// ignore_for_file: unnecessary_new

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conversate_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  bool? noName;

  @override
  void initState() {
    FirebaseFirestore.instance.collection('users').doc(user!.uid).get().then(
      (value) {
        setState(
          () {
            loggedInUser = UserModel.fromMap(
              value.data(),
            );
            if (loggedInUser.name!.isEmpty || loggedInUser.name == null) {
              noName = true;
            } else {
              noName = false;
            }
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(
                      15,
                      20,
                      0,
                      5,
                    ),
                    child: noName == true
                        ? Text(
                            'Hello there!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Text(
                            'Hi ${loggedInUser.name}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: const Text(
                      'Lets start learning!',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Dialog(
                insetPadding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: dialogContent(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "My Courses",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Theme.of(context).textTheme.headline6?.color,
                        ),
                      ),
                      margin: const EdgeInsets.fromLTRB(
                        0,
                        5,
                        0,
                        5,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.fromLTRB(
                        0,
                        5,
                        0,
                        5,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Manage',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Course(
                asset: './lib/assets/images/an_introduction_to_social_skills.jpg',
                colour: const LinearGradient(
                  colors: [
                    Color.fromRGBO(144, 58, 229, 1),
                    Color.fromRGBO(35, 83, 255, 1),
                  ],
                ),
                title: 'An Introduction to\nSocial Skills',
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 5,
                ),
                child: Text(
                  "Today's pick",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Theme.of(context).textTheme.headline6?.color,
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(
                  0,
                  5,
                  0,
                  5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DailyPickCard(
                    colour: const LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 67, 101, 1),
                        Color.fromRGBO(109, 9, 27, 1),
                      ],
                    ),
                    icon: './lib/assets/icons/dumbell.svg',
                    assetImage: './lib/assets/images/breathing_exercise',
                    time: '5 mins',
                    title: 'Breathing',
                  ),
                  DailyPickCard(
                    colour: const LinearGradient(
                      colors: [
                        Color.fromRGBO(24, 139, 132, 1),
                        Color.fromRGBO(39, 93, 173, 1),
                      ],
                    ),
                    icon: './lib/assets/icons/dumbell.svg',
                    assetImage: './lib/assets/images/articulation_exercise.jpg',
                    time: '5 mins',
                    title: 'Articulation',
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 5,
                ),
                child: Text(
                  "Explore",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Theme.of(context).textTheme.headline6?.color,
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(
                  0,
                  5,
                  0,
                  5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ExploreCard('./lib/assets/icons/dumbell.svg'),
                  ExploreCard('./lib/assets/icons/Union.svg'),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget dialogContent(BuildContext context) {
  return Stack(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.all(7.5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(248, 70, 76, 1),
              Color.fromRGBO(253, 202, 64, 1),
            ],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "Share with a friend,\nget one month of premium.\nLimited time only.",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SvgPicture.asset(
              './lib/assets/icons/offer.svg',
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
      Positioned(
        right: 0.0,
        child: GestureDetector(
          onTap: () {},
          child: const Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 14.0,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

class Course extends StatelessWidget {
  late String asset;
  late LinearGradient colour;
  late String title;

  Course({
    required this.asset,
    required this.colour,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: colour,
            image: DecorationImage(
              opacity: 0.2,
              fit: BoxFit.cover,
              image: AssetImage(
                asset,
              ),
            ),
          ),
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width / 1.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset('./lib/assets/icons/Union.svg'),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.all(15),
                child: const Text(
                  'CHAPTER 7/10',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreCard extends StatelessWidget {
  final String icon;

  ExploreCard(
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).accentColor,
        ),
        height: MediaQuery.of(context).size.height / 3.3,
        width: MediaQuery.of(context).size.width / 2.2,
        child: Center(
          child: SvgPicture.asset(
            icon,
            height: 75,
          ),
        ),
      ),
    );
  }
}

class DailyPickCard extends StatelessWidget {
  final String title;
  final String time;
  final String icon;
  final LinearGradient colour;
  final String assetImage;

  DailyPickCard({
    required this.title,
    required this.time,
    required this.icon,
    required this.colour,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: colour,
          image: DecorationImage(
            opacity: 0.2,
            fit: BoxFit.cover,
            image: AssetImage(
              assetImage,
            ),
          ),
        ),
        height: MediaQuery.of(context).size.height / 3.3,
        width: MediaQuery.of(context).size.width / 2.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.timer,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  width: 25,
                  height: 25,
                  child: SvgPicture.asset(
                    icon,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
