// import 'package:dpts/apps/backoffice/screens/complaints/complaints_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_template/pages/home/home_controller.dart';

class ListDrawerItems extends GetWidget<HomeController> {
  final bool autoClose;

  ListDrawerItems({@required this.autoClose});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          DrawerItem(
            autoClose: autoClose,
            title: 'Dashboard',
            position: 0,
          ),
          DrawerItem(
            autoClose: autoClose,
            title: 'other things',
            position: 1,
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends GetWidget<HomeController> {
  DrawerItem({
    @required this.autoClose,
    Key key,
    this.title,
    this.position,
  });
  final String title;
  final int position;
  final bool autoClose;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlatButton(
        color: controller.active == position ? Colors.grey[200] : Colors.white,
        onPressed: () {
          controller.tabController.animateTo(position);
          autoClose ? Navigator.pop(context) : print("");
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
            child: Row(children: [
              Icon(Icons.dashboard),
              SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Avenir',
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
