import 'package:flutter_test/flutter_test.dart';

import 'package:narou_paper/model/util.dart';

void main() {
  const ncodeShanfro = 'n6169dz';
  const ncodeGirlsMonster = 'n9297fq';

  group('Narou', () {
    group('request()', () {
      test('by not R18, returns 200 status code', () async {
        await Future.delayed(Duration(seconds: 1));
        var response = await NarouClient.request(ncodeShanfro, false);
        expect(response.statusCode, 200);
      });

      test('by R18, returns 200 status code', () async {
        await Future.delayed(Duration(seconds: 1));
        var response = await NarouClient.request(ncodeGirlsMonster, true);
        expect(response.statusCode, 200);
      });
    });

    group('firstRequest()', () {
      NarouFirstResponse firstResponse;

      group('by not R18,', () {
        setUp(() async {
          await Future.delayed(Duration(seconds: 1));
          firstResponse = await NarouClient.firstRequest(ncodeShanfro);
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
          await Future.delayed(Duration(seconds: 1));
          firstResponse = await NarouClient.firstRequest(ncodeGirlsMonster);
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
