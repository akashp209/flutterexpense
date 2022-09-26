import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';
import './post.dart';

// ...

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );

final DatabaseReference = FirebaseDatabase.instance.ref();

// DatabaseReference savePost(Post post) {
//   var id = DatabaseReference.child('transactions/').push();
//   id.set({value})
// }

