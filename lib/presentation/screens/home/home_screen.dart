import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/home/add_task_bottom_sheet/add_task_bottom_sheet.dart';
import 'package:todo/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:todo/presentation/screens/home/tabs/tasks_tab/tasks_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<TasksTabState> tasksTapKey = GlobalKey();
  List<Widget> tabs = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabs = [
      TasksTab(key: tasksTapKey),
      SettingsTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Update appBarTitle based on selectedIndex inside the build method
    String appBarTitle = selectedIndex == 0
        ? AppLocalizations.of(context)!.tasks
        : AppLocalizations.of(context)!.settings;

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
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: AppLocalizations.of(context)?.tasks),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)?.settings),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
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
    });
  }
}
