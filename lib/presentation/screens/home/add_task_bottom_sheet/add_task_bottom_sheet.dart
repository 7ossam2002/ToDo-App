import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/core/my_text_styles.dart';
import 'package:todo/core/utiles/date_util.dart';
import 'package:todo/database_manager/model/user_dm.dart';
import '../../../../database_manager/model/todo_dm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();

  static Future show(BuildContext context) {
   return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: AddTaskBottomSheet(),
      ),
    );
  }
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime userSelectedDate = DateTime.now();
  TextEditingController titleTask = TextEditingController();
  TextEditingController descriptionTask = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
    // height:400 ,
      height: MediaQuery.of(context).size.height*0.43,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.add_new_task,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Theme.of(context).dialogBackgroundColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: titleTask,
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return "Please enter your task name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.add_new_task,
                    hintStyle: MyTextStyles.greyHint,
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: descriptionTask,
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return "Please describe your task";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.add_description,
                    hintStyle: MyTextStyles.greyHint,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  AppLocalizations.of(context)!.select_date,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith( fontSize: 20,color: Theme.of(context).dialogBackgroundColor),
                  //textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () => showTaskDatePicker(context),
                  child: Text(
                    userSelectedDate.DateFormatted(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 90, right: 90),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).dialogBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: addTaskTodoToFireStore,


                    child: Text(
                      AppLocalizations.of(context)!.add_task_button,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.white),
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

  void showTaskDatePicker(BuildContext context) async {
    userSelectedDate = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:  ColorScheme.light(
              primary: ColorsManager.whiteColor,
              onPrimary: Theme.of(context).dialogBackgroundColor,
              onSurface: ColorsManager.whiteColor,
            ),
          ),
          child: child!,
        );
      },
    )) ??
        userSelectedDate;

    setState(() {});
  }

  void addTaskTodoToFireStore() {
    if (!formKey.currentState!.validate()) {
      debugPrint("Form validation failed - Title or Description might be empty.");

      return ;

    }
    Navigator.pop(context);
    final CollectionReference todoCollection =
    FirebaseFirestore.instance.collection(UserDm.collectionName).doc(UserDm.userDm!.id).collection(TodoDm.collectionName);
    final DocumentReference doc = todoCollection.doc();

    final TodoDm todo = TodoDm(
      id: doc.id,
      title: titleTask.text,
      date: Timestamp.fromMillisecondsSinceEpoch(userSelectedDate.copyWith(hour: 0,minute: 0,second: 0,microsecond: 0,millisecond: 0,).millisecondsSinceEpoch),
      description: descriptionTask.text,
      isDone: false,
    );

    // Attempt to add to Firestore and print debug message for success or error
    doc.set(todo.toJson()).then((value) {
      debugPrint("Task added successfully with ID: ${doc.id}");
      if (mounted) {
        // Pop the bottom sheet only after successfully adding the task
        Navigator.pop(context);
      }
    }).catchError((error) {
      debugPrint("Error adding task to Firestore: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error adding task: $error")),
      );
      if (mounted) {
        // Optionally pop the bottom sheet on error (if needed)

      }
    });
  }

}