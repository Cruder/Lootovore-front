component CharacterLoot.Filters.Classes {
  connect Stores.Characters exposing { CLASSES, currentKlasses }

  state activeClasses : Set(String) = Set.fromArray(currentKlasses)

  style classes {
    display: flex;
    flex-wrap: wrap;
    padding: 16px 32px;
  }

  get classesHtml {
    CLASSES |> Array.map(classHtml)
  }

  fun activeClass (klass : String) : Bool {
    currentKlasses |> Array.contains(klass)
  }

  fun classHtml (klass : String) : Html {
    <CharacterLoot.Filters.Class klass={klass} onClick={onClassClick} isActive={activeClass(klass)} />
  }

  fun alterActive (klass : String, active : Bool) : Set(String) {
    if (active == true) {
      activeClasses |> Set.add(klass) 
    } else {
      activeClasses |> Set.delete(klass) 
    }
  }

  fun reduceClass (acc : String, klass : String) : String {
    acc + klass
  }

  get classesUrl {
    activeClasses 
    |> Set.toArray()
    |> Array.intersperse(",")
    |> Array.reduce("/characters?klasses=", reduceClass)
  }

  fun onClassClick (klass : String, active : Bool, event : Html.Event) : Promise(Never, Void) {
    sequence {
      next { activeClasses = alterActive(klass, active) }

      activeClasses |> Set.toArray() |> Stores.Characters.loadKlasses()
      classesUrl |> Window.setUrl
    }
  }

  fun render : Html {
    <div::classes>
      <{ classesHtml }>
    </div>
  }
}
