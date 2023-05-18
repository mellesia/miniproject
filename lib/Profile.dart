import 'package:flutter/material.dart';
import 'package:miniproject/login.dart';
import 'package:miniproject/welcome.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

List<String> info = [
  'Username:  Mallosa',
  'Phone: 01271440048',
  'Email: mellesia1@gmail.com',
  'Address: Masr El Gadida'

];

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
      IconButton(
      icon: const CircleAvatar(
      radius: 15.0,
        backgroundColor: Colors.teal,
        child: Icon(Icons.logout),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Welcome()),
        );
      },
    ),
    ]
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(width: 50,),
            CircleAvatar(
              radius: 70,
              backgroundImage:  AssetImage('assets/images/mallos.jpg'),
            ),

            SizedBox(height: 20,),

            Text('Mellesia Maged', style: TextStyle( fontSize: 23, fontWeight: FontWeight.bold, ),),
            SizedBox(height: 10,),

            Column(
              children: [
                Container(
                  height: 270,
                    width: 400,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child:
                    ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(20),
                        child:

                        Text(info[index], style: TextStyle(fontSize:25),),
                      );

                    }
                    )

                ),
                SizedBox(height: 20,),
                Image.asset('assets/images/pp.jpg', height: 200, width: 250,)
                    ],


            ),
            // Image.asset('assets/images/pp.jpg', height: 100, width: 150,)


          ],
        ),
      )
    );
  }
}
