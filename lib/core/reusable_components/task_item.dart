import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/core/colors_manager.dart';
import '../../database_manager/model/todo_dm.dart';
import '../../database_manager/model/user_dm.dart';
import '../../presentation/screens/home/update_task/update_task.dart';
import '../my_text_styles.dart';

class TaskItem extends StatelessWidget {
  Function onDeleteTask;
  TaskItem({super.key, required this.todo,required this.onDeleteTask});

   TodoDm todo;

  @override
  Widget build(BuildContext context) {
    // Convert Timestamp to DateTime, ensuring correct timezone handling
    DateTime dateTime = todo.date.toDate();
    // Format DateTime as a readable string with 12-hour format and AM/PM
    String formattedDate = DateFormat('yyyy-MM-dd / hh:mm a').format(dateTime);  

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).indicatorColor,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                deleteTask();
                onDeleteTask();
              },
              backgroundColor: Theme.of(context).cardColor,
              foregroundColor: Theme.of(context).primaryColorDark,
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
              autoClose: true,
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                // Navigator.push(
                //   context,
                //   // MaterialPageRoute(
                //   //   builder: (context) => TaskDetailsPage(todoDm: selectedTask),
                //   // ),
                // );

              },
              backgroundColor: Theme.of(context).disabledColor,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: AppLocalizations.of(context)!.edit,
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(15),

          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: ColorsManager.whiteColor,
                  width: 4,
                  height: 60,
                ),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align to start
                  children: [
                    Text(
                      todo.title,
                      style: MyTextStyles.lightTaskTitle?.copyWith(fontSize: 20),
                    ),
                    SizedBox(height: 7),
                    Text(
                      todo.description,
                      style: MyTextStyles.lightTaskTitle?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: Colors.white),
                        const SizedBox(width: 3),
                        Text(
                          formattedDate,
                          style: MyTextStyles.lightDateStyle?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
                  decoration: BoxDecoration(
                    color: ColorsManager.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.check, size: 28, color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteTask()async {
   var tasksCollection= FirebaseFirestore.instance.collection(UserDm.collectionName).doc(UserDm.userDm!.id).collection(TodoDm.collectionName);
 await tasksCollection.doc(todo.id).delete();
  }



}
