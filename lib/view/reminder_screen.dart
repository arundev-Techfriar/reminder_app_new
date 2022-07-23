import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app_new/bloc/reminder_bloc.dart';
import 'package:reminder_app_new/services/network_service.dart';
import 'package:reminder_app_new/view/add_reminder.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReminderBloc(
        RepositoryProvider.of<ReminderService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Text('Reminders'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AddReminder();
                        }));
                      },
                      icon: Icon(Icons.add)),
                  Text("New Reminder"),
                ],
              ),
            ),
          ],
        ),
        body: BlocBuilder<ReminderBloc, ReminderState>(
          builder: (context, state) {
            if (state is ReminderLoadingState) {
              return Center(
                child: SingleChildScrollView(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is ReminderLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.reminderMessage,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          state.date,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          state.time,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
