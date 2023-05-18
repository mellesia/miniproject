import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<String> category = [
    'assets/images/fresh.jpg',
    'assets/images/healthy.jpg',
    'assets/images/salad.jpg',
    'assets/images/v.jpg',
    'assets/images/desert.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              padding: const EdgeInsets.only(
                  left: 10, top: 0, bottom: 0.0, right: 10),
              child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: ('Search'),
                    icon: Icon(Icons.search),
                  )),
            ),
          ),
          SizedBox(
            height: 55,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          // margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(8),
                          child: Image.asset(category[index]),
                        ),
                      );
                    },
                    itemCount: 5,
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
