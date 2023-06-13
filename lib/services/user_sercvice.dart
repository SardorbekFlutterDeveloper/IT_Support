// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:portfolio/models/user_model.dart';



// class FirebaseServices {
//   final FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

//  //recieve the data
 
//   Stream<List<UserModel>> getUserList() {
//     return _fireStoreDataBase.collection('user')
//         .snapshots()
//         .map((snapShot) => snapShot.documents
//         .map((document) => UserModel.fromJson(document.data))
//         .toList());
//   }

//   //upload a data
//   addUser(){
//     var addUserData = Map<String,dynamic>();
//     addUserData['name'] = "Andrew Holder";
//     addUserData['age'] = "31yrs";
//     return _fireStoreDataBase.collection('users').document('user_03').setData(addUserData);
//   }
// }