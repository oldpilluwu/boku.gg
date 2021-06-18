import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/models/anime_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LibraryController extends GetxController {
  final CollectionReference<Map<String, dynamic>> libraryCollection =
      FirebaseFirestore.instance.collection('library');

  var isLoading = false.obs;
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
      isLoading(true);
      await libraryCollection.doc(uid).collection(listName).add({
        "id": id,
        "title": title,
        "image": image,
      });
    } catch (e) {} finally {
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
      print(retVal);
      return retVal;
    });
  }

  bool isNotPresentIn(String listName, String id) {
    print(id);
    switch (listName) {
      case 'current':
        return currentWatching.where((anime) => anime.id == id).isEmpty;
      case 'completed':
        return completedWatching.where((anime) => anime.id == id).isEmpty;
      case 'watchlist':
        return watchList.where((anime) => anime.id == id).isEmpty;
      default:
        return false;
    }
  }

  Future<void> removeFromList(String uid, String listName, String id) async {
    try {
      var snapshot = await libraryCollection
          .doc(uid)
          .collection(listName)
          .where("id", isEqualTo: id)
          .get();
      for (var doc in snapshot.docs) await doc.reference.delete();
    } catch (e) {}
  }

  Future<void> removeFromAllList(String uid, String id) async {
    await removeFromList(authController.user!.uid, 'watchlist', id);
    await removeFromList(authController.user!.uid, 'current', id);
    await removeFromList(authController.user!.uid, 'completed', id);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
