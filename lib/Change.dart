import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/Page1.dart';
import 'package:miniproject/Register.dart';
import 'package:miniproject/config.dart';


class Change extends StatefulWidget {
  const Change({Key? key}) : super(key: key);

  @override
  State<Change> createState() => _ChangeState();

  static Change? fromJson(data) {}
}

class _ChangeState extends State<Change> {
  @override
  TextEditingController useridController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
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
              controller: useridController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20, color: Colors.teal),
              decoration: InputDecoration(
                label: Text('user id'),
              ),
            ),
          ),
          Container(
            height: 76,
            width: double.infinity,
            color: Colors.blueGrey[50],
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(
                left: 10, top: 10, bottom: 0.0, right: 10),
            child: TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20, color: Colors.teal),
              decoration: InputDecoration(
                label: Text('password'),
              ),
            ),
          ),
          ElevatedButton(
    onPressed: (){
    changenUser(passwordController.text, context);

    }
    , child: Text('Change')),
        ],
      ),
    );
  }
}


Future changenUser(String pass,context) async {
  var response =
  await Dio().get('${APIConfig.BASE_URL}changePassword.php', queryParameters: {

    'userid': globelUserModel!.userData!.userId,
    'password': pass,
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
