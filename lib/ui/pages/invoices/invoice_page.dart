import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/handlers/box_decoration.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:liveeasy_huynl/handlers/padding_handler.dart';
import 'package:liveeasy_huynl/handlers/text_style_handler.dart';
import 'package:liveeasy_huynl/models/views/invoices.dart';

class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBgInvoicePage,
      appBar: AppBar(
        leading: BackButton(),
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: kThemePrimaryColor,
        title: Text('Hoá đơn'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: kActionAppBarIcon,
              ),
              onPressed: null)
        ],
      ),
      body: _invoices(),
    );
  }

  Widget _invoices() {
    return Container(
      margin: EdgeInsets.only(top: kdefaultPadding),
      height: size.height * 3 / 4,
      decoration: BoxDecorationHandler.invoiceItemsPage,
      child: ListView.builder(
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          return _invoiceItem(context, index);
        },
      ),
    );
  }

  Widget _invoiceItem(context, index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 8.0, 24.0),
      child: Container(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            invoices[index].image,
            SizedBox(
              width: 12.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  invoices[index].name,
                  style: TextStyleHandler.invoiceItem,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  width: 320,
                  color: kBgDividerColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
