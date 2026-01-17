import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/auth/presentation/providers/auth_provider.dart';

class GoRouterNotifier extends ChangeNotifier {
  AuthStatus _authStatus = AuthStatus.checking;

  AuthStatus get authStatus => _authStatus;

  void setAuthStatus(AuthStatus value) {
    if (_authStatus == value) return;
    _authStatus = value;
    notifyListeners();
  }
}

final goRouterNotifierProvider =
    Provider<GoRouterNotifier>((ref) {
  final notifier = GoRouterNotifier();

  ref.listen<AuthState>(authProvider, (prev, next) {
    notifier.setAuthStatus(next.authStatus);
  });

  return notifier;
});