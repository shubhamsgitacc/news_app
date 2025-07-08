
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
     Timer? timer;

  RxBool primaryLoading = false.obs;
  RxBool secondaryLoading = false.obs;
  TextEditingController searchController = TextEditingController();
  onSearch(){

  }
}
