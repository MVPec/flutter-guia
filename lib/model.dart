import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  String id;
  String name;
  int mz;
  int villa;
  String date;
  //DocumentReference reference;


 Record({this.id, this.name, this.mz, this.villa, this.date});

Record.fromMap(Map data,   String id):
      assert(data['name'] != null),
      assert(data['villa'] != null),
       id = id ?? '',
       name = data['name'] ?? '',
       mz = data['mz'] ?? '',
       villa = data['villa'] ?? '',
       date = data['date'] ?? ''; 

/* 
   factory Record.fromFirestore(DocumentSnapshot doc){
     Map data = doc.data;
     return Record(
       id: doc.documentID,
       name: data['name'],
       mz: data['mz'] ?? '',
       villa: data['villa'] ?? '',
       date: data['date'] ?? '',
     );
   } */





  toJson(){
    return {
      "name": name,
      "mz": mz,
      "villa": villa,
      "date": date,
    };
  }

@override
 String toString() => "Record<$name:$mz,$villa>";
}