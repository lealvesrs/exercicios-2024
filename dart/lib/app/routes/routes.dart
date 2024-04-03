import 'package:chuva_dart/app/modules/calendar/view/calendar.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Calendar(),
    ),
  ],
);
