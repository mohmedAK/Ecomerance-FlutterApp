import 'package:demo_maker/Notifier/cart_notifier.dart';
import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/Notifier/makeup_notifier.dart';
import 'package:demo_maker/pages/app_bar.dart';
import 'package:demo_maker/pages/cart_page.dart';

import 'package:demo_maker/pages/display_makeup_by_type_page.dart';

import 'package:demo_maker/pages/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MakeupProductDetail extends StatefulWidget {
  static String id = 'MakeupProductDetail';
  @override
  _MakeupProductDetailState createState() => _MakeupProductDetailState();
}

class _MakeupProductDetailState extends State<MakeupProductDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print('we rebuild');

    // final cart = Provider.of<CartNotifier>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBarMethod(
        context,
        MakeupProductDetail.id,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF07031a),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 150),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                          bottomLeft: Radius.circular(45.0),
                          bottomRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                  ),
                  //Image
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      left: (MediaQuery.of(context).size.width / 2) - 100,
                    ),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Consumer<MakeupNotifier>(
                        builder: (context, data, widgit) {
                          return Image.network(
                            data.currentMakeup.imgUrl,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 260.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //==========================Name==============================
                          Center(
                            child: Consumer<MakeupNotifier>(
                              builder: (context, data, widget) {
                                return Text(
                                  data.currentMakeup.name,
                                  style: TextStyle(
                                    fontFamily: 'Segoe-UI-Bold',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20.0),
                          //==========================Colors==============================
                          Directionality(
                            textDirection: rtl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      TXT35,
                                      style: TextStyle(
                                          fontFamily: 'Segoe-UI-Bold',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Consumer<MakeupNotifier>(
                                    builder: (context, data, widget) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: data
                                            .getColorsMethod()
                                            .map((e) => GestureDetector(
                                                  key: Key(e),
                                                  onTap: () {
                                                    //  print('key' + e.toString());
                                                    data.setColor = e;
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(int.parse(e)),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30))),
                                                    width: 50,
                                                    height: 50,
                                                    child: Visibility(
                                                      visible: data.getColor ==
                                                                  null ||
                                                              data.getColor != e
                                                          ? false
                                                          : true,
                                                      child: Icon(
                                                        Icons.check,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          //====================================================================
                          SizedBox(height: 15.0),
                          //======================it has Price ====================================
                          Consumer<MakeupNotifier>(
                            builder: (context, data, widget) {
                              return Consumer<MakeupNotifier>(
                                builder: (context, data, widgit) {
                                  return Directionality(
                                    textDirection: rtl,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('${data.getNewPrice} \$',
                                              style: TextStyle(
                                                  fontFamily: 'Segoe-UI-Bold',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.pink)),
                                          Text('${data.getOldPrice} \$',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 20.0,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              )),
                                          Container(
                                              height: 20.0,
                                              color: Colors.grey,
                                              width: 1.0),
                                          //====================Qty==============================
                                          Container(
                                              width: 120.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          17.0),
                                                  color: Color(0xFF7A9BEE)),
                                              child: Consumer<MakeupNotifier>(
                                                builder:
                                                    (context, data, widgit) {
                                                  return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: <Widget>[
                                                        InkWell(
                                                          onTap: () {
                                                            data.dicrement();

                                                            //  total = newPrice * qty;
                                                          },
                                                          child: Container(
                                                            height: 20.0,
                                                            width: 20.0,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7.0),
                                                                color: Color(
                                                                    0xFF7A9BEE)),
                                                            child: Center(
                                                              child: Icon(
                                                                Icons.remove,
                                                                color: Colors
                                                                    .white,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          data.getQty
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 15.0),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            data.incremnt();
                                                          },
                                                          child: Container(
                                                            height: 20.0,
                                                            width: 20.0,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7.0),
                                                                color: Colors
                                                                    .transparent),
                                                            child: Center(
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ]);
                                                },
                                              ))
                                        ]),
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(height: 15.0),
                          //====================Brand==============================
                          Consumer<MakeupNotifier>(
                            builder: (context, data, widgit) {
                              return Directionality(
                                textDirection: rtl,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      TXT36,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat-Bold',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '${data.currentMakeup.brand} ',
                                      style: TextStyle(
                                        fontFamily: 'Segoe-UI-Bold',
                                        color: Color(0xFF2d3436),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 15.0),
                          //====================Country==============================
                          Consumer<MakeupNotifier>(
                            builder: (context, data, widgit) {
                              return Directionality(
                                textDirection: rtl,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      TXT37,
                                      style: TextStyle(
                                          fontFamily: 'Segoe-UI-Bold',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '${data.currentMakeup.country}',
                                      style: TextStyle(
                                        fontFamily: 'Segoe-UI-Bold',
                                        color: Color(0xFF2d3436),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 15.0),
                          // ======================= Description========================
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  TXT38,
                                  textDirection: rtl,
                                  style: TextStyle(
                                      fontFamily: 'Segoe-UI-Bold',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Consumer<MakeupNotifier>(
                                  builder: (context, data, widgit) {
                                    return Text(
                                      '${data.currentMakeup.description}',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontFamily: 'Segoe-UI-Bold',
                                        color: Color(0xFF2d3436),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 15.0),
                          //======================= Buttom=====================
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                  color: Colors.black),
                              height: 50.0,
                              child: Consumer<MakeupNotifier>(
                                builder: (context, data, widgit) {
                                  return Directionality(
                                    textDirection: rtl,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text('$TXT39${data.getTotel} \$',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontFamily: 'Segoe-UI-Bold',
                                            )),
                                        MaterialButton(
                                          color: Colors.purple,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0))),
                                          onPressed: () {
                                            if (data.getColor == null) {
                                              showInSnackBar(TXT40);
                                            } else {
                                              Provider.of<CartNotifier>(context,
                                                      listen: false)
                                                  .addItem(
                                                      typeOfProduct:
                                                          CATEGORY_MAKEUP,
                                                      id: data.getColor +
                                                          data.currentMakeup.id,
                                                      name: data
                                                          .currentMakeup.name,
                                                      imgUrl: data
                                                          .currentMakeup.imgUrl,
                                                      price: data.getNewPrice,
                                                      quantity: data.getQty,
                                                      type: data
                                                          .currentMakeup.type,
                                                      sizeOrColor:
                                                          data.getColor,
                                                      category: data
                                                          .currentMakeup
                                                          .category,
                                                      brand: data
                                                          .currentMakeup.brand);
                                              showInSnackBar(TXT41);
                                            }
                                          },
                                          child: Text(
                                            TXT42,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontFamily: 'Montserrat-Bold'),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )),
                        ]),
                  ),
//              Container(
//                margin: EdgeInsets.only(top: 730),
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(45.0),
//                      topRight: Radius.circular(45.0),
//                      bottomLeft: Radius.circular(45.0),
//                      bottomRight: Radius.circular(45.0),
//                    ),
//                    color: Colors.white),
//                height: MediaQuery.of(context).size.height,
//                width: MediaQuery.of(context).size.width,
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 735),
//                child: ProductByBrand(
//                  brandName: widget.post.data['brand'],
//                  gender: widget.post.data['gender'],
//                ),
//              )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Center(
                  child: Container(
                    child: Text(
                      TXT43,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat-Bold',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: 600),
                child: Consumer<MakeupNotifier>(
                  builder: (context, data, wid) {
                    return MakeupByType(
                      gender: data.currentMakeup.gender,
                      brandName: data.currentMakeup.brand,
                      type: data.currentMakeup.type,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(
        id: MakeupProductDetail.id,
      ),
    );
  }

  Text viewAllMethod() {
    return Text(
      TXT18,
      style: TextStyle(
        color: Colors.blue,
        fontFamily: 'Montserrat',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text titleMethod(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.pink,
        fontFamily: 'Montserrat-Bold',
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
//
//  List<Widget> getColors() {
//    Map<String, dynamic> size = Map.from(widget.post.data['size_price']);
//
//    List<Widget> sizeWidget = [];
//    size.forEach(
//      (key, value) {
//        List<dynamic> price = List.from(value);
//        sizeWidget.add(
//          Container(
//            decoration: BoxDecoration(
//                gradient: null,
//                borderRadius: BorderRadius.circular(10.0),
//                color: double.parse(key) == selectedSize
//                    ? Colors.amber
//                    : Colors.transparent,
//                // if the button is pressed color will be amber if pressed again it'll go back to blue
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.black12,
//                    offset: Offset(0.0, 0.5),
//                    blurRadius: 40.5,
//                  ),
//                ]),
//            child: FlatButton(
//              onPressed: () {
//                setState(() {
//                  newPrice = double.parse(price[0].toString());
//                  oldPrice = double.parse(price[1].toString()) == null
//                      ? 0
//                      : double.parse(price[1].toString());
//
//                  // change selected size from here
//                  selectedSize = double.parse(key);
//
//                  total = 0;
//                  total = newPrice * qty;
//                });
//              },
//              child: Text(
//                '$key ml',
//                style: TextStyle(
//                  fontFamily: 'Montserrat-Bold',
//                  color: Colors.red,
//                  fontSize: 17.0,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//            ),
//          ),
//        );
//      },
//    );
//
//    return sizeWidget;
//  }

  void showInSnackBar(String msg) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.purple,
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: TXT44,
        textColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
      ),
      content: Text(
        msg,
        textDirection: rtl,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Segoe-UI-Bold',
            fontSize: 16),
      ),
    ));
  }
}
