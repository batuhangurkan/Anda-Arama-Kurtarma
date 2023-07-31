import 'package:flutter/material.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Gönderi Oluştur"),
        backgroundColor: Color.fromARGB(255, 148, 23, 14),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Konu Başlığı',
                  hintText: "Konu Başlığını Giriniz",
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: _contentController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Konu İçeriği',
                    hintText: "Konu İçeriğini Giriniz",
                  ),
                )),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isEmpty ||
                      _contentController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: const Text(
                            "Konu Başlığı ve Konu İçeriği Boş Bırakılamaz")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: const Text("Konu Başarıyla Gönderildi")));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                  primary: Color.fromARGB(255, 148, 23, 14),
                  shape: StadiumBorder(),
                ),
                child: Text("Gönder"))
          ],
        ),
      ),
    );
  }
}
