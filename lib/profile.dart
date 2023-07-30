import 'dart:typed_data';

import 'package:bthn_test/login.dart';
import 'package:bthn_test/service/auth.dart';
import 'package:bthn_test/service/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  final User? user = FirebaseAuth.instance.currentUser;
  AuthService _authService = AuthService();

  String deleteAccount = "delete";
  TextEditingController _deleteAccountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool themeChange = false;
    return Scaffold(
        appBar: AppBar(
          title: Text("Profil Sayfası"),
          backgroundColor: Color.fromARGB(255, 148, 23, 14),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 70, 0, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : Container(),
                        CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              "https://icon-library.com/images/no-profile-pic-icon/no-profile-pic-icon-12.jpg"),
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: selectImage,
                            icon: Icon(Icons.add_a_photo),
                            color: Colors.black,
                          ),
                          bottom: -10,
                          right: -10,
                        )
                      ],
                    )),
                SizedBox(height: 20),
                Text(
                  user?.displayName ?? "Kullanıcı Adı Verisi Alınamadı.",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  user?.email ?? "Veri Alınamadı.",
                  style: TextStyle(fontSize: 20),
                ),
                Text(user?.uid ?? "Veri Alınamadı."),
                SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/edit-profile-page');
                      },
                      child: const Text(
                        "Profili Düzenle",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                ),
                SizedBox(height: 30),
                const Divider(),
                SizedBox(height: 10),
                ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(Icons.settings, color: Colors.red),
                  ),
                  title: Text("Ayarlar", style: GoogleFonts.nunito()),
                  onTap: () {
                    Navigator.pushNamed(context, '/settings-page');
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(Icons.notifications_active, color: Colors.red),
                  ),
                  title:
                      Text("Bildirim Tercihleri", style: GoogleFonts.nunito()),
                  enabled: false,
                  onTap: () {
                    Navigator.pushNamed(context, '/settings-page');
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(Icons.sunny, color: Colors.red),
                  ),
                  trailing: Switch(
                    value: themeChange,
                    onChanged: (bool value) {
                      setState(() {
                        if (themeChange = true) {
                          MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? themeChange = false
                              : themeChange = true;
                          print("Değiştim!");
                        }
                      });
                    },
                    activeColor: Colors.black,
                  ),
                  title: Text("Tema Seçenekleri", style: GoogleFonts.nunito()),
                  enabled: true,
                  onTap: () {},
                ),
                ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(Icons.delete, color: Colors.red),
                  ),
                  title: Text("Hesabımı Sil", style: GoogleFonts.nunito()),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          AuthService _authService = AuthService();
                          return AlertDialog(
                            title: Text("Hesabımı Sil"),
                            content: Text(
                                "Hesabınızı Silmek İstediğinize Emin Misiniz?"),
                            actions: [
                              TextField(
                                controller: _deleteAccountController,
                                decoration: InputDecoration(
                                    hintText:
                                        "Hesabınızı Silmek İçin 'delete' yazınız."
                                            .tr()
                                            .toString()),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Hayır")),
                              TextButton(
                                  onPressed: () {
                                    if (deleteAccount ==
                                        _deleteAccountController.text) {
                                      Navigator.pop(context);
                                      user?.delete();
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()),
                                          (route) => false);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 1),
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  "Hesabınız Başarıyla Silindi."
                                                      .tr()
                                                      .toString())));
                                    } else if (deleteAccount !=
                                        _deleteAccountController.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 1),
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  "Hesabınızı silmek için delete yazın!"
                                                      .tr()
                                                      .toString())));
                                    } else if (_deleteAccountController.text ==
                                        '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 1),
                                              backgroundColor: Colors.red,
                                              content: Text("Boş geçileemez."
                                                  .tr()
                                                  .toString())));
                                    }
                                    ;
                                  },
                                  child: Text("Evet")),
                            ],
                          );
                        });
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(Icons.logout, color: Colors.red),
                  ),
                  title: Text("Çıkış Yap", style: GoogleFonts.nunito()),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          AuthService _authService = AuthService();
                          return AlertDialog(
                            title: Text("Çıkış Yap"),
                            content:
                                Text("Çıkış Yapmak İstediğinize Emin Misiniz?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Hayır")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _authService.signOut();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                        (route) => false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            duration: Duration(seconds: 1),
                                            backgroundColor: Colors.green,
                                            content: Text(
                                                "logOutText".tr().toString())));
                                  },
                                  child: Text("Evet")),
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
