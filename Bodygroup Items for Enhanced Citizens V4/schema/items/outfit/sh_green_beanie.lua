-- =============================================================================
-- GREEN BEANIE ITEM
-- File: schema/items/outfit/sh_green_beanie.lua
-- =============================================================================

ITEM.name = "Green Beanie"
ITEM.description = "A stylish green beanie."
ITEM.model = "models/tnb/items/beanie.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Clothing"
ITEM.base = "base_outfit"

-- Bodygroup configuration - Green beanie
ITEM.bodyGroups = {
    [4] = 2  -- Sets bodygroup 4 (beanies) to submodel 2 (green beanie)
}

-- Optional: Define which player models this works with
ITEM.allowedModels = {
    -- Male models (01-11)
    "models/humans/group01/male_01.mdl",
    "models/humans/group01/male_02.mdl",
    "models/humans/group01/male_03.mdl",
    "models/humans/group01/male_04.mdl",
    "models/humans/group01/male_05.mdl",
    "models/humans/group01/male_06.mdl",
    "models/humans/group01/male_07.mdl",
    "models/humans/group01/male_08.mdl",
    "models/humans/group01/male_09.mdl",
    "models/humans/group01/male_10.mdl",
    "models/humans/group01/male_11.mdl",
    -- Female models (01-07)
    "models/humans/group01/female_01.mdl",
    "models/humans/group01/female_02.mdl",
    "models/humans/group01/female_03.mdl",
    "models/humans/group01/female_04.mdl",
    "models/humans/group01/female_05.mdl",
    "models/humans/group01/female_06.mdl",
    "models/humans/group01/female_07.mdl",
    -- Female _b versions (01-07)
    "models/humans/group01/female_01_b.mdl",
    "models/humans/group01/female_02_b.mdl",
    "models/humans/group01/female_03_b.mdl",
    "models/humans/group01/female_04_b.mdl",
    "models/humans/group01/female_05_b.mdl",
    "models/humans/group01/female_06_b.mdl",
    "models/humans/group01/female_07_b.mdl",
}

-- Function called when item is equipped
function ITEM:OnEquipped(client)
    local character = client:GetCharacter()
    
    -- Apply bodygroup
    if self.bodyGroups then
        for bodyGroupId, subModelId in pairs(self.bodyGroups) do
            client:SetBodygroup(bodyGroupId, subModelId)
        end
    end
    
    -- Store original bodygroups for restoration later (optional)
    if not character:GetData("originalBodygroups") then
        local originalBG = {}
        for bgId = 0, client:GetBodygroupCount() - 1 do
            originalBG[bgId] = client:GetBodygroup(bgId)
        end
        character:SetData("originalBodygroups", originalBG)
    end
end

-- Function called when item is unequipped
function ITEM:OnUnequipped(client)
    -- Reset beanie bodygroup to empty (no hat)
    if self.bodyGroups then
        for bodyGroupId, _ in pairs(self.bodyGroups) do
            client:SetBodygroup(bodyGroupId, 0) -- Reset to default (no beanie)
        end
    end
end

-- Override equip check for model compatibility
function ITEM:CanEquip(client)
    if self.allowedModels then
        local playerModel = client:GetModel()
        for _, allowedModel in ipairs(self.allowedModels) do
            if playerModel == allowedModel then
                return true
            end
        end
        return false, "This beanie doesn't fit your model."
    end
    return true
end