component Loots.Card {
  connect Theme exposing { primaryBackground, secondaryBackground, primary }
  
  property loot : Stores.Loots.Loot

  style base {
    background: #{secondaryBackground};
    margin: 16px;
    padding: 16px;
    width: 400px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    min-height: 280px;

    border-radius: 10px;
    box-shadow: 0px 0px 0px #{secondaryBackground};

    &:hover {
      box-shadow: 0px 15px 25px #{secondaryBackground};
    }
  }

  fun render : Html {
    <div::base>
      <Loots.Item image={loot.equipment.icon} name={loot.equipment.name} wish={loot.wish} />
      <Loots.Character image={loot.character.icon} name={loot.character.name} klass={loot.character.klass} />
      <Button onClick={Navigator.character(loot.character.id)}> "Character History" </Button>
    </div>
  }
}

component Loots.Character {
  property image : String
  property name : String
  property klass : String

  style base {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: right;
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

  style img {
    height: 36px;
    margin: 0 16px;
  }

  fun render : Html {
    <div::base>
      <div>
        <p::character-name(klass |> String.toLowerCase)><{ name }></p>
      </div>
      <img::img src={image} loading="lazy"/>
    </div>
  }
}

component Loots.Item {
  property image : String
  property name : String
  property wish : String

  style base {
    display: flex;
    flex-direction: row;
    align-items: center;
  }

  style loot-img {
    height: calc(36px + 16px);
    margin: 0 16px;
  }


  fun render : Html {
    <div::base>
      <img::loot-img src={image} loading="lazy" />
      <div>
        <p><{name}></p>
        <p><{wish}></p>
      </div>
    </div>
  }
}