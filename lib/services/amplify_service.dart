import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:template/amplifyconfiguration.dart';

class AmplifyService {
  static Future<void> configureAmplify() async {
    final authPlugin = AmplifyAuthCognito();
    final amplifyStorageS3 = AmplifyStorageS3();
    await Amplify.addPlugin(authPlugin);
    await Amplify.addPlugin(amplifyStorageS3);
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint("Tried to reconfigure Amplify");
    }
  }
}
