import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class CalmMindAuthUser {
  CalmMindAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<CalmMindAuthUser> calmMindAuthUserSubject =
    BehaviorSubject.seeded(CalmMindAuthUser(loggedIn: false));
Stream<CalmMindAuthUser> calmMindAuthUserStream() => calmMindAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
