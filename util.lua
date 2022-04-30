Util = {}

function Util:IsTouchingPlayer(x, y)
    local playerX = 50
    local playerY = Player.y
    if ((x > playerX+16 and x < playerX + 48) and (y > playerY and y < playerY + 64)) then
        return true
    end
    return false
end

function Util:IsTouchingObjects(x, y, obj)
    for key, value in pairs(Obstacles) do
        local o = value
        if (o.x >= x-(o.w+10) and o.x <= x+(o.w+10)) then
            if (o.y >= y-(o.h+10) and o.y <= y+(o.h+10)) then
                if (o ~= obj) then
                    return "Obstacle"
                end
            end
        end
    end
    for key, value in pairs(Collectables) do
        local o = value
        if (o.x >= x-(o.w+10) and o.x <= x+(o.w+10)) then
            if (o.y >= y-(o.h+10) and o.y <= y+(o.h+10)) then
                if (o ~= obj) then
                    return "Collectable"
                end
            end
        end
    end
    return false
end