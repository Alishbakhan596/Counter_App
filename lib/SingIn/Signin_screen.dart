import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/main_controller.dart';
import 'package:my_app/utils/Constant/colors.dart';
import 'package:my_app/view/Home/home_screen.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControlller = TextEditingController();
  @override
  signInFunc1() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordControlller.text);

      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
    print("Test");
  }

  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    final authProvider = Provider.of<AuthProvider>(context);
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Sign Up",
          style: TextStyle(color: theme.primaryColor),
        )),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(
              CupertinoTextSelectionToolbar.kToolbarScreenPadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 7),
                Text(
                  "Plase Enter your email address \nand password for login",
                  style: TextStyle(color: AColors.grey),
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Enter Your Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordControlller,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Enter Your Password",
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: controller.isVisible.value
                            ? Icon(Icons.visibility_off,
                                color: theme.primaryColor, size: 23)
                            : Icon(Icons.visibility,
                                color: theme.primaryColor, size: 23)),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Email";
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Add your forgot password logic
                      },
                      child: Text('Forgot Password?',
                          style: TextStyle(color: theme.primaryColor)),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width, // 1.5,
                  height: 55,
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await authProvider.signin(
                              emailController.text, passwordControlller.text);
                          Fluttertoast.showToast(msg: "Login Success");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        } catch (e) {
                          print(e);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF756ef3),
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "Sign Ip",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                SizedBox(height: 10),
                Text(
                  "SignIn with",
                  style: TextStyle(color: theme.primaryColor),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/images/apple.png"),
                            // fit: BoxFit.cover,
                          ),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3))),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/images/google icon.png"),
                            // fit: BoxFit.cover,
                          ),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3))),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not Register Yet?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Text(
                            "Sign In",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  bool get isSignedIn => currentUser != null;

  Future<void> signin(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:my_app/SignUp/Signup_screen.dart';
// import 'package:my_app/controllers/main_controller.dart';
// import 'package:my_app/utils/Constant/colors.dart';
// import 'package:my_app/view/Home/home_screen.dart';
// import 'package:provider/provider.dart';

// class SignIn extends StatelessWidget {
//   SignIn({super.key});
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordControlller = TextEditingController();
//   @override
//   signinFunc1() async {
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordControlller.text);

//       print(credential);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       } else {
//         print(e.code);
//       }
//     } catch (e) {
//       print(e);
//     }
//     print("Test");
//   }

//   Widget build(BuildContext context) {
//     final controller = Get.put(MainController());
//     final authProvider = Provider.of<AuthProvider>(context);
//     final theme = Theme.of(context);
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//             child: Text(
//           "Sign In",
//           style: TextStyle(color: theme.primaryColor),
//         )),
//       ),
//       body: Column(children: [
//         Padding(
//           padding: EdgeInsets.all(
//               CupertinoTextSelectionToolbar.kToolbarScreenPadding),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   "Welcome Back",
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Plase Enter your email address \nand password for Login",
//                   style: TextStyle(color: AColors.grey),
//                 ),
//                 SizedBox(height: 25),
//                 TextFormField(
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     labelText: "Enter Your Email",
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Please Enter Your Email";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: passwordControlller,
//                   keyboardType: TextInputType.visiblePassword,
//                   decoration: InputDecoration(
//                     labelText: "Enter Your Password",
//                     suffixIcon: IconButton(
//                         onPressed: () {},
//                         icon: controller.isVisible.value
//                             ? Icon(Icons.visibility_off,
//                                 color: theme.primaryColor, size: 23)
//                             : Icon(Icons.visibility,
//                                 color: theme.primaryColor, size: 23)),
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Please Enter Your Email";
//                     }
//                     return null;
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         // Add your forgot password logic
//                       },
//                       child: Text('Forgot Password?',
//                           style: TextStyle(color: theme.primaryColor)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 50),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   height: 55,
//                   child: ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           await authProvider.signin(
//                               emailController.text, passwordControlller.text);
//                           Fluttertoast.showToast(msg: "Login Success");
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HomeScreen()));
//                         } catch (e) {
//                           print(e);
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF756ef3),
//                         foregroundColor: Colors.white,
//                       ),
//                       child: Text(
//                         "Sign In",
//                         style: TextStyle(fontSize: 18),
//                       )),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "SignIn with",
//                   style: TextStyle(color: theme.primaryColor),
//                 ),
//                 SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 40,
//                       width: 40,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                             image: AssetImage("assets/images/apple.png"),
//                             // fit: BoxFit.cover,
//                           ),
//                           border:
//                               Border.all(color: Colors.grey.withOpacity(0.3))),
//                     ),
//                     SizedBox(width: 10),
//                     Container(
//                       height: 40,
//                       width: 40,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                             image: AssetImage("assets/images/google icon.png"),
//                             // fit: BoxFit.cover,
//                           ),
//                           border:
//                               Border.all(color: Colors.grey.withOpacity(0.3))),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Not Register Yet?",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 20, color: Colors.black),
//                       ),
//                       TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => SignUp()));
//                           },
//                           child: Text(
//                             "Sign Up",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 20, color: Colors.blue),
//                           )),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }

// class AuthProvider with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   User? get currentUser => _auth.currentUser;

//   bool get isSignedIn => currentUser != null;

//   Future<void> signin(String email, String password) async {
//     await _auth.signInWithEmailAndPassword(email: email, password: password);
//     notifyListeners();
//   }
// }
