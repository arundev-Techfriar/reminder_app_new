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
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        state.data[index].alertText,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Text(state.data[index].reminderDate.toString()),
                          SizedBox(
                            width: 20,
                          ),
                          Text(state.data[index].reminderTime),
                        ],
                      ),
                      trailing:
                          //list if widget in appbar actions
                          PopupMenuButton(
                        icon: const Icon(Icons
                            .menu_rounded), //don't specify icon if you want 3 dot menu
                        color: Colors.white,
                        itemBuilder: (context) => [
                          PopupMenuItem<int>(
                            value: 0,
                            child: const Text(
                              "Edit",
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                            onTap: () {},
                          ),
                          const PopupMenuItem<int>(
                            value: 1,
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                        // ignore: avoid_print
                        onSelected: (item) => {print(item)},
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
