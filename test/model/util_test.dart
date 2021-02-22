import 'package:flutter_test/flutter_test.dart';

import 'package:narou_paper/model/client.dart';

void main() {
  const ncodeShanfro = 'n6169dz';
  const ncodeGirlsMonster = 'n9297fq';

  final client = NarouClient('test');
  final wait = () => Future.delayed(Duration(milliseconds: 500));

  group('Narou', () {
    group('request()', () {
      test('by not R18, returns 200 status code', () async {
        await wait();
        var response = await client.request(ncodeShanfro, false);
        expect(response.statusCode, 200);
      });

      test('by R18, returns 200 status code', () async {
        await wait();
        var response = await client.request(ncodeGirlsMonster, true);
        expect(response.statusCode, 200);
      });
    });

    group('firstRequest()', () {
      FirstResponse firstResponse;

      group('by not R18,', () {
        setUp(() async {
          await wait();
          firstResponse = await client.firstRequest(ncodeShanfro);
        });

        test('returns 200 status code', () {
          expect(firstResponse.response.statusCode, 200);
        });

        test('should be isR18=false', () {
          expect(firstResponse.isR18, false);
        });
      });

      group('by R18,', () {
        setUp(() async {
          await wait();
          firstResponse = await client.firstRequest(ncodeGirlsMonster);
        });

        test('returns 200 status code', () {
          expect(firstResponse.response.statusCode, 200);
        });

        test('should be isR18=true', () {
          expect(firstResponse.isR18, true);
        });
      });
    });
  });
}
