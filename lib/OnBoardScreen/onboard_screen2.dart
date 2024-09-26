import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboard_screen3.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
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
              child: Stack(
                children: [
                  Image.asset('assets/images/Circle.png'),
                  // image 1
                  Positioned(
                      top: height * 0.06,
                      left: width * 0.04,
                      child: Image.asset('assets/images/Image 1 (1).png')),
                  // image 2
                  Positioned(
                      top: height * 0.20,
                      right: width * 0.04,
                      child: Image.asset("assets/images/Image box 2.png")),
                  //image 3
                  Positioned(
                      top: height * 0.09,
                      left: width * 0.04,
                      child: Image.asset("assets/images/Image box 3.png")),
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
                      Text("Work more",
                          style: TextStyle(fontSize: 33, color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Structure',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF5945FB)),
                          ),
                          SizedBox(width: width * 0.03),
                          Text('and',
                              style: TextStyle(
                                  fontSize: 33,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ],
                      ),
                      Text('Organized 👌',
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
                            Get.to(Screen3());
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
