import 'package:demo_maker/Notifier/brand_notifier.dart';
import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/brand_slide/brand_slide.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'app_bar.dart';
import 'display_mackup_page.dart';
import 'display_makeup_by_type_page.dart';
import 'footer.dart';

class AllMakeupPage extends StatelessWidget {
  static String id = 'AllMakeupPage';
  @override
  Widget build(BuildContext context) {
    Provider.of<BrandNotifier>(context, listen: false).getBrand();
    return Scaffold(
      appBar: appBarMethod(context, id),
      backgroundColor: Color(0xFF07031a),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  //========================Start Brand of Perfums for Men Slide ===============================
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Container(
                        child: Text(
                          TXT11,
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
                    margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          // topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                          bottomLeft: Radius.circular(45.0),
                          // bottomRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    child: BrandSlider(
                      typeOfData: COLLACTION_MAKEUP,
                    ),
                  ),
                  //========================End Brand of Perfums for Men Slide ===============================
                ],
              ),
              Container(
                // margin: EdgeInsets.only(top: 10),
                child: Center(
                  child: Container(
                    child: Text(
                      TXT12,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Segoe-UI-Bold',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
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
                                        brandName: BRAND_NAME_OTHER,
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
                      brandName: BRAND_NAME_OTHER,
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
                                        brandName: BRAND_NAME_OTHER,
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
                      brandName: BRAND_NAME_OTHER,
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
                                        brandName: BRAND_NAME_OTHER,
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
                      brandName: BRAND_NAME_OTHER,
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
                                          brandName: BRAND_NAME_OTHER,
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
                      brandName: BRAND_NAME_OTHER,
                    ),
                  ),
                  //=========================================skin=====================================
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
                      brandName: BRAND_NAME_OTHER,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(id: id),
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
