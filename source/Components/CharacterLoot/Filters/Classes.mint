component CharacterLoot.Filters.Classes {
  connect Stores.Characters exposing { CLASSES, currentKlasses, setKlasses, flipKlass }

  style classes {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
  }

  get classesHtml {
    CLASSES |> Array.map(classHtml)
  }

  fun classHtml (klass : String) : Html {
    <CharacterLoot.Filters.Class klass={klass} onClick={onClassClick} />
  }

  fun alterActive (klass : String, event : Html.Event) : Promise(Never, Void) { 
      if (event.shiftKey == true) {
        setKlasses([klass])
      } else if (event.ctrlKey == true) {
        setKlasses(CLASSES |> Set.fromArray() |> Set.delete(klass) |> Set.toArray() )
      } else {
        flipKlass(klass)
      }
  }

  fun reduceClass (acc : String, klass : String) : String {
    acc + klass
  }

  get classesUrl {
    currentKlasses 
    |> Array.intersperse(",")
    |> Array.reduce("/characters?klasses=", reduceClass)
  }

  fun refreshClassesHtml () : Promise(Never, Void) {
    case (classes) {
      Maybe::Just element => next {  }
      Maybe::Nothing => next { }
    }
  }

  fun onClassClick (klass : String, event : Html.Event) : Promise(Never, Void) {
    sequence {
      alterActive(klass, event)

      currentKlasses |> Stores.Characters.loadKlasses()
      classesUrl |> Window.setUrl

      refreshClassesHtml()
    }
  }

  fun render : Html {
    <div::classes as classes>
      <{ classesHtml }>
    </div>
  }
}
