import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app_new/services/network_service.dart';
import 'package:reminder_app_new/view/reminder_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reminder',
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => ReminderService(),
            ),
            // RepositoryProvider(
            //   create: (context) => ConnectivityService(),
            // )
          ],
          child: ReminderScreen(),
        ));
  }
}
