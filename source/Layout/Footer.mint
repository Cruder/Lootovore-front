component Layout.Footer {
  connect Theme exposing { secondaryBackground }

  style base {
    width: 100wh;
    text-align: center;
    background-color: #{secondaryBackground};
    padding: 8px;
  }

  fun render : Html {
    <div::base>
      <p> "Created with " <Atoms.SVG.HeartIcon /> " by Alexandre Lairan" </p>
    </div>
  }
}
