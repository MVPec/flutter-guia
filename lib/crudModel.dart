import 'package:flutter/material.dart';
import 'package:winncar/api.dart';
import 'package:winncar/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudModel extends ChangeNotifier{

  List<Record> records;


  

  
  
   Api _api = Api("teams");

   //List<Record> records;

  Future<List<Record>> buscarRecors() async{
     var result = await _api.getDataCollection();
     records = result.documents.map((doc) => Record.fromMap(doc.data, doc.documentID)).toList();
     return records;

  }

  getData(){
    return Firestore.instance.collection('users').snapshots();
  }


  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }



  Future<bool> addRecord(Record data) async{
    try{
      var result  = await _api.addDocument(data.toJson()) ;
      //notifyListeners();
      return true;
    }catch(e){
      //notifyListeners();
      return false;
    }
  
  }

}