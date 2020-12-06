component Pages.Characters.Show {
  connect Stores.Character exposing { status }

  style show-page {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  fun characterHtml(character : Stores.Character) : Html {
    <div::show-page>
      <Loot.Character character={character} />
      <Loot.Table loots={character.loots} />
    </div>
  }

  get characterBuilder : Html {
    case (status) {
      Api.Status::Ok character => character |> characterHtml
      => <{}>
    }
  }

  fun render : Html {
    <Status
      message="There was an error loading the articles."
      loadingMessage="Loading characters..."
      status={Api.toStatus(status)}>


      <{ characterBuilder }>
    </Status>
  }
}
