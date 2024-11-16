import 'package:flutter/material.dart';
import 'package:todo/core/images_manager.dart';
import 'package:todo/presentation/screens/home/add_task_bottom_sheet/add_task_bottom_sheet.dart';
import 'package:todo/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:todo/presentation/screens/home/tabs/tasks_tab/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<TasksTabState> tasksTapKey=GlobalKey();
  List<Widget> tabs=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = [
      TasksTab(key: tasksTapKey,),
      SettingsTab(),
    ];
  }
  int selectedIndex = 0;
  String appBarTitle = "ToDo List";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(

        extendBody: true,
        appBar: AppBar(
          title: Text(appBarTitle), // Use appBarTitle here
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              onButtonNavBarItem(index); // Call the function with the index argument
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tasks"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()async {
           await AddTaskBottomSheet.show(context);
           tasksTapKey.currentState?.readTodoFromFireStore();
          },
          child: const Icon(Icons.add, size: 30),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: tabs[selectedIndex],
      ),
    );
  }

  void onButtonNavBarItem(int index) {
    setState(() {
      selectedIndex = index;
      appBarTitle = index == 0 ? "ToDo List" : "Settings";
    });
  }
}
