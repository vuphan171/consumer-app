import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class AppToast {
  static void showSuccess(String message) {
    _showToast(
      message: message,
      icon: Icons.check_circle,
      backgroundColor: Colors.green,
    );
  }

  static void showWarning(String message) {
    _showToast(
      message: message,
      icon: Icons.warning_amber_rounded,
      backgroundColor: Colors.orange,
    );
  }

  static void showError(String message) {
    _showToast(
      message: message,
      icon: Icons.error,
      backgroundColor: Colors.red,
    );
  }

  static void _showToast({
    required String message,
    required IconData icon,
    required Color backgroundColor,
  }) {
    BotToast.showCustomNotification(
      duration: const Duration(seconds: 3),
      toastBuilder: (cancelFunc) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static CancelFunc? _loading;

  static void showLoading() {
    _loading = BotToast.showLoading();
  }

  static hideLoading() {
    _loading?.call();
    _loading = null;
    BotToast.closeAllLoading();
  }
}
