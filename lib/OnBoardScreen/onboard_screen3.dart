import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
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
                      Text("Manage your",
                          style: TextStyle(fontSize: 33, color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                      Text('Results ✌',
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
