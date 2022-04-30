Globals = {
    ObjectSpeed = 3,
    ObstacleInterval = 1,
    CollectableInterval = 0.5,
    PlayerHP = 100,
    PlayerCoins = 0,
    DefaultObjSpeed = 3,
    ObjSpdResetTime = 0,
    DefaultColour = {r = 0, g = 0, b = 0},
    PlayerPuzzles = 0,
    ShowHitboxes = false
}

function Globals:SetDefaultColour(r, g, b)
    Globals.DefaultColour.r = r
    Globals.DefaultColour.g = g
    Globals.DefaultColour.b = b
end

function Globals:Reset()
    Globals.PlayerHP = 100
    Globals.PlayerCoins = 0
    Globals.PlayerPuzzles = 0
end