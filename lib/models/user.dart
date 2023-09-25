class User {
  late String clientUuid;
  late String firstName;
  late String lastName;
  late String displayName = '';
  late String gender;
  late String email;
  late String phoneNumber;
  late String recoveryEmail;
  late String recoveryPhoneNumber;
  late String address1;
  late String address2;
  late String dateOfBirth;
  late String passwordLastChanged;
  late bool twoFactorEnabled;
  late String rank;
  late int poolKey;
  late String walletStatus;
  late String status;

  String get fullName => '$firstName $lastName';

  void updateInformation(Map<String, dynamic> newInformation) {
    clientUuid = newInformation['client_uuid'] ?? '';
    firstName = newInformation['first_name'] ?? '';
    lastName = newInformation['last_name'] ?? '';
    displayName = newInformation['display_name'] ?? '';
    gender = newInformation['gender'] ?? '';
    email = newInformation['email'] ?? '';
    phoneNumber = newInformation['phone_number'] ?? '';
    recoveryEmail = newInformation['recovery_email'] ?? '';
    recoveryPhoneNumber = newInformation['recovery_phone_number'] ?? '';
    address1 = newInformation['address_1'] ?? '';
    address2 = newInformation['address_2'] ?? '';
    dateOfBirth = newInformation['date_of_birth'] ?? '';
    passwordLastChanged = newInformation['password_last_changed'] ?? '';
    twoFactorEnabled = newInformation['two_factor_enabled'] ?? false;
    rank = newInformation['rank'] ?? '';
    poolKey = newInformation['pool_key'] ?? 0;
    walletStatus = newInformation['wallet_status'] ?? '';
    status = newInformation['status'] ?? '';
  }
}
