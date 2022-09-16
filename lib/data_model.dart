import 'package:firebase_auth/firebase_auth.dart';

class DataModel{
  int? token;
  String? providerId;
  String? signInMethod;
  String? phoneNumber;
  String? uid;
  String? email;
  String? displayName;
  bool? isVerified;
  String? photoUrl;
  DataModel.fromJson(UserCredential? credential,{bool? verified}):
        token = credential?.credential?.token,
        isVerified = verified?? true,
        providerId =credential?.credential?.providerId,
        signInMethod =credential?.credential?.signInMethod,
        phoneNumber = credential?.user?.phoneNumber,
        uid = credential?.user?.uid,
        email = credential?.user?.email,
        displayName = credential?.user?.displayName,
        photoUrl = credential?.user?.photoURL;

  @override
  String toString(){
    return """
    token: $token,
    providerId: $providerId,
    signInMethod: $signInMethod,
    phoneNumber: $phoneNumber,
    uid: $uid,
    email: $email,
    displayName: $displayName,
    photoUrl: $photoUrl
    """;
  }
}