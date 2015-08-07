
name = "Bugout Bag"

description = "Everyone laughed at you when you were prepping for disaster.  Well, who's laughing now?"
author      = "Brian Lauber (@BrianLauber)"

version = "1.0.0"

--This lets other players know if your mod is out of date. This typically needs to be updated every time there's a new game update.
api_version = 10
priority    = 0

--Compatible with both the base game and Reign of Giants
dont_starve_compatible     = true
reign_of_giants_compatible = true
dst_compatible = true

--This lets clients know if they need to get the mod from the Steam Workshop to join the game
all_clients_require_mod = false

--This determines whether it causes a server to be marked as modded (and shows in the mod list)
client_only_mod = true

--This lets people search for servers with this mod by these tags
server_filter_tags = {
  "bootstrap"
}

-- icon_atlas = "alwaysonstatus.xml"
-- icon = "alwaysonstatus.tex"

forumthread = ""


available_counts = {
  {description="0",  data= 0},
  {description="1",  data= 1},
  {description="2",  data= 2},
  {description="3",  data= 3},
  {description="4",  data= 4},
  {description="5",  data= 5},
  {description="10", data=10},
  {description="15", data=15},
  {description="20", data=20},
  {description="25", data=25},
  {description="30", data=30},
  {description="35", data=35},
  {description="40", data=40}
}



configuration_options = {}

function R(name, label)
  label = label or name

  configuration_options[#configuration_options + 1] = {
    name    = "LOGS_COUNT",
    label   = "Logs",
    options = available_counts,
    default = 0
  }
end

-- R("Logs")
-- R("Flint")
-- R("Rocks")
-- R("Gold")
-- R("Sticks")
-- R("Grass")
-- R("Gears")


configuration_options = {
  {
    name    = "LOGS_COUNT",
    label   = "Logs",
    options = available_counts,
    default = 0
  },
  {
    name    = "FLINT_COUNT",
    label   = "Flint",
    options = available_counts,
    default = 0
  },
  {
    name    = "ROCKS_COUNT",
    label   = "Rocks",
    options = available_counts,
    default = 0
  },
  {
    name    = "GOLD_COUNT",
    label   = "Gold",
    options = available_counts,
    default = 0
  },
  {
    name    = "STICKS_COUNT",
    label   = "Sticks",
    options = available_counts,
    default = 0
  },
  {
    name    = "GRASS_COUNT",
    label   = "Cut Grass",
    options = available_counts,
    default = 0
  },
  {
    name    = "GEARS_COUNT",
    label   = "Gears",
    options = available_counts,
    default = 0
  }
}
