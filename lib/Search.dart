import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8,),

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

                  child:
                  TextFormField (
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: ('Search'),
                        icon: Icon(Icons.search),
                      )
                  ),
                ),
              ),
              const SizedBox(height: 50,),
            Lottie.network('https://assets9.lottiefiles.com/private_files/lf30_jo7huq2d.json', width: 250, height: 250),
            ],
        )
    );
  }
}


