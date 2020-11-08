import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:liveeasy_huynl/handlers/padding_handler.dart';
import 'package:liveeasy_huynl/ui/components/divider_handler.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: kThemePrimaryColor,
        title: Text('Giỏ hàng'),
        actions: [
          IconButton(
              icon: ImageIcon(
                Image.asset(
                  'assets/icons/cross.png',
                  color: Colors.white,
                ).image,
                size: 18,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: _body(),
      bottomNavigationBar: _bottomButton(),
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
              'Mua hàng',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DividerHandler(
          label: 'Giao đến',
          size: size,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/icons/delivery.png',
                  fit: BoxFit.contain,
                  height: 24,
                  width: 24,
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Phòng 1521',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Toà CT3 - Tầng 15 - Phòng 1521')
                  ],
                ),
              )
            ],
          ),
        ),
        DividerHandler(
          label: 'Sản phẩm',
          size: size,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 5,
                      height: 30,
                      color: kThemePrimaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '1x',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Gạo lài sữa miên'),
                    Text(
                      '23.000đ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        DividerHandler(
          label: 'Phương thức thanh toán',
          size: size,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(kdefaultPadding, 8, kdefaultPadding, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/imgs/vnpay.jpg',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(flex: 4, child: Text('Cổng thanh toán VNPay'))
            ],
          ),
        )
      ],
    );
  }
}
