part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isPure;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isPure = true,
    this.username = const Username.pure(),
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isPure,
    Username? username,
    bool? isValid,
    Email? email,
    Password? password,
  }) => RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    isPure: isPure ?? this.isPure,
    username: username ?? this.username,
    isValid: isValid ?? this.isValid,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  List<Object> get props => [
    formStatus,
    isPure,
    isValid,
    username,
    email,
    password,
  ];
}
