import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/language_tile.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/notification_tile.dart';
import '../widgets/settings_tile.dart';
import 'package:flutter/material.dart';

import 'edit_details.dart';
import 'onboarding/freeTrial.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline6?.color,
                            fontSize: 25,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 1,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(114, 76, 249, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.only(right: 15),
                        child: const Text(
                          'PRO BETA',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: const SizedBox(
                      child: Text(
                        'Prabesh O.',
                        style: TextStyle(
                          color: Color.fromRGBO(2, 43, 58, 1),
                          fontSize: 48,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        child: const Text(
                          'My Progress',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Subscription",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.color,
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
                                color: const Color.fromRGBO(2, 43, 58, 1),
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
                        Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                  color: Color.fromRGBO(
                                    128,
                                    147,
                                    154,
                                    1,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: const Text(
                                    "Monthly",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(
                                        2,
                                        43,
                                        58,
                                        0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.schedule_rounded,
                                  size: 18,
                                  color: Color.fromRGBO(
                                    128,
                                    147,
                                    154,
                                    1,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                    10,
                                    3,
                                    0,
                                    5,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "Renews On: ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                              2,
                                              43,
                                              58,
                                              0.5,
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text: "27/11/22",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.fromLTRB(
                                0,
                                5,
                                5,
                                15,
                              ),
                              child: Text(
                                'Settings',
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const NotificationTile(),
                          LanguageTile(),
                          SettingsTile(
                            'Edit Details',
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => EditDetails(),
                                ),
                              );
                            },
                            SvgPicture.asset(
                              './lib/assets/icons/profile.svg',
                              color: Colors.black,
                            ),
                          ),
                          SettingsTile(
                            'Send feedback',
                            () {},
                            SvgPicture.asset('./lib/assets/icons/feedback.svg'),
                          ),
                          SettingsTile(
                            'Log out',
                            () {
                              logout(context);
                            },
                            SvgPicture.asset(
                              './lib/assets/icons/logout.svg',
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => FreeTrial(),
      ),
    );
  }
}
