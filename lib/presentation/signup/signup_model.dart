import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignupModel extends ChangeNotifier {
  String mail = "";
  String pw = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
    if (mail.isEmpty) {
      throw ("メールを入力してください");
    }
    if (pw.isEmpty) {
      throw ("パスワードを入力してください");
    }

    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: mail,
      password: pw,
    ))
        .user;
    final email = user.email;

    Firestore.instance.collection("uers").add(
      {
        'email': email,
        'createAt': Timestamp.now(),
      },
    );
  }
}
