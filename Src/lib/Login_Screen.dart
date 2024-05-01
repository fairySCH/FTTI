import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ossproj_comfyride/Style_Recommendation.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FTTI 로그인'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //수직 가운데 정렬
          children: [
            Center(
              child: Text(
                'FTTI 로그인',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // 구글 로그인 수행
                final UserCredential? userCredential = await signInWithGoogle();
                // Firestore에 사용자 추가
                await addUser(userCredential!);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StyleRecommendation()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 30,
                    height: 50,
                    child: Image.asset(
                      'assets/google.png',
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Google 로그인',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<UserCredential?> signInWithGoogle() async {
  try {
    // Trigger the authentication flow (구글 로그인 요청)
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      print('Google 로그인이 취소되었습니다.');
      return null;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in with Firebase
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Get the Firebase UID
    final String uid = userCredential.user?.uid ?? "UID not available";

    // Print the Firebase UID to the console
    print('Firebase UID: $uid');

    // Return the UserCredential
    return userCredential;
  } catch (e) {
    print('error: $e');
    return null;
  }
}

Future<void> addUser(UserCredential userCredential) async {
  try {
    // Get the Firebase UID
    final String uid = userCredential.user?.uid ?? "UID not available";

    // UID를 문서 ID로 설정하여 문서 생성
    final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);

    // Firestore 문서에 저장할 user Data
    final userData = {
      'uid': uid,
    };

    // Firestore 문서에 사용자 데이터를 설정
    await userDocRef.set(userData);

    print('sucess add user id!');
  } catch (e) {
    print('error: $e');
  }
}
