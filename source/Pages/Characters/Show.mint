component Pages.Characters.Show {
  connect Stores.Character exposing { status }
  
  style base {
    display: flex;
    flex-direction: row;

    @media (max-width: 720px) {
      flex-direction: column;
    }
  }

  get data : Maybe(Aggregates.Character) {
    case (status) {
      Api.Status::Ok character => Maybe.just(character)
      => Maybe.nothing()
    }
  }

  get renderData : Html {
    data
    |> Maybe.map(renderCharacter)
    |> Maybe.withDefault(<{}>)
  }

  fun componentDidUpdate : Promise(Never, Void) {
    case (data) {
      Maybe::Just character => Window.setTitle("Titan - #{character.name}")
      => next {}
    }
  }


  fun renderCharacter(character : Aggregates.Character) : Html {
    <>
      <Molecules.FloatingCard>
        <Molecules.Character character={aggregateToLeaf(character)} />  
      </Molecules.FloatingCard>
      <div::base>
        <Organisms.Loots.WishedLoots loots={character.loots} />
      </div>
    </>
  }

  fun aggregateToLeaf(character : Aggregates.Character) : Leaf.Character {
    {
      id = character.id,
      name = character.name,
      klass = character.klass,
      icon = character.icon,
    }
  }

  fun render : Html {
    <Molecules.Status
      message="There was an error loading the character."
      loadingMessage="Loading characters..."
      status={Api.toStatus(status)}>
      
      <{ renderData }>

    </Molecules.Status>
  }
}
