import 'package:demo_maker/Notifier/brand_notifier.dart';
import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/Notifier/language.dart';
import 'package:demo_maker/brand_slide/brand_slide.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'app_bar.dart';

import 'display_perfum_page.dart';
import 'footer.dart';

class AllPerfumeForMenPage extends StatelessWidget {
  static String id = 'AllPerfumeForMenPage';
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
                          TXT2,
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
                      typeOfData: GENDER_MEN,
                    ),
                  ),
                  //========================End Brand of Perfums for Men Slide ===============================

                  //========================Start Brand of Mackup ===============================
//        Container(
//          margin: EdgeInsets.only(top: 670),
//          child: Center(
//            child: Container(
//              child: Text(
//                'Brand of Makeup',
//                style: TextStyle(
//                  color: Colors.white,
//                  fontFamily: 'Montserrat-Bold',
//                  fontSize: 20.0,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//            ),
//          ),
//        ),
//        Container(
//          margin: EdgeInsets.only(top: 710),
//          decoration: BoxDecoration(
//              borderRadius: BorderRadius.only(
//                //    topLeft: Radius.circular(45.0),
//                topRight: Radius.circular(45.0),
//                bottomLeft: Radius.circular(45.0),
//                //  bottomRight: Radius.circular(45.0),
//              ),
//              color: Colors.white),
//          height: 160.0,
//          width: MediaQuery.of(context).size.width,
//        ),
//        Container(
//          margin: EdgeInsets.only(top: 740),
//          child: BrandSlider(
//            typeOfData: COLLACTION_MAKEUP,
//          ),
//        ),
                  //========================End Brand of Mackup ===============================
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Center(
                  child: Container(
                    child: Text(
                      TXT11,
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
              ProductByBrand(
                brandName: BRAND_NAME_OTHER,
                gender: GENDER_MEN,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(id: id),
    );
  }
}
