import 'package:flutter/material.dart';
import 'package:untitled/Components/book_tile.dart';

class LIbraryScreen extends StatefulWidget {
  const LIbraryScreen({super.key});

  @override
  State<LIbraryScreen> createState() => _LIbraryScreenState();
}

class _LIbraryScreenState extends State<LIbraryScreen> {

  List bookcovers = [
    'assets/ai.jpg',
    'assets/database.jpg',
    'assets/networks.jpg',
    'assets/physics.jpg'
  ];

  List bookdescriptions = [
    'This is a basic summary of the book that you have decided to borrow'
  ];

  List booktitles=[
    'Artificial Intelligence',
    'Database Systems',
    'Computer Networks',
    'Physics'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text("Library",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color:  Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: 'Search Books',
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
              ),
            ),
          ),
              const Row(
                children: [
                  SizedBox(width: 25,),
                  Text("New", style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold),)
                ],
              ),
             BookTile(imageUrl: bookcovers[1],title: booktitles[1], description: bookdescriptions[0],),
              const Row(
                children: [
                  SizedBox(width: 25,),
                  Text("For You", style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold),)
                ],
              ),
              BookTile(imageUrl: bookcovers[2],title: booktitles[2], description: bookdescriptions[0],),
        
              
        
            ],
          ),
        ),
      )
    );
  }
}
