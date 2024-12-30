class SignUpState {
  final String email;
  final String password;
  final String pin;
  final String uiPin; // What will be displayed in the UI

  SignUpState({
    this.email = '',
    this.password = '',
    this.pin = '',
    this.uiPin = '',
  });

  SignUpState copyWith({
    String? email,
    String? password,
    String? pin,
    String? uiPin,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      pin: pin ?? this.pin,
      uiPin: uiPin ?? this.uiPin,
    );
  }
}
