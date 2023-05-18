import 'package:flutter/material.dart';
import 'package:miniproject/Category.dart';
import 'package:miniproject/Page1.dart';
import 'package:miniproject/Search.dart';
import 'package:miniproject/config.dart';
import 'package:dio/dio.dart';
import 'package:miniproject/user_model/user.dart';





class Register extends StatefulWidget {
   const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
  bool password = true;
  Icon icon = Icon(Icons.visibility);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 76,
                width: double.infinity,
                color: Colors.blueGrey[50],
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 0.0, right: 10),
                child: TextFormField(
                  controller: firstNameController,
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: 25, color: Colors.teal),
                  // obscureText: true,
                  decoration: InputDecoration(
                    label: Text('First name'),
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
                  controller: lastNameController,
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: 25, color: Colors.teal),
                  // obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Last name'),
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
                  controller: userNameController,
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: 25, color: Colors.teal),
                  // obscureText: true,
                  decoration: InputDecoration(
                    label: Text('user name'),
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 25, color: Colors.teal),
                  decoration: InputDecoration(
                    label: Text('Email'),
                    icon: Icon(Icons.mail),
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
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 25, color: Colors.teal),
                  obscureText: password,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: icon,
                        onPressed: () {
                          password = !password;
                          if (password) {
                            icon = Icon(Icons.visibility);
                          } else {
                            icon = Icon(Icons.visibility_off);
                          }
                          setState(() {});
                        }),
                    label: Text('Password'),
                    icon: Icon(Icons.password),
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
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(fontSize: 25, color: Colors.teal),
                  obscureText: false,
                  decoration: InputDecoration(
                    label: Text('Phone'),
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
                  controller: addressController,
                  keyboardType: TextInputType.streetAddress,
                  style: TextStyle(fontSize: 25, color: Colors.teal),
                  // obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Address'),
                  ),
                ),
              ),
            SizedBox(height: 50,),
              TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 44.0, bottom: 10.0, right: 44.0, top: 10.0),
                      backgroundColor: Colors.white54,
                      shape: StadiumBorder(
                        side: BorderSide(width: 2, color: Colors.teal),
                      )),
                  onPressed: () {
                    registerNewUser(firstNameController.text, lastNameController.text, userNameController.text,
                        emailController.text, passwordController.text, phoneController.text, addressController.text,context);
                    debugPrint(' Submit right ');


                  },
                  child: Text('SIGN UP' , style: TextStyle(color: Colors.teal,  fontSize: 25,),
                  textAlign: TextAlign.center,
                  )
              ),

            ]

          ),
        ),
      ),
    );
  }
}
user? userModelObject;
Future registerNewUser(String fname, String lname, String uname, String email, String password, String phone , String address,context )async{


var response = await Dio().get('${APIConfig.BASE_URL}userRegister.php',queryParameters:
{
  'first_name':fname,
  'last_name':lname,
  'user_name':uname,
  'user_email':email,
  'user_password':password,
  'user_phone':phone,
  'address':address,



});
userModelObject = user.fromJson(response.data);
if (userModelObject!.message! == 'User Registered Successfully') {
  userModelGlobal = userModelObject;
  Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => Page1()));
} else {
  var snackBar = SnackBar(
    content: Text(userModelObject!.message!),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

}
var globelUserModel = userModelObject;
