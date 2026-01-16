// ! 1 - State del provider

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_app/features/auth/presentation/providers/providers.dart';
import 'package:teslo_app/features/shared/shared.dart';

class LoginFormState {
  final bool isFormPosted;
  final bool isPosting;
  final bool isValid;
  final Email email;
  final Password password;

  LoginFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  LoginFormState copyWith({
    bool? isFormPosted,
    bool? isPosting,
    bool? isValid,
    Email? email,
    Password? password,
  }) => LoginFormState(
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isPosting: isPosting ?? this.isPosting,
    isValid: isValid ?? this.isValid,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  String toString() {
    return ''' 
    LoginFormState:
      isPosting: $isPosting
      isFormPosted: $isFormPosted
      isValid: $isValid
      email: $email
      password: $password
    ''';
  }
}

// ! 2 - Implementar notifier
class LoginFormNotifier extends Notifier<LoginFormState> {
  late Function(String, String) loginUserCallBack;

  @override
  LoginFormState build() {
    loginUserCallBack = ref.watch(authProvider.notifier).loginUser;
    return LoginFormState();
  }

  void onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password]),
    );
  }

  void onPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([state.email, newPassword]),
    );
  }

  Future<void> onSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    await loginUserCallBack(state.email.value, state.password.value);
  }

  void _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
      isFormPosted: true,
      email: email,
      password: password,
      isValid: Formz.validate([email, password]),
    );
  }
}

// ! 3 - NotifierProvider - Para consumir
final loginFormProvider =
    NotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>(
      LoginFormNotifier.new,
    );
