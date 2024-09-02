import 'package:flutter/material.dart';


class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("MemberShip",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
