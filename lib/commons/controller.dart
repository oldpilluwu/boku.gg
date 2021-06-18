import 'package:boku_gg/controllers/anime_controller.dart';
import 'package:boku_gg/controllers/auth_controller.dart';
import 'package:boku_gg/controllers/library_controller.dart';
import 'package:boku_gg/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AnimeController animeController = AnimeController.instance;
SearchController searchController = SearchController.instance;
AuthController authController = Get.find();
LibraryController libraryController = Get.find();
