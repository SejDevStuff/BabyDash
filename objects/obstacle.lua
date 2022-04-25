math.randomseed(os.clock()*100000000000)
local lastObstacleSpawn = 0
local socket = require 'socket'

local spike = require "objects.spike"
local tree = require "objects.tree"
local snowman = require "objects.snowman"

local globals = require "globals"

Obstacle = {}

Obstacles = {}

function Obstacle:DrawIfChance()
    local obstacle = math.random(0,5)
    if obstacle < 2 then
        if (socket.gettime() - lastObstacleSpawn) > Globals.ObstacleInterval then
            lastObstacleSpawn = socket.gettime()
            local obstacle_to_choose = math.random(0,5)
            local obst = nil
            if obstacle_to_choose == 1 then
                obst = Spike
            elseif obstacle_to_choose == 2 then
                obst = Tree
            elseif obstacle_to_choose == 3 then
                obst = Snowman
            end
            if obst ~= nil then
                local newObstacle = {}
                for key, value in pairs(obst) do
                    newObstacle[key] = value
                end
                table.insert(Obstacles, newObstacle)
            end
        end
    end
    for key, value in pairs(Obstacles) do
        local obstacle = value
        obstacle.x = obstacle.x - Globals.ObjectSpeed
        if obstacle.x < (0 - obstacle.w) then
            table.remove(Obstacles, key)
        else
            if (Util:IsTouchingObjects(obstacle.x, obstacle.y, obstacle) ~= false and obstacle.canSpawn) then
                if (Util:IsTouchingObjects(obstacle.x, obstacle.y) == "Obstacle") then
                    obstacle.canSpawn = false
                end
            end
            if (Util:IsTouchingPlayer(obstacle.x, obstacle.y) and obstacle.canSpawn) then
                obstacle:OnHit()
            end
            if (obstacle.canSpawn) then
                obstacle:Draw()
            else
                table.remove(Obstacles, key)
            end
        end
    end
end