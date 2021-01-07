record Aggregates.Loot {
  wish : String,
  date : String,
  nbVote : Number using "nb_vote",
  equipment : Leaf.Equipment,
  character : Leaf.Character
}
