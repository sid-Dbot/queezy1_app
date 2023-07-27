import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AWSauthRepo {
  Future<String> getUser() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      return user.userId;
    } catch (e) {
      print(e);
      return 'not signed in';
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await Amplify.Auth.signIn(username: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signUp(String email, String password, String userName) async {
    try {
      final userAttributes = {AuthUserAttributeKey.email: email};
      await Amplify.Auth.signUp(
          username: userName,
          password: password,
          options: SignUpOptions(userAttributes: userAttributes));
    } on Exception {
      rethrow;
    }
  }
}

// Future<void> signUpUser({
//   required String username,
//   required String password,
//   required String email,
// }) async {
//   try {
//     final userAttributes = {
//       AuthUserAttributeKey.email: email,
//     };
//     final result = await Amplify.Auth.signUp(
//       username: username,
//       password: password,
//       options: SignUpOptions(
//         userAttributes: userAttributes,
//       ),
//     );
//     await _handleSignUpResult(result);
//   } on AuthException catch (e) {
//     safePrint('Error signing up user: ${e.message}');
//   }
// }

// Future<void> _handleSignUpResult(SignUpResult result) async {
//   switch (result.nextStep.signUpStep) {
//     case AuthSignUpStep.confirmSignUp:
//       final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
//       _handleCodeDelivery(codeDeliveryDetails);
//       break;
//     case AuthSignUpStep.done:
//       safePrint('Sign up is complete');
//       break;
//   }
// }

// void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
//   safePrint(
//     'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
//     'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
//   );
// }
