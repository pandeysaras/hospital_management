import 'package:get_storage/get_storage.dart';

class UserPreference {

  UserPreference._();
  static GetStorage preferences = GetStorage();
  static const String userId = 'userid';
  static const String userRole = 'userRole';
  static const String accessToken = 'access_token';
  static const String pushToken = 'push_token';
  static const String userName = 'userName';
  static const String userEmail = 'userEmail';
  static const String emailVerifiedAt = 'email_verified_at';
  static const String emailVerify = 'email_verify';
  static const String userLoggedIn = 'user_logged_in';
  static const String urlDevelopment = 'is_development';
  static const String currentEnvironment  = 'current_environment';
  static const String currentEnvironmentRaw  = 'current_environment_raw';
  static const String versionNumber  = 'version_number';
  static const String buildNumber  = 'build_number ';

  ///---initialize User Storage get set---
  static Future initUserStorage() async {
    await GetStorage.init();
  }

  /// set/get setBuildNumber
  static void setBuildNumber(String value) {
    preferences.write(buildNumber, value);
  }

  static String getBuildNumber() {
    return preferences.read(buildNumber);
  }

  /// set/get version
  static void setVersionNumber(String value) {
    preferences.write(versionNumber, value);
  }

  static String getVersionNumber() {
    return preferences.read(versionNumber);
  }

  /// set/get user id
  static void setUserId(String value) {
    preferences.write(userId, value);
  }

  static String getUserId() {
    return preferences.read(userId);
  }

  static void setUserRole(String value) {
    preferences.write(userRole, value);
  }

  static String getUserRole() {
    return preferences.read(userRole);
  }
  /// set/get CurrentEnvironmentRaw
  static void setCurrentEnvironmentRaw(String value) {
    preferences.write(currentEnvironmentRaw, value);
  }

  static String getCurrentEnvironmentRaw() {
    return preferences.read(currentEnvironmentRaw);
  }

  /// set/get accessToken
  static void setAccessToken(String value) {
    preferences.write(accessToken, value);
  }

  static String getAccessToken() {
    return preferences.read(accessToken);
  }

  static void setPushToken(String value) {
    preferences.write(pushToken, value);
  }

  static String getPushToken() {
    return preferences.read(pushToken);
  }

  /// set/get userName
  static void setUserName(String value) {
    preferences.write(userName, value);
  }
  static String getUserName() {
    return preferences.read(userName);
  }

  /// set/get userEmail
  static void setUserEmail(String value) {
    preferences.write(userEmail, value);
  }
  static String getUserEmail() {
    return preferences.read(userEmail);
  }

  /// set/get userEmailBool
  static void setEmailVerify(bool value) {
    preferences.write(emailVerify, value);
  }

  static bool isEmailVerify() {
    return preferences.read(emailVerify);
  }

  /// set/get userEmail
  static void setEmailVerifiedAt(String value) {
    preferences.write(emailVerifiedAt, value);
  }

  static String getEmailVerified() {
    return preferences.read(emailVerifiedAt);
  }

  /// set/get userLoggedIn
  static void setUserLoggedIn(bool value) {
    preferences.write(userLoggedIn, value);
  }
  static bool getUserLoggedIn() {
    try {
      return preferences.read(userLoggedIn);
    }catch(e){
      return false;
    }
  }

  /// set/get isDevelopment
  static void setDevelopment(bool value) {
    preferences.write(urlDevelopment, value);
  }
  static bool isDevelopment() {
    return preferences.read(urlDevelopment);
  }

  /// set/get currentEnvironment
  static void setCurrentEnvironment (String value) {
    preferences.write(currentEnvironment , value);
  }
  static String getCurrentEnvironment () {
    return preferences.read(currentEnvironment );
  }

  /// Clear all our local storage
  static void clearValuesFromStorage() {
    preferences.erase();
  }
}