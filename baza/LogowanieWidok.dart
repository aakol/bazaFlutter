
//klasa logowania
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class LogowanieWidok extends StatefulWidget {
  const LogowanieWidok({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LogowanieWidok> createState() => _LogowanieWidokState();
}

class _LogowanieWidokState extends State<LogowanieWidok> {
  late final TextEditingController _email;
  late final TextEditingController _haslo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = TextEditingController();
    _haslo = TextEditingController();
  }
  // zarzadzanie zmiennymi
  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _haslo.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ) ,
          builder: (context , snapshot) {
            switch (snapshot.connectionState) {

              case ConnectionState.done:
                return Column(
                  children: [
                    TextField(controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: 'email'),),
                    TextField(controller: _haslo,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(hintText: 'haslo'),),
                    TextButton(
                        onPressed: () async {
                          final email = _email.text;
                          final haslo = _haslo.text;
                          final uworzonyUzytkownik = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: email, password: haslo);
                          print(uworzonyUzytkownik);
                        },
                        child: Text('guzik rejestracji'))

                  ],

                );
              default:
                return const Text('Ladowanie');
            }
          }
      ),
    );
  }
}