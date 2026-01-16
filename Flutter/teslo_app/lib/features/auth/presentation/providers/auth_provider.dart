import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/auth/domain/domain.dart';
import 'package:teslo_app/features/auth/infrastructure/infrastructure.dart';
import 'package:teslo_app/features/shared/infrastructure/services/key_value_storage_service.dart';
import 'package:teslo_app/features/shared/infrastructure/services/key_value_storage_service_impl.dart';

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
  final KeyValueStorageService keyValueStorageService;

  AuthNotifier({
    required this.authRepository,
    required this.keyValueStorageService,
  });

  @override
  AuthState build() => AuthState();

  Future<void> loginUser(String email, String password) async {
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no controlado');
    }
  }

  Future<void> registerUser(String email, String password) async {}
  Future<void> checkAuthStatus() async {}

  void _setLoggedUser(User user) async {
    await keyValueStorageService.setKeyValue('token', user.token);
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  Future<void> logout(String? errorMessage) async {
    await keyValueStorageService.removeKey('token');
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      errorMessage: errorMessage,
      user: null,
    );
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier(
    authRepository: AuthRepositoryImpl(),
    keyValueStorageService: KeyValueStorageServiceImpl(),
  );
});
