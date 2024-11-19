import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDm {
  static const String collectionName = "ToDo";
  String? id; // Make ID nullable
  late String title;
  late String description;
  late Timestamp date;
  late bool isDone;

  TodoDm({
    this.id, // Optional id
    required this.title,
    required this.date,
    required this.description,
    required this.isDone,
  });

  // Converts a TodoDm object to a Map (for saving to Firestore)
  Map<String, dynamic> toJson() {
    return {
      "id": id, // If `id` is nullable, it will not throw an error if null
      "title": title,
      "description": description,
      "date": date,
      "isDone": isDone,
    };
  }

  // Converts a Map from Firestore to a TodoDm object
  TodoDm.fromJson(Map<String, dynamic> json) {
    id = json["id"]; // If `id` is missing, this will be null
    title = json["title"] ?? ""; // Add default value if field is missing
    description = json["description"] ?? "";
    date = json["date"] ?? Timestamp.now(); // Add default value if field is missing
    isDone = json["isDone"] ?? false; // Add default value if field is missing
  }

  // Helper function to format the date nicely
  String getFormattedDate() {
    DateTime dateTime = date.toDate();
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  // Update task status
  void toggleStatus() {
    isDone = !isDone;
  }

  // Example method to create a task from user input (to be used in your form)
  static TodoDm fromUserInput(String title, String description, DateTime date) {
    return TodoDm(
      title: title,
      description: description,
      date: Timestamp.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch),
      isDone: false,
    );
  }
}