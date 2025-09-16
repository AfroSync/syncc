/// Route paths for the Syncc app
/// Contains all route strings as constants for easy management
class ModernRoutes {
  // Private constructor to prevent instantiation
  ModernRoutes._();

  // Root routes
  static const String root = '/';

  static const String authChoice = '/auth-choice';
  static const String artistSignupScreen = '/signup/artist';
  static const String producerSignupScreen = '/signup/film-producer';

  static String verificationScreen(String code) =>
      '/signup/verification/:$code';

  // Main app routes
  static const String home = '/home';
}
