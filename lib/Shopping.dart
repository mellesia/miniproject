import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}
List<String> img = [
  'assets/images/strawberry.jpg',
  'assets/images/apple.jpg'
];
List<String> text = [
  'strawberry '
      '1 kilo '
      '20 LE',

  'apple  '
      '2 kilos  '
      '30 LE'

];


class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('MY SHOPPING CART'),
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
