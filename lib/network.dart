import 'package:firebase_auth/firebase_auth.dart';
import 'data_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<DataModel> loginWithFacebook() async {
    // Trigger the sign-in flow for facebook
    UserCredential? userCredential;
    final LoginResult loginResult = await FacebookAuth.instance.login();
    // Create a credential from the access token
    if(loginResult.accessToken!=null){
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider
          .credential(loginResult.accessToken!.token);
      // Signed in with the UserCredential
      userCredential = await _auth.signInWithCredential(facebookAuthCredential);
    }

    return DataModel.fromJson(userCredential);
  }

}