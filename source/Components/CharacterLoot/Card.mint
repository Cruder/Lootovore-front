component CharacterLoot.Card {
  property character : Stores.Characters.Character

  connect Theme exposing { secondaryBackground }

  style base {
    background: #{secondaryBackground};
    margin: 16px;
    padding: 16px;
    width: 400px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    min-height: 280px;
  }

  get lastLoots {
    character.loots |> Array.take(3)
  }

  fun goToCharacter(character : Stores.Characters.Character, event : Html.Event) : Promise(Never, Void) {
    Window.navigate("characters/#{character.id}") 
  }

  fun render : Html {
    <div::base>
      <div>
        <CharacterLoot.Character character={character} />
        for (loot of lastLoots) {
          <CharacterLoot.Loot loot={loot} />
        }
      </div>
      <Button onClick={goToCharacter(character)}> "History" </Button>
    </div>
  }
}
