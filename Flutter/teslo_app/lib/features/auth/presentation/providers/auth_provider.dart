import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/auth/domain/domain.dart';
import 'package:teslo_app/features/auth/infrastructure/infrastructure.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) => AuthState(
    authStatus: authStatus ?? this.authStatus,
    user: user ?? this.user,
    errorMessage: errorMessage ?? this.errorMessage,
  );
}

class AuthNotifier extends Notifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({required this.authRepository});

  @override
  AuthState build() => AuthState();

  void loginUser(String email, String password) async {
    final user = await authRepository.login(email, password);
    state = state.copyWith(user: user, authStatus: AuthStatus.authenticated);
  }

  void registerUser(String email, String password) async {}
  void checkAuthStatus() async {}
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  final authRepository = AuthRepositoryImpl();
  return AuthNotifier(authRepository: authRepository);
});
