component Loot.Table {
  
  connect Theme exposing { primary }
  property loots : Array(Stores.Loot)

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

  fun render : Html {
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
        for (loot of loots) {
          <Loot.Row loot={loot} />
        }
      </tbody>
    </table>
  }
}