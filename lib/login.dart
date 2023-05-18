import 'package:flutter/material.dart';
import 'package:miniproject/Change.dart';
import 'package:miniproject/forget.dart';
import 'package:miniproject/user_model/user.dart';
import 'Register.dart';
import 'package:miniproject/Page1.dart';
import 'package:dio/dio.dart';
import 'config.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool password = true;
  Icon icon = Icon(Icons.visibility);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Welcome Back'),
          backgroundColor: Colors.teal,
        ),
        body:
        SingleChildScrollView(
          child:
        Form(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.blueGrey[50],
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 0.0, right: 10),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 30, color: Colors.teal),
                      decoration: InputDecoration(
                        label: Text('Email'),
                        icon: Icon(Icons.mail),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.blueGrey[50],
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 0.0, right: 10),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(fontSize: 30, color: Colors.teal),
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


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),

                      TextButton(

                          onPressed: () {
                            debugPrint(' forget');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Forget(),
                              ),
                            );
                          },

                          child: Text('forget password')),
                      SizedBox(height: 90,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Expanded(child: Image.asset('assets/images/www.jpg' , height: 200, width: 250,)),

                      SizedBox(width: 8,),

                      Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.teal, fontSize: 15,),
                          ),

                      SizedBox(
                        height: 10,
                      ),

                      TextButton(
                          onPressed: () {
                            debugPrint(' Go to Sign up ');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            );
                          },
                          child: Text('SIGN UP', textAlign: TextAlign.end,)),

                      // child: const Text('SIGN UP', style:TextStyle(color: Colors.blue, fontSize: 15, fontStyle: FontStyle.italic),),
                      SizedBox(
                        height: 10,
                      ),

                      TextButton(
                          onPressed: () {
                            debugPrint(' change');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Change(),
                              ),
                            );
                          },
                          child: Text('change password', textAlign: TextAlign.end,)),

                      SizedBox(
                        height: 10,
                      ),

                      TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(
                                  left: 50.0,
                                  bottom: 10.0,
                                  right: 50.0,
                                  top: 10.0),
                              backgroundColor: Colors.teal,
                              shape: StadiumBorder(
                                side: BorderSide(width: 4, color: Colors.teal),
                              )),
                          onPressed: () {
                            loginUser(
                              emailController.text,
                              passwordController.text,
                              context,
                            );
                            debugPrint(' Submit right ');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Page1()),
                            );

                          },
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ))



                    ]
                  ),

                  // SizedBox(height: 50,),
                  // Image.asset('assets/images/www.jpg'),

                ]
                )

        ]
                )
                ]
        )
    )
    )
        )
    );
  }
}

user? userModel;

Future loginUser(String email, String password,context) async {
  var response =
  await Dio().get('${APIConfig.BASE_URL}userLogin.php', queryParameters: {
    'email': email,
    'password': password,
  });
  userModel = user.fromJson(response.data);
  if (userModel!.message! == 'User Logged in successfully') {
    userModelGlobal = userModel;
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page1()));
  } else {
    var snackBar = SnackBar(
      content: Text(userModel!.message!),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
