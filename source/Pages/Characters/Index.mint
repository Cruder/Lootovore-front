component Pages.Characters.Index {
  connect Stores.Characters exposing { status }
  connect Theme exposing { secondaryBackground }

  style base {
    display: flex;
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
    flex-basis: 20%;
    margin: 32px;
  }

  get data : Array(Stores.Characters.Character) {
    Api.withDefault([], status)
  }

  fun render : Html {
    <div::base>
      <div::filters>
        <CharacterLoot.Filters />
      </div>
      <div::cards>
        <Status
          message="There was an error loading the articles."
          loadingMessage="Loading characters..."
          status={Api.toStatus(status)}>

            for (character of data) {
              <CharacterLoot.Card character={character} />
            }
        </Status>
      </div>

    </div>
  }
}
