import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/profileCard.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _image;

  final _picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    checkProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
            onTap: () {},
        borderRadius: BorderRadius.circular(30),
        child: Container(
          margin: EdgeInsets.only(
            top: 10,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    _showPicker(context);
                  },
                  child: Stack(
                    children: [
                      _image == 'null' ?Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/user.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ) :
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(_image.toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      ,
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jhon Doe',
                        style: style1.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '+1213-269-6858',
                        style: style2.copyWith(
                            fontSize: 13, color: secondaryColor.withOpacity(0.8)),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        '${FirebaseAuth.instance.currentUser!.email}',
                        style: style2.copyWith(
                          fontSize: 13,
                          color: secondaryColor.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                'Accounts',
                style: style2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            middleLanguageAndCurrencyCard(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                'Security',
                style: style2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            bottomSecurityAndGeneralCard(),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  _imgFromCamera() async {
    final image = await _picker.pickImage(
      source: ImageSource.camera, imageQuality: 50,);

    // setState(() {
    //   _image = image;
    // });
    var imageLink = await uploadFile(image!.path);
    updateUser(imageLink);
  }

  _imgFromGallery() async {
    final image = await  _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    // setState(() {
    //   _image = image;
    // });
    var imageLink = await uploadFile(image!.path);
    updateUser(imageLink);
  }

 uploadFile(String filePath) async {
  File file = File(filePath);

  try {
    print('upload file');
    var uploadTask =  FirebaseStorage.instance;
    var task = await uploadTask.ref('profileImages/${FirebaseAuth.instance.currentUser!.uid}.png')
        .putFile(file);
    var downUrl = await task.ref.getDownloadURL();
    return downUrl.toString();
  } on FirebaseException catch (e) {
    // e.g, e.code == 'canceled'
    print(e);
  }
}

Future<void> updateUser(var imageUrl) async{
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  var update = await users.doc(FirebaseAuth.instance.currentUser!.uid).update({
    'imageUrl': '$imageUrl'
  });
  }

  checkProfile() async{
    var userDetails = await FirebaseFirestore.instance.collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid).get();
    var imageUrl = userDetails.data()?['imageUrl'];
    setState(() {
      _image = imageUrl;
    });
  }
}
