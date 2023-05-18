import 'package:flutter/material.dart';
import 'package:miniproject/Category.dart';
import 'package:miniproject/Favorite.dart';
import 'package:miniproject/Profile.dart';
import 'package:miniproject/Shopping.dart';
import 'package:miniproject/homeContent.dart';
import 'Search.dart';


class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.teal,
              child: Icon(Icons.account_circle_sharp)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Profile()),
            );
          },
        ),
        backgroundColor: Colors.teal,
        title: Text('Hi Mellesia,'),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.teal,
              child: Icon(Icons.favorite),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Favorite()),
              );
            },
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.teal,
              child: Icon(Icons.shopping_cart),
            ),
            onPressed: () {

              setState(() {
                currentIndex = currentIndex;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Shopping()));
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 30,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'shopping_cart',
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
              print(index);
            });
          }),
      body: pageToOpen(),
    );
  }

  Widget pageToOpen() {
    switch (currentIndex) {
      case 0:
        return HomeContent();
      case 1:
        return Search();
      case 2: return Category();
      default: return Shopping();
    }
  }
}

// Container(
// height: 76,
// width: double.infinity,
// color: Colors.blueGrey[50],
// margin: const EdgeInsets.all(20),
// padding: const EdgeInsets.only(
// left: 10, top: 10, bottom: 0.0, right: 10),
// child: TextFormField(
// keyboardType: TextInputType.emailAddress,
// style: TextStyle(fontSize: 25, color: Colors.teal),
// decoration: InputDecoration(
// label: Text('Email'),
// icon: Icon(Icons.mail),
// ),
// ),
// ),

//
// Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(height: 6,),
//
// Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.grey[300],
// ),
// padding: EdgeInsets.all(14.0),
//
// child: Row(
// children: [
// Icon( Icons.search,),
// SizedBox( width: 15,),
//
// TextButton (
// style: TextButton.styleFrom(
// textStyle: TextStyle(fontSize: 18,),
// ),
// onPressed: () {},
// child: Text ('Search', style: TextStyle(color: Colors.black),),
//
// ),
// ]
// ),
//
//
// ),
