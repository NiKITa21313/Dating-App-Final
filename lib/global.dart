import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

String currentUserID = FirebaseAuth.instance.currentUser!.uid;