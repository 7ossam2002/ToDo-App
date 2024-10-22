import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../../../../core/reusable_components/task_item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       children: [
         EasyDateTimeLine(
           initialDate: DateTime.now(),
           onDateChange: (selectedDate) {
             //`selectedDate` the new date selected.
           },
           headerProps: const EasyHeaderProps(
             monthPickerType: MonthPickerType.switcher,
             dateFormatter: DateFormatter.fullDateDMY(),
           ),
           dayProps: const EasyDayProps(
             dayStructure: DayStructure.dayStrDayNum,
             activeDayStyle: DayStyle(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(8)),
                 gradient: LinearGradient(
                   begin: Alignment.topCenter,
                   end: Alignment.bottomCenter,
                   colors: [
                     Color(0xff3371FF),
                     Color(0xff8426D6),
                   ],
                 ),
               ),
             ),

             inactiveDayStyle: DayStyle(
               decoration: BoxDecoration(

                 borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
               ),
               dayStrStyle: TextStyle(
                   color: Colors.blue,


               ),

               dayNumStyle: TextStyle(
                 color: Colors.blue,
                 fontSize: 20,
                 fontWeight: FontWeight.w600
               )
             ),

           ),
           ),
         TaskItem(),

       ],
     ),
    );
  }
}
