import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

import 'all.dart';

Future<void> addTestSubscriptionsToFirestore(FakeFirebaseFirestore firestore,
    [int length = 10]) async {
  await Future.wait([
    for (final json in generateTestSubscriptionJsonList(length))
      firestore
          .collection('users')
          .doc(testUserId)
          .collection('subscriptions')
          .doc(json['text'])
          .set(json),
  ]);
}

Future<void> addTestSavedNewsToFirestore(FakeFirebaseFirestore firestore,
    [int length = 10]) async {
  await Future.wait([
    for (final json in generateTestPieceJsonList(true, length))
      firestore
          .collection('users')
          .doc(testUserId)
          .collection('saved_news')
          .doc(json['id'])
          .set(json),
  ]);
}

Future<void> addTestPieceToHistory(
    FakeFirebaseFirestore firestore, int index, bool isSaved) async {
  await firestore
      .collection('users')
      .doc(testUserId)
      .collection('history')
      .doc(index.toString())
      .set(generateTestPieceJson(index, isSaved));
}

Future<void> addTestSubscription(
    FakeFirebaseFirestore firestore, String text) async {
  final encodedText = Uri.encodeComponent(text);
  await firestore
      .collection('users')
      .doc(testUserId)
      .collection('subscriptions')
      .doc(encodedText)
      .set({
    'text': encodedText,
    'locale': 'en_US',
    'isSubscribed': true,
    'subscriptionDate': DateTime(2000, 1, 1).toIso8601String(),
  });
}
