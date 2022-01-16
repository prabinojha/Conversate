import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final onPressed;
  SvgPicture icon;

  SettingsTile(
    this.title,
    this.onPressed,
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(
            color: const Color.fromRGBO(2, 43, 58, 1),
            width: 3,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6!.color,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: icon,
              margin: const EdgeInsets.only(right: 10),
            ),
          ],
        ),
      ),
    );
  }
}
