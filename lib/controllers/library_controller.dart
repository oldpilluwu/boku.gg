import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/models/anime_display_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LibraryController extends GetxController {
  final CollectionReference<Map<String, dynamic>> libraryCollection =
      FirebaseFirestore.instance.collection('library');

  var isLoading = false.obs;
  var currentWatching = <AnimeDisplay>[].obs;
  var watchList = <AnimeDisplay>[].obs;
  var completedWatching = <AnimeDisplay>[].obs;

  Future<void> getUserLibrary(String uid) async {
    try {
      currentWatching
          .bindStream(listStream(authController.user!.uid, 'current'));
      watchList.bindStream(listStream(authController.user!.uid, 'watchlist'));
      completedWatching
          .bindStream(listStream(authController.user!.uid, 'completed'));
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
    if (listName == 'current' && !isNotPresentIn('current', id)) return;
    if (listName == 'watchlist' && !isNotPresentIn('watchlist', id)) return;
    if (listName == 'completed' && !isNotPresentIn('current', id)) return;

    try {
      if (isLoading.value == true) return;
      isLoading(true);
      await libraryCollection.doc(uid).collection(listName).doc(id).set({
        "id": id,
        "title": title,
        "image": image,
      });
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  void clearList() {
    currentWatching.clear();
    completedWatching.clear();
    watchList.clear();
  }

  Stream<List<AnimeDisplay>> listStream(String uid, String listName) {
    return libraryCollection
        .doc(uid)
        .collection(listName)
        .snapshots()
        .map((QuerySnapshot query) {
      List<AnimeDisplay> retVal = [];
      query.docs.forEach((element) {
        retVal.add(AnimeDisplay.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  bool isNotPresentIn(String listName, String id) {
    List<AnimeDisplay> list = [];
    switch (listName) {
      case 'current':
        list.addAll(currentWatching);
        break;
      case 'completed':
        list.addAll(completedWatching);
        break;
      case 'watchlist':
        list.addAll(watchList);
        break;
      default:
        break;
    }
    bool res = list.where((element) => element.id == id).isEmpty;
    return res;
  }

  bool isNotBookmarked(String id) {
    List<AnimeDisplay> list = [];
        list.addAll(currentWatching);
        list.addAll(completedWatching);
        list.addAll(watchList);
    bool res = list.where((element) => element.id == id).isEmpty;
    return res;
  }

  Future<void> removeFromList(String uid, String listName, String id) async {
    try {
      var snapshot = await libraryCollection
          .doc(uid)
          .collection(listName)
          .where("id", isEqualTo: id)
          .get();
      for (var doc in snapshot.docs) await doc.reference.delete();
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> removeFromAllList(String uid, String id) async {
    await removeFromList(authController.user!.uid, 'watchlist', id);
    await removeFromList(authController.user!.uid, 'current', id);
    await removeFromList(authController.user!.uid, 'completed', id);
  }
}
