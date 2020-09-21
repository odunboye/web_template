import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class LogoutButton extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(Icons.exit_to_app),
        onPressed: () {
          // Navigator.pop(context);
          // controller.logout();
        },
      ),
    );
  }
}
