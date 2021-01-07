component Atoms.Loot.Text {
  property name : String
  property quality : String

  style base(quality : String) {
    font-size: 16px;
    word-spacing: 3px;

    case (quality) {
      "legendary" => color: #ff8000;
      "epic" => color: #a335ee;
      "rare" => color: #0070dd;
      "uncommon" => color: #1eff00;
      "common" => color: white;
      => color: gray;
    }
  }

  fun render : Html {
    <p::base(quality)> <{ name }> </p>
  }
}
