import 'package:cloud_firestore/cloud_firestore.dart';

class Api{
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;



  Api(this.path){
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection(){
    return ref.getDocuments();
  }
  Stream<QuerySnapshot> streamDataCollection(){
    return ref.snapshots();
  }


  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
}