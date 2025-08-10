PLUGIN.name = "Enhanced Citizens .mdls for the Citizen Faction"
PLUGIN.author = "Nuclearbeat"
PLUGIN.description = "Adds the Enhanced Citizen V4 models inplace of the default helix models"
PLUGIN.license = "MIT License"

function PLUGIN:InitializedPlugins()
    local citizenFaction = ix.faction.teams["citizen"]
    
    if citizenFaction then
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
        
        for _, model in ipairs(citizenFaction.models) do
            util.PrecacheModel(model)
        end
        
        function citizenFaction:GetModels(client)
            return self.models
        end
    end
end