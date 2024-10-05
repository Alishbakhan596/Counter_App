import 'package:flutter/material.dart';
import 'package:my_app/OnBoardScreen/onboarding_screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'assets/images/image 5.png',
                fit: BoxFit.fill,
                scale: 0.6,
              ),
            ),
            Container(
              height: 450,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.black),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Taskey",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Building Better\n   Workplaces",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Create a unique emotional story that\n     describes better than wors",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(25)),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF5945FB),
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnBoardScreen()));
                          },
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
