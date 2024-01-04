import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:template/core/constants/app_constants.dart';
import 'package:template/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/core_services.dart';
import '../controller/authentication_controller.dart';

// ignore: must_be_immutable
class AmplifyAuthUIScreen extends GetView<AuthenticationController> {
  AmplifyAuthUIScreen({super.key});

  final GlobalKey<FormFieldState> formKey = GlobalKey();
  int authFunctionCallCount = 0;

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      dialCodeOptions: const DialCodeOptions(defaultDialCode: DialCode.in1),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CoreService.getAppTheme(authenticationTheme: true),
        builder: Authenticator.builder(),
        home: Scaffold(
          body: FutureBuilder(
            future: Amplify.Auth.getCurrentUser(),
            builder: (context, snapshot) {
              //authFuncCallCount prevents concurrent call
              if (snapshot.data == null && authFunctionCallCount == 0) {
                authFunctionCallCount += 1;
                controller.validateUser();
              }
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// A widget that displays a logo, a body, and an optional footer.
class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.state,
    required this.body,
    this.footer,
  });

  final AuthenticatorState state;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppStyle.normalPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Image.asset(Constants.assets.authIllustration)),
                SizedBox(height: AppStyle.largePadding),
                Container(
                  constraints: BoxConstraints(maxWidth: Get.width),
                  child: body,
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: footer != null ? [footer!] : null,
    );
  }
}

Widget? getAuthenticatorBody({required AuthenticatorState state}) {
  if (state.currentStep == AuthenticatorStep.signIn) {
    return CustomScaffold(
      state: state,
      body: SignInForm(),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Don\'t have an account?'),
          TextButton(
            onPressed: () => state.changeStep(AuthenticatorStep.signUp),
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  } else if (state.currentStep == AuthenticatorStep.signUp) {
    return CustomScaffold(
      state: state,
      body: SignUpForm(),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Already have an account?'),
          TextButton(
            onPressed: () => state.changeStep(AuthenticatorStep.signIn),
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  } else if (state.currentStep == AuthenticatorStep.confirmSignUp) {
    return CustomScaffold(
      state: state,
      body: ConfirmSignUpForm(),
    );
  } else if (state.currentStep == AuthenticatorStep.resetPassword) {
    return CustomScaffold(
      state: state,
      body: ResetPasswordForm(),
    );
  } else if (state.currentStep == AuthenticatorStep.confirmResetPassword) {
    return CustomScaffold(
      state: state,
      body: const ConfirmResetPasswordForm(),
    );
  } else {
    return null;
  }
}
