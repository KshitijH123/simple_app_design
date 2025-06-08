import 'package:flutter/material.dart';

import 'package:simple_app_design/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:120),
        child: ListView(
          children: [
            Container(
              width: 200,
              height: 200,
              child: FittedBox(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/image1.png'),
                  radius: 50,
                ),
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
                          return value!.isEmpty ? 'please enter password' : null;
                        }),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: MaterialButton(
                      onPressed: () {
                        onLoginButtonPressed(context);
                      },
                      child: Text('Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          )),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  Text(
                    'Forgot Password ?',
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  final email = 'admin@gmail.com';
  final password = '1234';

  void onLoginButtonPressed(BuildContext context) {
    final eml = emailController.text;
    final passwd = passwordController.text;

    if (passwd == password && eml == email) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      print('Login Failed');
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Login Failed'),
              content: Text('Login Failed'),
            );
          });
    }
  }
}
