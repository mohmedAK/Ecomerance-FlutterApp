import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/Notifier/makeup_notifier.dart';
import 'package:demo_maker/Notifier/perfume_notifier.dart';
import 'package:demo_maker/details_page/makeup_detail_page.dart';
import 'package:demo_maker/details_page/prefum_detail_page.dart';
import 'package:demo_maker/pages/footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchePage extends StatefulWidget {
  static String id = 'searche';
  final collactionName;
  final gender;
  SearchePage({@required this.collactionName, @required this.gender});
  @override
  _SearchePageState createState() => new _SearchePageState();
}

class _SearchePageState extends State<SearchePage> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService()
          .searchByName(widget.collactionName, widget.gender, value)
          .then((QuerySnapshot docs) {
        if (widget.collactionName == COLLACTION_PERFUME) {
          queryResultSet = docs.docs
              .map((doc) => PerfumeModel.fromMap(doc.data(), doc.id))
              .toList();
        } else {
          queryResultSet = docs.docs
              .map((doc) => MakeupModel.fromMap(doc.data(), doc.id))
              .toList();
        }

        print('length of q' + queryResultSet.length.toString());
        print('  q' + queryResultSet[0].name.toString());
      });
    } else {
      tempSearchStore = [];

      queryResultSet.forEach((element) {
        if (element.name.startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xFF07031a),
        appBar: new AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: widget.collactionName == COLLACTION_PERFUME
              ? Text(
                  TXT33,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                )
              : Text(TXT34),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: 10.0),
          GridView.count(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                if (widget.collactionName == COLLACTION_PERFUME) {
                  return SingleProductPerfume(
                    post: element,
                  );
                } else {
                  return SingleProductMakeup(
                    post: element,
                  );
                }

//                return buildResultCard(context, element);
              }).toList())
        ]));
  }
}
//
//Widget buildResultCard(BuildContext context, PerfumeModel element) {
//  return Card(
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//      elevation: 2.0,
//      child: Container(
//          child: Center(
//              child: InkWell(
//        onTap: () {
//          Provider.of<PerfumeNotifier>(context, listen: false)
//              .setCurrentPerfume = element;
//          Navigator.push(context,
//              MaterialPageRoute(builder: (context) => PerfumeProductDetail()));
//        },
//        child: Text(
//          element.name,
//          textAlign: TextAlign.center,
//          style: TextStyle(
//            color: Colors.black,
//            fontSize: 20.0,
//          ),
//        ),
//      ))));
//}

class SearchService {
  searchByName(String collactionName, String gender, String searchField) {
    if (gender == GENDER_ALL) {
      return FirebaseFirestore.instance
          .collection(collactionName)
          .where('searchKey',
              isEqualTo: searchField.substring(0, 1).toUpperCase())
          .get();
    } else {
      return FirebaseFirestore.instance
          .collection(collactionName)
          .where('searchKey',
              isEqualTo: searchField.substring(0, 1).toUpperCase())
          .where('gender', isEqualTo: gender)
          .get();
    }
  }
}

//Sigle Produact
class SingleProductPerfume extends StatelessWidget {
  final PerfumeModel post;
//  final productId;
//  final productName;
//  final productPic;
//  final sizePrice;

  SingleProductPerfume({
    this.post,
//        this.productId,
//        this.productName,
//        this.productPic,
//        this.sizePrice
  });

  @override
  Widget build(BuildContext context) {
    // print('test' + price[0][0].toString());
    List<String> firstSize = List();
    List<List<dynamic>> prices = [];
    Map<String, dynamic> size = Map.from(post.sizePrice);
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
                    data.setCurrentPerfume = null;
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

class SingleProductMakeup extends StatelessWidget {
  final MakeupModel post;

//  final String imageLocation;
//  final String imageCaption;

  SingleProductMakeup({
    this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MakeupNotifier>(
      builder: (context, data, widgit) {
        return GestureDetector(
          onTap: () {
            data.currentMakeup = null;
            data.currentMakeup = post;

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MakeupProductDetail()));
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 120.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(1.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                )
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Image.network(
                              post.imgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          post.name,
                          style: new TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Montserrat-Bold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
