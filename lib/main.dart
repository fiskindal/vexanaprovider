import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vexanaprovider/viewmodel/login_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: LoginView()),
    );
  }
}

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (String value) {
                value = _emailController.text;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              onChanged: (String value) {
                value = _passwordController.text;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                final isLogin =
                    await Provider.of<LoginViewModel>(context, listen: false)
                        .login(_emailController.text, _passwordController.text);
                if (isLogin != null) {
                  print(isLogin);
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
