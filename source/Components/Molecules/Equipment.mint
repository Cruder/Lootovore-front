component Molecules.Equipment {
  property equipment : Leaf.Equipment
  property size : Size = Size::Medium

  property additionnal : Html = <{}>

  style base {
    display: flex;

    flex-direction: row;
    align-items: center;

    text-decoration: none;
  }

  style image-spacing {
    margin: 0 16px 0 0;
  }

  get data {
    "item=#{equipment.itemId}&domain=classic"
  }

  fun render : Html {
    <a::base href={equipment.wowheadUrl} target="_blank">
      <div::image-spacing>
        <Atoms.Icon imageUrl={equipment.icon} size={size}/>
      </div>
      <div>
        <Atoms.Loot.Text name={equipment.name} quality={equipment.quality} />
        <{ additionnal }>
      </div>
    </a>
  }
}
