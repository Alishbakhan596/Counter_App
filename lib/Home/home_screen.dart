import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Home/Home_view_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected tab index
  final HomeViewModel controller = Get.put(HomeViewModel());

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String date = controller.formattedDate();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: const Size.fromHeight(100),
      //     child: CustomAppBar(
      //       icon: IconButton(
      //         onPressed: () {},
      //         icon: Icon(Icons.grid_view_outlined, color: Colors.white),
      //       ),
      //       icon1: IconButton(
      //         onPressed: () {},
      //         icon: Icon(Icons.notifications_outlined, color: Colors.white),
      //       ),
      //       title: date,
      //     )),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.07, horizontal: width * 0.06),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.grid_view_outlined, color: Colors.white),
            ),

            // Center(
            //     child: Text('Friday, 26',
            //         style: TextStyle(color: Colors.white, fontSize: 20))),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined, color: Colors.white)),
          ]),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Let’s make a \nhabit together 🙌",
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 150,
          ),
          Container(
            height: 180,
            width: 400,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Application Design",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              "UI Design Kit",
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFF5945FB),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "In Progress",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white)
            ],
          ),
          BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: const Color.fromRGBO(117, 110, 243, 1),
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.folder_open_outlined), label: 'Task'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    label: 'Add'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.message), label: 'Chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_outlined),
                    label: 'Profile'),
              ]),
          // BottomAppBar(
          //   child: Container(
          //     color: Colors.black,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Row(
          //           children: [
          //             IconButton(
          //                 onPressed: () {
          //                   // Navigator.push(
          //                   //     context,
          //                   //     MaterialPageRoute(
          //                   //         builder: (context) => IceCream()));
          //                 },
          //                 icon: Icon(
          //                   Icons.home,
          //                   size: 30,
          //                   color: Colors.white,
          //                 )),
          //             IconButton(
          //                 onPressed: () {
          //                   // Navigator.push(
          //                   //     context,
          //                   //     MaterialPageRoute(
          //                   //         builder: (context) => Cart()));
          //                 },
          //                 icon: Icon(
          //                   Icons.chat_bubble,
          //                   size: 30,
          //                   color: Colors.white,
          //                 )),
          //             IconButton(
          //                 onPressed: () {},
          //                 icon: Icon(
          //                   Icons.favorite_outline,
          //                   size: 30,
          //                   color: Colors.white,
          //                 )),
          //             IconButton(
          //                 onPressed: () {
          //                   // Navigator.push(
          //                   //     context,
          //                   //     MaterialPageRoute(
          //                   //         builder: (context) => Profile()));
          //                 },
          //                 icon: Icon(
          //                   Icons.person_outline,
          //                   size: 30,
          //                   color: Colors.white,
          //                 )),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
