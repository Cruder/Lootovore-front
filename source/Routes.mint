routes {
  / {
    parallel {
      Application.load(Page::Home)
    }
  }

  /characters?klasses=:klasses (klasses : String) {
    parallel {
      Application.load(Page::Characters)
      Stores.Characters.loadKlasses(klasses |> String.split(","))
    }
  }

  /characters {
    parallel {
      Application.load(Page::Characters)
      Stores.Characters.load()
    }
  }

  /characters/:id (id : String) {
    parallel {
      Application.load(Page::Character)
      Stores.Character.load(id)
    }
  }

  /loots {
    parallel {
      Application.load(Page::Loots)
      Stores.Loots.load()
    }
  }

  /loots/imports {
    parallel {
      Application.load(Page::Loots.Imports.New)
    }
  }

  /equipments/:id (id : String) {
    parallel {
      Application.load(Page::Equipment)
      Stores.Equipment.load(id)
    }
  }

  * {
    Application.load(Page::NotFound)
  }
}
