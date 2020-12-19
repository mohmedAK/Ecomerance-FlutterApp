import 'package:demo_maker/Notifier/cart_notifier.dart';
import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/Notifier/perfume_notifier.dart';
import 'package:demo_maker/pages/app_bar.dart';
import 'package:demo_maker/pages/cart_page.dart';
import 'package:demo_maker/pages/display_perfum_page.dart';
import 'package:demo_maker/pages/footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfumeProductDetail extends StatefulWidget {
  static String id = 'PerfumeProductDetail';

  @override
  _PerfumeProductDetailState createState() => _PerfumeProductDetailState();
}

class _PerfumeProductDetailState extends State<PerfumeProductDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBarMethod(context, PerfumeProductDetail.id),
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
                      child: Consumer<PerfumeNotifier>(
                        builder: (context, data, wid) {
                          return Image.network(
                            data.getCurrentPerfume.imgUrl,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 260.0,
                      left: 25.0,
                      right: 25.0,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //==========================Name==============================
                          Consumer<PerfumeNotifier>(
                              builder: (context, data, wid) {
                            // print(data.getCurrentPerfume.name);
                            return Center(
                              child: Text(
                                data.getCurrentPerfume.name,
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Bold',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }),
                          SizedBox(height: 20.0),
                          //==========================Size==============================
                          Directionality(
                            textDirection: rtl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    TXT45,
                                    style: TextStyle(
                                        fontFamily: 'Segoe-UI-Bold',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: getSize(context),
                                  ),
                                )
                              ],
                            ),
                          ),
                          //====================================================================
                          SizedBox(height: 15.0),
                          //======================it has Price ====================================
                          Consumer<PerfumeNotifier>(
                            builder: (context, data, wid) {
                              return Directionality(
                                textDirection: rtl,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('${data.newPrice} \$',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat-Bold',
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.pink)),
                                      Text('${data.oldPrice}\$',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          )),
                                      Container(
                                          height: 25.0,
                                          color: Colors.grey,
                                          width: 1.0),
                                      //====================Qty==============================
                                      Container(
                                          width: 125.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(17.0),
                                              color: Color(0xFF7A9BEE)),
                                          child: Consumer<PerfumeNotifier>(
                                            builder: (context, data, wid) {
                                              return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    InkWell(
                                                      onTap: () {
                                                        data.dicrement();
                                                      },
                                                      child: Container(
                                                        height: 25.0,
                                                        width: 25.0,
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
                                                            color: Colors.white,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${data.getQty}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 15.0),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        data.incremnt();
                                                      },
                                                      child: Container(
                                                        height: 25.0,
                                                        width: 25.0,
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
                                                            color: Colors.white,
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
                          ),
                          SizedBox(height: 15.0),
                          //====================Brand==============================
                          Directionality(
                            textDirection: rtl,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  TXT36,
                                  style: TextStyle(
                                      fontFamily: 'Segoe-UI-Bold',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Consumer<PerfumeNotifier>(
                                  builder: (context, data, wid) {
                                    return Text(
                                      '${data.getCurrentPerfume.brand} ',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat-Bold',
                                        color: Color(0xFF2d3436),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 15.0),
                          //====================Country==============================
                          Directionality(
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
                                Consumer<PerfumeNotifier>(
                                  builder: (context, data, wid) {
                                    return Text(
                                      '${data.getCurrentPerfume.country}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat-Bold',
                                        color: Color(0xFF2d3436),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 15.0),
                          // ======================= Description========================
                          Column(
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
                              Consumer<PerfumeNotifier>(
                                builder: (context, data, wid) {
                                  return Text(
                                    '${data.getCurrentPerfume.description}',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontFamily: 'Segoe-UI-Bold',
                                      color: Color(0xFF2d3436),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),

                          SizedBox(height: 15.0),
                          //======================= Buttom=====================
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0)),
                                  color: Colors.black),
                              height: 50.0,
                              child: Consumer<PerfumeNotifier>(
                                builder: (context, data, wid) {
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
                                                fontFamily: 'Montserrat-Bold')),
                                        MaterialButton(
                                          color: Colors.purple,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0))),
                                          onPressed: () {
                                            if (data.getTotel == 0) {
                                              showInSnackBar(TXT46);
                                            } else {
                                              showInSnackBar(TXT47);

                                              Provider
                                                      .of<
                                                              CartNotifier>(context,
                                                          listen: false)
                                                  .addItem(
                                                      typeOfProduct:
                                                          CATEGORY_PERFUME,
                                                      id:
                                                          data
                                                                  .getSelectedSize
                                                                  .toString() +
                                                              data.getCurrentPerfume
                                                                  .id,
                                                      name:
                                                          data.getCurrentPerfume
                                                              .name,
                                                      imgUrl: data
                                                          .getCurrentPerfume
                                                          .imgUrl,
                                                      price: data.newPrice,
                                                      quantity: data.getQty,
                                                      type:
                                                          data.getCurrentPerfume
                                                              .gender,
                                                      sizeOrColor: data
                                                          .getSelectedSize
                                                          .toString(),
                                                      category: data
                                                          .getCurrentPerfume
                                                          .category,
                                                      brand: data
                                                          .getCurrentPerfume
                                                          .brand);
                                            }
                                          },
                                          child: Text(
                                            TXT42,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontFamily: 'Segoe-UI-Bold',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )),
                        ]),
                  ),
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
                // margin: EdgeInsets.only(top: 750),
                child: Consumer<PerfumeNotifier>(
                  builder: (context, data, wid) {
                    return ProductByBrand(
                      brandName: data.getCurrentPerfume.brand,
                      gender: data.getCurrentPerfume.gender,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(
        id: PerfumeProductDetail.id,
      ),
    );
  }

  List<Widget> getSize(BuildContext context) {
    Map<String, dynamic> size = Map.from(
        Provider.of<PerfumeNotifier>(context).getCurrentPerfume.sizePrice);

    List<Widget> sizeWidget = [];
    size.forEach(
      (key, value) {
        List<dynamic> price = List.from(value);
        sizeWidget.add(
          Consumer<PerfumeNotifier>(
            builder: (context, data, wid) {
              print("first time");
              return Container(
                  decoration: BoxDecoration(
                      gradient: null,
                      borderRadius: BorderRadius.circular(10.0),
                      color: double.parse(key) == data.getSelectedSize
                          ? Colors.amber
                          : Colors.transparent,
                      // if the button is pressed color will be amber if pressed again it'll go back to blue
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 0.5),
                          blurRadius: 40.5,
                        ),
                      ]),
                  child: FlatButton(
                    onPressed: () {
                      data.newPrice = double.parse(price[0].toString());
                      data.oldPrice = double.parse(price[1].toString()) == null
                          ? 0
                          : double.parse(price[1].toString());
                      print("keyParce" + key);
                      data.setSelectedSize = int.parse(key);
                      print(
                          "getSelectedSize" + data.getSelectedSize.toString());
                    },
                    child: Text(
                      '$key ml',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Bold',
                        color: Colors.red,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ));
            },
          ),
        );
      },
    );

    return sizeWidget;
  }

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
