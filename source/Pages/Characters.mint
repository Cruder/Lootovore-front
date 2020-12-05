component Pages.Characters {
  connect Stores.Characters exposing { status }
  connect Theme exposing { secondaryBackground, primary }

  style loot-name {
    width: 300px;
  }

  style loot-img {
    height: 36px;
  }

  style character-table {
    padding: 2px 32px;
    background: #{secondaryBackground};
  }

  style character-table-header {
    background: #{primary};
    margin-bottom: 50px;
  }

  style loot-count(idx : String) {
    text-align: center;
    font-weight: bold;
    
    width: 40px;
    
    case (idx) {
      "0" => color: orange;
      "1" => color: orange;
      "2" => color: green;
      "3" => color: purple;
      "4" => color: cyan;
      "5" => color: cyan;
      => color: gray;
    }
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

  style filters {
    position: fixed;
    top: 25px;
    left: 25px;

    width: 20%;
    height: 500px;

    background: #{secondaryBackground};

    border-radius: 10px;
  }

  style klass-input-filter {
    display: inline-block;

    input { 
    }

    input[type=checkbox]:checked:after {
         content: "";
         display: block;
         width: 5px;
         height: 10px;
         border: solid black;
         border-width: 0 2px 2px 0;
         -webkit-transform: rotate(45deg);
         -ms-transform: rotate(45deg);
         transform: rotate(45deg);
         position: absolute;
         top: 2px;
         left: 6px;
}
  }

  fun linkImg(klass : String) {
    "https://wow.zamimg.com/images/wow/icons/medium/classicon_#{klass}.jpg"
  }

  get klassList {
    ["paladin", "warlock", "mage", "druid", "priest", "hunter", "rogue", "shaman"]
  }

  fun filtersHtml : Html {
    <div::filters>
      <label for="klasses"> "Classes:" </label>
      <br/>
        <{
          klassList
          |> Array.map( (klass : String) : Html { 
            <div::klass-input-filter>
              <label for="filter-klass-#{klass}"> <img src={ linkImg(klass) }></img> </label>
              <input type="checkbox" id="filter-klass-#{klass}" value={klass} /> 
            </div>
          })    
        }>

      <Button 
        onClick={
          (event : Html.Event) : Promise(Never, Void) {
            klassList
            |> Array.map( (klass : String) : String { "filter-klass-#{klass}" }) 
            |> Array.map( (id : String) : Maybe(Dom.Element) { Dom.getElementById(id) })
            |> Debug.log()
            |> Array.select( (dom : Maybe(Dom.Element)) : Bool {
              case (dom) {
                Maybe::Just input => `#{input}.checked` as bool
                Maybe::Nothing => false
              }
            })
            |> Debug.log()
            |> Array.map( (dom : Maybe(Dom.Element)) : String {
              dom 
              |> Maybe.map( (domElement : Dom.Element) : String { 
                domElement 
                |> Dom.getAttribute("value") 
                |> Maybe.withDefault("") 
              })
              |> Maybe.withDefault("")
            })
            |> Stores.Characters.loadKlasses()
          } 
        } >
        "Filter"
      </Button>

    </div>
  }

  fun characterLootCount (character : Stores.Characters.Character) {
    character.lootCount 
    |> Map.values() 
    |> Array.map( (number : Number) : String { number |> Number.toString() })
    |> Array.mapWithIndex( (number : String, idx : Number) : Html { <td::loot-count(idx |> Number.toString())> <{number}> </td> } )
  }

  get charactersTable : Array(Html) {
    for (character of data) {
      <tr>
        <td><img src={character.icon} loading="lazy"/></td>
        <td><{ character.name }></td>
        for (loot of characterLootCount(character)) {
          <{ loot }>
        }
        <{ character.lastLoot |> maybeLoot() }>
        <td>
          <Button 
            onClick={
              (event : Html.Event) : Promise(Never, Void) { 
                Window.navigate("characters/#{character.id}") 
              } 
            }>
            "History"
          </Button>
        </td>
      </tr>
    }
  }

  fun maybeLoot (aLoot : Maybe(Stores.Loot)) : Html {
    aLoot |> Maybe.map(someLoot) |> Maybe.withDefault(<{}>)
  }

  fun someLoot(loot : Stores.Loot) : Html {
    <>
      <td>
        <img::loot-img src={loot.equipment.icon} loading="lazy"/>
      </td>
      <td::loot-name::equipment-quality(loot.equipment.quality)>
        <{loot.equipment.name}>
      </td>
    </>
  }

  get data : Array(Stores.Characters.Character) {
    Api.withDefault([], status)
  }

  fun render : Html {
    <>
    <{ filtersHtml() }>

    <Status
      message="There was an error loading the articles."
      loadingMessage="Loading characters..."
      status={Api.toStatus(status)}>

      <table::character-table>
      <thead>
        <tr>
          <th colspan="2">"Name"</th>
          <th colspan="6">"Loot Count"</th>
          <th colspan="2">"Last Loot"</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <{ charactersTable }>
      </tbody>
      </table>
    </Status>
    </>
  }
}
