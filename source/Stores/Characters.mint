store Stores.Characters {
  const CLASSES = [
    "paladin", 
    "warlock", 
    "mage", 
    "druid", 
    "priest", 
    "hunter", 
    "rogue", 
    "shaman", 
    "warrior"
  ]

  state status : Api.Status(Array(Aggregates.Character.Flatloots)) = Api.Status::Initial

  state currentKlasses : Array(String) = []

  fun reset : Promise(Never, Void) {
    next { status = Api.Status::Initial }
  }

  fun isLoaded : Bool {
    case (status) {
      Api.Status::Ok characters => true
      => false
    }
  }

  fun load : Promise(Never, Void) {
    sequence {
      next { currentKlasses = CLASSES }
      next { status = Api.Status::Loading }

      request = Http.get("/characters")

      newStatus = 
        Api.send(decoder, request)

      next { status = newStatus }
    }
  }

  fun loadKlasses(klasses : Array(String)) : Promise(Never, Void) {
    sequence {
      next { currentKlasses = klasses }
      next { status = Api.Status::Loading }

      klassesStr = klasses 
      |> Array.map((klass : String) : String { "klasses[]=#{klass}" })
      |> Array.intersperse("&")
      |> Array.reduce("", (acc : String, i : String) : String { acc + i })

      request = Http.get("/characters?#{klassesStr}")

      newStatus = 
        Api.send(decoder, request)

      next { status = newStatus }
    }
  }

  fun decoder (object : Object) : Result(Object.Error, Array(Aggregates.Character.Flatloots)) { 
    decode object as Array(Aggregates.Character.Flatloots)
  }

  fun setKlasses (klasses : Array(String)) : Promise(Never, Void) {
    next { currentKlasses = klasses }
  }

  fun flipKlass (klass : String) : Promise(Never, Void) {
    if (itContains) {
      next { currentKlasses = (currentKlasses |> Set.fromArray() |> Set.delete(klass) |> Set.toArray()) }
    } else {
      next { currentKlasses = (currentKlasses |> Set.fromArray() |> Set.add(klass) |> Set.toArray()) }
    }
  } where {
    itContains =
      (currentKlasses |> Array.contains(klass))
  }
}
