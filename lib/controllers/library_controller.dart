import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/models/anime_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LibraryController extends GetxController {
  final CollectionReference<Map<String, dynamic>> libraryCollection =
      FirebaseFirestore.instance.collection('library');

  var currentWatching = <AnimeDisplay>[].obs;
  var watchList = <AnimeDisplay>[].obs;
  var completedWatching = <AnimeDisplay>[].obs;

  // Future<void> createNewLibrary(String uid) async {
  //   try {
  //     await libraryCollection.doc(uid).collection("current")
  //     await libraryCollection.doc(uid).set({
  //       "current": currentWatching,
  //       "completed": completedWatching,
  //       "watch_list": watchList,
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> getUserLibrary(String uid) async {
    try {
      DocumentSnapshot doc = await libraryCollection.doc(uid).get();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addToList(
    String uid,
    String listName,
    String id,
    String title,
    String image,
  ) async {
    // switch (listName) {
    //   case "current":
    //     currentWatching.add(AnimeDisplay(id: id, title: title, image: image));
    //     break;
    //   case "watchlist":
    //     watchList.add(AnimeDisplay(id: id, title: title, image: image));
    //     break;
    //   case "completed":
    //     completedWatching.add(AnimeDisplay(id: id, title: title, image: image));
    //     break;
    //   default:
    // }

    try {
      await libraryCollection.doc(uid).collection(listName).add({
        "id": id,
        "title": title,
        "image": image,
      });
    } catch (e) {}
  }

  void clearList() {
    currentWatching.clear();
    completedWatching.clear();
    watchList.clear();
  }
}
