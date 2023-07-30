import 'package:bthn_test/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({super.key});

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  final User? user = FirebaseAuth.instance.currentUser;
  AuthService _authService = AuthService();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _clearcontroller = TextEditingController();

  Future _updatePassword(String password) async {
    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(_passwordController.text.trim())
          .then((value) => print("Şifre güncellendi."));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Düzenleme Sayfası"),
        backgroundColor: Color.fromARGB(255, 148, 23, 14),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(user?.photoURL ??
                  'https://icon-library.com/images/no-profile-pic-icon/no-profile-pic-icon-12.jpg'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(user?.displayName ?? 'Kullanıcı Adı Bilgisi Alınamadı.'),
            Text(user?.email ?? 'E-mail Bilgisi Alınamadı.'),
            SizedBox(
              height: 75,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: user?.email ?? 'Veri bulunamadı.',
                      prefixIcon: Icon(Icons.mail),
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                    )),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: user?.displayName ??
                          'Kullanıcı Adı Verisi bulunamadı.',
                      hintText: user?.displayName ?? 'Veri bulunamadı.',
                      prefixIcon: Icon(Icons.person),
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                    )),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: "Şifre",
                      prefixIcon: Icon(Icons.password),
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                    )),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    obscureText: true,
                    controller: _passwordConfirmController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: "Şifre Doğrula",
                      prefixIcon: Icon(Icons.password_outlined),
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                    )),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.0,
              child: ElevatedButton(
                  onPressed: () {
                    if (_passwordConfirmController.text ==
                        _passwordController.text) {
                      _updatePassword(_passwordController.text.trim());
                      setState(() {
                        _passwordController.clear();
                        _passwordConfirmController.clear();
                      });
                      var snackBar = SnackBar(
                        content: Text("Şfreniz başarıyla güncellendi."),
                        duration: Duration(seconds: 2, milliseconds: 500),
                        backgroundColor: Colors.green,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Future.delayed(Duration(seconds: 2), () {});
                    } else if (_passwordConfirmController.text.isEmpty) {
                      var snackBar = SnackBar(
                        content: Text("Şifre doğrulama alanı boş bırakıldı!"),
                        duration: Duration(seconds: 2, milliseconds: 500),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Future.delayed(Duration(seconds: 2), () {});
                    } else if (_passwordConfirmController.text.isEmpty) {
                      var snackBar = SnackBar(
                        content: Text("Şifre alanı boş bırakıldı!"),
                        duration: Duration(seconds: 2, milliseconds: 500),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Future.delayed(Duration(seconds: 2), () {});
                    } else {
                      var snackBar = SnackBar(
                        content: Text(
                            "Şifreler uyuşmuyor veya satırlar boş bırakıldı!"),
                        duration: Duration(seconds: 2, milliseconds: 500),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Future.delayed(Duration(seconds: 2), () {});
                    }
                  },
                  child: const Text(
                    "Bilgileri Güncelle",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 148, 23, 14),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
          ],
        ),
      ),
    );
  }
}
