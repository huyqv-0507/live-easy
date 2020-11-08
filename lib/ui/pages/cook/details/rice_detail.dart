import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:liveeasy_huynl/handlers/padding_handler.dart';
import 'package:liveeasy_huynl/models/views/rice.dart';
import 'package:liveeasy_huynl/ui/components/avatar.dart';

import '../../cart_page.dart';

class RiceDetail extends StatefulWidget {
  final Rice rice;

  const RiceDetail({Key key, this.rice}) : super(key: key);

  @override
  _RiceDetailState createState() => _RiceDetailState();
}

class _RiceDetailState extends State<RiceDetail> {
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
        bottomNavigationBar: _bottomButton());
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _bgImg(),
        _labelCategory(),
        Divider(
          thickness: 5,
        ),
        _description(),
        _verticalSpace(8),
        Divider(
          thickness: 5,
        ),
        _verticalSpace(8),
        _note(),
        _verticalSpace(8),
        Divider(
          thickness: 5,
        ),
        _verticalSpace(8),
        _quantity(),
        _verticalSpace(8),
        _totalCash()
      ],
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
        padding: EdgeInsets.only(
            top: kdefaultPadding,
            left: kdefaultPadding,
            right: kdefaultPadding,
            bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${widget.rice.name}',
                style: TextStyle(
                    color: kThemePrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
            Text('${widget.rice.price}',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ));
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

  Widget _description() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kdefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _titleDetail('Mô tả'),
          Text(
            '${widget.rice.description}',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _note() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kdefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _titleDetail('Ghi chú'),
              SizedBox(
                width: 10,
              ),
              Text(
                'Tuỳ chọn',
                style: TextStyle(color: Colors.black38, fontSize: 10),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: TextField(
              cursorHeight: 25,
              cursorColor: kThemePrimaryColor,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
                  hintText: 'E.g Không dùng túi nilon'),
            ),
          )
        ],
      ),
    );
  }

  Widget _quantity() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kdefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleDetail('Số lượng'),
          _verticalSpace(8),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ChoiceChip(
                    label: Text(
                      '1kg',
                      style: TextStyle(color: Colors.black),
                    ),
                    selected: true,
                    selectedColor: kThemePrimaryColor,
                  ),
                  _horizontalSpace(5),
                  ChoiceChip(label: Text('2kg'), selected: false),
                  _horizontalSpace(5),
                  ChoiceChip(label: Text('5kg'), selected: false),
                  _horizontalSpace(5),
                  ChoiceChip(label: Text('10kg'), selected: false)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: kThemePrimaryColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(color: kThemePrimaryColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text('01'),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: kThemePrimaryColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Center(
                      child: Text('+',
                          style: TextStyle(color: kThemePrimaryColor)),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _titleDetail(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    );
  }

  Widget _bottomButton() {
    return Padding(
      padding: const EdgeInsets.all(kdefaultPadding),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CartPage())),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: kThemePrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Center(
            child: Text(
              'Thêm vào giỏ',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget _totalCash() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kdefaultPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Tổng tiền: ',
                style: TextStyle(color: Colors.black, fontSize: 15)),
            TextSpan(
                text: '23 000đ',
                style: TextStyle(
                    color: kThemePrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      ),
    );
  }

  Widget _verticalSpace(double space) {
    return SizedBox(
      height: space,
    );
  }

  Widget _horizontalSpace(double space) {
    return SizedBox(
      width: space,
    );
  }
}
