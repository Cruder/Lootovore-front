component Loots.Card {
  connect Theme exposing { primaryBackground, secondaryBackground, primary, primaryText }
  
  property loot : Aggregates.Loot

  style base {
    background: #{secondaryBackground};
    margin: 16px;
    padding: 16px;
    width: 400px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    min-height: 280px;

    border-radius: 10px;
    box-shadow: 0px 0px 0px #{secondaryBackground};

    &:hover {
      box-shadow: 0px 15px 25px #{secondaryBackground};
    }
  }

  style character {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: right;
  }

  style wish {
    color: #{primaryText};
  }

  get wish : Html {
    <p::wish><{loot.wish}></p>
  }

  get time : Time {
    Time.fromIso(loot.date)
    |> Maybe.withDefault(Time.now())
  }

  fun render : Html {
    <div::base>
      <Molecules.Equipment equipment={loot.equipment} size={Size::Large} additionnal={wish} />
      <div::character>
        <Molecules.Character character={loot.character} position={Position::Right} />
      </div>
      <Molecules.Date time={time} />

      <Atoms.Button onClick={Navigator.character(loot.character.id)}> "Character History" </Atoms.Button>
    </div>
  }
}
