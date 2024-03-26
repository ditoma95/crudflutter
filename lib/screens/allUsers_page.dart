import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/model/user_model.dart';
import 'package:crud/screens/widgets/userlist_page.dart';
import 'package:flutter/material.dart';

class AllUsersPage extends StatefulWidget {
  const AllUsersPage({super.key});

  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {

  //list d'objet users
  List<User> allUsers = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          child: Text("Liste d'utilisateurs", style: TextStyle(
            fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,
            color: Colors.black,
          )),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').orderBy('name').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.hasData) {
            allUsers = snapshot.data!.docs
                .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>)).toList();
            return ListUsers(users: allUsers);
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ) ,
    );
  }
} 