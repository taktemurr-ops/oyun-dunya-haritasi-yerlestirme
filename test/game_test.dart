import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dunya_haritasi_yerlestirme/oyun_dunya_haritasi_yerlestirme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dunyaHaritasiConfig.title.length, 33);
    expect(dunyaHaritasiConfig.tagline.length, 33);
    for (final s in dunyaHaritasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dunyaHaritasiConfig.gameId, dunyaHaritasiId);
    expect(dunyaHaritasiRules.gameId, dunyaHaritasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dunyaHaritasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dunyaHaritasiId, optionalMechanics: dunyaHaritasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dunyaHaritasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
