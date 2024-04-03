import 'package:chuva_dart/app/modules/author/view/author.dart';
import 'package:chuva_dart/app/modules/calendar/view/calendar.dart';
import 'package:chuva_dart/app/modules/activity/view/activity.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Calendar(),
    ),
    GoRoute(
      path: '/activity',
      builder: (context, state) => const Activity(),
    ),
    GoRoute(
      path: '/author',
      builder: (context, state) => const Author(),
    ),
  ],
);
