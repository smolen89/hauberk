import 'package:malison/malison.dart';

import '../../hues.dart';
import '../action/condition.dart';
import '../action/detection.dart';
import '../action/teleport.dart';
import '../elements.dart';
import 'builder.dart';

void potions() {
  // TODO: Some potions should perform an effect when thrown.

  // Healing.
  category(CharCode.latinSmallLetterCWithCedilla, stack: 10)
    ..tag("magic/potion/healing")
    ..toss(damage: 1, range: 6, breakage: 100)
    ..destroy(Elements.cold, chance: 20);
  item("Soothing Balm", 2, 1.0, salmon)..heal(48);
  item("Mending Salve", 7, 1.0, brickRed)..heal(100);
  item("Healing Poultice", 12, 1.0, maroon)..heal(200, curePoison: true);
  item("Potion[s] of Amelioration", 24, 1.0, indigo)
    ..heal(400, curePoison: true);
  item("Potion[s] of Rejuvenation", 65, 0.5, violet)
    ..heal(1000, curePoison: true);

  item("Antidote", 2, 1.0, peaGreen)..heal(0, curePoison: true);

  category(CharCode.latinSmallLetterEWithCircumflex, stack: 10)
    ..tag("magic/potion/resistance")
    ..toss(damage: 1, range: 6, breakage: 100)
    ..destroy(Elements.cold, chance: 20);
  // TODO: Don't need to strictly have every single element here.
  item("Salve[s] of Heat Resistance", 5, 0.5, carrot)
    ..resistSalve(Elements.fire);
  // TODO: Make not freezable?
  item("Salve[s] of Cold Resistance", 6, 0.5, cornflower)
    ..resistSalve(Elements.cold);
  item("Salve[s] of Light Resistance", 7, 0.5, buttermilk)
    ..resistSalve(Elements.light);
  item("Salve[s] of Wind Resistance", 8, 0.5, turquoise)
    ..resistSalve(Elements.air);
  item("Salve[s] of Lightning Resistance", 9, 0.5, lilac)
    ..resistSalve(Elements.lightning);
  item("Salve[s] of Darkness Resistance", 10, 0.5, slate)
    ..resistSalve(Elements.dark);
  item("Salve[s] of Earth Resistance", 13, 0.5, persimmon)
    ..resistSalve(Elements.earth);
  item("Salve[s] of Water Resistance", 16, 0.5, ultramarine)
    ..resistSalve(Elements.water);
  item("Salve[s] of Acid Resistance", 19, 0.5, sandal)
    ..resistSalve(Elements.acid); // TODO: Better color.
  item("Salve[s] of Poison Resistance", 23, 0.5, lima)
    ..resistSalve(Elements.poison);
  item("Salve[s] of Death Resistance", 30, 0.5, violet)
    ..resistSalve(Elements.spirit);

  // TODO: "Insulation", "the Elements" and other multi-element resistances.

  // Speed.
  category(CharCode.latinSmallLetterEWithDiaeresis, stack: 10)
    ..tag("magic/potion/speed")
    ..toss(damage: 1, range: 6, breakage: 100)
    ..destroy(Elements.cold, chance: 20);
  item("Potion[s] of Quickness", 3, 0.3, lima)..use(() => HasteAction(20, 1));
  item("Potion[s] of Alacrity", 18, 0.3, peaGreen)
    ..use(() => HasteAction(30, 2));
  item("Potion[s] of Speed", 34, 0.25, sherwood)..use(() => HasteAction(40, 3));

  // dram, draught, elixir, philter

  // TODO: Don't need to strictly have every single element here.
  category(CharCode.latinSmallLetterEWithGrave, stack: 10)
    ..tag("magic/potion/bottled")
    ..toss(damage: 1, range: 8, breakage: 100)
    ..destroy(Elements.cold, chance: 15);
  item("Bottled Wind", 4, 0.5, cornflower)
    ..flow(Elements.air, "the wind", "blasts", 20, fly: true);
  // TODO: Make not freezable?
  item("Bottled Ice", 7, 0.5, cerulean)
    ..ball(Elements.cold, "the cold", "freezes", 30);
  item("Bottled Fire", 11, 0.5, brickRed)
    ..flow(Elements.fire, "the fire", "burns", 44, fly: true);
  item("Bottled Ocean", 12, 0.5, ultramarine)
    ..flow(Elements.water, "the water", "drowns", 52);
  item("Bottled Earth", 13, 0.5, persimmon)
    ..ball(Elements.earth, "the dirt", "crushes", 58);
  item("Bottled Lightning", 16, 0.5, lilac)
    ..ball(Elements.lightning, "the lightning", "shocks", 68);
  item("Bottled Acid", 18, 0.5, lima)
    ..flow(Elements.acid, "the acid", "corrodes", 72);
  item("Bottled Poison", 22, 0.5, sherwood)
    ..flow(Elements.poison, "the poison", "infects", 90, fly: true);
  item("Bottled Shadow", 28, 0.5, steelGray)
    ..ball(Elements.dark, "the darkness", "torments", 120);
  item("Bottled Radiance", 34, 0.5, buttermilk)
    ..ball(Elements.light, "light", "sears", 140);
  item("Bottled Spirit", 40, 0.5, slate)
    ..flow(Elements.spirit, "the spirit", "haunts", 160, fly: true);
}

void scrolls() {
  // TODO: Consider adding "complexity" to items. Like heft but for intellect,
  // it's a required intellect level needed to use the item successfully. An
  // item too complex for the user is likely to fail.

  // Teleportation.
  category(CharCode.latinSmallLetterAWithCircumflex, stack: 20)
    ..tag("magic/scroll/teleportation")
    ..toss(damage: 1, range: 3, breakage: 75)
    ..destroy(Elements.fire, chance: 20, fuel: 5);
  item("Scroll[s] of Sidestepping", 2, 0.5, lilac)
    ..use(() => TeleportAction(6));
  item("Scroll[s] of Phasing", 6, 0.3, violet)..use(() => TeleportAction(12));
  item("Scroll[s] of Teleportation", 15, 0.3, indigo)
    ..use(() => TeleportAction(24));
  item("Scroll[s] of Disappearing", 26, 0.3, ultramarine)
    ..use(() => TeleportAction(48));

  // Detection.
  category(CharCode.latinSmallLetterAWithDiaeresis, stack: 20)
    ..tag("magic/scroll/detection")
    ..toss(damage: 1, range: 3, breakage: 75)
    ..destroy(Elements.fire, chance: 20, fuel: 5);
  item("Scroll[s] of Find Nearby Escape", 1, 0.5, buttermilk)
    ..detection([DetectType.exit], range: 20);
  item("Scroll[s] of Find Nearby Items", 2, 0.5, gold)
    ..detection([DetectType.item], range: 20);
  item("Scroll[s] of Detect Nearby", 3, 0.25, lima)
    ..detection([DetectType.exit, DetectType.item], range: 20);

  item("Scroll[s] of Locate Escape", 5, 1.0, sandal)
    ..detection([DetectType.exit]);
  item("Scroll[s] of Item Detection", 20, 0.5, carrot)
    ..detection([DetectType.item]);
  item("Scroll[s] of Detection", 30, 0.25, copper)
    ..detection([DetectType.exit, DetectType.item]);

  // Mapping.
  category(CharCode.latinSmallLetterAWithGrave, stack: 20)
    ..tag("magic/scroll/mapping")
    ..toss(damage: 1, range: 3, breakage: 75)
    ..destroy(Elements.fire, chance: 15, fuel: 5);
  item("Adventurer's Map", 10, 0.25, sherwood)..mapping(16);
  item("Explorer's Map", 30, 0.25, peaGreen)..mapping(32);
  item("Cartographer's Map", 50, 0.25, mint)..mapping(64);
  item("Wizard's Map", 70, 0.25, seaGreen)..mapping(200, illuminate: true);

//  CharCode.latinSmallLetterAWithRingAbove // scroll
}

void spellBooks() {
  category(CharCode.vulgarFractionOneHalf, stack: 3)
    ..tag("magic/book/sorcery")
    ..toss(damage: 1, range: 3, breakage: 25)
    ..destroy(Elements.fire, chance: 5, fuel: 10);
  item('Spellbook "Elemental Primer"', 1, 0.5, maroon)
    ..skills([
      "Sense Items",
      "Flee",
      "Escape",
      "Disappear",
      "Icicle",
      "Brilliant Beam",
      "Windstorm",
      "Fire Barrier",
      "Tidal Wave"
    ]);

  // TODO: More spell books and reorganize spells.
}
