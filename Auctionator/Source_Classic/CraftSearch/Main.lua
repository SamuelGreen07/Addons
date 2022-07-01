-- Add a button to the craft (enchant) frame to search the AH for the reagents.
-- The button (see Source_TBC/CraftSearch/Mixins/Button.lua) will be hidden when
-- the AH is closed.
-- The total price is shown in a FontString next to the button
local addedFunctionality = false
function Auctionator.CraftSearch.InitializeSearchButton()
  if addedFunctionality then
    return
  end

  if CraftFrame then
    addedFunctionality = true

    local buttonFrame = CreateFrame("BUTTON", "AuctionatorCraftFrameSearch", CraftFrame, "AuctionatorCraftSearchButtonTemplate");
  end
end

function Auctionator.CraftSearch.DoCraftReagentsSearch()
  local craftIndex = GetCraftSelectionIndex()
  local craftLink =  GetCraftItemLink(craftIndex)

  local items = {Auctionator.Utilities.GetNameFromLink(craftLink)}

  for reagentIndex = 1, GetCraftNumReagents(craftIndex) do
    local reagentName = GetCraftReagentInfo(craftIndex, reagentIndex)
    table.insert(items, reagentName)
  end

  -- Exact search to avoid spurious results, say with "Runecloth"
  Auctionator.API.v1.MultiSearchExact(AUCTIONATOR_L_REAGENT_SEARCH, items)
end

function Auctionator.CraftSearch.GetCraftReagentsTotal()
  local craftIndex = GetCraftSelectionIndex()
  local craftLink =  GetCraftItemLink(craftIndex)

  local total = 0

  for reagentIndex = 1, GetCraftNumReagents(craftIndex) do
    local multiplier = select(3, GetCraftReagentInfo(craftIndex, reagentIndex))
    local link = GetCraftReagentItemLink(craftIndex, reagentIndex)
    if link ~= nil then
      local unitPrice

      local dbKey = Auctionator.Utilities.BasicDBKeyFromLink(link)
      if AUCTIONATOR_VENDOR_PRICE_CACHE[dbKey] ~= nil then
        unitPrice = AUCTIONATOR_VENDOR_PRICE_CACHE[dbKey]
      else
        unitPrice = Auctionator.API.v1.GetAuctionPriceByItemLink(AUCTIONATOR_L_REAGENT_SEARCH, link)
      end

      if unitPrice ~= nil then
        total = total + multiplier * unitPrice
      end
    end
  end

  return total
end

function Auctionator.CraftSearch.GetInfoText()
  local price = WHITE_FONT_COLOR:WrapTextInColorCode(Auctionator.Utilities.CreateMoneyString(Auctionator.CraftSearch.GetCraftReagentsTotal()))
  return AUCTIONATOR_L_TO_CRAFT_COLON .. " " .. price
end
