import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:liveeasy_huynl/ui/pages/cook/foods.dart';
import 'package:liveeasy_huynl/ui/pages/cook/needs.dart';
import 'package:liveeasy_huynl/ui/pages/cook/order_lunch.dart';

class CookPage extends StatefulWidget {
  @override
  _CookPageState createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            automaticallyImplyLeading: true,
            centerTitle: true,
            backgroundColor: kThemePrimaryColor,
            title: Text('Nhà bếp'),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: kActionAppBarIcon,
                  ),
                  onPressed: null)
            ],
            bottom: TabBar(
              labelColor: kSelectedTabbar,
              indicatorColor: kSelectedTabbar,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  text: 'Cần thiết',
                  icon: ImageIcon(
                      Image.asset('assets/icons/stay-at-home-cook.png').image),
                ),
                Tab(text: 'Đồ ăn', icon: Icon(Icons.fastfood)),
                Tab(
                    text: 'Thực phẩm',
                    icon: ImageIcon(
                        Image.asset('assets/icons/vegetables-cook.png').image)),
              ],
            ),
          ),
          body: TabBarView(
            children: [Needs(), OrderLunch(), Foods()],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: kFloatButton,
            onPressed: null,
            child: Stack(
              children: [
                Center(
                    child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                )),
                Positioned(
                  right: 13,
                  top: 13,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                        color: kThemePrimaryColor,
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Center(
                      child: Text(
                        '01',
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
