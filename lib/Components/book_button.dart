import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
             Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Collect Your Book at the library'),
              ),
            );
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 100,height: 50, color: Colors.teal, child:
               const Center(
                   child: Text("Get Book", style:
                   TextStyle(color: Colors.white),)),)),
        ),
        const SizedBox(width: 30,),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Tech support will be with you in a moment....'),
              ),
            );

          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 100,height: 50, color: Colors.transparent, child:
              const Center(
                  child: Text("Need Help?", style:
                  TextStyle(color: Colors.black),)),)),
        ),
      ],
    );
  }
}
