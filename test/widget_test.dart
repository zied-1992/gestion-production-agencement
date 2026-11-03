import 'package:flutter_test/flutter_test.dart';
import 'package:gestion_production_agencement/main.dart';

void main() {
  testWidgets('affiche le tableau de bord de démonstration', (tester) async {
    await tester.pumpWidget(const AgencementApp());

    expect(find.text('GESTION AGENCEMENT'), findsOneWidget);
    expect(find.text('Version de démonstration'), findsOneWidget);
    expect(find.text('Projets actifs'), findsOneWidget);
  });
}
