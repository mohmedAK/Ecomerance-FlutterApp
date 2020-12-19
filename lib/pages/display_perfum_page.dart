import 'package:demo_maker/pages/app_bar.dart';
import 'package:demo_maker/pages/footer.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_maker/Notifier/cart_notifier.dart';
import 'package:demo_maker/Notifier/perfume_notifier.dart';
import 'package:demo_maker/details_page/prefum_detail_page.dart';
import 'package:provider/provider.dart';

class DisplayPerfumPage extends StatelessWidget {
  static String id = 'perfume';
  final brandName;
  final gender;
  DisplayPerfumPage({@required this.brandName, this.gender});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF07031a),
      appBar: appBarMethod(context, id),
      body: ProductByBrand(
        brandName: brandName,
        gender: gender,
      ),
      bottomNavigationBar: Footer(
        id: id,
      ),
    );
  }
}

class ProductByBrand extends StatelessWidget {
  final String brandName;
  final String gender;
  ProductByBrand({@required this.brandName, this.gender});

  @override
  Widget build(BuildContext context) {
    //  final productData = Provider.of<PerfumeNotifier>(context);

    return Consumer<PerfumeNotifier>(
      builder: (context, data, widget) {
        print('rebuild');
        return StreamBuilder(
          stream: getStreamOfProductByBrand(brandName, gender),
          builder: (_, AsyncSnapshot<QuerySnapshot> post) {
            if (post.connectionState == ConnectionState.waiting) {
              return Center(
                child: Visibility(
                  visible: true,
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              data.perfume = post.data.docs
                  .map((doc) => PerfumeModel.fromMap(doc.data(), doc.id))
                  .toList();
              return GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.perfume.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (_, int index) {
                    // data.setCurrentPerfume = null;
                    // data.setCurrentPerfume = data.perfume[index];
                    // try {
                    //   print("current" + data.getCurrentPerfume.name);
                    // } catch (e) {
                    //   print("name = null");
                    // }
                    return SingleProduct(
                      post: data.perfume[index],
                      productId: data.perfume[index].id,
                      productName: data.perfume[index].name,
                      productPic: data.perfume[index].imgUrl,
                      sizePrice: data.perfume[index].sizePrice,
                    );
                  });
            }
          },
        );
      },
    );
  }
}

//Sigle Produact
class SingleProduct extends StatelessWidget {
  final PerfumeModel post;
  final productId;
  final productName;
  final productPic;
  final sizePrice;

  SingleProduct(
      {this.post,
      this.productId,
      this.productName,
      this.productPic,
      this.sizePrice});

  @override
  Widget build(BuildContext context) {
    // print('test' + price[0][0].toString());
    List<String> firstSize = List();
    List<List<dynamic>> prices = [];
    Map<String, dynamic> size = Map.from(sizePrice);
    size.forEach((key, value) {
      prices.add(List.from(value));
      firstSize.add(double.parse(key).toString());
    });

    return Consumer<PerfumeNotifier>(
      builder: (context, data, wid) {
        return Card(
          child: Hero(
            tag: post.name,
            child: Material(child: Consumer<PerfumeNotifier>(
              builder: (context, data, wid) {
                return GestureDetector(
                  onTap: () {
                    // data.setCurrentPerfume = null;
                    data.setCurrentPerfume = post;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PerfumeProductDetail(),
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
                            "\$${prices[0][0]}",
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Montserrat-Bold',
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: oldPrice(prices[0][1]),
//                          trailing: Consumer<PerfumeNotifier>(
//                            builder: (context, data, widgit) {
//                              return IconButton(
//                                icon: Icon(Icons.add_shopping_cart),
//                                color: Colors.red,
//                                onPressed: () {
//                                  Scaffold.of(context).showSnackBar(SnackBar(
//                                    duration: Duration(seconds: 2),
//                                    content: Text('Item Added to Cart'),
//                                  ));
//                                  data.setCurrentPerfume = null;
//                                  data.setCurrentPerfume = post;
//                                  Provider.of<CartNotifier>(context,
//                                          listen: false)
//                                      .addItem(
//                                          typeOfProduct: 'perfume',
//                                          id: firstSize[0].toString() +
//                                              data.getCurrentPerfume.id,
//                                          name: data.getCurrentPerfume.name,
//                                          imgUrl: data.getCurrentPerfume.imgUrl,
//                                          price: data.newPrice,
//                                          quantity: 1,
//                                          type: data.getCurrentPerfume.gender,
//                                          sizeOrColor: firstSize[0].toString(),
//                                          category:
//                                              data.getCurrentPerfume.category,
//                                          brand: data.getCurrentPerfume.brand);
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
