local require = GLOBAL.require 
local STRINGS = GLOBAL.STRINGS

local function CustomIntro(inst)
   if GLOBAL.GetPlayer().prefab == "yuk" then
      inst.components.maxwelltalker.speeches.SANDBOX_1 =
         {
            appearsound = "dontstarve/maxwell/disappear",
            voice = "dontstarve/maxwell/talk_LP",
            appearanim = "appear",
            idleanim= "idle",
            dialogpreanim = "dialog_pre",
            dialoganim="dial_loop",
            dialogpostanim = "dialog_pst",
            disappearanim = "disappear",
            disableplayer = true,
            skippable = false,
            {
               string = "Say Miss, you don't look so fresh.",
               wait = 3,
               anim = nil,
               sound = nil,
            },
            {
               string = "You won't be able to gap your way out of this one.",
               wait = 4,
               anim = nil,
               sound = nil,
            },
         }
   end
end

PrefabFiles = {
   "yuk"
}

Assets = {
   Asset( "IMAGE", "images/saveslot_portraits/yuk.tex" ),
   Asset( "ATLAS", "images/saveslot_portraits/yuk.xml" ),

   Asset( "IMAGE", "images/selectscreen_portraits/yuk.tex" ),
   Asset( "ATLAS", "images/selectscreen_portraits/yuk.xml" ),

   Asset( "IMAGE", "images/selectscreen_portraits/yuk_silho.tex" ),
   Asset( "ATLAS", "images/selectscreen_portraits/yuk_silho.xml" ),

   Asset( "IMAGE", "bigportraits/yuk.tex" ),
   Asset( "ATLAS", "bigportraits/yuk.xml" ),
   
   Asset("IMAGE", "images/yukicon.tex"),
   Asset("ATLAS", "images/yukicon.xml"),
}

STRINGS.CHARACTER_TITLES.yuk = "The Gap Woman"
STRINGS.CHARACTER_NAMES.yuk = "Yukari"
STRINGS.CHARACTER_DESCRIPTIONS.yuk = "*Can open gaps\n*Sleeps a lot"
STRINGS.CHARACTER_QUOTES.yuk = "\"Ah, how tiresome.\""

table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "yuk")
AddModCharacter("yuk")
AddPrefabPostInit("maxwellintro", CustomIntro)
AddMinimapAtlas("images/yukicon.xml")
