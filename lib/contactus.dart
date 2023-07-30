import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 148, 23, 14),
        title: Text('Bize Ulaşın'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ContactUs(
          email: 'info@anda.org.tr',
          companyName: 'ANDA',
          phoneNumber: '0(312) 312 58 06',
          dividerThickness: 5,
          website: 'https://anda.org.tr/',
          githubUserName: 'batuhangurkan',
          tagLine: 'Arama Kurtarma',
          instagram: 'bthn_grkn',
          cardColor: Color.fromARGB(255, 148, 23, 14),
          taglineColor: Colors.black,
          textColor: Colors.white,
          companyColor: Colors.black,
        ),
      ),
    );
  }
}
