record Aggregates.Character {
  id : Number,
  name : String,
  klass : String,
  icon : String,
  lootCount : Array(Number) using "loot_count",
  loots : Map(String, Array(Leaf.LootWithEquipment))
}
