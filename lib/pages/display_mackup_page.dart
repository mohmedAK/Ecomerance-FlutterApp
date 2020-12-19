import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/Notifier/makeup_notifier.dart';
import 'package:demo_maker/api/brand_api.dart';
import 'package:demo_maker/details_page/makeup_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bar.dart';
import 'display_makeup_by_type_page.dart';
import 'footer.dart';

class DisplayMakeupPage extends StatelessWidget {
  static String id = 'DisplayMakeupPage';
  final brandName;
  DisplayMakeupPage({this.brandName});
  @override
  Widget build(BuildContext context) {
    print(brandName);
    return Scaffold(
      backgroundColor: Color(0xFF07031a),
      appBar: appBarMethod(context, DisplayMakeupPage.id),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                brandName,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat-Bold',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Directionality(
            textDirection: rtl,
            child: ListTile(
              title: titleMethod(TXT13),
              trailing: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MakeupByTypePage(
                                gender: GENDER_WOMEN,
                                brandName: brandName,
                                type: TYPE_EYES,
                              )));
                },
                child: viewAllMethod(),
              ),
            ),
          ),
          Directionality(
            textDirection: rtl,
            child: MakeupProductsSlide(
              gender: GENDER_WOMEN,
              type: TYPE_EYES,
              brandName: brandName,
            ),
          ),
          //=========================================Face=============================
          Directionality(
            textDirection: rtl,
            child: ListTile(
              title: titleMethod(TXT14),
              trailing: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MakeupByTypePage(
                                gender: GENDER_WOMEN,
                                brandName: brandName,
                                type: TYPE_FACE,
                              )));
                },
                child: viewAllMethod(),
              ),
            ),
          ),
          Directionality(
            textDirection: rtl,
            child: MakeupProductsSlide(
              gender: GENDER_WOMEN,
              type: TYPE_FACE,
              brandName: brandName,
            ),
          ),
          //=========================================lips===================================
          Directionality(
            textDirection: rtl,
            child: ListTile(
              title: titleMethod(TXT15),
              trailing: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MakeupByTypePage(
                                gender: GENDER_WOMEN,
                                brandName: brandName,
                                type: TYPE_LIPS,
                              )));
                },
                child: viewAllMethod(),
              ),
            ),
          ),
          Directionality(
            textDirection: rtl,
            child: MakeupProductsSlide(
              gender: GENDER_WOMEN,
              type: TYPE_LIPS,
              brandName: brandName,
            ),
          ),
          //=========================================skin=====================================
          Directionality(
            textDirection: rtl,
            child: ListTile(
              title: titleMethod(TXT16),
              trailing: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MakeupByTypePage(
                                  gender: GENDER_WOMEN,
                                  brandName: brandName,
                                  type: TYPE_SKIN,
                                )));
                  },
                  child: viewAllMethod()),
            ),
          ),
          Directionality(
            textDirection: rtl,
            child: MakeupProductsSlide(
              gender: GENDER_WOMEN,
              type: TYPE_SKIN,
              brandName: brandName,
            ),
          ),
          //=========================================Hair=====================================
          Directionality(
            textDirection: rtl,
            child: ListTile(
              title: titleMethod(TXT17),
              trailing: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MakeupByTypePage(
                                  gender: GENDER_WOMEN,
                                  brandName: BRAND_NAME_OTHER,
                                  type: TYPE_HAIR,
                                )));
                  },
                  child: viewAllMethod()),
            ),
          ),
          Directionality(
            textDirection: rtl,
            child: MakeupProductsSlide(
              gender: GENDER_WOMEN,
              type: TYPE_HAIR,
              brandName: brandName,
            ),
          ),
        ],
      )),
      bottomNavigationBar: Footer(
        id: id,
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
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MakeupProductsSlide extends StatefulWidget {
  final String brandName;
  final String type;
  final String gender;
  MakeupProductsSlide({@required this.gender, this.type, this.brandName});

  @override
  _MakeupProductsSlideState createState() => _MakeupProductsSlideState();
}

class _MakeupProductsSlideState extends State<MakeupProductsSlide> {
  List<MakeupModel> makeup;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Provider.of<MakeupNotifier>(context, listen: false)
          .streamMakeupByType(widget.brandName, widget.type, widget.gender),
      builder: (_, AsyncSnapshot<QuerySnapshot> post) {
        if (post.connectionState == ConnectionState.waiting) {
          print('wait');
          return Center(
            child: Visibility(
              visible: true,
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          );
        } else {
          makeup = post.data.docs
              .map((doc) => MakeupModel.fromMap(doc.data(), doc.id))
              .toList();

          return Consumer<MakeupNotifier>(
            builder: (context, data, widgit) {
              print('hel' + makeup.length.toString());
              return Container(
                height: 100.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: makeup.length,
                    itemBuilder: (_, int index) {
                      data.setMakeupList = makeup;

                      return Product(
                        post: makeup[index],
//                    imageCaption: post.data[index].data['name'],
//                    imageLocation: post.data[index].data['imgUrl'],
                      );
                    }),
              );
            },
          );
        }
      },
    );
  }
}

class Product extends StatelessWidget {
  final MakeupModel post;

//  final String imageLocation;
//  final String imageCaption;

  Product({
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
