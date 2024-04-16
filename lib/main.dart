import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseseries/firebase_options.dart';
import 'package:firebaseseries/screen/loginscreen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //ensures that the binding is initialized before the app starts
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

//------FETCHING DATA-----------
//  QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("users").get();
//   for (var doc in snapshot.docs) {
//     debugPrint(doc.data().toString());
//   }

//-----------FETCHING SPECIFIC DATA--------------
  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection("users")
      .doc("pBIZESOxqeMFoBDk6QYW")
      .get();
  debugPrint(snapshot.data().toString());

  Map<String, dynamic> newUserData = {"name": "ant", "email": "ant.com"};

  // await fireStore.collection("users").add(newUserData);
  // debugPrint("new user saved");

//---GIVING OWN ID-----
  await fireStore.collection("users").doc("id").set(newUserData);
  debugPrint("new user saved");

//-------UPDATING DATA------
  await fireStore
      .collection("users")
      .doc("id")
      .update({"email": "manu@gmail.com"});
  debugPrint("user updated");

//-------Deleting data----------
  await fireStore.collection("users").doc("id").delete();
  debugPrint("user deleted");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
