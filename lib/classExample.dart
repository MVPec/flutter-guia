
import 'dart:convert';
/* import 'dart:convert';
import 'package:http/http.dart' as http;


class User{

  String userName;
  int age;


  User({this.userName, this.age});

  User.fromMap(Map<String, dynamic> json)
  : userName = json['login']['username'],
    age      = json['dob']['age'];


}


class Users{

  List<User> items = List();

  Users();

  Users.fronJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    for (var item in jsonList) {

      final user = User.fromMap(item);

      
      items.add(user);
      
    }
  }
}

class ProviderUser{

  Future<List<User>> getUser() async{

    final resp = await http.get('https://randomuser.me/api/?results=5000');
    final decodeData = json.decode(resp.body);

    final user = Users.fronJsonList(decodeData['results']);

    return user.items;
  }
}

 */
import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String id;
  String name;

  User.fromMap(Map<String, dynamic> data)
  : id = data['id'],
    name = data['name'] ?? '';

}

class Users{

  List<User> items = new List();

  Users();


  Users.fromFirestorList(List<DocumentSnapshot> jsonList){

    for (var item in jsonList) {
     
     final user = User.fromMap(item.data);

     items.add(user);
     
    }

  }

}


class ProvedorUsers{

  final dataBaseReference = Firestore.instance;

  Stream<List<User>> getUser(){

    Future.delayed(Duration(seconds: 10));
    
    final resp = dataBaseReference.collection('users').snapshots();

    return resp.map((list) => Users.fromFirestorList(list.documents).items);

  }


}


