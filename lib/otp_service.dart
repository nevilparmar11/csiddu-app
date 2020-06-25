library flutter_otp;

import 'dart:math';
import 'package:sms/sms.dart';

  int _otp, _minOtpValue, _maxOtpValue; //Generated OTP

  void generateOtp([int min = 1000, int max = 9999]) {
    //Generates four digit OTP by default
    _minOtpValue = min;
    _maxOtpValue = max;
    _otp = _minOtpValue + Random().nextInt(_maxOtpValue - _minOtpValue);
  }

  void sendOtp(String phoneNumber,
      [String messageText,
      int min = 1000,
      int max = 9999,
      String countryCode = '+91']) {
    //function parameter 'message' is optional.
    generateOtp(min, max);
    SmsSender sender = new SmsSender();
    String address = (countryCode ?? '+91') +
        phoneNumber; // +1 for USA. Change it according to use.

    /// Use country code as per your requirement.
    /// +1 : USA / Canada
    /// +91: India
    /// +44: UK
    /// For other countries, please refer https://countrycode.org/
    sender.sendSms(new SmsMessage(
        address, messageText ?? 'Your OTP is : ' + _otp.toString()));
  }

  /// This function is used to validate the OTP entered by the user, by comparing
  /// it with the generated value [_otp]. If validates to be true then bool value
  /// true is returned. Else, false is returned.
  bool resultChecker(int enteredOtp) {
    //To validate OTP
    return enteredOtp == _otp;
  }
