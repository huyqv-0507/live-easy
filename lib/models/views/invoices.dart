import 'package:flutter/material.dart';

class Invoice {
  final Image image;
  final String name;

  Invoice(this.image, this.name);
}

final List invoices = <Invoice>[
  Invoice(
      Image.asset(
        'assets/icons/power-invoice.png',
        width: 35,
        height: 35,
      ),
      'Điện'),
  Invoice(Image.asset('assets/icons/water-invoice.png', width: 35, height: 35),
      'Nước'),
  Invoice(
      Image.asset('assets/icons/tv-invoice.png', width: 35, height: 35), 'TV'),
  Invoice(
      Image.asset('assets/icons/internet-invoice.png', width: 35, height: 35),
      'Internet'),
  Invoice(
      Image.asset('assets/icons/building-invoice.png', width: 35, height: 35),
      'Chung cư'),
  Invoice(Image.asset('assets/icons/more-invoice.png', width: 35, height: 35),
      'Thêm'),
];
