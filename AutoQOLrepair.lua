local frame = CreateFrame("Frame")

-- Function to repair gear
local function AutoRepair()
    local canRepair = CanMerchantRepair()
    local cost = GetRepairAllCost()

    if canRepair and cost > 0 then
        local money = GetMoney()
        if money >= cost then
            RepairAllItems()
            print("Gear repaired for "..GetCoinText(cost, ""))
        else
            print("Not enough money to repair gear.")
        end
    end
end

-- Event handler for interacting with a vendor
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "MERCHANT_SHOW" then
        AutoRepair()
    end
end)

frame:RegisterEvent("MERCHANT_SHOW")