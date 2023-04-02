import 'package:bthn_test/login.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          ListTile(
            title: const InkWell(child: Text("Uygulama Dilini Değiştir")),
            leading: IconButton(
              icon: Icon(Icons.language),
              onPressed: () => null,
            ),
          ),
          ListTile(
            title: Text("Bize Ulaşın"),
            leading: IconButton(
              icon: Icon(Icons.contact_support_rounded),
              onPressed: () => null,
            ),
          ),
          ListTile(
            title: Text("Arkadaşlarınızı Davet Edin"),
            leading: IconButton(
              icon: Icon(Icons.share),
              onPressed: () => null,
            ),
          ),
          ListTile(
            title: Text("Karanlık Mod"),
            leading: IconButton(
              icon: Icon(Icons.light_mode),
              onPressed: () => null,
            ),
          ),
          ListTile(
            title: Text("Kullanıcı Ayarları"),
            leading: IconButton(
              icon: Icon(Icons.person),
              onPressed: () => null,
            ),
          ),
          ListTile(
            title: Text("Çıkış Yap"),
            leading: IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    )),
          ),
        ],
      ),
    );
  }
}
