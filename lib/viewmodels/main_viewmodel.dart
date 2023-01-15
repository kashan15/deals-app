
import 'dart:io';

import 'package:deals_app/utils/color_utils.dart';
import 'package:deals_app/utils/common_functions.dart';
import 'package:deals_app/utils/constants.dart';
import 'package:deals_app/utils/extensions.dart';
import 'package:deals_app/utils/font_utils.dart';
import 'package:deals_app/utils/image_utils.dart';
import 'package:deals_app/viewmodels/vendor_auth_viewmodel.dart';
import 'package:deals_app/views/forgetpass.dart';
import 'package:deals_app/views/login.dart';
import 'package:deals_app/views/main_views/main_views.dart';
import 'package:deals_app/views/verification.dart';
import 'package:deals_app/widgets/operator_select_widget.dart';
import 'package:dio/dio.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart' as stacked;
import 'package:stacked/stacked.dart';
import '../app/locator.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:deals_app/modules/allServices/navigation_service.dart'
as my_nav_service;

class MainViewModel extends BaseViewModel {
  var navigationService = my_nav_service.NavigationService();
  late SharedPreferences prefs;
  var dio = Dio();

  String? phoneNo;
  String? country_code;
  String? loginCountryCode;
  dynamic openingTimeFrom;

  bool dateSelected = false;
  var selectedcountry;
  var selectedcountry1;

  DateTime selectedDOB = DateTime.now();
  DateTime editProfileSelectedDOB = DateTime.now();
  DateTime selectedDate = DateTime.now();

  TextEditingController loginPhoneController =
  TextEditingController(text: '1234567891234');

  TextEditingController signupPhoneController = TextEditingController();
  TextEditingController signupCountryCode = TextEditingController();

  // TextEditingController selectedcountry1 = TextEditingController();
  TextEditingController loginPhoneController1 = TextEditingController();

  TextEditingController completeLoginPhoneNumber = TextEditingController();

  VendorAuthViewModel vendorAuthViewModel = locator<VendorAuthViewModel>();

  void showErrorMessage(BuildContext context, String error) async {
    ScaffoldMessenger.of(stacked.StackedService.navigatorKey!.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ColorUtils.white,
          fontFamily: FontUtils.PoppinsSemibold,
          fontSize: 1.8.t,
        ),
      ),
      backgroundColor: ColorUtils.pink,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      elevation: 10,
      duration: Duration(seconds: 1),
    ));
  }

//////////////////////////////////////////////////Deals App start//////////////////////////////////////////////
//////////////////////////////////////////////////forget password start //////////////////////////////////////////////
  TextEditingController verificationOtpController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController resetEmailAddressController = TextEditingController();
  TextEditingController resetEmailController = TextEditingController();
  TextEditingController resetpasswordcontroller = TextEditingController();
  TextEditingController resetConfirmPasswordController =
  TextEditingController();

  // void resetPasswordEmailValidation(BuildContext context) {
  //   if (resetEmailController.text.isEmpty) {
  //     showErrorMessage(context, 'Please Enter email');
  //   } else if (!resetEmailController.text.isEmail) {
  //     showErrorMessage(context, 'Invalid Email Format');
  //   } else {
  //     navigationService.navigateTo(to: Verification());
  //   }
  // }

  /// Scrolling to end
  ScrollController myController = ScrollController();


  /// chatScreen
  final chatController = TextEditingController();
  bool emojiShowing = false;
  bool emojiSelected = false;
  final scrollController = ScrollController();
  String? chatPic;

//   void resetPasswordValidationBackToLogin(BuildContext context) {
//     if (resetPasswordController.text.isEmpty) {
//       void resetPasswordEmailValidationBackToLogin(BuildContext context) {
//         if (resetEmailController.text.isEmpty) {
//           showErrorMessage(context, 'Please Enter Email');
//         } else if (!resetEmailController.text.isEmail) {
//           showErrorMessage(context, 'Invalid Email Format');
//         } else {
//           navigationService.navigateTo(to: Login());
//         }
//       }
//
//
//
//
// ////////////////////////////////////////////////// Votings Screen end //////////////////////////////////////////////
//
// //////////////////////////////////////////////////Deals App end//////////////////////////////////////////////
//
//     }
//   }


  void resetPasswordValidationBackToLogin(BuildContext context) {
    if (resetEmailController.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Email');
    } else if (!resetEmailController.text.isEmail) {
      showErrorMessage(context, 'Invalid Email Format');
    } else {
      navigationService.navigateTo(to: ForgetPassword());
    }
  }

  void resetPasswordValidationBackToLoginOne(BuildContext context) {
    if (resetPasswordController.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Password');
    } else if (resetPasswordController.text.length <= 8) {
      showErrorMessage(context, 'Password length should be greater than 8');
    } else if (resetPasswordController.text != resetConfirmPasswordController.text ) {
      showErrorMessage(context, 'Password dont match');
    }
    else {
      navigationService.navigateTo(to: Login());
    }
  }

  void openAndSelectDob(BuildContext context) async {
    selectedDOB =
    await CommonFunctions.showDateOfBirthPicker(context, selectedDOB);
    editProfileSelectedDOB = selectedDOB;
    notifyListeners();
  }

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: ColorUtils.gradientcolor2, // <-- SEE HERE
                onPrimary: ColorUtils.white, // <-- SEE HERE
                // onSurface: ColorUtils.redColorExpiresIn,
                onSurface: ColorUtils.black, // <-- SEE HERE

              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: ColorUtils.gradientcolor2, // button text color
                ),
              ),
            ),
            child: child!,
          );
        });
    if (picked != null && picked != selectedDate) selectedDate = picked;
    notifyListeners();
  }

  void resetPasswordPasswordValidation(BuildContext context) {
    if (resetpasswordcontroller.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Password');
    } else if (resetPasswordController.text !=
        resetConfirmPasswordController.text) {
      showErrorMessage(context, 'Passwords Do Not Match');
    } else {
      navigationService.navigateTo(to: Login());
    }
  }

  onEmojiSelected(Emoji emoji) {
    chatController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: chatController.text.length));
  }

  onBackspacePressed() {
    chatController
      ..text = chatController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: chatController.text.length));
  }

//////////////////////////////////////////////////forget password end //////////////////////////////////////////////

//////////////////////////////////////////////////Onboarding start //////////////////////////////////////////////
  List Onboarding_images = [
    {
      "image": ImageUtils.onboardimage1,
    },
    {
      "image": ImageUtils.onboardimage2,
    },
    {
      "image": ImageUtils.onboardimage3,
    }
  ];

  List friendsProfile = [
    {'type': 'Friends', 'count': '501', 'icon': ImageUtils.Friends},
    {
      'type': 'Rewards',
      'count': '168',
      'icon': ImageUtils.Rewards,
    },
    {'type': 'Check-ins', 'count': '200', 'icon': ImageUtils.Check_in},
    {'type': 'Favourites', 'count': '150', 'icon': ImageUtils.Favorites},
    {'type': 'Saved Offers', 'count': '150', 'icon': ImageUtils.OfferIcon},
    {'type': 'Reviews', 'count': '22', 'icon': ImageUtils.ReviewsIcon},
    {'type': 'My Bookings', 'count': '31', 'icon': ImageUtils.BookingIcon},
    {'type': 'My Votings', 'count': '26', 'icon': ImageUtils.VotingIcon},

  ];

  List chatMessagesList = [
    {'id': 0, 'type': 0, 'content': 'Hello', 'dateTime': 'wed, 20:32'},
    {'id': 0, 'type': 0, 'content': 'Hello', 'dateTime': 'wed, 20:32'},
    {'id': 0, 'type': 0, 'content': 'Hello', 'dateTime': 'wed, 20:32'},
    {'id': 0, 'type': 0, 'content': 'Hello', 'dateTime': 'wed, 20:32'},
    {'id': 0, 'type': 0, 'content': 'Hello', 'dateTime': 'wed, 20:32'},
  ];

  List UserImages = [
    {
      'image': ImageUtils.UP_Image1,
    },
    {
      'image': ImageUtils.UP_Image2,
    },
    {
      'image': ImageUtils.UP_Image3,
    },
    {
      'image': ImageUtils.UP_Image4,
    },
    {
      'image': ImageUtils.UP_Image5,
    },
    {
      'image': ImageUtils.UP_Image6,
    },
    {
      'image': ImageUtils.UP_Image7,
    },
    {
      'image': ImageUtils.UP_Image8,
    },
    {
      'image': ImageUtils.UP_Image9,
    },
    // {
    //   'image': ImageUtils.UP_Image10,
    // },
    // {
    //   'image': ImageUtils.UP_Image11,
    // },
    // {
    //   'image': ImageUtils.UP_Image12,
    // },
    // {
    //   'image': ImageUtils.UP_Image13,
    // },
    // {
    //   'image': ImageUtils.UP_Image14,
    // },
    // {
    //   'image': ImageUtils.UP_Image15,
    // },
  ];

  List UserImagesOne = [
    {
      'image': ImageUtils.UP_Image1,
    },
    {
      'image': ImageUtils.UP_Image2,
    },
    {
      'image': ImageUtils.UP_Image3,
    },
    {
      'image': ImageUtils.UP_Image4,
    },
    {
      'image': ImageUtils.UP_Image5,
    },
    {
      'image': ImageUtils.UP_Image6,
    },
    {
      'image': ImageUtils.UP_Image3,
    },
    {
      'image': ImageUtils.UP_Image2,
    },
    {
      'image': ImageUtils.UP_Image1,
    },
    {
      'image': ImageUtils.UP_Image1,
    },
    {
      'image': ImageUtils.UP_Image2,
    },
    {
      'image': ImageUtils.UP_Image3,
    },
    {
      'image': ImageUtils.UP_Image4,
    },
    {
      'image': ImageUtils.UP_Image5,
    },
    {
      'image': ImageUtils.UP_Image6,
    },
  ];

  List friendImages = [
    {
      'image': ImageUtils.UP_Image1,
    },
    {
      'image': ImageUtils.UP_Image2,
    },
    {
      'image': ImageUtils.UP_Image3,
    },
    {
      'image': ImageUtils.UP_Image4,
    },
    {
      'image': ImageUtils.UP_Image5,
    },
    {
      'image': ImageUtils.UP_Image6,
    },
    {
      'image': ImageUtils.UP_Image3,
    },
    {
      'image': ImageUtils.UP_Image2,
    },
    {
      'image': ImageUtils.UP_Image1,
    },
  ];

//////////////////////////////////////////////////Onboarding end //////////////////////////////////////////////

////////////////////////////////////////////////////////  login start ////////////////////////////////////////////

  final formKey = GlobalKey<FormState>();
  TextEditingController loginEmailOrPhone = TextEditingController();

  TextEditingController loginPassword = TextEditingController();

  void loginValidate(BuildContext context) {
    if (loginEmailOrPhone.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Email');
    } else if (!loginEmailOrPhone.text.isEmail) {
      showErrorMessage(context, 'Invalid Email/Phone Format');
    } else if (loginPassword.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Password');
    } else {
      navigationService.navigateToUntil(
          to: MainViews(
            index: 0,
          ));
    }
  }

  bool loginRememberPasswordSwitch = true;

////////////////////////////////////////////////////////Register start////////////////////////////////////////////

  TextEditingController emailRegisterScreen = TextEditingController();
  TextEditingController passwordRegisterScreen = TextEditingController();
  TextEditingController passwordRegisterScreen1 = TextEditingController();
  TextEditingController firstNameRegisterScreen = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController familyName = TextEditingController();
  TextEditingController dob = MaskedTextController(mask: '00-00-0000');
  TextEditingController lastNameRegisterScreen = TextEditingController();
  TextEditingController phoneNumberRegisterScreen = TextEditingController();
  TextEditingController countryRegisterScreen = TextEditingController();

  void updateProfile(BuildContext context) {
    if (userName.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Username');
    } else if (firstName.text.isEmpty) {
      showErrorMessage(context, 'Please Enter First Name');
    } else if (familyName.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Family Name');
    } else if (dob.text.isEmpty) {
      showErrorMessage(context, 'Please Enter D.O.B');
    } else if (email.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Email');
    } else if (!email.text.isEmail) {
      showErrorMessage(context, 'Invalid Email Format');
    } else if (phoneNum.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Phone Number');
    } else if (country.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Country');
    } else if (password.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Password');
    } else if (password.text.length < 8) {
      showErrorMessage(context, 'Password Should Have At least 8 Characters');
    } else if (password.text != confirmPass.text) {
      showErrorMessage(context, "Passwords don't match");
    } else if (city.text.isEmpty) {
      showErrorMessage(context, 'Please Enter City');
    } else if (address.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Address');
    }
    else {
      navigationService.navigateTo(to: MainViews(index: 0));
    }
  }

  void registerValidate(BuildContext context) {
    if (firstNameRegisterScreen.text.isEmpty) {
      showErrorMessage(context, 'Please Enter First Name');
    } else if (lastNameRegisterScreen.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Last Name');
    } else if (emailRegisterScreen.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Email');
    } else if (!emailRegisterScreen.text.isEmail) {
      showErrorMessage(context, 'Invalid Email Format');
    } else if (loginPhoneController.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Phone Number');
    } else if (loginPhoneController.text.length < 9) {
      showErrorMessage(context, 'Please Enter Correct Phone Number');
    }
    else if (passwordRegisterScreen.text.isEmpty) {
      showErrorMessage(context, 'Please Enter Password');
    }
    else if (passwordRegisterScreen.text.length < 8) {
      showErrorMessage(context, 'Password Should Have At least 8 Characters');
    }
    else if (passwordRegisterScreen.text != passwordRegisterScreen1.text) {
      showErrorMessage(context, 'Password and Confirm Password dont match');
    }
    else {
      Future.delayed(Duration(seconds: 0), () {
        showModalBottomSheet(
            isDismissible: false,
            backgroundColor: ColorUtils.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (builder) {
              return StatefulBuilder(builder: (BuildContext context,
                  StateSetter setState /*You can rename this!*/) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  padding: EdgeInsets.all(3.w),
                  height: 100.h,
                  color: ColorUtils.white,
                  child: OperatorSelectWidget(),
                );
              });
            });
      });

      // navigationService.navigateToUntil(
      //     to: MainViews(
      //   index: 0,
      // ));
    }
  }

  bool checkboxEmailSelect = true;
  bool checkboxMobileSelect = false;

  bool languageSelect = false;

  XFile? enterDetailsPickedFile;
  File? enterDetailsProfileFileImage;
  File? editProfileFileImage;
  String? enterDetailsProfilePic;
  String? editProfilePic;
  String verify = "";


  selectEmailAsOperatorCheckBox(bool isEmailSelect) {
    checkboxEmailSelect = isEmailSelect;
    notifyListeners();
  }

  ifSubtractQuantityPressed(int itemIndex, BuildContext context) {
    if (productCard[itemIndex]['quantity'] > 0) {
      productCard[itemIndex]['quantity'] =
      (productCard[itemIndex]['quantity'] - 1);
    }

    notifyListeners();
    if (productCard[itemIndex]['quantity'] >= 1) {
      productCard[itemIndex]['discountPriceAccToQuantity'] =
          productCard[itemIndex]['priceDiscount'] *
              productCard[itemIndex]['quantity'];
      productCard[itemIndex]['originalPriceAccToQuantity'] =
          productCard[itemIndex]['priceOrignal'] *
              productCard[itemIndex]['quantity'];
      notifyListeners();
    }
  }

  dynamic counter = 0;

  void plusCounter (){
    counter++;
    notifyListeners();
  }

  void minusCounter (){
    if(counter == 0){
      print("counter");
    }
    else {
      counter--;
      notifyListeners();
    }
  }

  ifAddMoreQuantityPressedApiPost(int itemIndex, BuildContext context,) {
    productCard[itemIndex]['quantity'] =
    (productCard[itemIndex]['quantity'] + 1);

    notifyListeners();
    // productCard[itemIndex]['discountPriceAccToQuantity'] =
    //     productCard[itemIndex]['priceDiscount'] *
    //         productCard[itemIndex]['quantity'];
    // productCard[itemIndex]['originalPriceAccToQuantity'] =
    //     productCard[itemIndex]['priceOrignal'] *
    //         productCard[itemIndex]['quantity'];
    // notifyListeners();
  }


  List productCard = [
    {
      "savePercentValue": 12.0,
      "deliveryType": "Express",
      "ratings": 5.0,
      "numberOfReviews": 100,
      "priceOrignal": 42.00,
      "originalPriceAccToQuantity": 42.00,
      "priceDiscount": 20.00,
      "discountPriceAccToQuantity": 20.00,
      "productImage": ImageUtils.slider,
      "productDiscription": "7 Days Cake Bar",
      "soldBy": "Carrefour",
      "quantity": 0,
      "points": 250,
      "weight": <String>["25g", "50g", "100g", "200g", "400g", "600g", "1kg"],
      "isFavourite": false,
    },
    {
      "savePercentValue": 10.0,
      "deliveryType": "Free",
      "ratings": 4.5,
      "numberOfReviews": 100,
      "priceOrignal": 42.00,
      "originalPriceAccToQuantity": 42.00,
      "priceDiscount": 20.00,
      "discountPriceAccToQuantity": 20.00,
      "productImage": ImageUtils.slider,
      "productDiscription": "O CAKEWICH ",
      "soldBy": "Carrefour",
      "quantity": 0,
      "points": 350,
      "weight": <String>["25g", "50g", "100g", "200g", "400g", "600g", "1kg"],
      "isFavourite": false,
    },
    {
      "savePercentValue": 12.0,
      "deliveryType": "Express",
      "ratings": 5.0,
      "numberOfReviews": 100,
      "priceOrignal": 5.00,
      "originalPriceAccToQuantity": 5.00,
      "priceDiscount": 2.00,
      "discountPriceAccToQuantity": 2.00,
      "productImage": ImageUtils.slider,
      "productDiscription": "Coke Caffeine-Free ",
      "soldBy": "Carrefour",
      "quantity": 0,
      "points": 150,
      "weight": <String>["25g", "50g", "100g", "200g", "400g", "600g", "1kg"],
      "isFavourite": false,
    },
    {
      "savePercentValue": 12.0,
      "deliveryType": "Express",
      "ratings": 5.0,
      "numberOfReviews": 100,
      "priceOrignal": 10.00,
      "originalPriceAccToQuantity": 10.00,
      "priceDiscount": 5.00,
      "discountPriceAccToQuantity": 5.00,
      "productImage": ImageUtils.slider,
      "productDiscription": "Pringles® Original",
      "soldBy": "Carrefour",
      "quantity": 0,
      "points": 250,
      "weight": <String>["25g", "50g", "100g", "200g", "400g", "600g", "1kg"],
      "isFavourite": false,
    },
    {
      "savePercentValue": 12.0,
      "deliveryType": "Express",
      "ratings": 5.0,
      "numberOfReviews": 100,
      "priceOrignal": 42.00,
      "originalPriceAccToQuantity": 42.00,
      "priceDiscount": 20.00,
      "discountPriceAccToQuantity": 20.00,
      "productImage": ImageUtils.slider,
      "productDiscription": "7 Days Cake Bar",
      "soldBy": "Carrefour",
      "quantity": 0,
      "points": 250,
      "weight": <String>["25g", "50g", "100g", "200g", "400g", "600g", "1kg"],
      "isFavourite": false,
    },
    {
      "savePercentValue": 12.0,
      "deliveryType": "Express",
      "ratings": 5.0,
      "numberOfReviews": 100,
      "priceOrignal": 42.00,
      "originalPriceAccToQuantity": 42.00,
      "priceDiscount": 20.00,
      "discountPriceAccToQuantity": 20.00,
      "productImage": ImageUtils.slider,
      "productDiscription": "O CAKEWICH ",
      "soldBy": "Carrefour",
      "quantity": 0,
      "points": 250,
      "weight": <String>["25g", "50g", "100g", "200g", "400g", "600g", "1kg"],
      "isFavourite": false,
    },
    {
      "savePercentValue": 12.0,
      "deliveryType": "Express",
      "ratings": 5.0,
      "numberOfReviews": 10,
      "priceOrignal": 5.00,
      "originalPriceAccToQuantity": 5.00,
      "priceDiscount": 2.00,
      "discountPriceAccToQuantity": 2.00,
      "productImage": ImageUtils.slider,
      "productDiscription": "Coca Cola Can  ",
      "soldBy": "Carrefour",
      "quantity": 0,
      "points": 250,
      "weight": <String>["25g", "50g", "100g", "200g", "400g", "600g", "1kg"],
      "isFavourite": false,
    },
    {
      "savePercentValue": 12.0,
      "deliveryType": "Express",
      "ratings": 5.0,
      "numberOfReviews": 100,
      "priceOrignal": 10.00,
      "originalPriceAccToQuantity": 10.00,
      "priceDiscount": 5.00,
      "discountPriceAccToQuantity": 5.00,
      "productImage": ImageUtils.slider,
      "productDiscription": "Pringles® Original",
      "soldBy": "Carrefour",
      "quantity": 0,
      "points": 200,
      "weight": <String>["25g", "50g", "100g", "200g", "400g", "600g", "1kg"],
      "isFavourite": false,
    },
  ];

  selectMobileAsOperatorCheckBox(bool isMobileSelect) {
    checkboxMobileSelect = isMobileSelect;
    notifyListeners();
  }

  Future<bool> enterDetailsOpenCamera() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 75);
    enterDetailsPickedFile = image;
    enterDetailsProfileFileImage = File(enterDetailsPickedFile!.path);
    editProfileFileImage = enterDetailsProfileFileImage;
    enterDetailsProfilePic = enterDetailsProfileFileImage.toString();
    editProfilePic = enterDetailsProfilePic;
    notifyListeners();
    final bytes = (await enterDetailsPickedFile!.readAsBytes()).lengthInBytes;
    print(bytes);
    if (enterDetailsProfileFileImage == null) {
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }

  Future<bool> enterDetailsGetImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 75);
    enterDetailsPickedFile = image;
    enterDetailsProfileFileImage = File(enterDetailsPickedFile!.path);
    editProfileFileImage = enterDetailsProfileFileImage;
    enterDetailsProfilePic = enterDetailsProfileFileImage.toString();
    editProfilePic = enterDetailsProfilePic;
    notifyListeners();
    if (enterDetailsProfileFileImage == null) {
      return false;
    } else {
      notifyListeners();
      return true;
      // createEventImages.add(createEventImage);
      // notifyListeners();
      // return true;
    }
  }


////////////////////////////////////////////////////////Register end////////////////////////////////////////////

////////////////////////////////////////////////////////login end////////////////////////////////////////////

//////////////////////////////////////////////////home start //////////////////////////////////////////////
  int select = 1;
  int selectMap = 1;
  int selectOne = 0;
  final home = SvgPicture.asset(ImageUtils.home);
  Widget categories = SvgPicture.asset(ImageUtils.categories);
  Widget location = SvgPicture.asset(ImageUtils.location);
  Widget hotdeals = SvgPicture.asset(ImageUtils.hotdeals);

  bool? is_like;

  // List bottom_appbar_icon = <IconData>[
  //   Icons.home
  // ];
  List tabbar = [
    {
      "tab": "All",
    },
    {
      "tab": "Foods & Drinks",
    },
    {
      "tab": "Entertainment",
    },
    {
      "tab": "Fashion And Retail",
    },
    {
      "tab": "Super Market",
    },
    {
      "tab": "Everyday Services",
    }
  ];

  List distance = [
    {'Distance': '100m away'},
    {'Distance': '100m away'},
    {'Distance': '120m away'},
  ];

  List checkIn = [
    {'checkin': '1 check in'},
    {'checkin': '5 check in'},
    {'checkin': '8 check in'},
  ];

  List bottomSheetImages = [
    {'image': ImageUtils.Sheet1},
    {'image': ImageUtils.Sheet3},
    {'image': ImageUtils.Sheet2}
  ];

  List Locationtabbar = [
    {
      "tab": "All",
    },
    {
      "tab": "Visited",
    },
    {
      "tab": "Saved",
    },
    {
      "tab": "Trending",
    },
    {
      "tab": "Super Market",
    },
    {
      "tab": "Everyday Services",
    }
  ];

  List photosList = [
    {'image'}
  ];

//////////////////////////////////////////////////home end //////////////////////////////////////////////

//////////////////////////////////////////////////Settings Start ////////////////////////////////////////////////////////////////////////////////////////////

  List settingsOpt = [
    {
      'title': Constants.notification,
      'icon': ImageUtils.settingNotification,
    },
    {
      'title': Constants.notification1,
      'icon': ImageUtils.greenBell,
    },
    {
      'title': Constants.notification2,
      'icon': ImageUtils.yellowBell,
    },

    {
      'title': Constants.contactUs,
      'icon': ImageUtils.contactUs,
    },
    {
      'title': Constants.logout,
      'icon': ImageUtils.logout,
    },
  ];

//////////////////////////////////////////////////Settings end ////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////ContactUs Start ////////////////////////////////////////////////////////////////////////////////////////////

  List contactUs = [
    {
      'NameHeader': Constants.fullName,
      'name': Constants.userName,
    },
    {
      'NameHeader': Constants.emailAddress,
      'name': Constants.userName,
    },
    {
      'NameHeader': Constants.contactNumber,
      'name': Constants.contactPhone,
    },
    {
      'NameHeader': Constants.yourMessages,
      'name': Constants.yourMessage,
    },
  ];

//////////////////////////////////////////////////ContactUs end ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// My Profile Start ////////////////////////////////////////////////////////////////////////////////////////////

  List favLocation = [
    {
      'images': ImageUtils.location1,
    },
    {
      'images': ImageUtils.location2,
    },
    {
      'images': ImageUtils.location3,
    },
    {
      'images': ImageUtils.location4,
    },
    {
      'images': ImageUtils.location5,
    },
    {
      'images': ImageUtils.location6,
    },
    {
      'images': ImageUtils.location7,
    },
    {
      'images': ImageUtils.location8,
    },
    {
      'images': ImageUtils.location9,
    },
    {
      'images': ImageUtils.location10,
    },
    {
      'images': ImageUtils.location11,
    },
    {
      'images': ImageUtils.location12,
    },
  ];

////////////////////////////////////////////////// My Profile end ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// My Profile Edit Start ////////////////////////////////////////////////////////////////////////////////////////////

  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController City = TextEditingController();

////////////////////////////////////////////////// My Profile Edit end ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Favourite Start ////////////////////////////////////////////////////////////////////////////////////////////

  List favourite = [
    {'image': ImageUtils.r1, 'title': Constants.resturantName1},
    {'image': ImageUtils.r6, 'title': Constants.resturantName2},
    {'image': ImageUtils.r1, 'title': Constants.resturantName1},
    {'image': ImageUtils.r6, 'title': Constants.resturantName2},
  ];

  List favouriteIcon = [
    {
      'icon': ImageUtils.heart
    },{
      'icon': ImageUtils.heart
    },{
      'icon': ImageUtils.heart
    },{
      'icon': ImageUtils.heart
    },
  ];

  List expireTime = [
    {
      'time': 'Expires in 5 hours'
    },
    {
      'time': 'Expires in 2 hours'
    },{
      'time': 'Expires in 5 hours'
    },{
      'time': 'Expires in 2 hours'
    },
  ];

////////////////////////////////////////////////// Favourite end ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Notification Start ////////////////////////////////////////////////////////////////////////////////////////////

  List notificationImage = [
    {
      'images': ImageUtils.dealFood,
    },
    {
      'images': ImageUtils.dealFood,
    },
    {
      'images': ImageUtils.dealFood,
    },
  ];

////////////////////////////////////////////////// Notification end ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Home Start ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Slider Start ////////////////////////////////////////////////////////////////////////////////////////////

  List homeSlider = [
    {
      // 'images': ImageUtils.dealBanner,
      'images': ImageUtils.sliderImage1,
      'logo': ImageUtils.sliderImage2,
      'text': ImageUtils.sliderImage3,
    },
    {
      'images': ImageUtils.dealBanner,
      'logo': ImageUtils.sliderImage2,
      'text': ImageUtils.sliderImage3,
    },
    {
      'images': ImageUtils.sliderImage1,
      'logo': ImageUtils.sliderImage2,
      'text': ImageUtils.sliderImage3,
    },
    {
      'images': ImageUtils.sliderImage1,
      'logo': ImageUtils.sliderImage2,
      'text': ImageUtils.sliderImage3,
    },
    {
      'images': ImageUtils.sliderImage1,
      'logo': ImageUtils.sliderImage2,
      'text': ImageUtils.sliderImage3,
    },
  ];

  List verticalElectronicsSlider = [
    {
      'images': ImageUtils.electronics,
    },
    {
      'images': ImageUtils.sliderImage4,
    },
    {
      'images': ImageUtils.electronics,
    },
  ];

////////////////////////////////////////////////// Trending Start ////////////////////////////////////////////////////////////////////////////////////////////

  List trendingDiscounts = [
    {"image": ImageUtils.ps, "imageDescription": "Ramadan Offers"},
    {"image": ImageUtils.ps1, "imageDescription": "Brunch"},
    {"image": ImageUtils.ps2, "imageDescription": "Ladies Night"},
    {"image": ImageUtils.ps3, "imageDescription": "Big Dicounts"},
    {"image": ImageUtils.ps2, "imageDescription": "Shopping"},
  ];

  List haveYouImages = [
    {
      'image': ImageUtils.hy1
    },
    {
      'image': ImageUtils.hy3
    }
  ];

  List haveYouImages1 = [
    {
      'image': ImageUtils.hy2
    },
    {
      'image': ImageUtils.hy4
    }
  ];

  ////////////////////////////////////////////////// Discover Start ////////////////////////////////////////////////////////////////////////////////////////////

  List discoverColor = [
    {
      "color": ColorUtils.blue,
    },
    {
      "color": ColorUtils.gradientColor,
    },
    {
      "color": ColorUtils.trendingRed,
    },
    {
      "color": ColorUtils.blue,
    },
  ];

  //////////////////////////////////////// Friend List
  // List friendList = [
  //   {'image': ImageUtils.profileImage, 'name': "Ayesha"},
  //   {'image': ImageUtils.profileImage, 'name': "Ayesha"},
  //   {'image': ImageUtils.profileImage, 'name': "Ayesha"},
  //   {'image': ImageUtils.profileImage, 'name': "Ayesha"},
  //   {'image': ImageUtils.profileImage, 'name': "Ayesha"},
  //   {'image': ImageUtils.profileImage, 'name': "Ayesha"},
  //   {'image': ImageUtils.profileImage, 'name': "Ayesha"},
  //   {'image': ImageUtils.profileImage, 'name': "Ayesha"},
  //   {'image': ImageUtils.profileImage, 'name': "Ayesha"},
  //   {'image': ImageUtils.profileImage, 'name': "Ayesha"},
  // ];
  List friendList = [
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha"},
  ];

  ////////////////////////////////// Inbox List
  List inboxList = [
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha", 'day': "Saturady"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha", 'day': "Saturady"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha", 'day': "Saturady"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha", 'day': "Saturady"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha", 'day': "Saturady"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha", 'day': "Saturady"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha", 'day': "Saturady"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha", 'day': "Saturady"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha", 'day': "Saturady"},
    {'image': ImageUtils.elysaIcon, 'name': "Ayesha", 'day': "Saturady"},
  ];

////////////////////////////////////////////////// Popular Searches Start ////////////////////////////////////////////////////////////////////////////////////////////

  List popularSearches = [
    {
      'images': ImageUtils.ps,
      "imageDescription": "Dubai Mall",
    },
    {
      'images': ImageUtils.ps1,
      "imageDescription": "Dior",
    },
    {
      'images': ImageUtils.ps2,
      "imageDescription": "Free Shipping",
    },
    {
      'images': ImageUtils.ps3,
      "imageDescription": "Big Discounts",
    },
    {
      'images': ImageUtils.ps4,
      "imageDescription": "Price Rollback",
    },
  ];

////////////////////////////////////////////////// Today's Deals Start ////////////////////////////////////////////////////////////////////////////////////////////

  List todays = [
    {
      'images': ImageUtils.watch1,
    },
    {
      'images': ImageUtils.watch2,
    },
    {
      'images': ImageUtils.watch1,
    },
    {
      'images': ImageUtils.watch2,
    },
  ];

//////////////////////////////////////////////////Hot Deals Start ////////////////////////////////////////////////////////////////////////////////////////////

  dynamic selectHotDate;

  List hotDeals = [
    {
      'date': Constants.today,
      'number': Constants.randomNumber,
      'newDiscount': Constants.newDiscount,
    },
    {
      'date': Constants.yesterday,
      'number': Constants.randomNumber,
      'newDiscount': Constants.newDiscount,
    },
    {
      'date': Constants.randomDate,
      'number': Constants.randomNumber,
      'newDiscount': Constants.newDiscount,
    },
  ];

////////////////////////////////////////////////// Search Start ////////////////////////////////////////////////////////////////////////////////////////////

  List searches = [
    {"title": Constants.searches1, 'images': ImageUtils.r1},
    {"title": Constants.searches2, 'images': ImageUtils.r2},
    {"title": Constants.searches1, 'images': ImageUtils.r1},
    {"title": Constants.searches1, 'images': ImageUtils.r2},
  ];

  List searches1 = [
    {"title": Constants.searchesOne, 'images': ImageUtils.r1},
    {"title": Constants.searchesTwo, 'images': ImageUtils.r2},
    {"title": Constants.searchesThree, 'images': ImageUtils.r1},
    {"title": Constants.searchesFour, 'images': ImageUtils.r2},
  ];

  List searchImages = [
    {'image': ImageUtils.r1},
    {'image': ImageUtils.r2}
  ];

  List searchImages1 = [
    {'image': ImageUtils.k1},
    {'image': ImageUtils.k2},
    {'image': ImageUtils.k3},
    {'image': ImageUtils.k1},
  ];

////////////////////////////////////////////////// Search End ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Resturant Detail Start ////////////////////////////////////////////////////////////////////////////////////////////

  dynamic selectIcon = 0;
  int resturantselect = 0;
  int resturantselect1 = 0;
  int favoriteselect = 0;
  int selectHourly = 0;
  int selectDaily = 0;
  int selectWeekly = 0;
  int iconSelect= 0 ;
  bool favoriteselect1 = false;

  // List generalIcon = [
  //   {
  //     'icon': Icons.phone,
  //   },
  //   {
  //     'icon': Icons.share,
  //   },
  //   {
  //     'icon': Icons.bookmark,
  //   },
  //   {
  //     'icon': Icons.map,
  //   },
  //   {
  //     'icon': Icons.vpn_lock,
  //   },
  //   {
  //     'icon': Icons.account_balance_wallet_rounded,
  //   },
  // ];

  List generalIcon = [
    {
      'icon': ImageUtils.group1,
    },
    {
      'icon': ImageUtils.group2,
    },
    {
      'icon': ImageUtils.group3,
    },
    {
      'icon': ImageUtils.group4,
    },
    {
      'icon': ImageUtils.group5,
    },
    {
      'icon': ImageUtils.group6,
    },
  ];

  List groupPhotos = [
    {'image': ImageUtils.groupPhoto1},
    {'image': ImageUtils.groupPhoto2},
    {'image': ImageUtils.groupPhoto3},
  ];

  List resturantTabbar = [
    {
      "tab": "Overview",
    },
    {
      "tab": "Offers",
    },
    {
      "tab": "Menu",
    },
    {
      "tab": "Reviews",
    },
  ];

  List fashionandRetail = [
    {
      "tab": "Top Rated",
    },
    {
      "tab": "New",
    },
    {
      "tab": "Delivery",
    },
    {
      "tab": "Buy or Sell",
    },
  ];

  List favoriteTabbar = [
    {
      "tab": "Visited",
    },
    {
      "tab": "Saved",
    },
  ];

  List delivery = [
    {
      'title': Constants.DineIn,
    },
    {
      'title': Constants.takeAway,
    },
    {
      'title': Constants.noContactDelivery,
    },
  ];

////////////////////////////////////////////////// Resturant Detail End ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Location Start ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Category Start ////////////////////////////////////////////////////////////////////////////////////////////
  dynamic selectCategory;
  List categoriesName = [
    {'title': 'Just for You'},
    {'title': 'Ramadan Essentials'},
    {'title': 'New In'},
    {'title': 'Trends'},
    {'title': 'Outdoor Dining'},
    {'title': 'Rooftop Restaurants'},
    {'title': 'Drive Thru'},
    {'title': 'Italian Cusine'},
  ];

  List haveyouText = [
    {'title': 'Hukka/The Market'},
    {'title': 'New Shanga'},
  ];

  List haveyouText1 = [
    {'title': 'Logma'},
    {'title': 'Colt Equestrain'},
  ];

  List haveyouthereImage = [
    {'title': 'assets/images/beenthere1.png'},
    {'title': 'assets/images/beenthere4.png'},
  ];

  List haveyouthereImage1 = [
    {'title': 'assets/images/beenthere3.png'},
    {'title': 'assets/images/beenthere2.png'},
    // {'title':'assets/images/beenthere4.png'},
  ];

  List clothing = [
    {'title': 'assets/images/clothing.png'},
    {'title': 'assets/images/clothing1.png'},
  ];

  List nearLogos = [
    {'title': 'assets/icons/near.png'},
    {'title': 'assets/icons/near1.png'},
  ];

  List nearImages = [
    {'title': 'assets/images/slider_image.png'},
    {'title': 'assets/images/nearImage1.png'},
  ];

  List sunsetLogos = [
    {'title': 'assets/icons/sunset.png'},
    {'title': 'assets/icons/sunset1.png'},
  ];

  List clothingbrand = [
    {'title': 'assets/images/clothingbrand.png'},
    {'title': 'assets/images/clothingbrand1.png'},
  ];

  List clothingbrandText = [
    {'title': 'Marie France Van Damme'},
    {'title': 'Vogue Fashion'},
  ];

  List electronicBrand = [
    {'title': 'assets/images/electronics.png'},
    {'title': 'assets/images/electronics1.png'},
    {'title': 'assets/images/electronics1.png'},
  ];

  List nearbydeals = [
    {'title': 'assets/images/nearbydeals.png'},
    {'title': 'assets/images/nearbydeals1.png'},
  ];
  List sunset = [
    {'title': 'assets/images/sunset.png'},
    {'title': 'assets/images/sunset1.png'},
  ];

  List favoriteresturent = [
    {'title': 'assets/images/favoriteResturent.png'},
    {'title': 'assets/images/favoriteResturent1.png'},
  ];

  List favoriteresturentText = [
    {'title': 'WOK Restaurant'},
    {'title': 'Bonafide Restaurant'},
  ];

  List favoriteresturentAddress = [
    {'title': 'Dubai Festival City'},
    {'title': 'Jumeirah Lakes Tower'},
  ];

  List sunsetText = [
    {'title': 'Señor Pico'},
    {'title': 'Hook & Cook'},
  ];

  List nearbylocations = [
    {'title': 'Wet Deck Dubai'},
    {'title': 'Orange Feels Bar & Shisha'},
  ];

  List popularSearch = [
    {'title': 'assets/images/popularSeacrh.png'},
    {'title': 'assets/images/popularSeacrh1.png'},
    {'title': 'assets/images/popularSeacrh2.png'},
    // {'title':'assets/images/popularSeacrh3.png'},
    {'title': 'assets/images/popularSeacrh4.png'},
    {'title': 'assets/images/popularSeacrh5.png'},
  ];

  List ramdanOffer = [
    {'title': 'assets/images/ramdanOffer.png'},
    {'title': 'assets/images/ramdanOffer1.png'},
  ];

  List ramdanOfferText = [
    {'title': 'Dubai Explorers'},
    {'title': 'Gourmet Moments'},
  ];

  List recomended = [
    {'title': 'assets/images/ramdanRecommended.png'},
    {'title': 'assets/images/ramdanRecommended1.png'},
  ];

  List popularServices = [
    {'title': 'assets/images/popularServices.png'},
    {'title': 'assets/images/popularServices.png'},
  ];

  List recomendedText = [
    {'title': 'Buffet for 2 Persons'},
    {'title': 'Hair Cutting Service'},
  ];

  List recomendedText1 = [
    {'title': 'Skydiving for 3 persons'},
    {'title': 'Buy 1 Get 1 Pizza'},
  ];

////////////////////////////////////////////////// Category End ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Location End ////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////Hot Deals Start ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Today's Deals end ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Popular Searches end ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Trending end ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Slider end ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Home end ////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////// Interest Screen Start//////////////////////////////////////////////

  List interestScreen = [
    {
      "image": ImageUtils.interestScreen1,
      "imageName": "Parison Bridge",
      "location": "Venice,Italy",
      "isChecked": true,
    },
    {
      "image": ImageUtils.interestScreen2,
      "imageName": "The Lake",
      "location": "Venice,Italy",
      "isChecked": true,
    },
    {
      "image": ImageUtils.interestScreen3,
      "imageName": ""
          "Enchanted Rock",
      "location": "Venice,Italy",
      "isChecked": true,
    },
    {
      "image": ImageUtils.interestScreen4,
      "imageName": "Moraine Lake",
      "location": "AB,Canada",
      "isChecked": true,
    },
  ];

////////////////////////////////////////////////// Interest Screen end//////////////////////////////////////////////

////////////////////////////////////////////////// My CheckIns Screen Start//////////////////////////////////////////////

  List checkIns = [
    {
      "image": ImageUtils.Sheet3,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.checkPoint,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Days Ago"
    },
    {
      "image": ImageUtils.Sheet1,
      "imageName": "Wet Deck",
      "icon": ImageUtils.checkPoint,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "7 Days Ago"
    },
    {
      "image": ImageUtils.Sheet3,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.checkPoint,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Days Ago"
    },
    {
      "image": ImageUtils.Sheet1,
      "imageName": "Wet Deck",
      "icon": ImageUtils.checkPoint,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "7 Days Ago"
    },
    {
      "image": ImageUtils.Sheet3,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.checkPoint,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Days Ago"
    },
    {
      "image": ImageUtils.Sheet1,
      "imageName": "Wet Deck",
      "icon": ImageUtils.checkPoint,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "7 Days Ago"
    },
    {
      "image": ImageUtils.Sheet3,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.checkPoint,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Days Ago"
    },
  ];

////////////////////////////////////////////////// My CheckIns Screen end //////////////////////////////////////////////

  ////////////////////////////////////////////////// My Rewards Screen Start//////////////////////////////////////////////

  List rewardsList = [
    {
      "image": ImageUtils.Sheet3,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.medalIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Rewards"
    },
    {
      "image": ImageUtils.Sheet1,
      "imageName": "Wet Deck",
      "icon": ImageUtils.medalIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Rewards"
    },
    {
      "image": ImageUtils.Sheet3,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.medalIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Rewards"
    },
    {
      "image": ImageUtils.Sheet1,
      "imageName": "Wet Deck",
      "icon": ImageUtils.medalIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Rewards"
    },
    {
      "image": ImageUtils.Sheet3,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.medalIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Rewards"
    },
    {
      "image": ImageUtils.Sheet1,
      "imageName": "Wet Deck",
      "icon": ImageUtils.medalIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Rewards"
    },
    {
      "image": ImageUtils.Sheet3,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.medalIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Rewards"
    },
    {
      "image": ImageUtils.Sheet1,
      "imageName": "Wet Deck",
      "icon": ImageUtils.medalIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "5 Rewards"
    },
  ];
////////////////////////////////////////////////// My Rewards Screen end //////////////////////////////////////////////

////////////////////////////////////////////////// Bookings Screen Start//////////////////////////////////////////////

  List bookingsList = [
    {
      "image": ImageUtils.slider,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.calenderIcon2,
      "description": "13 Sep, 2022  \n09:00 PM.",
      "smallText": "Booking Confirmed"
    },
    {
      "image": ImageUtils.interestScreen4,
      "imageName": "Wet Deck",
      "icon": ImageUtils.calenderIcon2,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "Booking Confirmed"
    },
    {
      "image": ImageUtils.slider,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.calenderIcon2,
      "description": "13 Sep, 2022  \n09:00 PM.",
      "smallText": "Booking Confirmed"
    },
    {
      "image": ImageUtils.interestScreen4,
      "imageName": "Wet Deck",
      "icon": ImageUtils.calenderIcon2,
      "description": "13 Sep, 2022  \n09:00 PM.",
      "smallText": "Booking Confirmed"
    },
    {
      "image": ImageUtils.slider,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.calenderIcon2,
      "description": "13 Sep, 2022  \n09:00 PM.",
      "smallText": "Booking Confirmed"
    },
    {
      "image": ImageUtils.interestScreen4,
      "imageName": "Wet Deck",
      "icon": ImageUtils.calenderIcon2,
      "description": "13 Sep, 2022  \n09:00 PM.",
      "smallText": "Booking Confirmed"
    },
    {
      "image": ImageUtils.slider,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.calenderIcon2,
      "description": "13 Sep, 2022  \n09:00 PM.",
      "smallText": "Booking Confirmed"
    },
    {
      "image": ImageUtils.interestScreen4,
      "imageName": "Wet Deck",
      "icon": ImageUtils.calenderIcon2,
      "description": "13 Sep, 2022  \n09:00 PM.",
      "smallText": "Booking Confirmed"
    },
  ];
////////////////////////////////////////////////// Booking Screen end //////////////////////////////////////////////

////////////////////////////////////////////////// Votings Screen Start//////////////////////////////////////////////

  List votingList = [
    {
      "image": ImageUtils.slider,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.voteIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "Voted"
    },
    {
      "image": ImageUtils.interestScreen4,
      "imageName": "Wet Deck",
      "icon": ImageUtils.voteIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "Voted"
    },
    {
      "image": ImageUtils.slider,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.voteIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "Voted"
    },
    {
      "image": ImageUtils.interestScreen4,
      "imageName": "Wet Deck",
      "icon": ImageUtils.voteIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "Voted"
    },
    {
      "image": ImageUtils.slider,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.voteIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "Voted"
    },
    {
      "image": ImageUtils.interestScreen4,
      "imageName": "Wet Deck",
      "icon": ImageUtils.voteIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "Voted"
    },
    {
      "image": ImageUtils.slider,
      "imageName": "Wet Deck Dubai",
      "icon": ImageUtils.voteIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "Voted"
    },
    {
      "image": ImageUtils.interestScreen4,
      "imageName": "Wet Deck",
      "icon": ImageUtils.voteIcon,
      "description": "Crescent Rd, The Palm \nJumeirah, Dubai.",
      "smallText": "Voted"
    },
  ];
}

