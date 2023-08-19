import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/muasam_controller.dart';

class MuaSamView extends GetView<MuaSamController> {
  MuaSamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('mua sam'),
    );
  }
}
