import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        isPure: false,
        username: Username.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([state.username, state.password, state.email]),
      ),
    );
  }

  void usernameChanged(String value) {
    final username = !state.isPure
        ? Username.dirty(value)
        : const Username.pure();

    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password, state.email]),
      ),
    );
  }

  void emailChanged(String value) {
    final email = !state.isPure ? Email.dirty(value) : const Email.pure();
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([state.username, state.password, email]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = !state.isPure
        ? Password.dirty(value)
        : const Password.pure();
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username, state.email]),
      ),
    );
  }
}
