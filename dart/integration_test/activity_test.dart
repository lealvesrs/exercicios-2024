import 'package:chuva_dart/app/modules/activity/view/activity.dart';
import 'package:chuva_dart/app/modules/calendar/controller/calendar_controller.dart';
import 'package:chuva_dart/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';

final controller = Get.put(CalendarController());
// Open activity page.
Future<void> loadActivityPage(WidgetTester tester) async {
  await tester.pumpWidget(const ChuvaDart());
  await controller.getPapers();
  await tester.pumpAndSettle();
  await tester.tap(find.text('Mesa redonda de 07:00 até 08:00'));
  await tester.pumpAndSettle();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Activity page', () {
    testWidgets('Verifica elementos da atividade', (WidgetTester tester) async {
      await loadActivityPage(tester);
      await expectLater(
        find.byType(Activity),
        matchesGoldenFile('../screenshots/ActivityPage-Unfavorited.png'),
      );

      await tester.pumpAndSettle();
      expect(find.text('Astrofísica e Cosmologia'), findsOneWidget);
      expect(find.text('Maputo'), findsOneWidget);
      //expect(find.text('Domingo 07:00h - 08:00h'), findsOneWidget);
      expect(find.text('Adicionar à sua agenda'), findsOneWidget);
      expect(find.text('Stephen William Hawking'), findsOneWidget);
    });

    testWidgets('Verifica se favoritar funciona', (WidgetTester tester) async {
      await expectLater(
        find.byType(Activity),
        matchesGoldenFile('../screenshots/ActivityPage-Unfavorited.png'),
      );
      await tester.tap(find.text('Adicionar à sua agenda'));
      await tester.pumpAndSettle();

      expect(find.text('Remover da sua agenda'), findsOneWidget);
      await expectLater(
        find.byType(Activity),
        matchesGoldenFile('../screenshots/ActivityPage-Favorited.png'),
      );
    });
  });
}
