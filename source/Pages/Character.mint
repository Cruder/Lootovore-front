component Pages.Character {
  connect Stores.Character exposing { status }
  connect Theme exposing { primary, primaryDark }

  style table {
    border-collapse: collapse;
    border-left: 5px solid #{primary};
    padding: 50px;
  }

  style thead {
    height: 40px;
  }

  style tr {
    background-color: #{primary};
    border-radius: 4px;
  }

  style th {
    text-transform: uppercase;
  }

  style tbody {
    margin: 50px;
  }

  fun characterHtml(character : Stores.Character) : Html {
    <div>
      <p>
        <{ "Name : " + character.name }>
        <br/>
        <{ "Class : " }>
        <img src={character.icon} loading="lazy"/>
        <br/>
      </p>
      <{ "List of loots" }>

      <{ lootsHtml(character.loots) }>
    </div>
  }

  fun lootsHtml (loots : Array(Stores.Loot)) : Html {
      <table::table>
      <thead::thead>
        <tr::tr>
          <th::th>"Icon"</th>
          <th::th>"Name"</th>
          <th::th>"Wish"</th>
          <th::th>"Date"</th>
          <th::th>"NbVote"</th>
          <th::th></th>
        </tr>
      </thead>
      <tbody::tbody>
        <{ loots |> Array.map(lootHtml) }>
      </tbody>
      </table>
  }

  fun lootHtml (loot : Stores.Loot) : Html {
    <tr>
      <td><img src={loot.equipment.icon} loading="lazy"/></td>
      <td><{ loot.equipment.name }></td>
      <td><{ loot.wish }></td>
      <td><{ loot.date }></td>
      <td><{ loot.nbVote |> Number.toString() }></td>
      <td>
        <Button>"Who else"</Button>
      </td>
    </tr>
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
