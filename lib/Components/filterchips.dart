import 'package:flutter/material.dart';

class Filterchips extends StatefulWidget {
   Filterchips({super.key, required this.labelName});

  String labelName;


  @override
  State<Filterchips> createState() => _FilterchipsState();
}

class _FilterchipsState extends State<Filterchips> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        label: Text("All"),
        onSelected:(bool selected){
          setState(() {
            isSelected = !isSelected;
          });
        },
        selected: isSelected,
    );
  }
}
