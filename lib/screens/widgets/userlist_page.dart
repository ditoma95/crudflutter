// ignore_for_file: must_be_immutable

import 'package:crud/model/user_model.dart';
import 'package:crud/repository/user_repo.dart';
import 'package:flutter/material.dart';

class ListUsers extends StatefulWidget {
  
  List<User> users;
  ListUsers({required this.users});

  @override
  State<ListUsers> createState() => _UserListPageState();
}

class _UserListPageState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    final allUsers = widget.users;
    final _ctrlupdatename = TextEditingController();
    final _ctrlupdateage = TextEditingController();
 
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
                            child: Center(
                              
                              child: Container(
                                child: Column(
                                  children: [
                                     TextField(
                                      style: TextStyle(fontSize: 22, color: Colors.pink),
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelText: "Name",
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.person),
                                        hintText: "Name",
                                      ),
                                      controller: _ctrlupdatename,
                                      
                                      
                                    ),
                                    SizedBox(height: 10,),
                                    TextField(
                                      style: TextStyle(fontSize: 22, color: Colors.pink),
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.numbers),
                                        hintText: "Age",
                                      ),
                                      controller: _ctrlupdateage,
                                      ),
                                    SizedBox(height: 10,),
                                    ElevatedButton(
                                      onPressed: () {
                                        //update
                                        final user = User(
                                          id: allUsers[index].id,
                                          name: _ctrlupdatename.text,
                                          age: int.parse(_ctrlupdateage.text),
                                        );
                                        updateUser(user);
                                        //retour sur la liste d'utilisateur
                                        Navigator.pop(context, 'retour');
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
                  //-------------------suppression----------------
                  TextButton(
                    onPressed: () {
                      //deleteUser(allUsers[index].id);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Suppression : ${allUsers[index].name}"),
                          content: Text("Voulez-vous vraiment supprimer cet utilisateur ?"),
                          actions: [
                            //non
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, 'annuler');
                              },
                              child: Text("non"),
                            ),

                            //oui
                            ElevatedButton(
                              onPressed: () {
                                deleteUser(allUsers[index].id);
                                Navigator.pop(context, 'retour');
                              },
                              child: Text("oui"),
                            ),
                            
                          ],
                        )
                      );
                    },
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