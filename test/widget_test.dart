import 'package:flutter_test/flutter_test.dart';
import 'package:gestion_production_agencement/main.dart';

void main() {
  testWidgets('affiche le tableau de bord', (tester) async {
    await tester.pumpWidget(const App());
    await tester.pump();
    expect(find.text('GESTION AGENCEMENT'), findsOneWidget);
    expect(find.text('Projets récents'), findsOneWidget);
  });
}
