import 'dart:convert';
import 'dart:ui';
import 'dart:async';
import 'package:bthn_test/service/user_service.dart';
import 'package:bthn_test/models/deprem_model.dart';
import 'package:bthn_test/views/show_all_earthquakes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LastEarthQuake extends StatefulWidget {
  @override
  _LastEarthQuakeState createState() => _LastEarthQuakeState();
}

class _LastEarthQuakeState extends State<LastEarthQuake> {
  Future<DepremModel>? veriler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veriler = GetApi().getApi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<DepremModel>(
          future: veriler,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.red,
                      ),
                      SizedBox(height: 10),
                      Text('Veriler Yükleniyor',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
                break;
              default:
                if (snapshot.hasError) {
                  return Text('HATA : ${snapshot.hasError}');
                } else {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data?.result.length,
                    itemBuilder: (context, index) {
                      List<Result> veriler = snapshot.data!.result;
                      Result item = veriler[index];
                      return ListTile(
                        ///BAŞLIK
                        title: Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),

                        ///ALT BAŞLIK
                        subtitle: Text(
                          item.date,
                          textAlign: TextAlign.center,
                        ),

                        ///CİRCLE AVATAR
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          child: Text(
                            item.mag.toString(),
                            style: TextStyle(
                                color: item.mag! < 5
                                    ? Colors.blue[400]
                                    : Colors.red),
                          ),
                        ),

                        ///MAP İCON
                        trailing: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/show-all-earthquakes');
                          },
                          child: Icon(
                            Icons.place,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {
            veriler = GetApi().getApi;
          });
        },
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
    );
  }
}
