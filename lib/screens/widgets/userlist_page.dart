// ignore_for_file: must_be_immutable

import 'package:crud/model/user_model.dart';
import 'package:flutter/material.dart';

class ListUsers extends StatefulWidget {
  
  List<User> users;
  ListUsers({required this.users});

  @override
  State<ListUsers> createState() => _UserListPageState();
}

class _UserListPageState extends State<ListUsers> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final allUsers = widget.users;
 
    return ListView.builder(
        itemCount: allUsers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Text(allUsers[index].name.substring(0, 2).toUpperCase(), 
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(allUsers[index].name),
              subtitle: Text(allUsers[index].age.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder:(context) => AlertDialog(
                          title: Text("Update : ${allUsers[index].name}"),
                          content: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Container(
                                child: Column(
                                  children: [
                                     TextFormField(
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.person),
                                        hintText: "Name",
                                      ),
                                      validator: (value) {
                                        if (value ==null || value.isEmpty) {
                                          return "Please enter your name";
                                        }else if(value.length < 3){
                                          return "Name must be at least 3 characters long";
                                        }
                                        return null;
                                      },
                                      
                                    ),
                                    SizedBox(height: 10,),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.numbers),
                                        hintText: "Age",
                                      ),
                                      validator: (value) {
                                        if (value ==null || value.isEmpty) {
                                          return "Please enter your age";
                                        }
                                        return null;
                                      },                                    ),
                                    SizedBox(height: 10,),
                                    ElevatedButton(
                                      onPressed: () {
                                        if(_formKey.currentState!.validate()){}
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        child: Text("Update", textAlign: TextAlign.center,),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, 'annuler');
                              },
                              child: Text("Annuler"),
                            )
                          ],
                        ),

                      );
                    },
                    child: Icon(Icons.edit, color: Colors.green, size: 20,),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(Icons.delete, color: Colors.red, size: 20,),
                  ),
                ]
              )
            ) 
        );
      }
    );
  }
}  