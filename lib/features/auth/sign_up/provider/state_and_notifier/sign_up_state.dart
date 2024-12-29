class SignUpState {
  final String email;
  final String password;
  final String pin;

  SignUpState({
    this.email = '',
    this.password = '',
    this.pin = '',
  });

  SignUpState copyWith({
    String? email,
    String? password,
    String? pin,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      pin: pin ?? this.pin,
    );
  }
}
