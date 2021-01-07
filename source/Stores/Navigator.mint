store Navigator {
  fun home(event : Html.Event) : Promise(Never, Void) {
    sequence {
      Application.load(Page::Home)

      Window.setUrl("/")
    }
  }

  fun characters(event : Html.Event) : Promise(Never, Void) {
    sequence {
      Application.load(Page::Characters)

      if (!Stores.Characters.isLoaded()) {
        Stores.Characters.load()
      } else {
        next {}
      }
     
      Window.setUrl("/characters")
    }
  }

  fun character(id : Number, event : Html.Event) : Promise(Never, Void) {
    sequence {
      Application.load(Page::Character)

      Stores.Character.load(strId)
     
      Window.setUrl("/characters/#{strId}")
    }
  } where {
    strId =
      id |> Number.toString()
  }

  fun loots(event : Html.Event) : Promise(Never, Void) {
    sequence {
      Application.load(Page::Loots)

      if (!Stores.Loots.isLoaded()) {
        Stores.Loots.load()
      } else {
        next {}
      }

      Window.setUrl("/loots")
    }
  }

  fun equipment(id : Number, event : Html.Event) : Promise(Never, Void) {
    sequence {
      Application.load(Page::Equipment)

      Stores.Equipment.load(strId)
     
      Window.setUrl("/equipments/#{strId}")
    }
  } where {
    strId =
      id |> Number.toString()
  }
}
