
local DebugSpawn = GLOBAL.DebugSpawn


function EquipCount(name)
  local eq = GetModConfigData(name)
  if eq == true then
    return 1
  else
    return 0
  end
end


local resources = {
  { prefab = "axe",        count = EquipCount("Axe") },
  { prefab = "pickaxe",    count = EquipCount("Pickaxe") },
  { prefab = "shovel",     count = EquipCount("Shovel") },
  { prefab = "torch",      count = EquipCount("Torch") },
  { prefab = "spear",      count = EquipCount("Spear") },
  { prefab = "armorwood",  count = EquipCount("Log Suit") },
  { prefab = "meat_dried", count = GetModConfigData("Jerky") },
  { prefab = "log",        count = GetModConfigData("Logs")  },
  { prefab = "flint",      count = GetModConfigData("Flint")  },
  { prefab = "rocks",      count = GetModConfigData("Rocks") },
  { prefab = "goldnugget", count = GetModConfigData("Gold") },
  { prefab = "twigs",      count = GetModConfigData("Twigs") },
  { prefab = "cutgrass",   count = GetModConfigData("Grass") },
  { prefab = "gears",      count = GetModConfigData("Gears") },
}





function Give(inst, prefab, count)
  inst.components.inventory.ignoresound = true

  for i=1,count do
    local item = DebugSpawn(prefab)
    inst.components.inventory:GiveItem(item)
  end

  inst.components.inventory.ignoresound = false
end


function GrabAndGo(inst)

  local OnNewSpawn_prev = inst.OnNewSpawn

  local OnNewSpawn_new = function(inst)
    print("I knew it!  The government done gone to hell!")


    if(GetModConfigData("Backpack")) then
      local backpack = DebugSpawn("backpack")
      inst.components.inventory:Equip(backpack)
    end


    for k, v in pairs(resources) do 
      Give(inst, v["prefab"], v["count"])
    end


    if OnNewSpawn_prev then
      return OnNewSpawn_prev(inst)
    end
  end
  inst.OnNewSpawn = OnNewSpawn_new

end


AddPlayerPostInit(GrabAndGo)

