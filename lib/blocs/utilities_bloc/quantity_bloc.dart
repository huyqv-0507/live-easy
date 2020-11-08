import 'package:rxdart/subjects.dart';

class QuantityBloc {
  final quantityController = BehaviorSubject<int>();
  Stream get quantityStream => quantityController.stream;
  Sink get quantitySink => quantityController.sink;

  
  void dispose() {
    quantityController.close();
  }
}

final QuantityBloc quantityBloc = QuantityBloc();
