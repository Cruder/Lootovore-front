component CharacterLoot.Filters.Title {
  property title : String

  style title {
    font-family: uniSansHeavy;
    font-size: 24px;
  }

  fun render : Html {
    <div::title>
      <p> <{ title }> </p>
    </div>
  }
}
