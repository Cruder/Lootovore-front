component CharacterLoot.Filters.Title {
  property title : String

  style title {

  }

  fun render : Html {
    <div::title>
      <p> <{ title }> </p>
    </div>
  }
}
