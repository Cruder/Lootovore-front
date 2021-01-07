component Atoms.Klass.Name {
  property name : String
  property klass : String

  style base(klass : String) {
    font-family: uniSansRegular;
    font-size: 22px;

    case (klass) {
      "druid" => color: #FF7C0A;
      "hunter" => color: #AAD372;
      "mage" => color: #3FC7EB;
      "paladin" => color: #F48CBA;
      "priest" => color: #FFFFFF;
      "rogue" => color: #FFF468;
      "shaman" => color: #0070DD;
      "warlock" => color: #8788EE;
      "warrior" => color: #C69B6D;
      => color: red;
    }
  }

  get klassIdentifier {
    klass |> String.toLowerCase
  }

  fun render : Html {
    <p::base(klassIdentifier)> <{ name }> </p>
  }
}
