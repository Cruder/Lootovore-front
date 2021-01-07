component Organisms.Loots.WishedLoots {
  property loots : Map(String, Array(Leaf.LootWithEquipment))

  style base {
    display: flex;
    flex-direction: column;

    width: 100%;
  }

  fun renderList(acc : Array(Html), wish : String, loots : Array(Leaf.LootWithEquipment)) : Array(Html) {
    acc 
    |> Array.push(
      <Organisms.Loots.WishContainer wish={wish} lootCount={loots |> Array.size}>
        <Organisms.Loots.ListWithEquipment loots={loots} />
      </Organisms.Loots.WishContainer>
    )
  }

  fun render : Html {
    <div::base>
      <{ loots |> Map.reduce([], renderList) }>
    </div>
  }
}
