import 'package:flutter/material.dart';
import './common/global.dart';
import 'widget/login.dart';
import 'widget/repos.dart';
void main() {
  Global.init().then((e)=>runApp(MainApp()));
}

class MainApp extends StatelessWidget {
  
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("git client"),
        ),
        body: ListenableBuilder(
          listenable: Global.usermodel,
          builder: (context,child) {
            return Center(
              child: _build(),
            );
          },
        ),
      ),
    );
  }
    Widget _build() {
      if(Global.usermodel.isLogin) {
        return Repos();
    }
      return LoginPage();
    }

    dispose() {
      Global.usermodel.dispose();
    }
}
