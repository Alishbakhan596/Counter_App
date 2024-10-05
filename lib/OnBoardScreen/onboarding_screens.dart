import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/SingIn/Signin_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/Constant/colors.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.05),
        child:
            // OnBoarding Screen #1
            PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            // Onboarding Screen 1
            Stack(
              children: [
                Image.asset("assets/images/Circle.png"),

                // image 1
                Positioned(
                    top: height * 0.07,
                    right: 0.15,
                    child: Image.asset('assets/images/Image 3.png')),

                // image 2
                Positioned(
                    top: height * 0.18,
                    left: width * 0.07,
                    child: Image.asset('assets/images/Image 2.png')),

                // image 3
                Positioned(
                    top: height * 0.27,
                    right: width * 0.07,
                    child: Image.asset("assets/images/Image 1.png")),
                Positioned(
                  top: height * 0.53,
                  left: width * 0.07,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Task Management",
                        style: TextStyle(
                            fontSize: 20,
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Let's Create a",
                        style: TextStyle(
                          fontSize: 35,
                          color: theme.primaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 30)),
                          Text(
                            'space',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: theme.iconTheme.color),
                          ),
                          SizedBox(width: width * 0.03),
                          Text('for your',
                              style: TextStyle(
                                  fontSize: 33,
                                  fontWeight: FontWeight.w400,
                                  color: theme.primaryColor)),
                        ],
                      ),
                      Text('workflows.',
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.w400,
                              color: theme.primaryColor)),
                    ],
                  ),
                ),
              ],
            ),
            //OnBoarding Screen 2
            Stack(
              children: [
                Image.asset("assets/images/Circle.png"),

                // image 1
                Positioned(
                    top: height * 0.06,
                    left: width * 0.04,
                    child: Image.asset('assets/images/Image 1 (1).png')),
                // image 2
                Positioned(
                    top: height * 0.16,
                    right: width * 0.04,
                    child: Image.asset("assets/images/Image box 2.png")),
                //image 3
                Positioned(
                    top: height * 0.09,
                    left: width * 0.07,
                    child: Image.asset("assets/images/Image box 3.png")),

                Positioned(
                  top: height * 0.53,
                  left: width * 0.07,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Task Management",
                        style: TextStyle(
                            fontSize: 23,
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Work more",
                        style: TextStyle(
                          fontSize: 35,
                          color: theme.primaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Structures',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: theme.iconTheme.color),
                          ),
                          SizedBox(width: width * 0.03),
                          Text('and',
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.w400,
                                color: theme.primaryColor,
                              )),
                        ],
                      ),
                      Text('Organized 👌',
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.w400,
                              color: theme.primaryColor)),
                    ],
                  ),
                ),
              ],
            ),
            // Onboarding Screen 3
            Stack(
              children: [
                Image.asset("assets/images/Circle.png"),
                // image 1
                Positioned(
                    top: height * 0.04,
                    left: width * 0.19,
                    child: Image.asset('assets/images/Image 1 (2).png')),
                // image 2
                Positioned(
                    top: height * 0.17,
                    right: width * 0.02,
                    child: Image.asset("assets/images/Image 2 (1).png")),
                //image 3
                Positioned(
                    top: height * 0.06,
                    left: width * 0.03,
                    child: Image.asset("assets/images/Image 3 (1).png")),
                Positioned(
                  top: height * 0.53,
                  left: width * 0.07,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Task Management",
                        style: TextStyle(
                            fontSize: 23,
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Manage Your",
                        style: TextStyle(
                          fontSize: 35,
                          color: theme.primaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Tasks',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: theme.iconTheme.color),
                          ),
                          SizedBox(width: width * 0.03),
                          Text('quickly for',
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.w400,
                                color: theme.primaryColor,
                              )),
                        ],
                      ),
                      Text('Results✌',
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.w400,
                              color: theme.primaryColor)),
                    ],
                  ),
                ),
              ],
            ),
            //
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: height * 0.15,
        child: Stack(
          children: [
            Positioned(
              top: height * 0.01,
              left: width * 0.07,
              child: SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                  radius: 25,
                  dotHeight: 8,
                  dotWidth: 10,
                  activeDotColor: AColors.primaryLight,
                  dotColor: Colors.grey.withOpacity(0.4),
                ),
                count: 3,
                controller: controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => controller.jumpToPage(2),
                    child: Text(
                      "Skip",
                      style: TextStyle(color: theme.primaryColor),
                    )),
                Stack(
                  children: [
                    Image.asset("assets/images/Rectangle.png"),
                    Positioned(
                      left: width * 0.02,
                      bottom: 25,
                      child: IconButton(
                        onPressed: () {
                          if (isLastPage) {
                            Get.to(SignIn());
                          } else {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 450),
                                curve: Curves.easeInOut);
                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                          size: 25,
                        ),
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
