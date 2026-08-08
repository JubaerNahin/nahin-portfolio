

class AppConstants {
  static const String appName = 'ServiPro';
  static const double appVersion = 1.0;
  // static const AppMode appMode = AppMode.release;
  static const String fontFamily = 'Exo';
  static const String baseUrl = 'https://tapeitbackend.thesyndicates.team';


  /// auth
  static const String signIn = '/api/v1/login';
  static const String signUp = '/api/v1/sign-up';
  static const String signUpOtp = '/api/v1/verify/otp';
  static const String forgotPass = '/api/v1/forgot-password';
  static const String forgotPassOtp = '/api/v1/forgot-password/verifyOtp';
  static const String resetPass = '/api/v1/reset-password';
  static const String changePassword = '/api/v1/auth/change-password';
  static const String switchProfile = '/api/v1/auth/switch-profile';

  ///support
  static const String supportCards = '/api/v1/support-ticket';
  static const String supportCardDetail = '/api/v1/support-ticket/';
  static const String sendSupportMessage = '/api/v1/support-ticket/';
  /// faq
  static const String contractorFaq = '/api/v1/support-center/faq';
  static const String customerFaq = '/api/v1/support-center/customer-faq';
  static const String getNotification = '/api/v1/notifications';


  /// user
  static const String getHomeCategories = '/api/v1/service/categories';
  static const String categoryWiseServices = '/api/v1/service/all-services?parent_id=';
  static const String placeOrder = '/api/v1/orders/order';
  static const String getOrders = '/api/v1/orders/order?status=';
  static const String getBidderList = '/api/v1/bidding/bid?order_id=';
  static const String getBudgetAcceptList = '/api/v1/bidding/view-budget-accepted?order_id=';
  static const String orderDetails = '/api/v1/orders/order/';
  static const String showOthersProfile = '/api/v1/bidding/bid/';
  static const String idWiseProfileDetails = '/api/v1/orders/view-profile';
  //static const String confirmOrder = '/api/v1/bidding/confirm-order-customer';
  static const String confirmOrder = '/api/v1/payment';
  static const String promotedPackages = '/api/v1/promoted-packages';
  static const String promote = '/api/v1/promoted-packages/store';

  /// contractor
  static const String suggestedOrder = '/api/v1/orders/view-suggested-orders';
  static const String promotedOrders = '/api/v1/orders/view-promoted-orders';
  static const String browseServices = '/api/v1/orders/contractor-orders';
  static const String serviceDetails = '/api/v1/orders/contractor-order-show/';
  static const String addBid = '/api/v1/bidding/bid';
  static const String editBid = '/api/v1/bidding/bid/';
  static const String acceptBudget = '/api/v1/bidding/accept-budget';
  static const String customerProfileInfo = '/api/v1/bidding/show-customer-info/';
  static const String getAllSkill = '/api/v1/service/all-services';
  static const String addSkill = '/api/v1/skillset/skill';

  static const String getWallet = '/api/v1/wallet';
  static const String getStripeDashboard = '/api/v1/account/dashboard';
  static const String connectAccount = '/api/v1/stripe/account/connection';
  static const String withdraw = '/api/v1/withdraw';

  /// chat =================
  static const String conversationList = '/api/v1/conversations';
  static const String conversationDetail = '/api/v1/conversations/'; // passing id from repo
  static const String sendMessage = '/api/v1/messages';
  static const String sendCustomOffer = '/api/v1/orders/send-offer';
  static const String acceptRejectCancelCustomOffer = '/api/v1/orders/accept-offer';
  static const String sendReview = '/api/v1/ratings/rating';

  /// profile
  static const String getProfile = '/api/v1/auth/profile';
  static const String kycUpload = '/api/v1/kyc/id-upload';

  // Shared Key
  static const String token = 'token';
  static const String profileType = 'profile_type';
  static const String isLogIn = 'is_login';
  static const String userId = 'userId';
  static const String langSkip = 'lang_skip';
  static const String guestId = 'guest_id';
  static const String kKeyIsFirstTime = "firstTime";
  static const String kKeyDeviceID = "kDeviceId";
  static const String kKeyFCMToken = "kFcm";
  static const String kKeyLocation = "KLocation";



}