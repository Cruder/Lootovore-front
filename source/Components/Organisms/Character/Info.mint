component Organisms.Character.Info {
  connect Theme exposing { secondaryBackground }

  property character : Leaf.Character

  style base {
    background: #{secondaryBackground};
    margin: 8px;
    padding: 8px;
    min-width: 200px;
    height: max-content;

    box-shadow: 5px 10px 20px black;
  }

  fun render : Html {
    <div::base>
      <Molecules.Character character={character} />      
    </div>
  }
}
