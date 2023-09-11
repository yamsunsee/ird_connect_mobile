import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:provider/provider.dart';

export 'user.dart';
export 'bugtrack.dart';

enum RequestMethod { getMethod, postMethod }

class Services {
  static Future<void> showLoading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  static void handleError(BuildContext context, dynamic errors) {
    Navigator.pop(context);

    String errorMessages = '';

    if (errors.runtimeType is String) {
      errorMessages = errors;
    } else {
      try {
        errors.forEach((key, value) {
          if (value is List) {
            errorMessages += '${value.join('\n')}\n';
          }
        });
      } catch (_) {
        errorMessages = errors.toString();
      }
    }

    if (errorMessages.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Errors'.toUpperCase(),
              style: const TextStyle(color: Colors.red),
            ),
            icon: const Icon(Icons.error, color: Colors.red),
            content: Text(
              errorMessages,
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  static Future<void> sendRequest({
    required BuildContext context,
    required RequestMethod method,
    required String url,
    Function? action,
    Function? redirect,
    Map<String, String>? body,
  }) async {
    try {
      late dynamic response;
      final user = Provider.of<UserProvider>(context, listen: false);
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${user.token}',
        },
      );

      showLoading(context);
      if (method == RequestMethod.getMethod) {
        response = await Dio().get(url, options: options);
      } else if (method == RequestMethod.postMethod) {
        response = await Dio().post(url, data: body, options: options);
      } else {
        throw 'Method not allowed.';
      }

      final data = response.data as Map<String, dynamic>;
      if (data['status'] == 'Success') {
        if (action is Function) action(data);
        if (context.mounted) {
          Navigator.pop(context);
          if (redirect is Function) redirect();
        }
      } else {
        throw data['message'];
      }
    } catch (errors) {
      handleError(context, errors);
    }
  }
}
