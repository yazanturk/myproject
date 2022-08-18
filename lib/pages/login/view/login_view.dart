import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/business_logic/authentication/authentication_cubit.dart';
import 'package:myproject/pages/login/widget/widget.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(
          authenticationRepository: AuthenticationRepository()),
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AuthenticationCubit.get(context);
          return SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: CustomTextFormFailed(
                          enable: true,
                          onChanged: (value) {
                            cubit.updatePhoneNumber(phoneNumber: value);
                          },
                        prefixIcon: const Text('+962'),
                        paddingH: 20,

                      ),
                    )),
                TextButton(onPressed: (){
                  cubit.getAuthUser();
                }, child: const Text('Login'))
              ],
            ),
          );
        },
      ),
    );
  }
}
