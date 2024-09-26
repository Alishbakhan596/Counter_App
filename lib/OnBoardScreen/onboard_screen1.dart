import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/OnBoardScreen/onboard_screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
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
                  Image.asset('assets/images/Circle.png'),

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
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Positioned(
                top: height * 0.53,
                left: width * 0.07,
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Task Management",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF5945FB),
                              fontWeight: FontWeight.w500)),
                      Text("Let's create a",
                          style: TextStyle(fontSize: 33, color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                      Text('workflows.',
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ]),
              ),
            ]),
            Container(
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
