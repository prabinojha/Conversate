import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TasksScreen extends StatelessWidget {
  static const routeName = '/tasks-screen';

  const TasksScreen({Key? key}) : super(key: key);

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
                  "Tasks",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Theme.of(context).textTheme.headline6?.color,
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(
                  30,
                  20,
                  10,
                  20,
                ),
              ),
              Task(
                './lib/assets/icons/challenges.svg',
                const Color.fromRGBO(37, 137, 189, 1),
              ),
              Task(
                './lib/assets/icons/personal.svg',
                const Color.fromRGBO(248, 70, 76, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  late String asset;
  late Color colour;

  Task(this.asset, this.colour);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height / 2.8,
        width: MediaQuery.of(context).size.width / 1.1,
        margin: const EdgeInsets.only(bottom: 40),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colour,
        ),
        child: SvgPicture.asset(
          asset,
        ),
      ),
    );
  }
}

/* margin: const EdgeInsets.only(bottom: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colour,
        ),
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width / 1.075,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SvgPicture.asset(
            asset,
          ),
        ),*/