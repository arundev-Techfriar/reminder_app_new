import 'package:flutter/material.dart';
import 'package:reminder_app_new/view/widgets/input_decoration.dart';

class AddReminder extends StatelessWidget {
  final _textController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set a Reminder'),
        backgroundColor: Colors.white70,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                InputFieldDecoration(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                              hintText: "Reminder Message",
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                InputFieldDecoration(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          controller: _dateController,
                          decoration: InputDecoration(
                            hintText: "Set Date",
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.calendar_month,
                                color: Colors.orange),
                          ),
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2300));
                            _dateController.text =
                                date.toString().substring(0, 10);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                InputFieldDecoration(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          controller: _timeController,
                          decoration: InputDecoration(
                            hintText: "Set Time",
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.alarm, color: Colors.orange),
                          ),
                          onTap: () async {
                            var time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            _timeController.text =
                                '${time?.hour}:${time?.minute}';
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: TextButton(
                      child: Text("Add Reminder",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
