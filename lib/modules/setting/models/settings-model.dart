class SettingsItemModel {
  final String value;
  final String title;
  const SettingsItemModel({required this.title, required this.value});
}

const List<SettingsItemModel> personalSettings = [
  SettingsItemModel(title: "Profile", value: "en"),
  SettingsItemModel(title: "Shipping Address", value: "id"),
  SettingsItemModel(title: "Payment Methods", value: "ar"),
];

const List<SettingsItemModel> shopSettings = [
  SettingsItemModel(title: "Country", value: "en"),
  SettingsItemModel(title: "Currency", value: "id"),
  SettingsItemModel(title: "Terms and Conditions", value: "ar"),
];

const List<SettingsItemModel> accountSettings = [
  SettingsItemModel(title: "Language", value: "en"),
  SettingsItemModel(title: "About Us", value: "ar"),
  SettingsItemModel(title: "Delete My Account", value: "id"),
];
