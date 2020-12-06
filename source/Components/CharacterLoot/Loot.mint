component CharacterLoot.Loot {
  property loot : Stores.Loot

  style base {
    display: flex;
    flex-direction: row;
    align-items: center;
  }

  style loot-img {
    height: 36px;
    margin: 0 16px;
  }

  style equipment-quality(quality : String) {
    case (quality) {
      "legendary" => color: #ff8000;
      "epic" => color: #a335ee;
      "rare" => color: #0070dd;
      "uncommon" => color: #1eff00;
      "common" => color: white;
      => color: gray;
    }
  }

  fun render : Html {
    <div::base>
      <img::loot-img src={loot.equipment.icon} loading="lazy"/>
      <p::equipment-quality(loot.equipment.quality)>
        <{loot.equipment.name}>
      </p>
    </div>
  }
}
