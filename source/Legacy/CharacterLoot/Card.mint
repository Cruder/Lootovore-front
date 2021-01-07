component CharacterLoot.Card {
  connect Theme exposing { secondaryBackground }

  property character : Aggregates.Character.Flatloots

  style base {
    background: #{secondaryBackground};
    margin: 16px;
    padding: 16px;
    width: 400px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    min-height: 280px;

    border-radius: 10px;
    box-shadow: 0px 0px 0px #{secondaryBackground};

    &:hover {
      box-shadow: 0px 15px 25px #{secondaryBackground};
    }
  }

  style loots {
    margin: 16px;
  }

  get lastLoots {
    character.loots |> Array.take(3)
  }

  fun goToCharacter(character : Aggregates.Character.Flatloots, event : Html.Event) : Promise(Never, Void) {
    sequence {
      Application.load(Page::Character)
      Stores.Character.load(character.id |> Number.toString())
      Window.setUrl("characters/#{character.id}")
    }
  }

  fun aggregateToLeaf(character : Aggregates.Character.Flatloots) : Leaf.Character {
    {
      id = character.id,
      name = character.name,
      klass = character.klass,
      icon = character.icon,
    }
  }

  fun render : Html {
    <div::base>
      <div>
        <Molecules.Character character={aggregateToLeaf(character)} />
        <div::loots>
          for (loot of lastLoots) {
            <Molecules.Equipment equipment={loot.equipment} />
          }
        </div>
      </div>
      <Atoms.Button onClick={goToCharacter(character)}> "History" </Atoms.Button>
    </div>
  }
}
