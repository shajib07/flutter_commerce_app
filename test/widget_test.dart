import 'package:flutter_test/flutter_test.dart';
import 'package:shoply/app/app.dart';
import 'package:shoply/app/di.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    configureDependencies();
  });

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('loads and displays products', (tester) async {
    await tester.pumpWidget(const ShoplyApp());

    expect(find.text('Shoply'), findsOneWidget);
    expect(find.text('Loading products…'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();

    expect(find.text('Pulse Wireless Headphones'), findsOneWidget);
    expect(find.text('USD 129.99'), findsOneWidget);
  });
}
