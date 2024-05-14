import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_creator/controllers/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        automaticallyImplyLeading: false,
      ),
      body: Container(child: Text('data')),
    );
  }
}
