import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/handlers/padding_handler.dart';
import 'package:liveeasy_huynl/handlers/text_style_handler.dart';
import 'package:liveeasy_huynl/models/views/needs_service_cook.dart';
import 'package:liveeasy_huynl/ui/pages/cook/gas_page.dart';
import 'package:liveeasy_huynl/ui/pages/cook/rice_page.dart';

class Needs extends StatefulWidget {
  @override
  _NeedsState createState() => _NeedsState();
}

class _NeedsState extends State<Needs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            kdefaultPadding, kdefaultPadding, kdefaultPadding, 0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
          itemCount: needServiceCooks.length,
          itemBuilder: (context, index) {
            return _needServiceItem(context, index);
          },
        ),
      ),
    );
  }

  Widget _needServiceItem(context, index) {
    return GestureDetector(
      onTap: () => _gotoNeeds(needServiceCooks[index].name),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(kdefaultPadding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kdefaultPadding),
                      topRight: Radius.circular(kdefaultPadding)),
                  child: Image.asset(
                    needServiceCooks[index].imageUrl,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _verticalSpace(5.0),
                    Text(
                      '${needServiceCooks[index].name}',
                      style: TextStyleHandler.infoNeedsCookTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '${needServiceCooks[index].body}',
                      style: TextStyleHandler.infoNeedsCookBody,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _gotoNeeds(String name) {
    switch (name) {
      case 'Gạo':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RicePage()));
        break;
      case 'Ga':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => GasPage()));
        break;
      default:
    }
  }

  Widget _verticalSpace(double space) {
    return SizedBox(
      height: space,
    );
  }
}
