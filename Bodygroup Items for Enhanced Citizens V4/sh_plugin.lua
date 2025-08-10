-- =============================================================================
-- MINIMAL BODYGROUP TEST PLUGIN
-- File: plugins/bodygroup_manager/sh_plugin.lua
-- =============================================================================

PLUGIN.name = "Minimal Bodygroup Test"
PLUGIN.description = "Basic bodygroup management"
PLUGIN.author = "Test"
PLUGIN.version = "1.0"

if SERVER then
    -- Hook to prevent bodygroup conflicts when equipping items
    function PLUGIN:CanPlayerEquipItem(client, item)
        if item.base ~= "base_outfit" or not item.bodyGroups then
            return
        end
        
        local character = client:GetCharacter()
        if not character then return end
        
        local inventory = character:GetInventory()
        if not inventory then return end
        
        -- Check for bodygroup conflicts with other equipped items
        for _, equippedItem in pairs(inventory:GetItems()) do
            if equippedItem ~= item and equippedItem:GetData("equip") and equippedItem.bodyGroups then
                for bodyGroupId, _ in pairs(item.bodyGroups) do
                    if equippedItem.bodyGroups[bodyGroupId] then
                        return false, "This item conflicts with your " .. equippedItem.name .. ". Unequip it first."
                    end
                end
            end
        end
        
        return true
    end
    
    -- Console command for admins to reset bodygroups
    concommand.Add("ix_resetbodygroups", function(client, cmd, args)
        if not client:IsAdmin() then
            client:Notify("You must be an admin to use this command.")
            return
        end
        
        local target = client
        if args[1] then
            target = ix.util.FindPlayer(args[1])
            if not IsValid(target) then
                client:Notify("Invalid player specified.")
                return
            end
        end
        
        if IsValid(target) then
            target:ResetBodygroups()
            client:Notify("Reset all bodygroups for " .. target:GetName())
        end
    end)
    
    print("[Minimal Bodygroup Test] Plugin loaded!")
end