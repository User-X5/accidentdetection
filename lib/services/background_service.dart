import 'package:flutter_background_service/flutter_background_service.dart';

Future<void> initBackgroundService() async {
  final svc = FlutterBackgroundService();
  await svc.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: _onStart,
      autoStart: false,
      isForegroundMode: true,
      notificationChannelId: 'accident_detector',
      initialNotificationTitle: 'Accident Detector',
      initialNotificationContent: 'Monitoring active',
    ),
    iosConfiguration: IosConfiguration(autoStart: false),
  );
}

@pragma('vm:entry-point')
void _onStart(ServiceInstance svc) {
  // detection logic added later
}