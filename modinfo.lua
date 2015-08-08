
name = "Bug-out Bag"

description = "Everyone laughed at you when you were prepping for disaster.\n\nWell, who's laughing now?"
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
client_only_mod = false

--This lets people search for servers with this mod by these tags
server_filter_tags = {
  "bootstrap"
}

-- icon_atlas = "alwaysonstatus.xml"
-- icon = "alwaysonstatus.tex"

forumthread = ""


configuration_options = {}

yes_no = {
  {description = "No...", data = false},
  {description = "Yes!",  data = true},
}

tools = {
  "Backpack", "Axe", "Pickaxe", "Shovel", "Torch",
  "Spear", "Log Suit"
}

for i=1,#tools do
  configuration_options[#configuration_options + 1] = {
    name    = tools[i],
    label   = tools[i].."?",
    options = yes_no,
    default = false
  }
end


__resource_counts = {
  0, 1, 2, 3, 4, 5, 10, 15, 20, 25, 30, 35, 40
}

resource_counts = {}
for i=1,#__resource_counts do 
  resource_counts[i] = {
    description=__resource_counts[i],
    data=__resource_counts[i]
  }
end


resource = {
  "Jerky", "Logs", "Flint", "Rocks", "Gold",
  "Twigs", "Grass", "Gears", 
}

for i=1,#resource do 
  configuration_options[#configuration_options + 1] = {
    name    = resource[i],
    label   = resource[i],
    options = resource_counts,
    default = 0
  }
end
