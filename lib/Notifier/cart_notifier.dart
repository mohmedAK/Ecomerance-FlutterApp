import 'package:flutter/foundation.dart';

import 'constant.dart';

class CartIModel {
  //final DocumentSnapshot post;
  final String id;
  final String name;
  final int quantity;
  final double price;
  final String type;
  final String sizeOrColor;
  final String imgUrl;
  final String category;
  final String brand;
  String get getSizeOrColor {
    return sizeOrColor;
  }

  CartIModel(
      {@required this.brand,
      @required this.imgUrl,
      @required this.sizeOrColor,
      @required this.type,
      @required this.id,
      @required this.name,
      @required this.quantity,
      @required this.price,
      @required this.category});
}

class CartNotifier with ChangeNotifier {
  Map<String, CartIModel> _items = {};

  Map<String, CartIModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(
      {String typeOfProduct,
      String id,
      String name,
      String imgUrl,
      double price,
      int quantity,
      String type,
      String sizeOrColor,
      String category,
      String brand}) {
    if (typeOfProduct == CATEGORY_PERFUME) {
      List<String> keysForUpdate = List();
      List<String> keysForAdd = List();
      _items.forEach((key, value) {
        print('key' + key);
        print('id ' + id);
        print('val' + value.getSizeOrColor.toString());
        print('val' + sizeOrColor.toString());
        if (key == id && value.getSizeOrColor == sizeOrColor) {
          keysForUpdate.add(key);
          print(keysForUpdate.length.toString() + 'sUpdate');
        } else {
          keysForAdd.add(key);
        }
      });
      keysForAdd.forEach((element) {
        _items.putIfAbsent(
            id,
            () => CartIModel(
                brand: brand,
                name: name,
                id: id,
                imgUrl: imgUrl,
                quantity: quantity,
                price: price,
                type: type,
                sizeOrColor: sizeOrColor,
                category: category));
      });
      keysForAdd.clear();
      keysForUpdate.forEach((element) {
        if (_items.containsKey(element)) {
          print('yes');
          _items.update(
              id,
              (existingCartItem) => CartIModel(
                  id: id,
                  name: existingCartItem.name,
                  imgUrl: existingCartItem.imgUrl,
                  quantity: quantity,
                  price: existingCartItem.price,
                  sizeOrColor: existingCartItem.sizeOrColor,
                  type: existingCartItem.type,
                  category: existingCartItem.category,
                  brand: existingCartItem.brand));
        }
      });
      keysForUpdate.clear();
      if (_items.isEmpty) {
        print('add');
        _items.putIfAbsent(
            id,
            () => CartIModel(
                brand: brand,
                name: name,
                id: id,
                imgUrl: imgUrl,
                quantity: quantity,
                price: price,
                type: type,
                sizeOrColor: sizeOrColor,
                category: category));
      }
    } else if (typeOfProduct == CATEGORY_MAKEUP) {
      List<String> keysForUpdate = List();
      List<String> keysForAdd = List();
      _items.forEach((key, value) {
        print('key' + key);
        print('id ' + id);
        print('val' + value.getSizeOrColor.toString());
        print('val' + sizeOrColor.toString());
        if (key == id && value.getSizeOrColor == sizeOrColor) {
          keysForUpdate.add(key);
          print(keysForUpdate.length.toString() + 'sUpdate');
        } else {
          keysForAdd.add(key);
        }
      });
      keysForAdd.forEach((element) {
        _items.putIfAbsent(
            id,
            () => CartIModel(
                name: name,
                id: id,
                imgUrl: imgUrl,
                quantity: quantity,
                price: price,
                type: type,
                sizeOrColor: sizeOrColor,
                category: category,
                brand: brand));
      });
      keysForAdd.clear();
      keysForUpdate.forEach((element) {
        if (_items.containsKey(element)) {
          print('yes');
          _items.update(
              id,
              (existingCartItem) => CartIModel(
                  id: id,
                  name: existingCartItem.name,
                  imgUrl: existingCartItem.imgUrl,
                  quantity: quantity,
                  price: existingCartItem.price,
                  sizeOrColor: existingCartItem.sizeOrColor,
                  type: existingCartItem.type,
                  category: existingCartItem.category,
                  brand: existingCartItem.brand));
        }
      });
      keysForUpdate.clear();
      if (_items.isEmpty) {
        print('add');
        _items.putIfAbsent(
            id,
            () => CartIModel(
                name: name,
                id: id,
                imgUrl: imgUrl,
                quantity: quantity,
                price: price,
                type: type,
                sizeOrColor: sizeOrColor,
                category: category,
                brand: brand));
      }
    }

//    if (_items.containsKey(id)) {
//      _items.update(
//          id,
//          (existingCartItem) => CartIModel(
//              post: post,
//              id: DateTime.now().toString(),
//              name: existingCartItem.name,
//              imgUrl: existingCartItem.imgUrl,
//              quantity: existingCartItem.quantity + 1,
//              price: existingCartItem.price,
//              sizeOrColor: existingCartItem.sizeOrColor,
//              type: existingCartItem.type));
//    } else {
//      _items.putIfAbsent(
//          id,
//          () => CartIModel(
//                post: post,
//                name: name,
//                id: DateTime.now().toString(),
//                imgUrl: imgUrl,
//                quantity: quantity,
//                price: price,
//                type: type,
//                sizeOrColor: sizeOrColor,
//              ));
    //}
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => CartIModel(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price,
              sizeOrColor: existingCartItem.sizeOrColor,
              type: existingCartItem.type,
              imgUrl: existingCartItem.imgUrl,
              category: existingCartItem.category,
              brand: existingCartItem.brand));
    }
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      print('item' + total.toString());
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
