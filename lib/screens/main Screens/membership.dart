import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:untitled/Components/society_club.dart';


class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {

  List clubnsocities = [
    "Chess",
    "Robotics",
    "Wrestling",
    "Indoor Games"
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              const Center(
                child: Text("MemberShip",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
              ),
              const Text("Scan QR Code"),
              QrImageView(
                data: 'Student ID Code goes here ',
                version: QrVersions.auto,
                size: 300,
                gapless: false,
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: clubnsocities.length,
                    itemBuilder:(context, index){
                  return  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SocietyClubTile(clubName:clubnsocities[index],),
                  );
                } ),
              ),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 500.0,
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            const Text("Join More Clubs and Societies", style:
                              TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                            const SizedBox(height: 20,),
                            SizedBox(
                              height: 300,
                              child: ListView.builder(
                                  itemCount: clubnsocities.length,
                                  itemBuilder:(context, index){
                                    return  Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: (){
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Thank you for joining ${clubnsocities[index]}')
                                              ),
                                            );
                                          },
                                          child: SocietyClubTile(clubName:clubnsocities[index],)
                                      ),
                                    );
                                  } ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  color: Colors.teal,
                                  child: const Center(child: Text("Close", style: TextStyle(
                                      color: Colors.white
                                  ),)),
                                ),
                              ),
                            )],
                        ),
                      );
                    },
                  );

                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.teal,
                    child: const Center(child: Text("More Clubs", style: TextStyle(
                      color: Colors.white
                    ),)),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
