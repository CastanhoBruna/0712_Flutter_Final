import 'package:flutter/cupertino.dart';
import 'package:flutter_fiap_project2/model/payment.dart';
import 'package:flutter_fiap_project2/model/payment.dart';
import 'package:mobx/mobx.dart';

part 'paymentController.g.dart';

class PaymentController = PaymentControllerBase with _$PaymentController;

abstract class PaymentControllerBase with Store {

  @observable
  var payments = ObservableList();

  @action
  void add(Payment payment) {
    payments.add(payment);
  }

  @action
  void update(int index, Payment payment){
    payments.removeAt(index);
    payments.insert(index, payment);
  }
}