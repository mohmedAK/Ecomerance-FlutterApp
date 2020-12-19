import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MakeupModel {
  String id;
  String name;
  String brand;
  String category;
  String type;
  String country;
  String description;
  String imgUrl;
  String gender;
  List<dynamic> color;
  List<dynamic> price;
  bool featured;

  MakeupModel(
      {this.id,
      this.name,
      this.brand,
      this.category,
      this.type,
      this.country,
      this.description,
      this.imgUrl,
      this.gender,
      this.color,
      this.price,
      this.featured});

  MakeupModel.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        brand = snapshot['brand'] ?? '',
        category = snapshot['category'] ?? '',
        type = snapshot['type'] ?? '',
        country = snapshot['country'] ?? '',
        description = snapshot['description'] ?? '',
        imgUrl = snapshot['imgUrl'] ?? '',
        gender = snapshot['gender'] ?? '',
        color = snapshot['color'],
        price = snapshot['price'],
        featured = snapshot['featured'];

  toJson() {
    return {
      "name": name,
      "brand": brand,
      "category": category,
      "picture": imgUrl,
      "featured": featured,
    };
  }
}

class MakeupNotifier with ChangeNotifier {
  List<MakeupModel> makeupList;
  MakeupModel _currentMakeup;
  int _qty = 1;
  String _color;

  incremnt() {
    _qty++;
    notifyListeners();
  }

  dicrement() {
    _qty--;
    if (_qty == 0) {
      _qty = 1;
    }
    notifyListeners();
  }

  set setColor(String color) {
    _color = color;
    notifyListeners();
  }

  set setMakeupList(List<MakeupModel> _makeupList) {
    makeupList = _makeupList;
    // notifyListeners();
  }

  set currentMakeup(MakeupModel makeupModel) {
    _currentMakeup = makeupModel;
    //notifyListeners();
  }

  List<String> getColorsMethod() {
    List<String> colors = currentMakeup.color.map((e) => e as String).toList();
    return colors;
  }

  MakeupModel get currentMakeup => _currentMakeup;
  String get getColor {
    return _color;
  }

  int get getQty {
    return _qty;
  }

  double get getNewPrice {
    return double.parse(
                currentMakeup.price.map((e) => e).toList()[0].toString()) ==
            null
        ? 0
        : double.parse(
            currentMakeup.price.map((e) => e).toList()[0].toString());
  }

  double get getOldPrice {
    return double.parse(
                currentMakeup.price.map((e) => e).toList()[1].toString()) ==
            null
        ? 0
        : double.parse(
            currentMakeup.price.map((e) => e).toList()[1].toString());
  }

  double get getTotel {
    return getNewPrice * getQty;
  }

//  Future getPostOfMakeupByType(String brandName, String type) async {
//    Firestore firestore = Firestore.instance;
//    QuerySnapshot qu = await firestore
//        .collection("makeup")
//        .where('brand', isEqualTo: brandName)
//        .where('type', isEqualTo: type)
//        .getDocuments();
//
//    // print(qu.documents.length);
//    return qu.documents;
//  }

  Stream<QuerySnapshot> streamMakeupByType(
      String brandName, String type, String gender) {
    if (brandName == 'All') {
      return FirebaseFirestore.instance
          .collection("makeup")
          // .where('brand', isEqualTo: brandName)
          .where('type', isEqualTo: type)
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection("makeup")
          .where('brand', isEqualTo: brandName)
          .where('type', isEqualTo: type)
          .where('gender', isEqualTo: gender)
          .snapshots();
    }
  }
}
