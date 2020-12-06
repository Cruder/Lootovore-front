component CharacterLoot.Filters {
  connect Theme exposing { secondaryBackground }

  style filters {
    background: #{secondaryBackground};
    padding: 16px;
    display: flex;
    align-items: center;
    flex-direction: column;
  }

  fun render : Html {
    <div::filters>
      <CharacterLoot.Filters.Title title="Classes" />
      <CharacterLoot.Filters.Classes />
    </div>
  }
}
