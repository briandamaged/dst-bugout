
local DebugSpawn = GLOBAL.DebugSpawn


local resources_table = {
  { prefab = "log",        count = GetModConfigData("Logs")  },
  { prefab = "flint",      count = GetModConfigData("Flint")  },
  { prefab = "rocks",      count = GetModConfigData("Rocks") },
  { prefab = "goldnugget", count = GetModConfigData("Gold") },
  { prefab = "twigs",      count = GetModConfigData("Twigs") },
  { prefab = "cutgrass",   count = GetModConfigData("Grass") },
  { prefab = "rocks",      count = GetModConfigData("Gears") },
}



function Give(inst, prefab, count)
  inst.components.inventory.ignoresound = true

  for i=1,count do
    local item = DebugSpawn(prefab)
    inst.components.inventory:GiveItem(item)
  end

  inst.components.inventory.ignoresound = false
end


GLOBAL.BUGINV = resources_table
GLOBAL.BUGOUT = Give


function GrabAndGo(inst)

  local OnNewSpawn_prev = inst.OnNewSpawn

  local OnNewSpawn_new = function(inst)
    print("I knew it!  The government done gone to hell!")


    for k, v in pairs(resources_table) do 
      Give(inst, v["prefab"], v["count"])
    end


    if OnNewSpawn_prev then
      return OnNewSpawn_prev(inst)
    end
  end
  inst.OnNewSpawn = OnNewSpawn_new

end


AddPlayerPostInit(GrabAndGo)

