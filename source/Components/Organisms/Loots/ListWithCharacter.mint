component Organisms.Loots.ListWithCharacter {
  property loots : Array(Leaf.LootWithCharacter)

  style base {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    justify-content: center;
  }

  fun time (loot : Leaf.LootWithCharacter) : Time {
    Time.fromIso(loot.date)
    |> Maybe.withDefault(Time.now())
  }

  fun render : Html {
    <div::base>
      for (loot of loots) {
        <Organisms.Loot.Card>
          <Molecules.Character character={loot.character} />
          
          <Molecules.Date time={time(loot)} />

          <Atoms.Button onClick={Navigator.character(loot.character.id)}> "Character History" </Atoms.Button>
        </Organisms.Loot.Card>
      }
    </div>
  }
}
