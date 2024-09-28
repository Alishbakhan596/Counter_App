import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/OnBoardScreen/onboard_screen2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.05),
              child:
                  // OnBoarding Screen #1
                  Stack(
                children: [
                  Container(
                    height: 400,
                    width: 500,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(23),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Circle.png"),
                          fit: BoxFit.cover),
                      color: Colors.black,
                    ),
                  ),
                  // image 1
                  Positioned(
                      top: height * 0.07,
                      right: 0.10,
                      child: Image.asset('assets/images/Image 3.png')),

                  // image 2
                  Positioned(
                      top: height * 0.18,
                      left: width * 0.05,
                      child: Image.asset('assets/images/Image 2.png')),

                  // image 3
                  Positioned(
                      top: height * 0.27,
                      right: width * 0.07,
                      child: Image.asset('assets/images/Image 1.png')),
                ],
              ),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text(
                  "Task Management",
                  style: TextStyle(
                      fontSize: 23,
                      color: Color(0xFF5945FB),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text(
                  "Let's Create a",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text(
                  'space',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5945FB)),
                ),
                SizedBox(width: width * 0.03),
                Text('for your',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text('workflows.',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 0,
              child: PageView(
                controller: controller,
                children: const [],
              ),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Color(0xFF5945FB),
                    dotColor: Color(0xFF5945FB),
                    dotHeight: 20,
                    dotWidth: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Skip",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Stack(
                  children: [
                    Image.asset("assets/images/Rectangle.png"),
                    Positioned(
                      left: width * 0.06,
                      bottom: 25,
                      child: IconButton(
                        onPressed: () {
                          Get.to(Screen2());
                        },
                        icon: Icon(Icons.arrow_forward_sharp,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
