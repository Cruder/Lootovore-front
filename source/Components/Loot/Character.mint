component Loot.Character {
  property character : Stores.Character
  
  fun render : Html {
    <p>
      <{ "Name : " + character.name }>
      <br/>
      <{ "Class : " }>
      <img src={character.icon} loading="lazy"/>
      <br/>
    </p>
  }
}