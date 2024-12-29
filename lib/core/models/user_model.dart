/*

USER MODEL
 */

class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? pin;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.pin,
  });

  // Convert to map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'pin': pin,
    };
  }

  // Receive as Json format and convert to UserModel format

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      pin: map['pin'],
    );
  }

  // Empty print able string
  static final empty =
      UserModel(name: '', uid: '', email: '', pin: '');

  @override
  String toString() {
    return 'UserModel{name: $name, uid: $uid, email: $email, pin: $pin}';
  }
}
