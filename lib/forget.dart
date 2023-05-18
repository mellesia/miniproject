import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/config.dart';

import 'Page1.dart';
import 'Register.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();

  static Forget? fromJson(data) {}
}

class _ForgetState extends State<Forget> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body:
      Column(
        children: [
          Container(
            height: 76,
            width: double.infinity,
            color: Colors.blueGrey[50],
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(
                left: 10, top: 10, bottom: 0.0, right: 10),
            child: TextFormField(
              controller:emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 20, color: Colors.teal),
              decoration: InputDecoration(
                label: Text('write your email'),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                forgetUser(emailController.text, context);

              }
              , child: Text('New password')),

      ]
      ),
    );
  }
}
Forget? forgetModel;

Future loginUser(String email,context) async {
  var response =
  await Dio().get('${APIConfig.BASE_URL}userLogin.php', queryParameters: {
    'email': email,
  });


}

Future forgetUser(String pass,context) async {
  var response =
  await Dio().get('${APIConfig.BASE_URL}changePassword.php', queryParameters: {

    'email': globelUserModel!.userData!.userEmail,
  });
  String msg = response.data['message'];
  var snackBar = SnackBar(
    content: Text(msg),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => Page1()),);

}
