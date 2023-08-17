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

  void updateInformation(Map<String, dynamic> newInformation) {
    clientUuid = newInformation['client_uuid'] ?? 'Unset';
    firstName = newInformation['first_name'] ?? 'Unset';
    lastName = newInformation['last_name'] ?? 'Unset';
    displayName = newInformation['display_name'] ?? 'Unset';
    gender = newInformation['gender'] ?? 'Unset';
    email = newInformation['email'] ?? 'Unset';
    phoneNumber = newInformation['phone_number'] ?? 'Unset';
    recoveryEmail = newInformation['recovery_email'] ?? 'Unset';
    recoveryPhoneNumber = newInformation['recovery_phone_number'] ?? 'Unset';
    address1 = newInformation['address_1'] ?? 'Unset';
    address2 = newInformation['address_2'] ?? 'Unset';
    dateOfBirth = newInformation['date_of_birth'] ?? 'Unset';
    passwordLastChanged = newInformation['password_last_changed'] ?? 'Unchanged';
    twoFactorEnabled = newInformation['two_factor_enabled'] ?? false;
    rank = newInformation['rank'] ?? 'Unset';
    poolKey = newInformation['pool_key'] ?? 0;
    walletStatus = newInformation['wallet_status'] ?? 'Unset';
    status = newInformation['status'] ?? 'Unset';
  }
}
