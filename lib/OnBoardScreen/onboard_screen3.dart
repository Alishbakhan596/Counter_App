import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Home/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.05),
              child:
                  // Onboarding Screen #3
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
                      top: height * 0.06,
                      left: width * 0.04,
                      child: Image.asset('assets/images/Image 1 (2).png')),
                  // image 2
                  Positioned(
                      top: height * 0.20,
                      right: width * 0.04,
                      child: Image.asset("assets/images/Image 2 (1).png")),
                  //image 3
                  Positioned(
                      top: height * 0.09,
                      left: width * 0.04,
                      child: Image.asset("assets/images/Image 3 (1).png")),
                ],
              ),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text("Task Management",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF5945FB),
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text("Manage your",
                    style: TextStyle(fontSize: 33, color: Colors.white)),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text(
                  'Tasks',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5945FB)),
                ),
                SizedBox(width: width * 0.03),
                Text('wuickly for',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text('Results ✌',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 20,
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
                          Get.to(HomeScreen());
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
