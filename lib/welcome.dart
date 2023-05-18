import 'package:flutter/material.dart';
import 'package:miniproject/Register.dart';
import 'package:miniproject/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // backgroundColor: Colors.orange[100],

        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/welcome.jpg',
            ),
            fit: BoxFit.cover),
      ),
          child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text(
                  'The Grocery', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.teal,
                  ),
                ),
                SizedBox(height: 40,),
                Text(
                  'Welcome to our Grocery Store',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40,),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 50.0, bottom: 10.0, right: 50.0, top: 10.0),
                      backgroundColor: Colors.teal,
                      shape: StadiumBorder(
                        side: BorderSide(width: 4, color: Colors.teal),
                      )),
                  onPressed: () {
                    debugPrint('Login right');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20,),
                Text('Do not have an account?'),
                SizedBox(height: 5.0,),
                SizedBox(width: 60,),
                TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 44.0, bottom: 10.0, right: 44.0, top: 10.0),
                        shape: StadiumBorder(
                          side: BorderSide(width: 2, color: Colors.teal),
                        )),
                    onPressed: () {
                      debugPrint('Sign up right');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: const Text('SIGN UP',
                      style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 25,),
                      textAlign: TextAlign.center,
                    )),
              ]),
        ),
      ),
    ));
  }
}

