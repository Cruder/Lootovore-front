enum Position {
  Left
  Right
}

component Molecules.Character {
  property character : Leaf.Character

  property position : Position = Position::Left

  style base {
    display: flex;

    flex-direction: row;
    align-items: center;

    text-decoration: none;
  }

  style image-spacing(position : Position) {
    case (position) {
      Position::Left => margin: 0 16px 0 0;
      Position::Right => margin: 0 0 0 16px;
    }
  }

  get icon : Html {
    <div::image-spacing(position)>
      <Atoms.Icon imageUrl={character.icon} size={Size::Medium}/>
    </div>
  }

  fun render : Html {
    <div::base>
      if (position == Position::Left) {
        icon
      }
      <Atoms.Klass.Name name={character.name} klass={character.klass} />
      if (position == Position::Right) {
        icon
      }
    </div>
  }
}
