import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/helper/cache_helper.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({required this.authenticationRepository})
      : super(const AuthenticationState(
            smsCode: '',
            countryCode: '+962',
            phoneNumber: '',
            status: SignInStatus.init,
            errorMessage: '',
            verificationID: ''));
  AuthenticationRepository authenticationRepository;
  static AuthenticationCubit get (context)=>BlocProvider.of(context);
  void updatePhoneNumber({required String phoneNumber}){
    emit(state.copyWith(phoneNumber: phoneNumber));
  }
  getAuthUser() {
    emit(state.copyWith(status: SignInStatus.otpReceive));
    String phoneTxt = (state.countryCode + state.phoneNumber);
    authenticationRepository
        .sendOtp(
          phoneNumber: phoneTxt,
          autoRetrievalTimeout: autoRetrievalTimeout,
          phoneCodeSent: phoneCodeSent,
          phoneVerificationCompleted: phoneVerificationCompleted,
          phoneVerificationFailed: phoneVerificationFailed,
          timeOut: const Duration(seconds: 60),
        )
        .then((value) {});
  }
  Future<void> verifyPhoneNumber() async {
    emit(state.copyWith(status: SignInStatus.loading));
    debugPrint('=======================');
    debugPrint(state.verificationID);
    try {
      User? user = await authenticationRepository.verifyPhoneNumber(
        verificationId: state.verificationID,
        smsCode: state.smsCode,
      );

      if (user != null) {

      }
    } catch (e) {
      print('3333333333333333 $e');
     // errorFirebaseExceptionSmsCode(exception: e as FirebaseException);
    }
  }




  Future<void> phoneVerificationCompleted(AuthCredential credential) async {
    try {
      User? user =
          await authenticationRepository.signInWithCredential(credential);

      if (user != null) {}
    } catch (e) {
      emit(state.copyWith(
        status: SignInStatus.error,
        errorMessage: 'error',
      ));
    }
  }

  void phoneVerificationFailed(FirebaseAuthException exception) {
    print('exception  $exception');
    //errorFirebaseExceptionPhoneNumber(exception: exception);
  }

  void phoneCodeSent(String verificationId, int? forceResendToken) {
    print('verificationId  $verificationId');
    CacheHelper.saveData(key: 'token_phone', value: verificationId);
    emit(state.copyWith(verificationID: verificationId));
  }

  void autoRetrievalTimeout(String verificationId) {
    CacheHelper.saveData(key: 'token_phone', value: verificationId);
    emit(
      state.copyWith(
        verificationID: verificationId,
      ),
    );
  }
  errorFirebaseExceptionSmsCode({required FirebaseException exception}) {
    switch (exception.code) {
      case 'invalid-verification-code':
        emit(state.copyWith(
            status: SignInStatus.error, errorMessage: 'الكود غير صحيح'));
        break;
      case 'session-expired':
        emit(state.copyWith(
            status: SignInStatus.error,
            errorMessage: 'انتهت صلاحية الكود يجب اعادة ارسال الكود'));
        break;
      case 'invalid-verification-id':
        emit(state.copyWith(
            status: SignInStatus.error, errorMessage: 'فشل التحقق'));
    }
  }


}
