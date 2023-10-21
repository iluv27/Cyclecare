import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

User? currentUser;
String? displayName;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<void> signUpWithGoogle() async {
  debugPrint("Gotten here 10");

  try {
    // Trigger the Google Sign-In flow.
    //googleUser = await _googleSignIn.signIn();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    debugPrint("Gotten here 13");
    // Obtain the auth details from the request.
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    debugPrint("Gotten here 11");
    // Create a new credential.
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    debugPrint("Gotten here 12");

    // Sign up to Firebase with the Google credential.
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Access the authenticated user.
    currentUser = userCredential.user;

    if (currentUser != null) {
      // Save user data to Firestore.

      await saveUserDataToFirestore(currentUser!, googleUser!);
      await getUserDataFromFirestore(currentUser!.uid);
    }
  } catch (e) {
    debugPrint('Error signing up with Google: $e');
  }
}

// SIGN OUT FROM GOOGLE
Future<void> signOutFromGoogle() async {
  try {
    // Sign out from Google.
    await _googleSignIn.signOut();

    // Sign out from Firebase.
    await FirebaseAuth.instance.signOut();

    // Clear the user data.
    currentUser = null;
    // displayName = null;
    // userEmail = null;
    // photoUrl = null;
    // notifyListeners();
    // Perform any additional actions after logging out.
  } catch (e) {
    debugPrint('Error signing out: $e');
  }
}

Future<void> saveUserDataToFirestore(
    User user, GoogleSignInAccount googleUser) async {
  try {
    // ignore: unnecessary_null_comparison
    if (googleUser != null) {
      await FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
        'displayName': googleUser.displayName,
        // 'email': googleUser.email,
        // 'photoUrl': googleUser.photoUrl,
        // 'identity': 'user',
        // 'verificationMode': '',
        // 'contactPreference': '',
        // 'verificationImageURL': '',
        // 'phoneNo': ''
        // Add more fields as needed.
      });
    }
  } catch (e) {
    debugPrint('Error saving user data to Firestore: $e');
  }
}

Future<Map<String, dynamic>?> getUserDataFromFirestore(String uid) async {
  try {
    if (currentUser != null) {
      // Fetch user document from 'users' collection using UID
      final DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();

      if (snapshot.exists) {
        // Access user data from the document
        displayName = snapshot.get('displayName');
        // userEmail = snapshot.get('email');
        // photoUrl = snapshot.get('photoUrl');
        // identity = snapshot.get('identity');
        // verificationMode = snapshot.get('verificationMode');
        // contactPreference = snapshot.get('contactPreference');
        // verificationImageURL = snapshot.get('verificationImageURL');
        // phoneNo = snapshot.get('phoneNo');

        debugPrint('Display Name: $displayName');
        // debugPrint('Email: $userEmail');
        // debugPrint('photoUrl: $photoUrl');
        // debugPrint('identity: $identity');
      }
    }
  } catch (e) {
    debugPrint('Error retrieving user data from Firestore: $e');
    return null;
  }
  return null;
}
