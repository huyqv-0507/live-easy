class NeedServiceCook {
  final String name;
  final String imageUrl;
  final String body;

  NeedServiceCook(this.name, this.imageUrl, this.body);
}

final List needServiceCooks = <NeedServiceCook>[
  NeedServiceCook('Gạo', 'assets/imgs/gaonepsap.png', 'Gạo dẻo, gạo nếp, ...'),
  NeedServiceCook('Ga', 'assets/imgs/gas.jpg', 'Petrolimex, Totalgaz, ...'),
  NeedServiceCook('Dụng cụ', 'assets/imgs/equipment.jpg', 'Chảo, đũa, ...'),
  NeedServiceCook('Nước', 'assets/imgs/water.png', 'Vihawa, Aquafina, ...'),
];
