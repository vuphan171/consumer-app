sealed class SettingsItemModel {
  final String title;

  const SettingsItemModel({required this.title});
}

class NavigationItem extends SettingsItemModel {
  final String route;

  const NavigationItem({required super.title, required this.route});
}

class ToggleItem extends SettingsItemModel {
  final bool value;
  const ToggleItem({required super.title, required this.value});
}

class ActionItem extends SettingsItemModel {
  final String? value;
  const ActionItem({required super.title, this.value});
}

List<SettingsItemModel> generalSettings = [
  ActionItem(title: "Language", value: "English"),
  ToggleItem(title: 'Dark Mode', value: true),
  ToggleItem(title: 'Notification', value: true),
  ActionItem(title: "Currency Format", value: "\$.0000"),
  ActionItem(title: "Default Transaction Type", value: "Expense"),
];

const List<SettingsItemModel> dataManagement = [
  ActionItem(title: "Backup & Restore"),
  ActionItem(title: "Export Data"),
  ActionItem(title: "Sync"),
];

const List<SettingsItemModel> budgetAndCategories = [
  NavigationItem(title: "Monthly Budget", route: ""),
  NavigationItem(title: "Manage Categories", route: ""),
];
