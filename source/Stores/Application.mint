enum Page {
  Initial
  Character
  Characters
  Loots
  Equipment
  Home
  Loots.Imports.New
  NotFound
}

store Application {
  state page : Page = Page::Initial

  fun load (page : Page) : Promise(Never, Void) {
    sequence {
      setPage(page)
      initialize()
    }
  }

  fun initialize : Promise(Never, Void) {
    sequence {
      Http.abortAll()
    }
  }

  fun setPage (page : Page) : Promise(Never, Void) {
    next { page = page }
  }
}