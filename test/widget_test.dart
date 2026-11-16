import 'package:cat_app/app/cat_app.dart';
import 'package:cat_app/core/get_it_manager/setup_features.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await setup.reset();
    setupFeatures();
  });

  testWidgets('Cats screen shows action buttons', (WidgetTester tester) async {
    await tester.pumpWidget(const CatApp());

    expect(find.text('Cats'), findsOneWidget);
    expect(find.text('Show Fact'), findsOneWidget);
    expect(find.text('Show Breeds'), findsOneWidget);
  });
}
