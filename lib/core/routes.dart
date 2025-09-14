/// Route paths for the Syncc app
/// Contains all route strings as constants for easy management
class AppRoutes {
  // Private constructor to prevent instantiation
  AppRoutes._();

  // Root routes
  static const String root = '/';
  static const String splash = '/splash';

  static String userProfilePath(String id) => '/user/$id';
}
