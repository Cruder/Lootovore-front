component Atoms.Icon {
  property imageUrl : String
  property size : Size

  property loading = "lazy"

  style base {
    height: #{imageSize}px;
    width: #{imageSize}px;

    border-radius: 4px;
  }

  get imageSize {
    case(size) {
      Size::Large =>
        60
      Size::Medium =>
        36
      Size::Small =>
        22
    }
  }

  fun render : Html {
    <img::base src={imageUrl} loading={loading}/>
  }
}
