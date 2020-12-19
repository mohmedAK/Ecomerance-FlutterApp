import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'constant.dart';

class PerfumeModel {
  String id;
  String name;
  String brand;
  String category;
  String country;
  String description;
  String gender;
  String imgUrl;
  Map sizePrice;
  bool featured;

  PerfumeModel(
      {this.id,
      this.name,
      this.brand,
      this.category,
      this.country,
      this.description,
      this.gender,
      this.imgUrl,
      this.sizePrice,
      this.featured});

  PerfumeModel.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        brand = snapshot['brand'] ?? '',
        category = snapshot['category'] ?? '',
        country = snapshot['country'],
        description = snapshot['description'],
        gender = snapshot['gender'],
        imgUrl = snapshot['imgUrl'] ?? '',
        sizePrice = snapshot['size_price'] ?? [],
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

class PerfumeNotifier with ChangeNotifier {
  List<PerfumeModel> perfumeSlide = new List();

  List<PerfumeModel> perfume = new List();
  PerfumeModel _currentPerfume;
  double newPrice = 0;
  double oldPrice = 0;
  int _selectedSize = 0;
  int _qty = 1;

  set setSelectedSize(int cp) {
    _selectedSize = cp;
    notifyListeners();
  }

  int get getSelectedSize => _selectedSize;

  set setCurrentPerfume(PerfumeModel cp) {
    _currentPerfume = cp;

    //notifyListeners();
  }

  PerfumeModel get getCurrentPerfume => _currentPerfume;

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

  double get getTotel {
    return newPrice * getQty;
  }

  int get getQty {
    return _qty;
  }

  Future getSlide() async {
    print('hello');
    var result = await FirebaseFirestore.instance
        .collection(COLLACTION_PERFUME)
        .where('featured', isEqualTo: true)
        .get();
    print('length' + result.docs.length.toString());

    perfumeSlide = result.docs
        .map((doc) => PerfumeModel.fromMap(doc.data(), doc.id))
        .toList();
    print(perfumeSlide);

    // notifyListeners();
  }

//  getPrice() {
//    notifyListeners();
//  }
}

Stream<QuerySnapshot> getStreamOfProductByBrand(
    String brandName, String gender) {
  print("iam stream");
  return FirebaseFirestore.instance
      .collection('products')
      .where('brand', isEqualTo: brandName)
      .where('gender', isEqualTo: gender)
      .snapshots();
}

//  Future getPostOfProductByBrand(String brandName, String gender) async {
//    Firestore firestore = Firestore.instance;
//    QuerySnapshot qu = await firestore
//        .collection("products")
//        .where('brand', isEqualTo: brandName)
//        .where('gender', isEqualTo: gender)
//        .getDocuments();
//
//    print(qu.documents.length);
//    return qu.documents;
//  }
