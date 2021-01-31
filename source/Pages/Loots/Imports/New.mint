component Pages.Loots.Imports.New {
  style base {
  }

  fun render : Html {
    <Organisms.Loots.Imports.File />
  }
}

component Organisms.Loots.Imports.File {
  connect Theme exposing { primary, secondaryBackground }

  connect Forms.Loots.Import exposing {
    setFile,
    setPassword,
    submit,
    getCurrentState,
    reset,
    body
  }

  state isDraggingOver = false
  
  style base {
    display: flex;
    text-align: center;
    justify-content: center;
    align-items: center;

    flex-direction: column;

    > * {
      margin: 25px 0;
    }
  }

  style header {
    text-align: center;
    background-color: #{secondaryBackground};
    padding: 4px;
    margin: 16px;
    border-radius: 8px;
    width: 90vw;
  }

  style upload-file {
    width: 400px;
    height: 300px;
    if (!isDraggingOver) {
      border: 5px dashed white;
    } else {
      border: 5px dashed #{primary};
    }

    display: flex;
    align-items: center;
    justify-content: center;

    flex-direction: column;
  }

  fun componentDidMount : Promise(Never, Void) {
    Window.setTitle("Titan - Loot Import")
  }

  fun componentDidUpdate : Promise(Never, Void) {
    next {}
  }

  fun importFile(event : Html.Event) : Promise(Never, Void) {
    sequence {
      file = File.select(".txt,.json")
      content = File.readAsString(file)
      Debug.log(content)
      setFile(file)
    }
  }

  fun handleInputPassword (event : Html.Event) : a {
    setPassword(password)
  } where {
    password = Dom.getValue(event.target)
  }

  fun dragEnter (event : Html.Event) : Promise(Never, Void) {
    sequence {
      stopEvent(event)
      next { isDraggingOver = true }
    }
  }

  fun dragLeave (event : Html.Event) : Promise(Never, Void) {
    sequence { 
      stopEvent(event)
      next { isDraggingOver = false }
    }
  }

  fun drop (event : Html.Event) : Promise(Never, Void) {
    sequence {
      stopEvent(event)
      files = Html.DataTransfer.getFiles(event.dataTransfer)

      case (Array.first(files)) {
        Maybe::Just file =>
          setFile(file)
        => next {}
      }
      next { isDraggingOver = false }
    }
  }

  fun stopEvent(event : Html.Event) : Promise(Never, Void) {
    sequence {
      `#{event}.preventDefault()`
      `#{event}.stopPropagation()`
    }
  }

  get stateDisplay : Html {
    case (getCurrentState()) {
      Forms.Loots.Import.States::WaitingFile => waitingFile
      Forms.Loots.Import.States::WaitingSubmit => waitingSubmit
      Forms.Loots.Import.States::Submitting => submitting
      Forms.Loots.Import.States::Submitted => submitted
      Forms.Loots.Import.States::Error => error
    }
  }

  get waitingFile : Html {
    <>
      <div::header>
        <p> "Please upload the json corresponding." </p>
      </div>

      <div>
        <Technical.DragDropZone
          onDragEnter={dragEnter}
          onDragOver={dragEnter}
          onDragLeave={dragLeave}
          onDrop={drop}
        >
          <div::upload-file>
            <div>
            <i class="far fa-file fa-4x"></i>
            <p> "Drag your file here" </p>
            </div>
            <div>
              <Atoms.Button onClick={importFile}>
                "Or Browse"
              </Atoms.Button>

            </div>
          </div>
        </Technical.DragDropZone>

        <div>
          <p> "OR" </p>
        </div>

        <div>
          <Molecules.Form.TextArea 
            onInput={handleInputPassword} 
            label="Paste your JSON here" 
            id="json-content"
            type="text"
          />
          <Atoms.Button onClick={submit}>
            "Validate JSON"
          </Atoms.Button>
        </div>
      </div>
    </>
  }

  get waitingSubmit : Html {
    <>
      <div::header>
        <p> "Please enter the secret password." </p>
      </div>

      <div>
        <Molecules.Form.Input 
          onInput={handleInputPassword} 
          label="Password" 
          id="secret-password"
          type="password"
        />
      </div>

      <Atoms.Button onClick={submit}>
        "Submit"
      </Atoms.Button>
    </>
  }

  get submitting : Html {
    <>
      <button disabled={true} >
        "Wait please"
      </button>
    </>
  }

  get submitted : Html {
    <div>
      <button onClick={reset}>
        "Completed. Click to continue"
      </button>
    </div>
  }

  get error : Html {
    <div>
      <button onClick={reset}>
        "An error occured"
      </button>
    </div>
  }

  fun render : Html {
    <div::base>
      <{ stateDisplay }> 
    </div>
  }
}

component Technical.DragDropZone {
  property onDragEnter : Function(Html.Event, Promise(Never, Void))
  property onDragOver : Function(Html.Event, Promise(Never, Void))
  property onDragLeave : Function(Html.Event, Promise(Never, Void))
  property onDrop : Function(Html.Event, Promise(Never, Void))

  property children : Array(Html) = []

  fun componentDidMount : Promise(Never, Void) {
    case (dragZone) {
      Maybe::Just zone =>
        sequence {
          `#{zone}.addEventListener('dragenter', #{onDragEnter}, false)`
          `#{zone}.addEventListener('dragover', #{onDragOver}, false)`
          `#{zone}.addEventListener('dragleave', #{onDragLeave}, false)`
          `#{zone}.addEventListener('drop', #{onDrop}, false)`
        }
      => next {}
    }
  }

  fun render : Html {
    <div as dragZone>
     <{ children }>
    </div>
  }
}