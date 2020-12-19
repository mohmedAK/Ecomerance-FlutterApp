import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String ref = "brands";
  //CollectionReference ref;

  /*Api({this.path } ) {
    ref = _db.collection(path);
  }*/

  Future<QuerySnapshot> getDataCollection(String type) {
    //return ref.getDocuments() ;

    return FirebaseFirestore.instance
        .collection(ref)
        .where('data.$type', isEqualTo: true)
        .get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    // return ref.snapshots() ;
    //return _db.snapshots(ref).getDocuments();
    return _db.collection(ref).snapshots();
  }
//  Future<DocumentSnapshot> getDocumentById(String id) {
//    // return ref.document(id).get();
//    return _db.document(id).get();
//  }
//  Future<void> removeDocument(String id){
//    //return ref.document(id).delete();
//    return _db.document(id).delete();
//  }
//  Future<DocumentReference> addDocument(Map data) {
//    // return ref.add(data);
//    return _db.collection(ref).add(data);
//  }
//  Future<void> updateDocument(Map data , String id) {
//    //return ref.document(id).updateData(data) ;
//    return _db.document(ref).updateData(data);
//  }

}
