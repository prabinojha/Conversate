import '../../screens/onboarding/freeTrial.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:conversate_app/screens/onboarding/slider_model.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboardingScreen';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<SliderModel> mySLides = <SliderModel>[];
  int slideIndex = 0;
  late PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 14.0 : 10.0,
      width: isCurrentPage ? 14.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Theme.of(context).accentColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySLides = getSlides();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(
              () {
                slideIndex = index;
              },
            );
          },
          children: <Widget>[
            SlideTile(
              imagePath: mySLides[0].getImageAssetPath(),
            ),
            SlideTile(
              imagePath: mySLides[1].getImageAssetPath(),
            ),
            SlideTile(
              imagePath: mySLides[2].getImageAssetPath(),
            ),
            SlideTile(
              imagePath: mySLides[3].getImageAssetPath(),
            ),
          ],
        ),
      ),
      bottomSheet: slideIndex != 3
          ? Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++)
                    i == slideIndex
                        ? _buildPageIndicator(true)
                        : _buildPageIndicator(false),
                ],
              ),
            )
          : InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => FreeTrial(),
                  ),
                );
              },
              child: Container(
                height: 80,
                color: Theme.of(context).accentColor,
                alignment: Alignment.center,
                child: const Text(
                  "GET STARTED NOW",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath;

  SlideTile({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 15,
                  top: 20,
                  bottom: 0,
                ),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color.fromRGBO(
                      2,
                      43,
                      58,
                      1,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 15,
                ),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Conversate',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 48,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(imagePath),
          ),
        ],
      ),
    );
  }
}
