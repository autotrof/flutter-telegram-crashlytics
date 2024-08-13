import 'package:workmanager/workmanager.dart';

// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//     var reporter = TCrashReporter.getInstance(botToken, chatId);
//     reporter.initializeDatabase();
//     reporter.sync();
//     return Future.value(true);
//   });
// }

class TBackgroundService {
  void initialize() async {
    // Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  }

  void start() {
    Workmanager().registerPeriodicTask(
      "sync-task-identifier",
      "sync-task",
      initialDelay: const Duration(minutes: 30),
      frequency: const Duration(hours: 3),
      existingWorkPolicy: ExistingWorkPolicy.keep,
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
  }
}
