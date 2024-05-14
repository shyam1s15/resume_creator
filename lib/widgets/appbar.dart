import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Icon? backIcon;
  final VoidCallback? voidCallback;

  const CustomAppBar({super.key, required this.title, this.backIcon, this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return GFAppBar(
      leading: backIcon != null ? GFIconButton(
        icon: backIcon!,
        onPressed: voidCallback ?? () {},
        type: GFButtonType.transparent,
      ) : null,
      title: Text(title),
      /*actions: <Widget>[
        GFIconButton(
          icon: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          onPressed: () {},
          type: GFButtonType.transparent,
        ),
      ],*/
    );
  }
}
