import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/handlers/box_decoration.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:liveeasy_huynl/handlers/padding_handler.dart';
import 'package:liveeasy_huynl/handlers/text_style_handler.dart';
import 'package:liveeasy_huynl/models/views/needs.dart';
import 'package:liveeasy_huynl/models/views/news.dart';
import 'package:liveeasy_huynl/ui/components/avatar.dart';
import 'package:liveeasy_huynl/ui/pages/cook/cook_page.dart';
import 'package:liveeasy_huynl/ui/pages/invoices/invoice_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _bgAppBar(),
            _appBar(),
            Padding(
              padding: const EdgeInsets.only(
                  top: kdefaultPadding,
                  left: kdefaultPadding,
                  right: kdefaultPadding),
              child: Column(
                children: [
                  _infoUser(),
                  _defaultVerticalSpace(),
                  _defaultVerticalSpace(),
                  _servicesItems(),
                  _defaultVerticalSpace(),
                  _defaultVerticalSpace(),
                  _verticalSpace(8.0),
                  _haveYouNeed(),
                  _defaultVerticalSpace(),
                  _news()
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _bgAppBar() {
    return Positioned(
      top: 0,
      child: Container(
        width: size.width,
        height: 434,
        color: kBgAppBar,
      ),
    );
  }

  Widget _appBar() {
    return Positioned(
        top: 0,
        child: Container(
          width: size.width,
          height: size.height * 1 / 5,
          decoration: BoxDecorationHandler.appBar,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                kdefaultPadding, 0, kdefaultPadding, 0),
          ),
        ));
  }

  Widget _infoUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Avatar(),
        SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nguyễn Lê Huy',
              style: TextStyleHandler.infoUserName,
            ),
            Text(
              'Toà CT3 - Tầng 15 - Phòng 1521',
              style: TextStyleHandler.infoUserLocation,
            )
          ],
        )
      ],
    );
  }

  Widget _servicesItems() {
    return Container(
      width: 380,
      height: 310,
      decoration: BoxDecorationHandler.servicesItems,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _serviceItem(_gotoInvoicePage, 'invoice.png', 'Hoá đơn',
                    BoxDecorationHandler.servicesItemTopLeft),
                _serviceItem(null, 'room.png', 'Dọn dẹp', null),
                _serviceItem(null, 'home-repair.png', 'Sửa chữa',
                    BoxDecorationHandler.servicesItemTopRight),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                _serviceItem(null, 'transportation.png', 'Vận chuyển', null),
                _serviceItem(_gotoCookPage, 'chef-hat.png', 'Nhà bếp', null),
                _serviceItem(null, 'spa.png', 'Chăm sóc', null),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                _serviceItem(null, 'medicine.png', 'Y tế',
                    BoxDecorationHandler.servicesItemBottomLeft),
                _serviceItem(null, 'marketplace.png', 'Mua bán', null),
                _serviceItem(null, 'grid.png', 'Thêm',
                    BoxDecorationHandler.servicesItemBottomRight),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceItem(Function function, String iconName, String label,
      BoxDecoration boxDecoration) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: boxDecoration ?? BoxDecorationHandler.servicesItem,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/$iconName',
                height: 35,
                width: 30,
              ),
              Text(label)
            ],
          ),
        ),
      ),
    );
  }

  Widget _haveYouNeed() {
    return Container(
      height: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_label('Khám phá'), _verticalSpace(8.0), _needItems()],
      ),
    );
  }

  Widget _label(String label) {
    return Text(
      label,
      style: TextStyleHandler.labelCategory,
    );
  }

  Widget _needItems() {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: needs.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: kdefaultPadding),
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    child: Image.asset(
                      '${needs[index].imageUrl}',
                      fit: BoxFit.cover,
                      width: 200,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _verticalSpace(5.0),
                        Text(
                          '${needs[index].title}',
                          style: TextStyleHandler.infoBuildingTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          '${needs[index].body}',
                          style: TextStyleHandler.infoBuildingbBody,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _news() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_label('Tin tức'), _verticalSpace(8.0), _newItems()],
    );
  }

  Widget _newItems() {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: kdefaultPadding,
        mainAxisSpacing: kdefaultPadding,
      ),
      itemCount: news.length,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  child: Image.asset(
                    '${news[index].imageUrl}',
                    fit: BoxFit.fill,
                    width: 300,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _verticalSpace(5.0),
                      Text(
                        '${news[index].title}',
                        style: TextStyleHandler.infoBuildingTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        '${news[index].body}',
                        style: TextStyleHandler.infoBuildingbBody,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _defaultVerticalSpace() {
    return SizedBox(
      height: kdefaultPadding,
    );
  }

  Widget _verticalSpace(double space) {
    return SizedBox(
      height: space,
    );
  }

  _gotoInvoicePage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InvoicePage()));
  }

  _gotoCookPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CookPage()));
  }
}
