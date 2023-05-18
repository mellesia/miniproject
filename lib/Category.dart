import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/Category_data.dart';
import 'package:miniproject/Page1.dart';

import 'config.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}



class _CategoryState extends State<Category> {
   bool isLoaded = false;
  @override
  void initState(){
    getCategories();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return  isLoaded? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8,),

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
                decoration: InputDecoration(
                  hintText: ('Search'),
                  icon: Icon(Icons.search),
                )
            ),
          ),
        ),
        SizedBox(height: 20,),

        Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),

            child:
            TextButton(onPressed: () {
              debugPrint('Home');
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Page1()),
              );
            },
                child: Text('Home' , style: TextStyle(color: Colors.teal,  fontSize: 25,),
                  textAlign: TextAlign.center,
                )
            )
        ),
        SizedBox(height: 30,),

        Expanded(
    // isLoaded?
          child:  ListView.builder(
            shrinkWrap: true,
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: categories!.categoryData!.length,
            itemBuilder: (context, index) {

              return Container(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridTile(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SingleChildScrollView(
                            child: Image.network(
                              '${categories!.categoryData![index].groceryItemCategoryImg}',
                              fit: BoxFit.cover,
                              height: 80,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${categories!.categoryData![index].groceryItemCategoryName}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 15,),

                          Text('${categories!.categoryData![index].groceryItemCategoryDesc}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },

    )


        )
      ]
    ): Center(child: CircularProgressIndicator(),);
  }

Category_data? categories;
Future getCategories() async{
  var response = await Dio().get('${APIConfig.BASE_URL}loadCategories.php');

    categories = Category_data.fromJson(response.data);
    if(categories!.categoryData!.isNotEmpty){
  setState(() {
    isLoaded = true;
  });

  }else{
    //isLoaded = true;
    var snackBar = SnackBar(
      content: Text(categories!.message!),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  }

}
