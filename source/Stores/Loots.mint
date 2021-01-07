store Stores.Loots {
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

  state status : Api.Status(Array(Aggregates.Loot)) = Api.Status::Initial

  state currentKlasses : Array(String) = []

  fun reset : Promise(Never, Void) {
    next { status = Api.Status::Initial }
  }

  fun isLoaded : Bool {
    case (status) {
      Api.Status::Ok loots => true
      => false
    }
  }

  fun load : Promise(Never, Void) {
    sequence {
      next { currentKlasses = CLASSES }
      next { status = Api.Status::Loading }

      request = Http.get("/loots")

      newStatus = 
        Api.send(decoder, request)

      next { status = Debug.log(newStatus) }
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

      request = Http.get("/loots?#{klassesStr}")

      newStatus = 
        Api.send(Debug.log(decoder), request)

      next { status = newStatus }
    }
  }

  fun decoder (object : Object) : Result(Object.Error, Array(Aggregates.Loot)) { 
    decode Debug.log(object) as Array(Aggregates.Loot)
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
