record Aggregates.Character.Flatloots {
  id : Number,
  name : String,
  klass : String,
  icon : String,
  lootCount : Array(Number) using "loot_count",
  loots : Array(Leaf.LootWithEquipment)
}
