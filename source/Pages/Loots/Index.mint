component Pages.Loots.Index {
  connect Stores.Loots exposing { status }
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

  get data : Array(Stores.Loots.Loot) {
    Api.withDefault([], status)
  }

  fun render : Html {
    <div::base>
      /*
      <div::filters>
        <CharacterLoot.Filters />
      </div>
      */

      <div::cards>
        <Status
          message="There was an error loading the loots."
          loadingMessage="Loading characters..."
          status={Api.toStatus(status)}>
            for (loot of data) {
              <Loots.Card loot={loot} />
            }
        </Status>
      </div>

    </div>
  }
}
