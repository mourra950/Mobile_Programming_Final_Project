import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> togglePending(String tripId, String newItem) async {
  var message = "";
  await FirebaseFirestore.instance
      .collection('Trips')
      .doc(tripId)
      .get()
      .then((DocumentSnapshot documentSnapshot) async {
    if (documentSnapshot.exists) {
      final t = documentSnapshot.data() as Map<String, dynamic>;
      List<dynamic> pendingArray = t['pending'] ?? [];

      if (pendingArray.contains(newItem)) {
        removePending(tripId, newItem);
        message = "removed";
      } else {
        addPending(tripId, newItem);
        message = "added";
      }
    } else {
      print('Document does not exist');
      message = "dah";
    }
  }).catchError((error) {
    print('Error getting document: $error');
  });
  return message;
}

void addPending(String tripId, String newItem) async {
  await FirebaseFirestore.instance.collection('Trips').doc(tripId).update({
    'pending': FieldValue.arrayUnion([newItem]),
  }).then((_) {
    print('added');
  }).catchError((error) {
    print('Error updating document: $error');
  });
}

void removePending(String tripId, String itemToRemove) async {
  await FirebaseFirestore.instance.collection('Trips').doc(tripId).update({
    'pending': FieldValue.arrayRemove([itemToRemove]),
  }).then((_) {
    print('Item successfully removed from the "pending" array!');
  }).catchError((error) {
    print('Error updating document: $error');
  });
}
