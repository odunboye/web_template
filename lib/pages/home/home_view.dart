import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_template/pages/home/home_controller.dart';
import 'package:web_template/pages/home/widgets/LogoutButton.dart';
import 'package:web_template/utils/color_constants.dart';

import 'widgets/ListDrawerItems.dart';
import 'widgets/contents.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            MediaQuery.of(context).size.width < 1300 ? true : false,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 32),
                child: Text(
                  "App Name",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
            ]),
        actions: <Widget>[
          InkWell(
            onTap: () {
              print("download");
            },
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.cloud_download,
                    color: Colors.black,
                    size: 22,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Some Action",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'HelveticaNeue',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 32),
          Container(child: Icon(Icons.web)),
          SizedBox(width: 32),
          Container(
              child: GestureDetector(
            child: Icon(Icons.account_circle),
            onTap: () => controller.tabController.animateTo(11),
          )),
          SizedBox(width: 32),
          LogoutButton(),
          SizedBox(width: 32),
        ],
        backgroundColor: ColorConstants.blue,
        // automaticallyImplyLeading: false,
      ),
      drawer: Padding(
          padding: EdgeInsets.only(top: 56),
          child: Drawer(child: ListDrawerItems(autoClose: true))),
      body: Row(
        children: <Widget>[
          MediaQuery.of(context).size.width < 1300 ? Container() : SideNav(),
          Container(
            width: MediaQuery.of(context).size.width < 1300
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width - 310,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller.tabController,
              children: children1,
            ),
          )
        ],
      ),
    );
  }
}

class SideNav extends StatelessWidget {
  const SideNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
          margin: EdgeInsets.all(0),
          height: MediaQuery.of(context).size.height,
          width: 255,
          color: Colors.white,
          child: ListDrawerItems(
            autoClose: false,
          )),
    );
  }
}
