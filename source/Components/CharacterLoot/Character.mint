component CharacterLoot.Character {
  property character : Stores.Characters.Character

  style class {
    padding-right: 16px;
  }

  style description {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  style base {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 16px;
  }

  get primaryLoots {
    character.lootCount |> Map.values() |> Array.take(2) |> Array.sum()
  }

  get ofSpecLoots {
    character.lootCount |> Map.values() |> Array.at(2) |> Maybe.withDefault(0)
  }

  get disenchantLoots {
    character.lootCount |> Map.values() |> Array.at(3) |> Maybe.withDefault(0)
  }

  get lootCount : String {
    "#{primaryLoots} | #{ofSpecLoots} (#{disenchantLoots})"
  }

  fun render : Html {
    <div::base>
      <div::description>
        <img::class src={character.icon} loading="lazy"/>

        <{ character.name }>
      </div>
      <div>
        <{ lootCount }>
      </div>
    </div>
  }
}
