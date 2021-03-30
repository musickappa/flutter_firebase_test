import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_20210310/presentation/book_list/book_list_page.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailEditingController = TextEditingController();
    final pwEditingController = TextEditingController();
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Consumer<LoginModel>(builder: (context, model, child) {
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
                  child: Text("ログインする"),
                  onPressed: () async {
                    // await model.signup();
                    try {
                      await model.login();
                      _showDialog(context, "ログインしました");
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
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookListPage(),
                    fullscreenDialog: false,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
