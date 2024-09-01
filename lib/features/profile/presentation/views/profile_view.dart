import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mydalil3/core/utils/app_colors.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../auth/presentation/views/sign_in_view.dart';


class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() =>  _ProfileViewState();
}

class  _ProfileViewState extends State<ProfileView> {
  String firstName = '';
  String lastName = '';
  String email = '';
  File? _image;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String email = user.email!; // Get the current user's email
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      QuerySnapshot querySnapshot = await users.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        setState(() {
          firstName = documentSnapshot['frist_name'];
          lastName = documentSnapshot['last_name'];
          this.email = documentSnapshot['email'];
        });
      } else {
        print('No user found with this email');
      }
    } else {
      print('No current user logged in');
    }
  }

  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile', maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.pacifico400style64.copyWith(fontSize: 25),),

            // Handle back button press
        ),
        backgroundColor: AppColors.offWhite,


      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                children: [
                  CircleAvatar(

                    radius: 75,
                    backgroundImage:AssetImage(Assets.avatar,) as ImageProvider,

                  ),
                  SizedBox(height: 10),
                  Text(
                    '$firstName $lastName',
                    style: CustomTextStyles.pacifico400style64.copyWith(fontSize: 25),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileInfoItem(
              icon: Icons.person,
              text: '$firstName $lastName',
            ),
            ProfileInfoItem(
              icon: Icons.email,
              text: email,
            ),
            SizedBox(height: 180),
      ElevatedButton(
        onPressed: () {
          customNavigateReplacement(context,"/Signinview");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.deepBrown, // Set the button color
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'Logout',
          style:CustomTextStyles.poppins400style20.copyWith(color:AppColors.offWhite ),
        ),
      )],

        ),
      ),
    );
  }
}

class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  ProfileInfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 6,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor),
          SizedBox(width: 20),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.poppins500style24.copyWith(color: AppColors.deepBrown),
          ),

        ],
      ),

    );
  }
}
