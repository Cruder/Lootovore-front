component CharacterLoot.Character {
  property character : Aggregates.Character.Flatloots

  style class {
    padding-right: 16px;
  }

  style description {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  style base {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 16px;
  }

  style character-name(klass : String) {
    font-family: uniSansRegular;
    font-size: 22px;

    case (klass) {
      "druid" => color: #FF7C0A;
      "hunter" => color: #AAD372;
      "mage" => color: #3FC7EB;
      "paladin" => color: #F48CBA;
      "priest" => color: #FFFFFF;
      "rogue" => color: #FFF468;
      "shaman" => color: #0070DD;
      "warlock" => color: #8788EE;
      "warrior" => color: #C69B6D;
      => color: red;
    }
  }

  style loot-count {
    color: white;
  }

  get primaryLoots {
    character.lootCount |> Array.take(2) |> Array.sum()
  }

  get ofSpecLoots {
    character.lootCount |> Array.at(2) |> Maybe.withDefault(0)
  }

  get disenchantLoots {
    character.lootCount |> Array.at(3) |> Maybe.withDefault(0)
  }

  get lootCount : String {
    "#{primaryLoots} | #{ofSpecLoots} (#{disenchantLoots})"
  }

  fun render : Html {
    <div::base>
      <div::description>
        <img::class src={character.icon} loading="lazy"/>

        <p::character-name(character.klass |> String.toLowerCase)><{ character.name }></p>
      </div>
      <div>
        <p::loot-count><{ lootCount }></p>
      </div>
    </div>
  }
}
