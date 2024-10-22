
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),

      margin: EdgeInsets.symmetric(horizontal: 18,vertical: 25),
      child: Slidable(
        startActionPane:  ActionPane(
          extentRatio: 0.2,
          // A motion is a widget used to control how the pane animates.
          motion: const DrawerMotion(),

          children:  [

            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {

              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              autoClose: true,
            ),

          ],
        ),

        endActionPane: ActionPane(
          extentRatio: 0.2,
          // A motion is a widget used to control how the pane animates.
          motion: const DrawerMotion(),

          children:  [

            SlidableAction(
              autoClose: true,
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {

              },
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),

          ],
        ),

        child: Card(

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Theme.of(context).dividerColor,
                  width: 4,
                  height: 60,

                ),
                const SizedBox(width: 25,),
                 Column(
                  children: [
                    Text("HELLO",style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(width: 3,),
                        Text("10:30",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black,fontWeight:FontWeight.w600,fontSize: 16),),

                      ],
                    )
                  ],
                ),
                Spacer(),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 3,horizontal: 14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.check,size: 28,color: Colors.white,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
