import '../../screens/onboarding/signin.dart';
import '../../screens/onboarding/signup.dart';

import '../../widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FreeTrial extends StatelessWidget {
  static const routeName = '/free-trial';
  const FreeTrial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                './lib/assets/icons/social_friends.svg',
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Start your ",
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: "free trial",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Limited time.",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: " For beta members.",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w100,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    PremiumBenefitIcon(
                      assetName: './lib/assets/icons/courses.svg',
                    ),
                    PremiumBenefitIcon(
                      assetName: './lib/assets/icons/calender.svg',
                    ),
                    PremiumBenefitIcon(
                      assetName: './lib/assets/icons/puzzle.svg',
                    ),
                    PremiumBenefitIcon(
                      assetName: './lib/assets/icons/canvas.svg',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PremiumBenefit(
                      text: 'Full access to all courses',
                    ),
                    PremiumBenefit(
                      text: 'Daily challenges & exercises',
                    ),
                    PremiumBenefit(
                      text: 'Unlock all games and quizes',
                    ),
                    PremiumBenefit(
                      text: 'Dark mode and theming',
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Button(
              color: Theme.of(context).primaryColor,
              title: 'Try for Free!',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  SignUp.routeName,
                );
              },
            ),
            Button(
              color: Theme.of(context).accentColor,
              title: 'Sign In',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  SignIn.routeName,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class PremiumBenefit extends StatelessWidget {
  String text;

  PremiumBenefit({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color.fromRGBO(
            2,
            43,
            58,
            0.6,
          ),
          fontSize: 16,
        ),
      ),
    );
  }
}

class PremiumBenefitIcon extends StatelessWidget {
  String assetName;

  PremiumBenefitIcon({
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        right: 20,
      ),
      child: SvgPicture.asset(
        assetName,
        color: Color.fromRGBO(
          253,
          203,
          64,
          1,
        ),
      ),
    );
  }
}
