//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:demo_maker/Notifier/brand_notifier.dart';
//import 'package:flutter/cupertino.dart';
//
//class BrandController with ChangeNotifier {
//  Future getPost(String typeOfData) async {
//    Firestore firestore = Firestore.instance;
//    QuerySnapshot qu = await firestore
//        .collection("brands")
//        .where('data.$typeOfData', isEqualTo: true)
//        .getDocuments();
//    print(qu.documents.length);
//    return qu.documents;
//  }
//
//  Future getPostOfProductByBrand(String brandName, String gender) async {
//    Firestore firestore = Firestore.instance;
//    QuerySnapshot qu = await firestore
//        .collection("products")
//        .where('brand', isEqualTo: brandName)
//        .where('gender', isEqualTo: gender)
//        .getDocuments();
//    print(qu.documents.length);
//    return qu.documents;
//  }
//
//  Future getPostOfProductsByType(String productType, String brandName) async {
//    Firestore firestore = Firestore.instance;
//    QuerySnapshot qu = await firestore
//        .collection("makeup")
//        .where('type', isEqualTo: productType)
//        .where('brands', isEqualTo: brandName)
//        .getDocuments();
//    print(qu.documents.length);
//    return qu.documents;
//  }
//}
