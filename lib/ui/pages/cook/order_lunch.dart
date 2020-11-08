import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/blocs/product_bloc/product_bloc.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:liveeasy_huynl/handlers/padding_handler.dart';
import 'package:liveeasy_huynl/helpers/format_helper.dart';
import 'package:liveeasy_huynl/models/repos/product/data.dart';
import 'package:liveeasy_huynl/ui/pages/cook/details/product_detail.dart';

class OrderLunch extends StatefulWidget {
  @override
  _OrderLunchState createState() => _OrderLunchState();
}

class _OrderLunchState extends State<OrderLunch> {
  @override
  void initState() {
    productBloc.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: kdefaultPadding,
            ),
            _product('Mì', 'Mì'),
            _product('Cơm', 'Cơm'),
            _product('Pizza', 'PIZZA'),
            _product('Salad', 'Salad'),
            _product('Nước', 'Nước'),
          ],
        ),
      ),
    );
  }

  Widget _product(String categoryName, String productCompare) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    categoryName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Icon(Icons.chevron_right)
            ],
          ),
          StreamBuilder<List<Data>>(
            initialData: [],
            builder: (context, snapshot) {
              return Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      if (snapshot.data[index].productName
                          .contains(productCompare))
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                        product: snapshot.data[index],
                                      ))),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 130,
                            height: 140,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  child: Image.network(
                                    '${snapshot.data[index].picUrl}',
                                    fit: BoxFit.fill,
                                    height: 80,
                                    width: 140,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${snapshot.data[index].productName}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${formatHelper.toCurrencyVnd(snapshot.data[index].price)}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                    }
                    return Container();
                  },
                ),
              );
            },
            stream: productBloc.productStream,
          ),
        ],
      ),
    );
  }
}
