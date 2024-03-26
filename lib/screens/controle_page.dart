import 'package:crud/screens/allUsers_page.dart';
import 'package:crud/screens/user_add.dart';
import 'package:flutter/material.dart';

class ControlePage extends StatelessWidget {
  const ControlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("GESTIONS D'UTILISATEURS"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.supervised_user_circle_sharp), text: 'Ajouter',),
              Tab(icon: Icon(Icons.edit_attributes), text: 'List Users',),
              Tab(icon: Icon(Icons.search), text: 'Search',),
            ]
          )
        ),
        body: TabBarView(
          children: [
            UserPage(),
            AllUsersPage(),
            Center(child: Text('Search')),
          ],
        )
      
      )
      
    );
  }
}