import 'package:flutter/material.dart';

class SocietyClubTile extends StatelessWidget {
   SocietyClubTile({super.key, required this.clubName});

  String clubName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.teal,
        width: 350,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(clubName, style: const TextStyle(color: Colors.white),),
              const Icon(Icons.group,color: Colors.white,)
            ],
          ),
        ) ,
      ),
    );
  }
}
