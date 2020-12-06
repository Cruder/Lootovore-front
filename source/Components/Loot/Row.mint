component Loot.Row {
  property loot : Stores.Loot

  fun render : Html {
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
}
