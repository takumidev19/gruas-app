class AppConstants {
  // Firebase Collections
  static const String usersCollection = 'users';
  static const String servicesCollection = 'services';
  static const String requestsCollection = 'requests';
  
  // Storage Paths
  static const String userImagesPath = 'user_images';
  static const String serviceImagesPath = 'service_images';
  
  // Shared Preferences Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  
  // API Endpoints
  static const String baseUrl = 'https://api.gruas.com';
  
  // Timeouts
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
} 