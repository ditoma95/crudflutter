import 'package:crud/model/user_model.dart';
import 'package:crud/repository/user_repo.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserPage extends StatefulWidget {
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
    // TextField controllers
    TextEditingController _nameController = TextEditingController();
    TextEditingController _ageController = TextEditingController();

    //_formkey
    final _formkey = GlobalKey<FormState>();

    //ajouter dans la base
    void ajouter(){
      final user = User(name: _nameController.text, age: int.parse(_ageController.text));
      addUser(user);
      //Navigator.pop(context, user);
    }

    //method vider les champs de texts
    void clearText(){
      _nameController.clear();
      _ageController.clear();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enregistrer un utilisateur'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter name',
                  labelText: 'Enter name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Entrer votre nom';
                  }else if(value.length < 3){
                    return 'Le nom doit contenir au moins 3 caractères';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _ageController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.numbers_outlined),
                  border: OutlineInputBorder(),
                  hintText: 'Enter age',
                  labelText: 'Age',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Entrer votre age';
                  }
              
                  return null;
                },
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if(_formkey.currentState!.validate()){
                  ajouter();
                  clearText();
                }
              },
              child: Text(
                "Enregistrer", 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),),
            )
          ]
        )
      )
    );
  }
}