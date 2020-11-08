import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:liveeasy_huynl/handlers/padding_handler.dart';
import 'package:liveeasy_huynl/models/views/rice.dart';
import 'package:liveeasy_huynl/ui/components/avatar.dart';
import 'package:liveeasy_huynl/ui/components/divider_handler.dart';
import 'package:liveeasy_huynl/ui/pages/cook/details/rice_detail.dart';

class RicePage extends StatefulWidget {
  @override
  _RicePageState createState() => _RicePageState();
}

class _RicePageState extends State<RicePage> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _body(),
            _appBarFixed(),
          ],
        ),
      ),
    );
  }

  Widget _appBarFixed() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Padding(
        padding: const EdgeInsets.all(kdefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_backButton(), Avatar()],
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _bgImg(),
        _labelCategory(),
        DividerHandler(
          label: 'Được mua nhiều nhất',
          size: size,
        ),
        _bestSeller(),
        _verticalSpace(kdefaultPadding),
        DividerHandler(
          label: 'Khác',
          size: size,
        ),
        _others()
      ],
    );
  }

  Widget _backButton() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back_ios,
        color: kThemePrimaryColor,
        size: 30,
      ),
    );
  }

  Widget _bgImg() {
    return Container(
      width: size.width,
      height: size.height * 0.2,
      child: Image.asset(
        'assets/imgs/rice/gao.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _labelCategory() {
    return Padding(
        padding: EdgeInsets.all(kdefaultPadding),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Foodmart gạo',
                style: TextStyle(
                    color: kThemePrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25))));
  }

  Widget _bestSeller() {
    return GridView.builder(
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
      itemCount: rices.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding),
          child: _bestSellerItem(context, index),
        );
      },
    );
  }

  Widget _bestSellerItem(context, index) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RiceDetail(rice: rices[index]))),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.asset(
                  '${rices[index].imageUrl}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${rices[index].name}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Giá bán: ',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: '${rices[index].price}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400))
                          ]),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _others() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding),
      child: ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: rices.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0)),
                      child: Image.asset(
                        '${rices[index].imageUrl}',
                        fit: BoxFit.fill,
                        height: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${rices[index].name}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${rices[index].price}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _verticalSpace(double space) {
    return SizedBox(
      height: space,
    );
  }
}
