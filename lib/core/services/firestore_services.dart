import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mm_dictionary/model/user.dart';
import 'package:mm_dictionary/model/word.dart';



class FirestoreService extends GetxService {


  final _firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot> fireStoreUserStream(String userId) {
    return _firestore.collection("users").doc(userId).snapshots();
  }

  // Future createUser(String id,UserModel user)async{
  //   try{
  //     DocumentSnapshot snapshot=await _firestore.collection('users').doc(id).get();
  //     print(snapshot.exists);
  //     if(snapshot.exists){
  //       updateUser(id, user.toMap());
  //     }
  //     else{
  //       await _firestore.collection('users').doc(id).set(user.toMap(),SetOptions(merge: true));
  //     }
  //   }
  //   catch(e){
  //     rethrow;
  //   }
  // }

//add new word to firestore with auto generated id
  Future addWord(Word word) async {
    try {
      return await _firestore.collection('words').add(word.toMap());
    }
    catch (e) {
      rethrow;
    }
  }

  Future updateWord(Word word, String? id) async {
    try {
      return await _firestore.collection('words').doc(id).update(word.toMap());
    }
    catch (e) {
      rethrow;
    }
  }

  Future<List<Word>> getWords() async {
    QuerySnapshot querySnapshot= await _firestore.collection("words").get();
    return querySnapshot.docs.map((e) => Word.fromJson(e.data() as Map, e.id)).toList();
  }

  Future<List<Word>> getContributorWords(String userId) async {
    return await _firestore.collection("words").where("userId",isEqualTo:userId ).get().then((value) =>
        value.docs.map((e) => Word.fromJson(e.data(), e.id)).toList());
  }
  Future<UserModel> getCurrentUser(String? id) async {
    return await _firestore.collection("users").doc(id).get().then((value) =>
      UserModel.fromJson(value.data() as Map, value.id));
  }
  Future check(String id, bool action) async {
    return
      action==false? await _firestore.collection("words").doc(id).delete():

      await _firestore.collection("words").doc(id).update(
        {"isVerified": action});
  }

  Future addUser(UserModel user,String? id) async {
    try {
      return await _firestore.collection("users").doc(id).set(user.toMap());
    }
    catch (e) {
      rethrow;
    }
  }
}