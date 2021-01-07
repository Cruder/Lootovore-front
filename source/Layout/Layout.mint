component Layout {
  connect Theme exposing { primaryBackground, primaryText }

  property children : Array(Html) = []

  property header = true
  property footer = true

  style base(withHeader : Bool) {
    background: #{primaryBackground};
    color: #{primaryText};

    if (withHeader) {
      min-height: calc(100vh - 78px);
      margin-top: 78px;
    } else {
      min-height: 100vh;
    }
  }

  fun render : Html {
    <>
      if (header) {
        <Layout.Header/>
      }

      <div::base(header)>
        <div>
          <{ children }>
        </div>

      if (footer) {
        <Layout.Footer/>
      }

      </div>
    </>
  }
}
