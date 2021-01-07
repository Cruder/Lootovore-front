component CharacterLoot.Filters.Class {
  connect Stores.Characters exposing { currentKlasses }

  property klass : String

  property onClick : Function(String, Html.Event, Promise(Never, Void)) =
    (klass : String, event : Html.Event) : Promise(Never, Void) { next { } } 
  
  fun isActive () : Bool {
    currentKlasses |> Array.contains(klass)
  }

  style class(active : Bool) {
    flex-basis: 20%;
    display: flex;
    justify-content: center;
    margin: 16px;

    img {
      if (active) {
        opacity: 1;

        -moz-box-shadow: 0 0 5px #fff;
        -webkit-box-shadow: 0 0 5px #fff;
        box-shadow: 0px 0px 5px #fff;
      } else {
        opacity: 0.7;
      }
    }
  }

  get linkImg {
    "https://wow.zamimg.com/images/wow/icons/medium/classicon_#{klass}.jpg"
  }

  fun handleClick (event : Html.Event) : Promise(Never, Void) {
    sequence {
      onClick(klass, event)
    }
  }

  fun render : Html {
    <div::class(isActive())>
      <img onClick={handleClick} src={ linkImg }></img>
    </div>
  }
}
