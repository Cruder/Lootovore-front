component Pages.CharacterNew {
  connect Stores.Character exposing { status }
  connect Theme exposing { primary, primaryDark }

  fun render : Html {
    <Status
      message="There was an error loading the articles."
      loadingMessage="Loading characters..."
      status={Api.toStatus(status)}>

      <SVG.HeartIcon />
    </Status>
  }
}
