math.randomseed(os.clock()*100000000000)
local lastCollectableSpawn = 0
local socket = require 'socket'
local globals = require "globals"
local util = require "util"

local coin = require "objects.coin"
local jumppad = require "objects.jumppad"

Collectable = {}

Collectables = {}
local lastCollectableSpawn = 0

function Collectable:DrawIfCan()
    if ((socket.gettime() - lastCollectableSpawn) > Globals.CollectableInterval) then
        lastCollectableSpawn = socket.gettime()
        local collectable = nil
        local c_to_choose = math.random(0,2)
        if c_to_choose == 1 then
            collectable = Coin
        elseif c_to_choose == 2 then
            if (math.random(0,5) <= 2) then
                collectable = JumpPad
            end
        end
        if collectable ~= nil then
            local newCollectable = {}
            for key, value in pairs(collectable) do
                newCollectable[key] = value
            end
            table.insert(Collectables, newCollectable)
        end
    end
    for key, value in pairs(Collectables) do
        local collectable = value
        collectable.x = collectable.x - Globals.ObjectSpeed
        if collectable.x < (0 - collectable.w) then
            table.remove(Collectables, key)
        else
            if (Util:IsTouchingObjects(collectable.x, collectable.y, collectable) ~= false and collectable.canSpawn) then
                collectable.canSpawn = false
            end
            if (Util:IsTouchingPlayer(collectable.x, collectable.y) and collectable.canSpawn) then
                collectable:OnHit()
            end
            if (collectable.canSpawn) then
                collectable:Draw()
            else
                table.remove(Collectables, key)
            end
        end
    end
end