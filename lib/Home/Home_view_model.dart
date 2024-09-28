import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends GetxController {
  List<int> progressValue = [50, 30, 70];

  List<int> totalValue = [80, 100, 90];
  final data = RxList();

  String formattedDate() {
    DateTime now = DateTime.now();
    return DateFormat('EEEE, d').format(now);
  }

// Stream<QuerysSnapShot> getTask() {
//   return fireStore.snapshots();
// }
  List inProgress = [
    {
      'title': 'Productivity Mobile App',
      'subtitle': 'Create Detail Booking',
      'time': '2 min ago'
    },
    {
      'title': 'Banking Mobile App',
      'subtitle': 'Revision Home Page',
      'time': '5 min ago'
    },
    {
      'title': ' Online Course',
      'subtitle': 'Working On Landing Page',
      'time': '7 min ago'
    }
  ];
}
