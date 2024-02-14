import 'package:flutter/foundation.dart';
import 'package:googleapis/logging/v2.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:logger/logger.dart';

// Define constants for authentication and project identification
const _serviceAccountCredentials = {
  // Replace with the content of the JSON key file
  "type": "service_account",
  // ...
  // ...
  // ...
};
const _projectId =
    'YOUR_PROJECT_ID'; // Replace with your project ID from the JSON key file

class GoogleCloudLoggingService {
  late LoggingApi _loggingApi; // Instance variable for Cloud Logging API
  bool _isSetup = false; // Indicator to check if the API setup is complete

  // Method to set up the Cloud Logging API
  Future<void> setupLoggingApi() async {
    if (_isSetup) return;

    try {
      // Create credentials using ServiceAccountCredentials
      final credentials = ServiceAccountCredentials.fromJson(
        _serviceAccountCredentials,
      );

      // Authenticate using ServiceAccountCredentials and obtain an AutoRefreshingAuthClient authorized client
      final authClient = await clientViaServiceAccount(
        credentials,
        [LoggingApi.loggingWriteScope],
      );

      // Initialize the Logging API with the authorized client
      _loggingApi = LoggingApi(authClient);

      // Mark the Logging API setup as complete
      _isSetup = true;
      debugPrint('Cloud Logging API setup for $_projectId');
    } catch (error) {
      debugPrint('Error setting up Cloud Logging API $error');
    }
  }

  void writeLog({required Level level, required String message}) {
    if (!_isSetup) {
      // If Logging API is not setup, return
      debugPrint('Cloud Logging API is not setup');
      return;
    }

    // Define environment and log name
    const env = 'dev';
    const logName =
        'projects/$_projectId/logs/$env'; // It should in the format projects/[PROJECT_ID]/logs/[LOG_ID]

    // Create a monitored resource
    final resource = MonitoredResource()
      ..type =
          'global'; // A global resource type is used for logs that are not associated with a specific resource

    // Map log levels to severity levels
    final severityFromLevel = switch (level) {
      Level.fatal => 'CRITICAL',
      Level.error => 'ERROR',
      Level.warning => 'WARNING',
      Level.info => 'INFO',
      Level.debug => 'DEBUG',
      _ => 'NOTICE',
    };

    // Create a log entry
    final logEntry = LogEntry()
      ..logName = logName
      ..jsonPayload = {'message': message}
      ..resource = resource
      ..severity = severityFromLevel
      ..labels = {
        'project_id':
            _projectId, // Must match the project ID with the one in the JSON key file
        'level': level.name.toUpperCase(),
        'environment': env, // Optional but useful to filter logs by environment
        'user_id': 'your-app-user-id', // Useful to filter logs by userID
        'app_instance_id':
            'your-app-instance-id', // Useful to filter logs by app instance ID e.g device ID + app version (iPhone-12-ProMax-v1.0.0)
      };

    // Create a write log entries request
    final request = WriteLogEntriesRequest()..entries = [logEntry];

    // Write the log entry using the Logging API and handle errors
    _loggingApi.entries.write(request).catchError((error) {
      debugPrint('Error writing log entry $error');
      return WriteLogEntriesResponse();
    });
  }
}
