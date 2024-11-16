import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'my_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:const FirebaseOptions(
        apiKey: 'AIzaSyBYO60XJ4mx-c8BXpV0VhdN2dgX3m4ja-E',
        appId: 'com.example.todo',
        messagingSenderId: '',
        projectId: 'todo-app-ea98f'
    )
  );
 // await FirebaseFirestore.instance.enableNetwork();
  runApp(MyApp());
}

