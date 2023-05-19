class signupfailure {
  final String message;

  const signupfailure([this.message = "An unknown error occured."]);

  factory signupfailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const signupfailure('Please enter a strong password');
      case 'invalid-email':
        return const signupfailure('Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const signupfailure('An account already exist for that email');
      case 'operation not allowed':
        return const signupfailure(
            'Operation is not allowed. Please contact support.');
      case 'user-diasbled':
        return const signupfailure(
            'This user has been disabled. Please contact support.');
      default:
        return const signupfailure();
    }
  }
}
