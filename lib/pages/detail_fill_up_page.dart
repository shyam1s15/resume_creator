import 'package:flutter/material.dart';

import '../dto/widget_arguments.dart';

class DetailFillUpPage extends StatefulWidget {
  final String pageTitle;
  final List<WidgetArguments> widgets;
  const DetailFillUpPage({super.key, required this.pageTitle, required this.widgets});

  @override
  State<DetailFillUpPage> createState() => _DetailFillUpPageState();
}

class _DetailFillUpPageState extends State<DetailFillUpPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
