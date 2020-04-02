------------------------------------------------------------------------
--  MODULE: Jokewad Module
------------------------------------------------------------------------
--
--  Copyright (C) 2019-2020 MsrSgtShooterPerson
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
------------------------------------------------------------------------

JOKEWAD_MODULE = {}

JOKEWAD_MODULE.ENABLE_DISABLE =
{
  "enable",  _("Enable"),
  "disable", _("Disable"),
}

function JOKEWAD_MODULE.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

JOKEWAD_MODULE.SUPER_DEC =
[[
Actor ObE_LootValue : CustomInventory
{
  Height 8
  Radius 16
  Scale 0.5

  Inventory.Icon "OBTTA1"
  Inventory.AltHUDIcon "OBTTA1"
  Inventory.MaxAmount 1000000

  +INVENTORY.INVBAR
  +INVENTORY.ALWAYSPICKUP
  +COUNTITEM

  States
  {
    Spawn:
      OBTT B 0
      Stop

    Use:
      TNT1 B 0 A_Print("It is foretold, the Slayer will make hell pay for hoarding toiletries.")
      TNT1 B 0 A_GiveInventory("ObE_LootValue", 1)
      Stop
  }
}

Actor ObE_TwoRolls : ObE_LootValue 14950
{
  Tag "Two Tissue Rolls"

  Inventory.PickupMessage "Found two tissue rolls! A victory against hell, two rolls at a time!"
  -INVENTORY.INVBAR

  States
  {
    Spawn:
      OBTT B 20
      OBTT B 5 Bright
      GoTo Animate

    Animate:
      OBTT B 20
      OBTT B 5 Bright
      Loop

    Pickup:
      TNT1 B -1
      TNT1 C 0 A_GiveInventory("ObE_LootValue", 2)
      Stop
  }
}

Actor ObE_FiveRolls : ObE_LootValue 14951
{
  Tag "Five Tissue Rolls"

  Inventory.PickupMessage "Found a stack of five tissue rolls! The people need this!"
  -INVENTORY.INVBAR

  States
  {
    Spawn:
      OBTT C 20
      OBTT C 5 Bright
      GoTo Animate

    Animate:
      OBTT C 20
      OBTT C 5 Bright
      Loop

    Pickup:
      TNT1 C -1
      TNT1 C 0 A_GiveInventory("ObE_LootValue", 5)
      Stop
  }
}

Actor ObE_HandSanitizer : ObE_LootValue 14952
{
  Tag "Hand Sanitizer"

  Inventory.PickupMessage "Picked up a hand sanitizer. Remember to disinfect and stay at home!"
  -INVENTORY.INVBAR

  States
  {
    Spawn:
      OBTT A 20
      OBTT A 5 Bright
      GoTo Animate

    Animate:
      OBTT A 20
      OBTT A 5 Bright
      Loop

    Pickup:
      TNT1 A -1
      TNT1 A 0 A_GiveInventory("ObE_LootValue", 10)
      Stop
  }
}
]]

JOKEWAD_MODULE.TISSUES =
{
  ob_2roll =
  {
    id = 14950
    cluster = 5
  }

  ob_5roll =
  {
    id = 14951
    cluster = 2
  }

  ob_handsanitizer =
  {
    id = 14952
  }
}

function JOKEWAD_MODULE.add_tissues()

  if PARAM.pandemic_mode == "disable" then return end

  each A in LEVEL.areas do
    if (A.mode and A.mode == "floor") then
      each S in A.seeds do

        if A.chunk and A.chunk.content then continue end

        if rand.odds(4) then

          local item_tab = {ob_2roll = 40, ob_5roll = 20, ob_handsanitizer = 10}
          local choice = rand.key_by_probs(item_tab)
          local item = JOKEWAD_MODULE.TISSUES[choice]
          local cluster
          local count = 1

          if item.cluster then
            count = rand.irange(1, item.cluster)
          end

          for i = 1, count do
            local event_thing = {
              z = S.area.ceil_h
              id = JOKEWAD_MODULE.TISSUES[choice].id
            }

            event_thing.x = rand.irange(S.mid_x + 48, S.mid_x - 48)
            event_thing.y = rand.irange(S.mid_y + 48, S.mid_y - 48)

            raw_add_entity(event_thing)
          end

        end

      end
    end
  end

end

function JOKEWAD_MODULE.all_done()
  if PARAM.pandemic_mode == "disable" then return end

  PARAM.tissue_dec = JOKEWAD_MODULE.SUPER_DEC

  local dir = "games/doom/data/"

  gui.wad_merge_sections(dir .. "events.wad")
end

OB_MODULES["jokewad_module"] =
{
  label = _("Jokewad Module")

  side = "left"
  priority = 60

  hooks =
  {
    setup = JOKEWAD_MODULE.setup
    --[[end_level = JOKEWAD_MODULE.add_tissues
    all_done = JOKEWAD_MODULE.all_done]]
  }

  options =
  {
    fireblu_mode =
    {
      name = "fireblu_mode"
      label=_("FIREBLU Mode")
      choices = JOKEWAD_MODULE.ENABLE_DISABLE
      tooltip = _(
        "Allows the creation of the greatest maps to ever be generated on " ..
        "on the face of the earth. Warning: ticking this waives any " ..
        "liability for potential emotional and physical damage on the " ..
        "part of the user. \n")
      default = "disable"
    }

    pandemic_mode =
    {
      name = "pandemic_mode"
      label=_("Pandemic Mode")
      choices = JOKEWAD_MODULE.ENABLE_DISABLE
      tooltip = _("Do your part in preventing the coronavirus crisis! Hell is taking " ..
      "away all our tissue rolls and hand sanitizers! It's up to the Slayer to take " ..
      "it back. Every square and every squeeze.")
      default = "disable"
    }
  }
}