// klasa widoku rejestracjist
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr123/firebase_options.dart';
import 'dart:async';
import 'package:mysql1/mysql1.dart';

class RejestracjaWidok extends StatefulWidget {
  const RejestracjaWidok({Key? key}) : super(key: key);

  @override
  State<RejestracjaWidok> createState() => _RejestracjaWidokState();

}

class _RejestracjaWidokState extends State<RejestracjaWidok> {
  //String get sql => 'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)';
@override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            builder: (context , snapshot){

             return TextButton(onPressed:
                 ()=> funkcjasql()
                 , child: Text('sql'));},
          ),
          FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform
            ), builder: ( context, snapshot) {
              switch(snapshot.connectionState)
                  {


                case ConnectionState.done:
                  return TextButton(
                      onPressed: () async
                      {var collections = FirebaseFirestore.instance;
                        final db = collections.collection('baza');
                      final data1 = <String, dynamic>{
                      "tytul": 123};
                      db.doc('xxxx ').set(data1);

                      final docRef = collections.collection("baza").doc("xxxx");
                      docRef.get().then(
                            (DocumentSnapshot doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          print(data.values.elementAt(1));

                        },
                        onError: (e) => print("Error getting document: $e"),
                      );



                      print(snapshot.data?.name);
                        },
                      child: Text('guzik'));
                default:
                  return const Text('brak danych');
              }



          },
          ),
        ],
      )
    );
  }


Future  funkcjasql() async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '127.0.0.1',
      port: 3306,
      user: 'xxxx',
      db: 'xxxx',
      password: 'xxxx'));

  await conn.query(
      'CREATE TABLE io (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)');
  await conn.close();
}
}

