import 'dart:convert';

Reminder reminderFromJson(String str) => Reminder.fromJson(json.decode(str));

String reminderToJson(Reminder data) => json.encode(data.toJson());

class Reminder {
  Reminder({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datas> data;

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
        status: json["status"],
        message: json["message"],
        data: List<Datas>.from(json["data"].map((x) => Datas.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datas {
  Datas({
    required this.id,
    required this.alertText,
    required this.reminderDate,
    required this.reminderTime,
  });

  int id;
  String alertText;
  DateTime reminderDate;
  String reminderTime;

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        id: json["id"],
        alertText: json["alert_text"],
        reminderDate: DateTime.parse(json["reminder_date"]),
        reminderTime: json["reminder_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alert_text": alertText,
        "reminder_date":
            "${reminderDate.year.toString().padLeft(4, '0')}-${reminderDate.month.toString().padLeft(2, '0')}-${reminderDate.day.toString().padLeft(2, '0')}",
        "reminder_time": reminderTime,
      };
}
