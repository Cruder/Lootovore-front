component Pages.Characters.Index {
  connect Stores.Characters exposing { status }
  connect Theme exposing { secondaryBackground }

  style base {
    display: flex;    
    flex-direction: column;
  }

  style cards {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    flex-basis: 80%;

    align-items: center;
    justify-content: center;
  }

  style filters {
    margin: 32px;
  }

  fun componentDidMount : Promise(Never, Void) {
      Window.setTitle("Titan - Characters")
  }

  get data : Array(Aggregates.Character.Flatloots) {
    Api.withDefault([], status)
  }

  fun render : Html {
    <div::base>
      <div::filters>
        <CharacterLoot.Filters />
      </div>
      <div::cards>
        <Molecules.Status
          message="There was an error loading characters."
          loadingMessage="Loading characters..."
          status={Api.toStatus(status)}>

            for (character of data) {
              <CharacterLoot.Card character={character} />
            }
        </Molecules.Status>
      </div>

    </div>
  }
}
