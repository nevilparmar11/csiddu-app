import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:csiddu/SignUpPage.dart';

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

Future<String> signInWithGoogle() async {
  googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

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
      return '';
    }

    print("Succeded sign in");
    isSignedIn = true;
    return 'signInWithGoogle succeeded: $user';
  }
  print("Signing out because sign in failed, no account found");
  await googleSignIn.signOut();
  return 'signInWithGoogle failed';
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Sign Out");
  isSignedIn = false;
}
