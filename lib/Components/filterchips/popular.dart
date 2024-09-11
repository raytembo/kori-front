import 'package:flutter/material.dart';

class PopularFilterChip extends StatefulWidget {
  const PopularFilterChip({super.key});

  @override
  State<PopularFilterChip> createState() => _PopularFilterChipState();
}

class _PopularFilterChipState extends State<PopularFilterChip> {

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text("Popular"),
      selectedColor: Colors.greenAccent,
      onSelected:(bool selected){
        setState(() {
          isSelected = !isSelected;
        });
      },
      selected: isSelected,
    );
  }
}
