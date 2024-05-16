import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Flutter',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value) {},
                        validator: (value) {
                          return value!.isEmpty ? 'please enter value' : null;
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter password',
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value) {},
                        validator: (value) {
                          return value!.isEmpty
                              ? 'please enter password'
                              : null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('forgot password'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: MaterialButton(
                      onPressed: () {
                        onLoginButtonPressed();
                      },
                      child: Text('Login'),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: Text('New User? Create Account'),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  final email = 'kshitijhapase@gmail.com';
  final password = 'Kshitij@123';

  void onLoginButtonPressed() {
    final eml = emailController.text;
    final passwd = passwordController.text;

    if (passwd == password && eml == email) {
      print('Login Success');

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Login Success'),
              content: Text('Login Successfully'),
            );
          });
    } else {
      print('Login Failed');
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Login Failed'),
              content: Text('Login Failled'),
            );
          });
    }
  }
}
