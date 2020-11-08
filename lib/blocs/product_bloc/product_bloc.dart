import 'package:liveeasy_huynl/models/repos/product/data.dart';
import 'package:liveeasy_huynl/models/views/product_view.dart';
import 'package:liveeasy_huynl/repositories/product_repository.dart';
import 'package:rxdart/subjects.dart';

class ProductBloc {
  var productController = PublishSubject<List<Data>>();
  Sink<List<Data>> get productSink => productController.sink;
  Stream<List<Data>> get productStream => productController.stream;
  final productView = ProductView(150, 1, 50);

  void fetchProducts() async {
    await productRepository
        .fetchProducts(productView)
        .then((products) => {
              productSink.add(products),
            })
        .catchError((onError) => productSink.add(onError));
  }

  void dispose() {
    productController.close();
  }
}

final productBloc = ProductBloc();
