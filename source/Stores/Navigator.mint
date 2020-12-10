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
}
