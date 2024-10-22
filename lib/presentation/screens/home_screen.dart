import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/tabs/settings_tab/settings_tab.dart';
import 'package:todo/presentation/screens/tabs/tasks_tab/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> Tabs=[
    TasksTab(),
    SettingsTab(),
  ];

  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("ToDo List"),
      ),
      bottomNavigationBar: BottomAppBar(

        notchMargin: 8,
        child: BottomNavigationBar(

          currentIndex: selectedIndex,
          onTap: (index){
            selectedIndex=index;
            setState(() {

            });
          },
          items:const [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: "Tasks"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        // RoundedRectangleBorder(
        //   side: BorderSide(color: Colors.white,width: 3),
        //   borderRadius: BorderRadius.circular(40),
        // ),
        onPressed: (){

      },
      child:const Icon(Icons.add,size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Tabs[selectedIndex],
    );
  }
}
