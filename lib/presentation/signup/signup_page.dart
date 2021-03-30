import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_20210310/presentation/signup/signup_model.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailEditingController = TextEditingController();
    final pwEditingController = TextEditingController();
    return ChangeNotifierProvider<SignupModel>(
      create: (_) => SignupModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Signup"),
        ),
        body: Consumer<SignupModel>(builder: (context, model, child) {
          return Container(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: "example@ooo.com"),
                  controller: mailEditingController,
                  onChanged: (Text) {
                    model.mail = Text;
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: "6文字以上のパスワードを入力"),
                  controller: pwEditingController,
                  onChanged: (Text) {
                    model.pw = Text;
                  },
                ),
                RaisedButton(
                  child: Text("登録する"),
                  onPressed: () async {
                    // await model.signup();
                    try {
                      await model.signUp();
                      _showDialog(context, "登録しました");
                    } catch (e) {
                      _showDialog(context, e.toString());
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future _showDialog(
    BuildContext context,
    String title,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
