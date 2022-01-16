import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GamesScreen extends StatelessWidget {
  static const routeName = '/games-screen';
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Theme.of(context).textTheme.headline6?.color,
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(30, 20, 10, 20),
              ),
              Game(
                asset: './lib/assets/images/in_a_party',
                colour: const LinearGradient(
                  colors: [
                    Color.fromRGBO(246, 93, 231, 1),
                    Color.fromRGBO(235, 52, 118, 1),
                  ],
                ),
                title: 'In a party',
              ),
              Game(
                asset: './lib/assets/images/job_interview.jpg',
                colour: const LinearGradient(
                  colors: [
                    Color.fromRGBO(8, 150, 181, 1),
                    Color.fromRGBO(24, 104, 121, 1),
                  ],
                ),
                title: 'Job Interview',
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Coming soon",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Theme.of(context).textTheme.headline6?.color,
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(30, 0, 10, 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Game extends StatelessWidget {
  late String asset;
  late LinearGradient colour;
  late String title;

  Game({
    required this.asset,
    required this.colour,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1.1,
            margin: const EdgeInsets.only(
              bottom: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: colour,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  asset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
