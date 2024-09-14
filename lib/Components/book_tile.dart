import 'package:flutter/material.dart';
import 'package:untitled/Components/book_button.dart';


class BookTile extends StatelessWidget {
   BookTile({super.key, required this.title, required this.imageUrl, required this.description});

  String title;
  String imageUrl;
  String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 150,
                  child: Column(
                    children: [
                      Image.asset(imageUrl,width: 200,height: 200,),
                      Text(title),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet<void>(

                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                width: 500,
                                height: 800,
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(title, style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),),
                                    SizedBox(height: 10,),
                                    Image.asset(imageUrl, width: 200,height: 300,),
                                    SizedBox(height: 10,),
                                    Text(description),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      BookButton()

                                    ],)
                                    
                                   
                                  ],
                                ),
                              );
                            },
                          );
                        },
                          child: const Text("Borrow", style: TextStyle(color: Colors.teal, fontSize: 15),))
                    ],
                  ),
                ),
              ),
            );

          }),
    );
  }
}
