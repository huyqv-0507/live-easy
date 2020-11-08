class Rice {
  final String name;
  final String imageUrl;
  final String price;
  final String description;

  Rice(this.name, this.imageUrl, this.price, this.description);
}

final List rices = <Rice>[
  Rice('Gạo hương lài', 'assets/imgs/rice/gaohuonglai.jpg', '23.000đ/kg',
      '\nGạo lài sữa miên có hạt dài và đều, có mùi thơm nhẹ. \n\nGạo lài sữa miên có xuất xứ nguồn gốc từ giống lúa Khaodokmali và RD15 của Thái Lan được người dân Campuchia nhập về và canh tác trên các ruộng lúa của người bản xứ. Thông qua quá trình trao đổi lưu thông hàng hóa của các nông hộ khu vực vùng biên Thái-Cam.'),
  Rice(
      'Gạo lức huyết rồng',
      'assets/imgs/rice/gaoluchuyetrong.jpg',
      '34.000đ/kg',
      'Gạo lài sữa miên có hạt dài và đều, có mùi thơm nhẹ. Gạo lài sữa miên có xuất xứ nguồn gốc từ giống lúa Khaodokmali và RD15 của Thái Lan được người dân Campuchia nhập về và canh tác trên các ruộng lúa của người bản xứ. Thông qua quá trình trao đổi lưu thông hàng hóa của các nông hộ khu vực vùng biên Thái-Cam.'),
  Rice('Gạo nếp sáp', 'assets/imgs/rice/gaonepsap.png', '32.000đ/kg',
      'Gạo lài sữa miên có hạt dài và đều, có mùi thơm nhẹ. Gạo lài sữa miên có xuất xứ nguồn gốc từ giống lúa Khaodokmali và RD15 của Thái Lan được người dân Campuchia nhập về và canh tác trên các ruộng lúa của người bản xứ. Thông qua quá trình trao đổi lưu thông hàng hóa của các nông hộ khu vực vùng biên Thái-Cam.'),
  Rice('Gạo rồng vàng', 'assets/imgs/rice/gaorongvang.jpg', '23.000đ/kg',
      'Gạo lài sữa miên có hạt dài và đều, có mùi thơm nhẹ. Gạo lài sữa miên có xuất xứ nguồn gốc từ giống lúa Khaodokmali và RD15 của Thái Lan được người dân Campuchia nhập về và canh tác trên các ruộng lúa của người bản xứ. Thông qua quá trình trao đổi lưu thông hàng hóa của các nông hộ khu vực vùng biên Thái-Cam.'),
];
