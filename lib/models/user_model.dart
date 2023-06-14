import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String bolim;
  final String name;
  final String message;

  UserModel({
    required this.bolim,
    required this.name,
    required this.message,
  });
  
  toJson() {
    return {
      "bolim":bolim, 
      "name" : name,
      "message":message,       
    };
  }
}
