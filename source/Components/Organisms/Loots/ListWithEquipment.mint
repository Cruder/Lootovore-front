component Organisms.Loots.ListWithEquipment {
  property loots : Array(Leaf.LootWithEquipment)

  style base {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    justify-content: center;
  }

  fun time (loot : Leaf.LootWithEquipment) : Time {
    Time.fromIso(loot.date)
    |> Maybe.withDefault(Time.now())
  }

  fun render : Html {
    <div::base>
      for (loot of loots) {
        <Organisms.Loot.Card>
          <Molecules.Equipment equipment={loot.equipment} size={Size::Large} />

          <Molecules.Date time={time(loot)} />

          <Atoms.Button onClick={Navigator.equipment(loot.equipment.id)}> "Equipment History" </Atoms.Button>
        </Organisms.Loot.Card>
      }
    </div>
  }
}
