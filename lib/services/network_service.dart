import 'package:http/http.dart';
import 'package:reminder_app_new/model/reminder_model.dart';

class ReminderService {
  Future<Reminder> getReminder() async {
    String url =
        "https://dev.boq.wireandswitch.com/api/list_reminder?page_no=0";
    String token = '42|wjmhqDJ65eqE5tnBfzKT69dp0PXgO9nOgvpr1Q6S';
    final response = await post(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print(response.body);
    final activity = reminderFromJson(response.body);
    return activity;
  }
}
