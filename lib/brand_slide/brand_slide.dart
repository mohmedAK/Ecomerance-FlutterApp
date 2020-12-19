import 'package:demo_maker/Notifier/brand_notifier.dart';
import 'package:demo_maker/Notifier/constant.dart';
import 'package:demo_maker/pages/display_mackup_page.dart';
import 'package:demo_maker/pages/display_perfum_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class BrandSlider extends StatelessWidget {
  final typeOfData;
  BrandSlider({this.typeOfData});
  @override
  Widget build(BuildContext context) {
    print(typeOfData);
    return Consumer<BrandNotifier>(
      builder: (context, data, widgit) {
        return Container(
          height: 140.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.brands.length - 1,
              itemBuilder: (_, int index) {
                if (typeOfData == CATEGORY_MAKEUP) {
                  print('hello');
                  return BrandMackup(
                    gender: typeOfData,
                    brandName: data.brandsMakeup[index].brandName,
                    imageLocation: data.brandsMakeup[index].imgUrl,
                  );
                } else if (typeOfData == GENDER_WOMEN) {
                  return Brand(
                    gender: typeOfData,
                    brandName: data.brandsWomen[index].brandName,
                    imageLocation: data.brandsWomen[index].imgUrl,
                  );
                } else if (typeOfData == GENDER_MEN) {
                  return Brand(
                    gender: typeOfData,
                    brandName: data.brandsMen[index].brandName,
                    imageLocation: data.brandsMen[index].imgUrl,
                  );
                } else {
                  return null;
                }
              }),
        );
      },
    );
  }
}

class Brand extends StatelessWidget {
  final String gender;
  final String imageLocation;
  final String brandName;

  Brand({this.gender, this.imageLocation, this.brandName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                // topLeft: Radius.circular(45.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                // bottomRight: Radius.circular(45.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                )
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayPerfumPage(
                              brandName: brandName,
                              gender: gender,
                            )));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  // bottomRight: Radius.circular(45.0),
                ),
                child: FadeInImage.assetNetwork(
                  // placeholderScale: 10,

                  fit: BoxFit.fill,
                  image: imageLocation,
                  placeholder: 'images/loading.gif',
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
            flex: 1,
            child: Container(
                child: Text(
              brandName,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat-Bold',
                // fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )))
      ],
    );
  }
}

class BrandMackup extends StatelessWidget {
  final String gender;
  final String imageLocation;
  final String brandName;

  BrandMackup({this.gender, this.imageLocation, this.brandName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                // topLeft: Radius.circular(45.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                // bottomRight: Radius.circular(45.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                )
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DisplayMakeupPage(brandName: brandName)));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  // bottomRight: Radius.circular(45.0),
                ),
                child: FadeInImage.assetNetwork(
                  // placeholderScale: 10,

                  fit: BoxFit.fill,
                  image: imageLocation,
                  placeholder: 'images/loading.gif',
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
            flex: 1,
            child: Container(
                child: Text(
              brandName,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat-Bold',
                // fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )))
      ],
    );
  }
}
