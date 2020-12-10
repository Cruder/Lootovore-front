component Layout {
  connect Theme exposing { primaryBackground, primaryText }

  property children : Array(Html) = []

  style base {
    background: #{primaryBackground};
    color: #{primaryText};
    min-height: 100vh;
  }

  fun render : Html {
    <div::base>

      <Layout.Header/>

      <{ children }>

      <Layout.Footer/>
    </div>
  }
}
