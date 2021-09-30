import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class UserSignUp{
  Future<dynamic> userSignUp(var email, var password, var image, var fullName,
      var currency);
}

class UserSignUpRepository implements UserSignUp{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<dynamic> userSignUp(var email, var password, var profileImage,
  var fullName, var currency) async{
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'weak-password';
      }
      else if (e.code == 'email-already-in-use') {
        return 'Email already Exists';
      }
    }
    catch (e) {
      return e.toString();
    }

    if(auth.currentUser != null){
      try{
        var userId = auth.currentUser!.uid;
        var imageLink = await uploadFile(profileImage.path, userId);
        print(imageLink);
        await FirebaseFirestore.instance
            .collection("Users")
            .doc('$userId')
            .set({
          'Name': fullName,
          'imageUrl': imageLink,
          'currency': currency
        }).then((_){
          print('success');
        });
      }
      catch(e){
        return "Firestore Error data not sent";
      }
    } else return;
  }
  Future<String?> uploadFile(String filePath, var userId) async {
    File file = File(filePath);

    try {
      var uploadTask =  FirebaseStorage.instance;
      var task = await uploadTask.ref('profileImages/$userId.png')
          .putFile(file);
      var downUrl = await task.ref.getDownloadURL();
      return downUrl.toString();
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print(e);
    }
  }
}