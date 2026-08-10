import 'package:flutter/material.dart';
import '../common/git_api.dart';
import '../common/global.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Container(
      child: Center(
        child: Form(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        prefixIcon: Icon(Icons.person),
                        ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "密码",
                        prefixIcon: Icon(Icons.lock),
                        ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final user = await Git(
                      context,
                    ).login(_usernameController.text, _passwordController.text);
                    Global.usermodel.user = user;
                    print("login success");
                  } on Exception catch (e) {
                    print(e);
                  }
                },
                child: Text("登录"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
