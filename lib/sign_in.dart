import 'package:csiddu/CrudServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:csiddu/Models/UserModel.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

GoogleSignInAccount googleSignInAccount;
String name;
String email;
String imageUrl;
bool isSignedIn = false;
bool firstTime = false;
bool hasFilledDetails = false;
bool hasEnteredPhone = false;
bool isSpecialCase = false;

Future<String> signInWithGoogle() async {
  try {
    googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoUrl != null);

      if (user.email != null && user.displayName != null) isSignedIn = true;

      print(user.email + " trying to access");

      name = user.displayName;
      if (name.contains(" ")) {
        name = name.substring(0, name.indexOf(" "));
      }
      email = user.email;
      imageUrl = user.photoUrl;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      if (authResult.additionalUserInfo.isNewUser) {
        //User logging in for the first time
        // Redirect user to signUpPage
        print('User is logging in for the first time');
        firstTime = true;
        isSignedIn = true;
        return 'firsttime';
      }

      CrudMethodsUsers crudMethodsUsers = new CrudMethodsUsers();
      await crudMethodsUsers.initializeUserModel();
      if (User.phoneNo != "#" && User.phoneNo != null) {
        hasEnteredPhone = true;
        if (User.branch != null) hasFilledDetails = true;
      }
      if ((User.phoneNo == "#" || User.phoneNo == null) && User.branch != null)
        isSpecialCase = true;
      print("Succeded sign in");
      isSignedIn = true;
      return 'succeeded';
    }
    print("Signing out because sign in failed, no account found");
    await googleSignIn.signOut();
    return 'failed';
  } catch (error) {
    print("error caught");

    print(error);
  }
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Sign Out");
  isSignedIn = false;
}
