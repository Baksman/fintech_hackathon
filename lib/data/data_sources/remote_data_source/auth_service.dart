import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fintech_hackathon/core/error/auth_error/auth_exception.dart';
import "package:fintech_hackathon/data/model/user_model.dart";
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<UserModel> signUp(String email, String password);
  Future<UserModel> login(String email, String password);
  Future<void> forgotPassword(String email);
}

class AuthServiceImpl implements AuthService {
  final FirebaseAuth auth;
  final FirebaseFirestore firestoreInstance;
  static const USER_COLLECTION_PATH = "users";
  // FirebaseFirestore.instance.

  AuthServiceImpl({this.auth, this.firestoreInstance});
  @override
  Future<void> forgotPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw IncorrectDetailsException(e.message);
      }

      throw ServerException("");
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      final uuid = await user.getIdToken();
      UserModel userModel = UserModel(
        emailAddress: email,
        uuid: uuid,
      );
      return userModel;
      // firestoreInstance.collection("users").add({});
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw IncorrectDetailsException(e.message);
      }
      // though this wil  rearely happen in firehase;
      throw ServerException("");
    }
  }

  @override
  Future<UserModel> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      final uuid = await user.getIdToken();
      UserModel userModel = UserModel(
        emailAddress: email,
        uuid: uuid,
      );
      saveNewlyCreatedUsers(userModel: userModel, uuid: uuid);
      return userModel;
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw IncorrectDetailsException(e.message);
      }
      // though this wil  rearely happen in firehase;
      throw ServerException("");
    }
  }

  void saveNewlyCreatedUsers({String uuid, UserModel userModel}) {
    firestoreInstance
        .collection(USER_COLLECTION_PATH)
        .doc(uuid)
        .set((userModel.toMap()));
  }
}
// invalid-email:
// Thrown if the email address is not valid.
// user-disabled:
// Thrown if the user corresponding to the given email has been disabled.
// user-not-found:
// Thrown if there is no user corresponding to the given email.
// wrong-password:
// Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
