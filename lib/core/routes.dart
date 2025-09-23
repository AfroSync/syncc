/// Route paths for the Syncc app
/// Contains all route strings as constants for easy management
class ModernRoutes {
  // Private constructor to prevent instantiation
  ModernRoutes._();

  // Root routes
  static const String root = '/';

  static const String authChoice = '/auth-choice';
  static const String login = '/login';
  static const String artistSignupScreen = '/signup/artist';
  static const String producerSignupScreen = '/signup/film-producer';

  static String verificationScreen(String code) =>
      '/signup/verification/:$code';

  // Main app routes
  static const String home = '/home';

  // Nested routes for home tabs
  static const String profile = '$home/profile';
  static const String catalog = '$home/catalog';
  static const String license = '$home/license';
  static const String search = '$home/search';

  // License contract route
  static String licenseContract(String trackId) => '/license/contract/$trackId';

  // License payment route
  static String licensePayment(String licenseId) =>
      '/license/payment/$licenseId';

  // Create track route
  static const String createTrack = '/create/track';
}
