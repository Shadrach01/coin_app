class SignInState {
  final String email;
  final String pw;

  SignInState({
    this.email = '',
    this.pw = '',
  });

  SignInState copyWith({
    String? email,
    String? pw,
  }) {
    return SignInState(
      email: email ?? this.email,
      pw: pw ?? this.pw,
    );
  }
}
