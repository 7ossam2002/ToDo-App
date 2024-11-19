import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/core/my_text_styles.dart';
import 'package:todo/database_manager/model/todo_dm.dart';
import '../../../../../core/reusable_components/task_item.dart';
import '../../../../../database_manager/model/user_dm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => TasksTabState();
}

class TasksTabState extends State<TasksTab> {
  List<TodoDm> todos = [];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    readTodoFromFireStore();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: EasyDateTimeLine(
            initialDate: selectedDate,
            onDateChange: (newDate) {
              setState(() {
                selectedDate = newDate;
                readTodoFromFireStore(); // Re-fetch tasks for the new date
              });
            },
            headerProps: EasyHeaderProps(
              monthStyle: TextStyle(color: Theme.of(context).dialogBackgroundColor),
              selectedDateStyle: TextStyle(color: Theme.of(context).dialogBackgroundColor,fontSize: 17,fontWeight: FontWeight.w700),
              monthPickerType: MonthPickerType.dropDown,
              dateFormatter: DateFormatter.fullDateDMY(),
            ),
            dayProps: EasyDayProps(
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).dialogBackgroundColor
                ),
              ),
              inactiveDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorsManager.greyColor,
                ),
                dayStrStyle: TextStyle(color: Theme.of(context).dialogBackgroundColor),
                dayNumStyle: TextStyle(
                  color: Theme.of(context).dialogBackgroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: todos.isEmpty
              ? Center(child: Text(AppLocalizations.of(context)!.noTasks,style: TextStyle(
            color: Theme.of(context).dialogBackgroundColor,fontSize: 20,fontWeight: FontWeight.w700
          ),))
              : ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => TaskItem(todo: todos[index],onDeleteTask: (){readTodoFromFireStore();},),
            itemCount: todos.length,
          ),
        ),
      ],
    );
  }

  Future<void> readTodoFromFireStore() async {
    CollectionReference todoCollection = FirebaseFirestore.instance.collection(UserDm.collectionName).doc(UserDm.userDm!.id).collection(TodoDm.collectionName);
    QuerySnapshot querySnapshot = await todoCollection.where('date',isEqualTo: selectedDate..copyWith(hour: 0,minute: 0,second: 0,microsecond: 0,millisecond: 0,)).get();

    // Map documents and filter by selectedDate
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    if (documents.isNotEmpty) {
      setState(() {
        todos = documents.map((docSnapshot) {
          Map<String, dynamic> json = docSnapshot.data() as Map<String, dynamic>;
          return TodoDm.fromJson(json);
        }).where((todo) =>
        todo.date.toDate().year == selectedDate.year &&
            todo.date.toDate().month == selectedDate.month &&
            todo.date.toDate().day == selectedDate.day)
            .toList();
      });
    } else {
      setState(() {
        todos = [];
      });
    }
  }
}
