import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_maker/Notifier/cart_notifier.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/pages/footer.dart';
import 'package:demo_maker/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  static String id = 'account';
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController username = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

//  final _phoneController = TextEditingController();
//   final _codeController = TextEditingController();
  // User user;
//  Future<bool> loginUser(String phone, BuildContext context) async {
//    FirebaseAuth _auth = FirebaseAuth.instance;
//    int cartItem =
//        Provider.of<CartNotifier>(context, listen: false).items.length;
//    if (cartItem == 0) {
//      showDialog(
//          context: context,
//          barrierDismissible: false,
//          builder: (context) {
//            return AlertDialog(
//              title: Text(
//                "يرجى شراء بعض المنتجات !",
//                textDirection: rtl,
//              ),
//              content: Column(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
////                  TextField(
////                    controller: _codeController,
////                  ),
//                ],
//              ),
//              actions: <Widget>[
//                FlatButton(
//                  child: Text("Confirm"),
//                  textColor: Colors.white,
//                  color: Colors.blue,
//                  onPressed: () {
//                    Navigator.pushReplacement(context,
//                        MaterialPageRoute(builder: (context) => Home()));
//                  },
//                )
//              ],
//            );
//          });
//    } else {
//      _auth.verifyPhoneNumber(
//          phoneNumber: phone,
//          timeout: Duration(seconds: 60),
//          verificationCompleted: (AuthCredential credential) async {
//            print('you are auth');
//            Navigator.of(context).pop();
//            print('you are not');
//
//            AuthResult result = await _auth.signInWithCredential(credential);
//
//            user = result.user;
//
//            if (user != null) {
//              final QuerySnapshot result = await Firestore.instance
//                  .collection("users")
//                  .where("id", isEqualTo: user.uid)
//                  .getDocuments();
//
//              final List<DocumentSnapshot> document = result.documents;
//
//              String date = DateTime.now().toString();
//              if (document.length == 0) {
//                //insert user to our collaction
//                Firestore.instance
//                    .collection("users")
//                    .document(
//                        username.text.trim() + _phoneController.text.trim())
//                    .setData({
//                  "id": user.uid,
//                  "username": username.text.trim(),
//                  "location": location.text.trim(),
//                  "phoneNumber": _phoneController.text.trim()
//                });
//
//                Provider.of<CartNotifier>(context, listen: false)
//                    .items
//                    .forEach((key, value) {
//                  Firestore.instance
//                      .collection("users")
//                      .document(
//                          username.text.trim() + _phoneController.text.trim())
//                      .collection('orders')
//                      .document(date)
//                      .collection(user.uid)
//                      .document(key)
//                      .setData({
//                    'id': value.id,
//                    'name': value.name,
//                    'brand': value.brand,
//                    'category': value.category,
//                    'price': value.price,
//                    'quantity': value.quantity,
//                    'sizeOrColor': value.sizeOrColor,
//                    'type': value.type,
//                    'imgUrl': value.imgUrl,
//                  });
//                });
//                showDialog(
//                    context: context,
//                    barrierDismissible: false,
//                    builder: (context) {
//                      return AlertDialog(
//                        title: Text(
//                          "شكرا لشرائكم منتجاتنا",
//                          textDirection: rtl,
//                        ),
//                        content: Column(
//                          mainAxisSize: MainAxisSize.min,
//                          children: <Widget>[
////                            TextField(
////                              controller: _codeController,
////                            ),
//                          ],
//                        ),
//                        actions: <Widget>[
//                          FlatButton(
//                            child: Text("انتقال الى الواجهة الرئيسيه"),
//                            textColor: Colors.white,
//                            color: Colors.blue,
//                            onPressed: () {
//                              Navigator.pushReplacement(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) => Home()));
//                            },
//                          )
//                        ],
//                      );
//                    });
//                print('document');
//              } else {
//                // String date = DateTime.now().toString();
//
//                Firestore.instance
//                    .collection("users")
//                    .document(
//                        username.text.trim() + _phoneController.text.trim())
//                    .updateData({
//                  // "id": _phoneController.text.trim(),
//                  "username": username.text.trim(),
//                  "location": location.text.trim(),
//                  // "phoneNumber": _phoneController.text.trim()
//                });
//
//                Provider.of<CartNotifier>(context, listen: false)
//                    .items
//                    .forEach((key, value) {
//                  Firestore.instance
//                      .collection("users")
//                      .document(
//                          username.text.trim() + _phoneController.text.trim())
//                      .collection('orders')
//                      .document(date)
//                      .collection(user.uid)
//                      .document(key)
//                      .setData({
//                    'id': value.id,
//                    'name': value.name,
//                    'brand': value.brand,
//                    'category': value.category,
//                    'price': value.price,
//                    'quantity': value.quantity,
//                    'sizeOrColor': value.sizeOrColor,
//                    'type': value.type,
//                    'imgUrl': value.imgUrl,
//                  });
//                });
//              }
//            } else {
//              print("Error");
//            }
//
//            //This callback would gets called when verification is done auto maticlly
//          },
//          verificationFailed: (AuthException exception) {
//            print(exception);
//          },
//          codeSent: (String verificationId, [int forceResendingToken]) {
//            showDialog(
//                context: context,
//                barrierDismissible: false,
//                builder: (context) {
//                  return AlertDialog(
//                    title: Text(
//                      "يرجى الانتظار سوف تصلك رسالة برمز الدخول",
//                      textDirection: rtl,
//                    ),
//                    content: Column(
//                      mainAxisSize: MainAxisSize.min,
//                      children: <Widget>[
//                        TextField(
//                          controller: _codeController,
//                        ),
//                      ],
//                    ),
//                    actions: <Widget>[
//                      FlatButton(
//                        child: Text("تاكيد"),
//                        textColor: Colors.white,
//                        color: Colors.blue,
//                        onPressed: () async {
//                          final code = _codeController.text.trim();
//                          AuthCredential credential =
//                              PhoneAuthProvider.getCredential(
//                                  verificationId: verificationId,
//                                  smsCode: code);
//
//                          AuthResult result =
//                              await _auth.signInWithCredential(credential);
//
//                          user = result.user;
//
//                          if (user != null) {
//                            final QuerySnapshot result = await Firestore
//                                .instance
//                                .collection("users")
//                                .where("id", isEqualTo: user.uid)
//                                .getDocuments();
//
//                            final List<DocumentSnapshot> document =
//                                result.documents;
//
//                            String date = DateTime.now().toString();
//                            if (document.length == 0) {
//                              //insert user to our collaction
//                              Firestore.instance
//                                  .collection("users")
//                                  .document(username.text.trim() +
//                                      _phoneController.text.trim())
//                                  .setData({
//                                "id": user.uid,
//                                "username": username.text.trim(),
//                                "location": location.text.trim(),
//                                "phoneNumber": _phoneController.text.trim()
//                              });
//
//                              Provider.of<CartNotifier>(context, listen: false)
//                                  .items
//                                  .forEach((key, value) {
//                                Firestore.instance
//                                    .collection("users")
//                                    .document(username.text.trim() +
//                                        _phoneController.text.trim())
//                                    .collection('orders')
//                                    .document(date)
//                                    .collection(user.uid)
//                                    .document(key)
//                                    .setData({
//                                  'id': value.id,
//                                  'name': value.name,
//                                  'brand': value.brand,
//                                  'category': value.category,
//                                  'price': value.price,
//                                  'quantity': value.quantity,
//                                  'sizeOrColor': value.sizeOrColor,
//                                  'type': value.type,
//                                  'imgUrl': value.imgUrl,
//                                });
//                              });
//
//                              print('document');
//                              showDialog(
//                                  context: context,
//                                  barrierDismissible: false,
//                                  builder: (context) {
//                                    return AlertDialog(
//                                      title: Text(
//                                        "شكرا لشرائكم منتجاتنا",
//                                        textDirection: rtl,
//                                      ),
//                                      content: Column(
//                                        mainAxisSize: MainAxisSize.min,
//                                        children: <Widget>[
////                                          TextField(
////                                            controller: _codeController,
////                                          ),
//                                        ],
//                                      ),
//                                      actions: <Widget>[
//                                        FlatButton(
//                                          child: Text(
//                                              "انتقال الى الواجهة الرئيسيه"),
//                                          textColor: Colors.white,
//                                          color: Colors.blue,
//                                          onPressed: () {
//                                            Navigator.pushReplacement(
//                                                context,
//                                                MaterialPageRoute(
//                                                    builder: (context) =>
//                                                        Home()));
//                                          },
//                                        )
//                                      ],
//                                    );
//                                  });
//                            } else {
//                              // String date = DateTime.now().toString();
//
//                              Firestore.instance
//                                  .collection("users")
//                                  .document(username.text.trim() +
//                                      _phoneController.text.trim())
//                                  .updateData({
//                                // "id": _phoneController.text.trim(),
//                                "username": username.text.trim(),
//                                "location": location.text.trim(),
//                                // "phoneNumber": _phoneController.text.trim()
//                              });
//
//                              Provider.of<CartNotifier>(context, listen: false)
//                                  .items
//                                  .forEach((key, value) {
//                                Firestore.instance
//                                    .collection("users")
//                                    .document(username.text.trim() +
//                                        _phoneController.text.trim())
//                                    .collection('orders')
//                                    .document(date)
//                                    .collection(user.uid)
//                                    .document(key)
//                                    .setData({
//                                  'id': value.id,
//                                  'name': value.name,
//                                  'brand': value.brand,
//                                  'category': value.category,
//                                  'price': value.price,
//                                  'quantity': value.quantity,
//                                  'sizeOrColor': value.sizeOrColor,
//                                  'type': value.type,
//                                  'imgUrl': value.imgUrl,
//                                });
//                              });
//                            }
//                          } else {
//                            print("Error");
//                          }
//                        },
//                      )
//                    ],
//                  );
//                });
//          },
//          codeAutoRetrievalTimeout: null);
//    }
//  }

  // ignore: missing_return
  Future<bool> login(BuildContext context, String phone) async {
    int cartItem =
        Provider.of<CartNotifier>(context, listen: false).items.length;
    if (cartItem == 0) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertWid(
              containe: "يرجى شراء بعض المنتجات !",
              title: 'تنبيه',
              onPriss: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            );
          });
    } else {
      // final QuerySnapshot result = await Firestore.instance
      //     .collection("users")
      //     .where("id", isEqualTo: _phoneController.text.trim())
      //     .getDocuments();
      //
      // final List<DocumentSnapshot> document = result.documents;
      //
      // String date = DateTime.now().toString();
      var arrayOfData = [];

      Provider.of<CartNotifier>(context, listen: false)
          .items
          .forEach((key, value) {
        arrayOfData.add({
          'id': value.id,
          'name': value.name,
          'brand': value.brand,
          'category': value.category,
          'price': value.price,
          'quantity': value.quantity,
          'sizeOrColor': value.sizeOrColor,
          'type': value.type,
          'imgUrl': value.imgUrl,
        });
      });
      //insert user to our collaction
      FirebaseFirestore.instance.collection("users").doc().set({
        "id": _phoneController.text.trim(),
        "username": username.text.trim(),
        "location": location.text.trim(),
        "phoneNumber": _phoneController.text.trim(),
        "date": DateTime.now(),
        "order": arrayOfData
      });

      // if (document.length == 0) {
      //
      //   print('document');
      // } else {
      //   // String date = DateTime.now().toString();
      //
      //   Firestore.instance
      //       .collection("users")
      //       .document(username.text.trim() + _phoneController.text.trim())
      //       .updateData({
      //     // "id": _phoneController.text.trim(),
      //     "username": username.text.trim(),
      //     "location": location.text.trim(),
      //     // "phoneNumber": _phoneController.text.trim()
      //   });
      //
      //   Provider.of<CartNotifier>(context, listen: false)
      //       .items
      //       .forEach((key, value) {
      //     Firestore.instance
      //         .collection("users")
      //         .document(username.text.trim() + _phoneController.text.trim())
      //         .collection('orders')
      //         .document(date)
      //         .collection(_phoneController.text.trim())
      //         .document(key)
      //         .setData({
      //       'id': value.id,
      //       'name': value.name,
      //       'brand': value.brand,
      //       'category': value.category,
      //       'price': value.price,
      //       'quantity': value.quantity,
      //       'sizeOrColor': value.sizeOrColor,
      //       'type': value.type,
      //       'imgUrl': value.imgUrl,
      //     });
      //   });
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF07031a),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/rosa.png",
                  width: 160,
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomText(
                text: "وصل حساب",
                color: Colors.white,
                size: 28,
                weight: FontWeight.bold),
            SizedBox(height: 5),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "اهلا بكم في تطبيق",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat-Bold',
                      fontSize: 16)),
              TextSpan(
                  text: " مكياج روزا",
                  style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Montserrat-Bold',
                      fontSize: 16)),
//              TextSpan(
//                  text: " app",
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontFamily: 'Montserrat-Bold',
//                  )),
            ], style: TextStyle(color: black))),
            SizedBox(height: 10),
            //  SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Directionality(
                textDirection: rtl,
                child: Container(
                  decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: black, width: 0.2),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: grey.withOpacity(0.3),
                            offset: Offset(2, 1),
                            blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: username,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.perm_identity,
                            color: Colors.indigo,
                          ),
                          border: InputBorder.none,
                          hintText: "اسم الزبون",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Montserrat-Bold",
                              fontSize: 18)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Directionality(
                textDirection: rtl,
                child: Container(
                  decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: black, width: 0.2),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: grey.withOpacity(0.3),
                            offset: Offset(2, 1),
                            blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: location,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.indigo,
                          ),
                          border: InputBorder.none,
                          hintText: "العنوان:المحافظة-المنطقة-اقرب نقطه دالة",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Montserrat-Bold",
                              fontSize: 18)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Directionality(
                textDirection: rtl,
                child: Container(
                  decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: black, width: 0.2),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: grey.withOpacity(0.3),
                            offset: Offset(2, 1),
                            blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.phone_android, color: Colors.indigo),
                          border: InputBorder.none,
                          hintText: "+968 770 1234 567",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Montserrat-Bold",
                              fontSize: 18)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "بعد الضغط على تاكيد سوف يتم مراجعة طلبك ويتم الاتصال بك باقرب وقت لتاكيد طلبك ,شكرا لتسوقكم من متجرنا",
                textAlign: TextAlign.center,
                style: TextStyle(color: grey, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            CustomButton(
                msg: "تاكيد",
                onTap: () {
                  //loginUser(_phoneController.text.trim(), context);
                  if (_phoneController.text.trim() != '' &&
                      location.text.trim() != '' &&
                      username.text.trim() != '') {
                    login(context, _phoneController.text.trim());

                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertWid(
                            containe: "شكرا لكم",
                            title: 'تنبيه',
                            onPriss: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            },
                          );
                        });
                  } else {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertWid(
                            containe: "يرجى ملئ جميع الحقول !",
                            title: 'تنبيه',
                            onPriss: () {
                              Navigator.pop(context);
                            },
                          );
                        });
                  }
                })
          ]),
        ),
        bottomNavigationBar: Footer(
          id: AccountPage.id,
        ),
      ),
    );
  }
}

class AlertWid extends StatelessWidget {
  final title;
  final containe;
  final onPriss;
  AlertWid({this.title, this.containe, this.onPriss});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textDirection: rtl,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            containe,
            textDirection: rtl,
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("تاكيد"),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: onPriss,
        )
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String msg;
  final Function onTap;

  const CustomButton({Key key, this.msg, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(2, 1),
                blurRadius: 2)
          ], color: Colors.pink, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14),
                child: CustomText(
                  text: msg,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Color primary = Colors.blue.shade800;
const red = Colors.red;
const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color green = Colors.green;

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  // name constructor that has a positional parameters with the text required
  // and the other parameters optional
  CustomText({@required this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({Key key, this.hintText, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 0.2),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: Offset(2, 1),
                  blurRadius: 2)
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
                icon: Icon(Icons.phone_android, color: Colors.grey),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                    color: Colors.grey, fontFamily: "Sen", fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
