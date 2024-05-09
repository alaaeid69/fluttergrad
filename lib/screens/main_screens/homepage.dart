import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gradproj/screens/diabetes_info/some_information.dart';
import 'package:gradproj/screens/foodpart/food.dart';
import 'package:gradproj/screens/medicaltests/MedicalTests.dart';
import 'package:gradproj/screens/medicine/medicine1.dart';
import 'package:gradproj/screens/sports/sports.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/calender.dart';
import 'package:gradproj/widgets/image.dart';
import 'package:gradproj/widgets/navigation_bar.dart';
import 'package:gradproj/widgets/text.dart';


class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;
  final List<String> photoPaths = [
    'images/diabetes_types.jpg',
    'images/mfitness1.jpg',
    'images/food2.jpg',
    'images/medicine.jpg',
    'images/blood-test.jpg',
  ];

  final List<String> photoTexts = [
    'Some Information',
    'Sport',
    'Food',
    'Medicine',
    'Medical Tests',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title:  Padding(
          padding: EdgeInsets.only(left: 20),
            child: Row(
          children: [
            TextTitle(
             text: 'Health pulse',
             textcolor: Colors.black,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GestureDetector(
              onTap: (){

              },
            child: Padding(
              padding: EdgeInsets.only(left: 40),
            child: SmallText(
                text: 'Emergency',
              textcolor: Colors.red,
              weight: FontWeight.bold,
            )),
            )),
          ],
        ))
      ),
      body: Column(
        children: [
          Padding(
        padding: EdgeInsets.only(top: 15),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  text: 'Currently Date: ',
                  textcolor: kButtonColor, // Set the color to blue
                  weight: FontWeight.bold,
                ),
               Calender(),
              ],
          )),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 15),
                itemCount: photoPaths.length,
                itemBuilder: (context , index){
                  _currentIndex = index;
                  return Padding(
                      padding: EdgeInsets.only(top: 20),
                     child: CustomRoundedImage(
                      imagesrc: photoPaths[_currentIndex],
                      action: (){
                        if(index == 0 ){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (v)=> SomeInformation()));
                        }else if(index == 1 ){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (v)=> SportsScreen()));
                        }else if(index == 2 ){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (v)=> FoodScreen()));
                        }else if(index == 3 ){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (v)=> Medicine()));
                        }
                        else if(index == 4 ){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (v)=> medicalTests()));
                        }
                      },
                    text: photoTexts[_currentIndex],
                  ));
                }
            )),

        ],
      ),
    );
  }
}


