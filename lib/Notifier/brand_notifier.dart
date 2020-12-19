import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';

class BrandModel {
  String id;
  String brandName;
  String imgUrl;
  Map data;

  BrandModel.fromMap(Map snapshot, String id)
      : id = id ?? '',
        brandName = snapshot['brandName'] ?? '',
        imgUrl = snapshot['imgUrl'] ?? '',
        data = snapshot['data'] ?? '';
}

class BrandNotifier with ChangeNotifier {
//  List<BrandModel> _brandList = [];
//
//  BrandModel _currentBrand;
//
//  UnmodifiableListView<BrandModel> get brandList =>
//      UnmodifiableListView(_brandList);
//
//  BrandModel get currentBrand => _currentBrand;
//
//  set brandList(List<BrandModel> brandList) {
//    _brandList = brandList;
//    notifyListeners();
//  }
//
//  set currentBrand(BrandModel brandModel) {
//    _currentBrand = brandModel;
//
//    notifyListeners();
//  }

  List<BrandModel> brands = new List();
  List<BrandModel> brandsWomen = new List();
  List<BrandModel> brandsMen = new List();
  List<BrandModel> brandsMakeup = new List();

  Future getBrand() async {
    print('GETbRAND');
    await Firebase.initializeApp();
    var result = await FirebaseFirestore.instance
        .collection('brands')
        // .where('data.$type', isEqualTo: true)
        .get();
    print('length' + result.docs.length.toString());

    brands = result.docs
        .map((doc) => BrandModel.fromMap(doc.data(), doc.id))
        .toList();
    arrangeBrandData();

    // notifyListeners();
  }

  void arrangeBrandData() {
    brands.forEach((element) {
      element.data.forEach((key, value) {
        // BrandModel temp = element;
        if (key == 'women' && value == true) {
          // print('key $key  value $value for women');
          brandsWomen.add(element);
        }
        if (key == 'men' && value == true) {
          //  print('key $key  value $value for men');
          brandsMen.add(element);
        }
        if (key == 'makeup' && value == true) {
          brandsMakeup.add(element);
        }
      });
    });
    //notifyListeners();
  }
}
