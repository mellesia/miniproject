import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}
List<String> img = [
  'assets/images/strawberry.jpg',
  'assets/images/apple.jpg'
];
List<String> text = [
  'strawberry '
      '5 kilo '
      '100 LE',

  'apple  '
      '3 kilos  '
      '45 LE'

];

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child:ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(8),
                          child:
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 20,),
                                Row(
                                  children: [
                                    Image.asset(img[index], width: 150, height: 150,),
                                    SizedBox(height: 20,),
                                    SizedBox(width: 20,),
                                    Text(text[index]),
                                  ],
                                ),
                              ]
                          )
                      );
                    },

                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
