-- sh_plugin.lua
PLUGIN.name = "Enhanced Citizens .mdls for the Citizen Faction"
PLUGIN.author = "Nuclearbeat"
PLUGIN.description = "Adds the Enhanced Citizen V4 models inplace of the default helix models"
PLUGIN.license = "MIT License"

-- Hook into when factions are loaded to modify the citizen faction
function PLUGIN:InitializedPlugins()
    -- Wait a frame to ensure factions are loaded
    timer.Simple(0, function()
        local citizenFaction = ix.faction.teams["citizen"]
        
        if citizenFaction then
            -- Replace the citizen faction models with Zelpa models
            citizenFaction.models = {
                "models/player/zelpa/male_01.mdl",
                "models/player/zelpa/male_02.mdl",
                "models/player/zelpa/male_03.mdl",
                "models/player/zelpa/male_04.mdl",
                "models/player/zelpa/male_05.mdl",
                "models/player/zelpa/male_06.mdl",
                "models/player/zelpa/male_07.mdl",
                "models/player/zelpa/male_08.mdl",
                "models/player/zelpa/male_09.mdl",
                "models/player/zelpa/male_10.mdl",
                "models/player/zelpa/male_11.mdl",
                "models/player/zelpa/female_01.mdl",
                "models/player/zelpa/female_01_b.mdl",
                "models/player/zelpa/female_02.mdl",
                "models/player/zelpa/female_02_b.mdl",
                "models/player/zelpa/female_03.mdl",
                "models/player/zelpa/female_03_b.mdl",
                "models/player/zelpa/female_04.mdl",
                "models/player/zelpa/female_04_b.mdl",
                "models/player/zelpa/female_06.mdl",
                "models/player/zelpa/female_06_b.mdl",
                "models/player/zelpa/female_07.mdl",
                "models/player/zelpa/female_07_b.mdl"
            }
            
            -- Precache all the models
            for _, model in ipairs(citizenFaction.models) do
                util.PrecacheModel(model)
            end
            
            -- Update the GetModels function
            function citizenFaction:GetModels(client)
                return self.models
            end
            
            print("[EC4CF] Successfully replaced citizen faction models with enhanced models!")
        else
            print("[EC4CF] Error: Could not find citizen faction!")
        end
    end)
end