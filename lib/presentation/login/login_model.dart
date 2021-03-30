import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginModel extends ChangeNotifier {
  String mail = "";
  String pw = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login() async {
    if (mail.isEmpty) {
      throw ("メールを入力してください");
    }
    if (pw.isEmpty) {
      throw ("パスワードを入力してください");
    }

    await _auth.signInWithEmailAndPassword(
      email: mail,
      password: pw,
    );
  }
}
