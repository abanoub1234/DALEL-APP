import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String firstName;
  String lastName;
  String profileImageUrl;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    this.profileImageUrl = '', // Default to empty string if not provided
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    // Print document data for debugging
    print('Document data: ${doc.data()}');

    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      email: data['email'] ?? '', // Provide a default value if the field is missing
      firstName: data['frist_name'] ?? '', // Use the correct field name
      lastName: data['last_name'] ?? '',
      profileImageUrl: data['profile_image_url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      email:'email',
      firstName:'frist_name',
      lastName:'last_name',
      profileImageUrl:'profile_image_url'
    };
  }
}
