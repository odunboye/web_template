import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;
  final _active = RxInt(0);
  int get active => this._active.value;
  set active(value) => this._active.value = value;

  AnimationController _animController;
  final animValue = 0.0.obs;

  @override
  void onInit() {
    tabController = new TabController(vsync: this, length: 2, initialIndex: 0)
      ..addListener(() {
        _active.value = tabController.index;
        print(Get.currentRoute);
      });
    _animController =
        AnimationController.unbounded(duration: 1.seconds, vsync: this);
    _animController.addListener(_onValueChanged);
  }

  void _onValueChanged() {
    animValue.value = _animController.value;
  }

  @override
  void onReady() {
    _animController.forward();
  }

  @override
  void onClose() {
    _animController.removeListener(_onValueChanged);
    _animController.dispose();
    tabController.dispose();
  }
}
