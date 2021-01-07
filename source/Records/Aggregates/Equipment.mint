record Aggregates.Equipment {
  id : Number,
  name : String,
  icon : String,
  wowheadUrl : String using "wowhead_url",
  itemId : Number using "item_id",
  quality : String,
  loots : Map(String, Array(Leaf.LootWithCharacter))
}
