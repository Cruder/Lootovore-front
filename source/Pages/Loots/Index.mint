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

  get data : Array(Aggregates.Loot) {
    Api.withDefault([], status)
  }

  fun render : Html {
    <div::base>
      <div::cards>
        <Molecules.Status
          message="There was an error loading the loots."
          loadingMessage="Loading loots..."
          status={Api.toStatus(status)}>
            for (loot of data) {
              <Loots.Card loot={loot} />
            }
        </Molecules.Status>
      </div>

    </div>
  }
}
