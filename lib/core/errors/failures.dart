import 'package:dartz/dartz.dart';

abstract class Failure {
  String message;

  Failure({required this.message});

  void showMessage() {
    // use toast
  }
}

class OfflineFailure extends Failure {
  OfflineFailure() : super(message: '');
}

class ServerFailure extends Failure {
  ServerFailure() : super(message: '');
}

class UndefinedFailure extends Failure {
  UndefinedFailure() : super(message: '');
}

// ==================== auth ===========================
class LoginFailure extends Failure {
  LoginFailure() : super(message: '');
}

class RegisterFailure extends Failure {
  RegisterFailure() : super(message: '');
}

class DisconnectedFailure extends Failure {
  DisconnectedFailure() : super(message: '');
}

// ==================== category ===========================
class GetCategoriesFailure extends Failure {
  GetCategoriesFailure() : super(message: '');
}

// ==================== location ===========================
class DisabledLocationFailure extends Failure {
  DisabledLocationFailure() : super(message: '');
}

class PermissionsDeniedFailure extends Failure {
  PermissionsDeniedFailure() : super(message: '');
}

class PermissionsDeniedForeverFailure extends Failure {
  PermissionsDeniedForeverFailure() : super(message: '');
}
