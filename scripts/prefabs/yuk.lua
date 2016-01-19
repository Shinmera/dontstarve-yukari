
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
   Asset( "ANIM", "anim/player_basic.zip" ),
   Asset( "ANIM", "anim/player_idles_shiver.zip" ),
   Asset( "ANIM", "anim/player_actions.zip" ),
   Asset( "ANIM", "anim/player_actions_axe.zip" ),
   Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
   Asset( "ANIM", "anim/player_actions_shovel.zip" ),
   Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
   Asset( "ANIM", "anim/player_actions_eat.zip" ),
   Asset( "ANIM", "anim/player_actions_item.zip" ),
   Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
   Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
   Asset( "ANIM", "anim/player_actions_fishing.zip" ),
   Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
   Asset( "ANIM", "anim/player_bush_hat.zip" ),
   Asset( "ANIM", "anim/player_attacks.zip" ),
   Asset( "ANIM", "anim/player_idles.zip" ),
   Asset( "ANIM", "anim/player_rebirth.zip" ),
   Asset( "ANIM", "anim/player_jump.zip" ),
   Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
   Asset( "ANIM", "anim/player_teleport.zip" ),
   Asset( "ANIM", "anim/wilson_fx.zip" ),
   Asset( "ANIM", "anim/player_one_man_band.zip" ),
   Asset( "ANIM", "anim/shadow_hands.zip" ),
   Asset( "SOUND", "sound/sfx.fsb" ),
   Asset( "SOUND", "sound/wilson.fsb" ),
   Asset( "ANIM", "anim/beard.zip" ),

   -- Don't forget to include your character's custom assets!
   Asset( "ANIM", "anim/yuk.zip" ),
}
local prefabs = {}

local fn = function(inst)
   
   -- choose which sounds this character will play
   inst.soundsname = "wendy"

   -- a minimap icon must be specified
   --inst.MiniMapEntity:SetIcon( "wilson.png" )
   inst.entity:AddMiniMapEntity()
   inst.MiniMapEntity:SetIcon("yukicon.tex")

   -- todo: Add an example special power here.
   inst.components.sanity:SetMax(250)
   inst.components.health.maxhealth = 100
   inst.components.combat.damagemultiplier = TUNING.WENDY_DAMAGE_MULT
   
   inst.OnSave = function(inst, data)
      --print("guardando"..inst.components.leader.numfollowers)
      data.nf = inst.components.leader.numfollowers
   end        
   
   inst.OnLoad = function(inst, data)    
      if data then
         --[[
            if data.nf then
            print("Cargando"..data.nf)
            end--]]
      end
   end 
   -- CONTROL PETS
   inst.resurrecting = true
   inst:DoTaskInTime(6, function() inst.resurrecting = false end)	

   
end


return MakePlayerCharacter("yuk", prefabs, assets, fn)
