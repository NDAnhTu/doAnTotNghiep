import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/thamkham_controller.dart';

class ThamKhamView extends GetView<ThamKhamController> {
  ThamKhamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('tham kham'),
    );
  }
}
