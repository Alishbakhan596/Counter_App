// import 'dart:async';
// import 'dart:convert';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:intl/intl.dart';
// import 'package:lottie/lottie.dart';
// import 'package:my_app/commons/progress_card.dart';
// import 'package:my_app/commons/task_card.dart';
// import 'package:my_app/models/task_model.dart';
// import 'package:my_app/view/TaskStatus/task_status_screen.dart';
// import 'package:my_app/view/TodayTask/today_task_screen.dart';
// import 'package:my_app/view/UpdateTask/update_task.dart';
// import 'package:my_app/widgets/custom_app_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Task> tasks = [];
//   Timer? _progressTimer;

//   @override
//   void initState() {
//     super.initState();
//     _loadTasks();
//     _startProgressTimer();
//   }

//   void _startProgressTimer() {
//     _progressTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
//       for (var task in tasks) {
//         if (task.progress < 100) {
//           setState(() {
//             task.progress += 1;
//             if (task.progress > 100) task.progress = 100; // Cap to 100%
//           });

//           // Persist updated task progress
//           await _saveTasks();
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _progressTimer?.cancel();
//     super.dispose();
//   }

//   void _onTap(Task task) {
//     Get.to(TaskStatusScreen(task: task));
//   }

//   Future<void> _loadTasks() async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String>? taskList = prefs.getStringList('tasks');

//     setState(() {
//       if (taskList != null) {
//         tasks = taskList
//             .map((task) {
//               try {
//                 return Task.fromJson(jsonDecode(task));
//               } catch (e) {
//                 print('Error decoding task: $e');
//                 return null;
//               }
//             })
//             .whereType<Task>()
//             .toList();
//       }
//     });
//   }

//   Future<void> _saveTasks() async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> taskList =
//         tasks.map((task) => jsonEncode(task.toJson())).toList();
//     await prefs.setStringList('tasks', taskList);
//   }

//   void _deleteTask(int index) {
//     setState(() {
//       tasks.removeAt(index); // Remove task from the list
//       _saveTasks(); // Persist updated list
//     });
//   }

//   void _updateTask(Task task, context, index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final theme = Theme.of(context);
//         return AlertDialog(
//           backgroundColor: theme.scaffoldBackgroundColor,
//           title: Text(
//             'Update Task',
//             style: TextStyle(color: theme.primaryColor),
//           ),
//           content: Text(
//             'Are you sure you want to update the task?',
//             style: TextStyle(color: theme.primaryColor),
//           ),
//           actions: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: theme.iconTheme.color,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12))),
//               onPressed: () => Navigator.of(context).pop(false),
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: theme.iconTheme.color,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12))),
//               onPressed: () => Get.to(UpdateTaskScreen(
//                 index: index,
//               )),
//               child: const Text(
//                 'Update',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//     // Navigate to an update screen or show a dialog to edit task
//     // Implement your update logic here
//     print("Update task: ${task.taskName}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     final theme = Theme.of(context);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               vertical: height * 0.07, horizontal: width * 0.06),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomApButton(
//                     onTap: () {
//                       Get.to(const TodayTaskScreen());
//                     },
//                     icon: Iconsax.category,
//                   ),
//                   Text(
//                     DateFormat('EEEE, dd').format(DateTime.now()),
//                     style: TextStyle(
//                       color: theme.primaryColor,
//                       fontSize: 19,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   CustomApButton(onTap: () {}, icon: Iconsax.notification),
//                 ],
//               ),
//               const SizedBox(height: 40),
//               Text(
//                 "Let’s make a \nhabit together 🙌",
//                 style: TextStyle(
//                     fontSize: 28,
//                     color: theme.primaryColor,
//                     fontWeight: FontWeight.w800),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 150,
//                 child: ListView.builder(
//                   itemCount: 4,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return ProgressCard(
//                       title: "Application Design",
//                       subtitle: "UI Design Kit",
//                       progress: 50,
//                       total: 80,
//                       users: const [
//                         "Assets/person/Ellipse (1).png",
//                         "Assets/person/Ellipse (1).png"
//                       ],
//                       index: index,
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "In Progress",
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: theme.primaryColor,
//                         fontWeight: FontWeight.w800),
//                   ),
//                   Icon(Icons.arrow_forward_ios, color: theme.primaryColor),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               tasks.isEmpty
//                   ? Column(
//                       children: [
//                         SizedBox(
//                           height: height * 0.08,
//                           child: Center(
//                             child: Text(
//                               'No tasks available',
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   color: theme.primaryColor,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                           ),
//                         ),
//                         Lottie.asset(
//                           height: height * 0.3,
//                           'Assets/Animation/Animation - 1727514970400.json',
//                           repeat: true,
//                         )
//                       ],
//                     )
//                   : ListView.builder(
//                       reverse: true,
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: tasks.length,
//                       itemBuilder: (context, index) {
//                         final task = tasks[index];
//                         return TaskCard(
//                           progress: task.progress / 100.0, // Link progress here
//                           appName: task.taskName,
//                           taskName: task.taskName,
//                           dateTime:
//                               '${task.date}\nStart: ${task.timeStart} - End: ${task.timeEnd}',
//                           onTap: () {
//                             _onTap(task); // Navigate to TaskStatusScreen
//                           },
//                           onDelete: () {
//                             _deleteTask(index); // Delete task from list
//                           },
//                           onUpdate: () {
//                             _updateTask(
//                               task,
//                               context,
//                               index,
//                             ); // Implement update logic
//                           },
//                         );
//                       },
//                     ),

//               // shrinkWrap: true,
//               // physics: const NeverScrollableScrollPhysics(),
//               // itemCount: tasks.length,
//               // itemBuilder: (context, index) {
//               //   final task = tasks[index];
//               //   return TaskCard(
//               //     progress: task.progress / 100.0, // Link progress here
//               //     appName: task.taskName,
//               //     taskName: task.taskName,
//               //     dateTime:
//               //         '${task.date}\nStart: ${task.timeStart} - End: ${task.timeEnd}',
//               //     onTap: () {
//               //       _onTap(task); // Navigate to TaskStatusScreen
//               //     },
//               //     onDelete: () {
//               //       _deleteTask(index); // Delete task from list
//               //     },
//               //     onUpdate: () {
//               //       _updateTask(
//               //         task,
//               //         context,
//               //         index,
//               //       ); // Implement update logic
//               //     },
//               //   );
//               //   },
//               // ),
// // >>>>>>> origin/main
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
//import 'package:my_app/Home/Home_view_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected tab index
//  final HomeViewModel controller = Get.put(HomeViewModel());

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String date = controller.formattedDate();
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.07, horizontal: width * 0.06),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.grid_view_outlined, color: theme.primaryColor),
            ),
            // Text(
            //   DateFormat('EEEE, dd').format(DateTime.now()),
            //   style: TextStyle(
            //     color: theme.primaryColor,
            //     fontSize: 19,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            // Center(
            //     child: Text('Friday, 26',
            //         style: TextStyle(color: Colors.white, fontSize: 20))),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined,
                    color: theme.primaryColor)),
          ]),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Let’s make a \nhabit together 🙌",
            style: TextStyle(
                fontSize: 28,
                color: theme.primaryColor,
                fontWeight: FontWeight.w800),
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
                    color: theme.primaryColor,
                    fontWeight: FontWeight.w800),
              ),
              Icon(Icons.arrow_forward_ios, color: theme.primaryColor)
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
                    icon: Icon(Iconsax.folder_minus), label: 'Task'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    label: 'Add'),
                BottomNavigationBarItem(
                    icon: Icon(Iconsax.message), label: 'Chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: 'Profile'),
              ]),
        ]),
      ),
    );
  }
}
