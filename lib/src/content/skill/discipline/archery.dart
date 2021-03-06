import 'package:piecemeal/piecemeal.dart';

import '../../../engine.dart';
import '../../action/bolt.dart';
import 'mastery.dart';

// TODO: This doesn't work as a trained skill because it isn't a melee weapon.
// Decide if this should be a trained skill (warrior) or an explicitly leveled
// one (rogue).
class Archery extends MasteryDiscipline implements TargetSkill {
  // TODO: Should this still use focus now that max focus is based on intellect?
  static int focusCost(int level) => lerpInt(level, 1, 20, 300, 1);

  String get name => "Archery";
  String get description =>
      "Kill your foe without risking harm to yourself by unleashing a volley "
      "of arrows from far away.";

  String get weaponType => "bow";

  // TODO: Does this boost attack damage?
  String levelDescription(int level) =>
      "Firing an arrow costs ${focusCost(level)} focus.";

  int getRange(Game game) {
    var hit = game.hero.createRangedHit();
    return hit.range;
  }

  Action getTargetAction(Game game, int level, Vec target) {
    var hit = game.hero.createRangedHit();
    var focus = Archery.focusCost(level);
    return FocusAction(focus, BoltAction(target, hit, canMiss: true));
  }
}
