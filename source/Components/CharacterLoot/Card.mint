component CharacterLoot.Card {
  connect Theme exposing { primaryBackground, secondaryBackground, primary }

  property character : Stores.Characters.Character

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
    margin: 0 0 16px;
  }

  get lastLoots {
    character.loots |> Array.take(3)
  }

  fun goToCharacter(character : Stores.Characters.Character, event : Html.Event) : Promise(Never, Void) {
    sequence {
      Application.load(Page::Character)
      Stores.Character.setCharacter(
        { 
          id = character.id,
          name = character.name,
          klass = character.klass,
          icon = character.icon,
          loots = character.loots,   
        }
      )
      Window.setUrl("characters/#{character.id}")
    }
  }

  fun render : Html {
    <div::base>
      <div>
        <CharacterLoot.Character character={character} />
        <div::loots>
          for (loot of lastLoots) {
            <CharacterLoot.Loot loot={loot} />
          }
        </div>
      </div>
      <Button onClick={goToCharacter(character)}> "History" </Button>
    </div>
  }
}
