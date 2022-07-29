math.randomseed(os.clock()*100000000000)
local lastObstacleSpawn = 0
local socket = require 'socket'

local spike = require "objects.spike"
local tree = require "objects.tree"
local snowman = require "objects.snowman"
local crate = require "objects.crate"
local baby = require "objects.baby"
local bird = require "objects.bird"

local globals = require "globals"

Obstacle = {}

Obstacles = {}

function Obstacle:DrawIfChance()
    local obstacle = math.random(0,5)
    if obstacle < 2 then
        if (socket.gettime() - lastObstacleSpawn) > Globals.ObstacleInterval then
            lastObstacleSpawn = socket.gettime()
            local obstacle_to_choose = math.random(0,12)
            local obst = nil
            if obstacle_to_choose == 1 then
                obst = Spike
            elseif obstacle_to_choose == 2 then
                obst = Tree
            elseif obstacle_to_choose == 3 then
                obst = Snowman
            elseif obstacle_to_choose == 4 then
                obst = Crate
            elseif obstacle_to_choose == 5 then
                obst = Baby
            elseif obstacle_to_choose == 6 then
                obst = Bird
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
            local obstacleHit = false
            for ox = 0, obstacle.w, 1 do
                for oy = 0, obstacle.h, 1 do
                    local obx = obstacle.x + ox
                    local oby = obstacle.y + oy
                    if (Util:IsTouchingPlayer(obx, oby) and obstacle.canSpawn) then
                        obstacleHit = true
                    end
                    if (Util:IsTouchingObjects(obx, oby, obstacle) ~= false and obstacle.canSpawn) then
                        if (Util:IsTouchingObjects(obx, oby) == "Obstacle") then
                            obstacle.canSpawn = false
                        end
                    end
                end
            end
            if (obstacleHit) then
                obstacle:OnHit()
            end
            if (obstacle.canSpawn) then
                if (Globals.ShowHitboxes) then
                    love.graphics.setColor(255,0,0)
                    love.graphics.rectangle("fill", obstacle.x, obstacle.y, obstacle.w, obstacle.h)
                    love.graphics.setColor(255,255,255)
                end
                obstacle:Draw()
            else
                table.remove(Obstacles, key)
            end
        end
    end
end