import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/model/user_model.dart';

Future addUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docUser.id;
  await docUser.set(user.toJson());
}

//update
Future updateUser(User user) async {
  final docUser =
      FirebaseFirestore.instance.collection('users').doc(user.id);
  await docUser.update(user.toJson());
}
//delete
Future deleteUser(String id) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc(id);
  await docUser.delete();
}
