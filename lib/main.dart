import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import "package:flutter_app_20210310/main_model.dart";

import 'book_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("コリアンダー"),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Center(
              child: Column(
                children: [
                  Text(
                    model.kappa,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  FlatButton(
                    child: Text("ボタン"),
                    onPressed: () {
                      //  なにかする
                      // model.changeText();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookListPage()),
                      );
                    },
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
