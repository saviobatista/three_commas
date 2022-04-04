import 'package:three_commas/three_commas.dart';
import 'package:test/test.dart';

void main() async {
  /// Validate the signature generation for requests
  test('Check signature', () {
    final client = ThreeCommasApi(key: 'test', secret: 'test');
    final signature = client.generateSignature('test', 'test');
    final knownSignature =
        '74eec50d0011a0442083ff01c642c0f4075918cebf4b397155be6de60efabc77';

    /// For testing purposes signature for test, test is defined bellow
    expect(signature, equals(knownSignature));
  });

  /// Validates API requests
  test('Check connection', () async {
    final client = ThreeCommasApi(key: 'test', secret: 'test');
    final response = await client.ping();
    expect(response['pong'], equals('pong'));
  });
}
