class Signupfailure {
  final String message;

  const Signupfailure([this.message = "An unknown error occured."]);

  factory Signupfailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const Signupfailure('Please enter a strong password');
      case 'invalid-email':
        return const Signupfailure('Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const Signupfailure('An account already exist for that email');
      case 'operation not allowed':
        return const Signupfailure(
            'Operation is not allowed. Please contact support.');
      case 'user-diasbled':
        return const Signupfailure(
            'This user has been disabled. Please contact support.');
      default:
        return const Signupfailure();
    }
  }
}

class Signuprequire {
  final String message;

  const Signuprequire([this.message = 'All fields are required ']);
}

class Loginfailure {
  final String message;

  const Loginfailure([this.message = "An unknown error occured."]);

  factory Loginfailure.code(String code) {
    switch (code) {
      case 'wrong-password':
        return const Loginfailure('Please enter a correct password');
      case 'email not exist':
        return const Loginfailure('Please enter a correct email');
      case 'operation not allowed':
        return const Loginfailure(
            'Operation is not allowed. Please contact support.');
      case 'user-diasbled':
        return const Loginfailure(
            'This user has been disabled. Please contact support.');
      default:
        return const Loginfailure();
    }
  }
}

class TExceptions {
  final String message;

  const TExceptions([this.message = "An unknown error occured."]);

  factory TExceptions.code(String code) {
    switch (code) {
      case 'weak-password':
        return const TExceptions('Please enter a strong password');
      case 'invalid-email':
        return const TExceptions('Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const TExceptions('An account already exist for that email');
      case 'operation not allowed':
        return const TExceptions(
            'Operation is not allowed. Please contact support.');
      case 'user-diasbled':
        return const TExceptions(
            'This user has been disabled. Please contact support.');
      case 'too-many-requests':
        return const TExceptions(
            'Too may request, Service Temporarily blocked');
      case 'invalid-argument':
        return const TExceptions(
            'An invalid argument was provided to an Authentication method.');
      default:
        return const TExceptions();
    }
  }
}
