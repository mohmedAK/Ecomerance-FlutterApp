import 'package:demo_maker/Notifier/makeup_notifier.dart';
import 'package:demo_maker/details_page/makeup_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'app_bar.dart';
import 'footer.dart';

class MakeupByTypePage extends StatelessWidget {
  static String id = 'makeupByType';
  final String brandName;
  final String type;
  final String gender;
  MakeupByTypePage({this.brandName, this.type, @required this.gender});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF07031a),
      appBar: appBarMethod(context, id),
      body: MakeupByType(
        gender: gender,
        brandName: brandName,
        type: type,
      ),
      bottomNavigationBar: Footer(
        id: id,
      ),
    );
  }
}

class MakeupByType extends StatelessWidget {
  final String brandName;
  final String type;
  final String gender;
  MakeupByType({@required this.brandName, this.type, @required this.gender});

  @override
  Widget build(BuildContext context) {
    //  final productData = Provider.of<MakeupNotifier>(context);
    List<MakeupModel> makeupList;
    return StreamBuilder(
      stream: Provider.of<MakeupNotifier>(context, listen: false)
          .streamMakeupByType(brandName, type, gender),
      builder: (_, AsyncSnapshot<QuerySnapshot> post) {
        if (post.connectionState == ConnectionState.waiting) {
          return Center(
            child: Visibility(
              visible: true,
              child: Container(
                color: Colors.transparent,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          );
        } else {
          makeupList = post.data.docs
              .map((doc) => MakeupModel.fromMap(doc.data(), doc.id))
              .toList();
          return GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: makeupList.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (_, int index) {
                Provider.of<MakeupNotifier>(context, listen: false)
                    .currentMakeup = makeupList[index];
                return SingleProduct(
                  post: makeupList[index],
                );
              });
        }
      },
    );
  }
}

//Sigle Produact
class SingleProduct extends StatelessWidget {
  final MakeupModel post;

  SingleProduct({
    this.post,
  });

  @override
  Widget build(BuildContext context) {
//    // print('test' + price[0][0].toString());
//    List<String> firstSize = List();
//    List<List<dynamic>> prices = [];
//    Map<String, dynamic> size = Map.from(sizePrice);
//    size.forEach((key, value) {
//      prices.add(List.from(value));
//      firstSize.add(double.parse(key).toString());
//    });

    return Consumer<MakeupNotifier>(
      builder: (context, data, wid) {
        return Card(
          child: Hero(
            tag: post.name,
            child: Material(child: Consumer<MakeupNotifier>(
              builder: (context, data, wid) {
                return GestureDetector(
                  onTap: () {
                    data.currentMakeup = null;
                    data.currentMakeup = post;

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MakeupProductDetail(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(1.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: GridTile(
                        child: FadeInImage.assetNetwork(
                            placeholder: 'images/loading.gif',
                            image: post.imgUrl),
                        footer: GridTileBar(
                          backgroundColor: Colors.white70,
                          leading: Text(
                            post.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat-Bold',
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            "\$${data.getNewPrice}",
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Montserrat-Bold',
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: oldPrice(data.getOldPrice),
//                          trailing: Consumer<MakeupNotifier>(
//                            builder: (context, data, widgit) {
//                              return IconButton(
//                                icon: Icon(Icons.add_shopping_cart),
//                                color: Colors.red,
//                                onPressed: () {
//                                  Scaffold.of(context).showSnackBar(SnackBar(
//                                    duration: Duration(seconds: 2),
//                                    content: Text('Item Added to Cart'),
//                                  ));
////                                  data.setCurrentPerfume = post;
////                                  Provider.of<CartNotifier>(context,
////                                      listen: false)
////                                      .addItem(
////                                      typeOfProduct: 'perfume',
////                                      id: firstSize[0].toString() +
////                                          data.getCurrentPerfume.id,
////                                      name: data.getCurrentPerfume.name,
////                                      imgUrl: data.getCurrentPerfume.imgUrl,
////                                      price: data.newPrice,
////                                      quantity: 1,
////                                      type: data.getCurrentPerfume.gender,
////                                      sizeOrColor: firstSize[0].toString(),
////                                      category:
////                                      data.getCurrentPerfume.category);
//
////                      cart.addItem(
////                          post,
////                          double.parse(price[0][0].toString()).toString() +
////                              post.data['id'].toString(),
////                          productName,
////                          productPic,
////                          double.parse(price[0][0].toString()),
////                          1,
////                          post.data['gender'].toString(),
////                          firstSize[0].toString());
////                      print(firstSize[0].toString());
//                                },
//                              );
//                            },
//                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
          ),
        );
      },
    );
  }

  Text oldPrice(price) {
    if (price == 0) {
      return null;
    } else {
      return Text(
        "\$$price",
        style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w800,
            decoration: TextDecoration.lineThrough),
      );
    }
  }
}
