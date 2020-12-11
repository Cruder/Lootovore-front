component Loot.Row {
  connect Theme exposing { primary, primaryDark }

  property loot : Stores.Loot

  style wowhead {
    display: flex;

    div {
      height: 40px;
      padding: 8px;
      background: #a71a19;
      border-radius: 8px;

      display: flex;
      justify-content: center;
      align-items: center;

      img {
        height: 40px;
      }
    }
  }

  fun render : Html {
    <tr>
      <td><img src={loot.equipment.icon} loading="lazy"/></td>
      <td><{ loot.equipment.name }></td>
      <td><{ loot.wish }></td>
      <td><{ loot.date }></td>
      <td><{ loot.nbVote |> Number.toString() }></td>
      <td>
        <a::wowhead href={loot.equipment.wowheadUrl} target="_blank">
          <div><img src="/wowhead.png" /></div>
        </a>
      </td>
    </tr>
  }
}
