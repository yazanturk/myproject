part of 'authentication_cubit.dart';

enum SignInStatus { init, success, loading, error, otpReceive, unAuth }

class AuthenticationState extends Equatable {
  const AuthenticationState(
      {required this.countryCode,
      required this.phoneNumber,
      required this.smsCode,
      required this.status,
      required this.verificationID,
      required this.errorMessage});
  final SignInStatus status;
  final String phoneNumber;
  final String smsCode;
  final String countryCode;
  final String errorMessage;
  final String verificationID;

  @override
  List<Object> get props =>
      [phoneNumber, smsCode, countryCode, status, errorMessage,verificationID];
  AuthenticationState copyWith({
    String? phoneNumber,
    String? smsCode,
    String? countryCode,
    String? verificationID,
    SignInStatus? status,
    String? errorMessage,
  }) {
    return AuthenticationState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        countryCode: countryCode ?? this.countryCode,
        smsCode: smsCode ?? this.smsCode,
        status: status ?? this.status,
        verificationID: verificationID??this.verificationID,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
