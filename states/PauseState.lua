--[[
Pause State

Freezes game progress -- currently does not continue into the original game
]]

PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
    self.score = params.score
    sounds['music']:pause()
end

function PauseState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('p') then
        sounds['music']:play()
        gStateMachine:change('play', {
                    score = self.score
                })
    end
end

function PauseState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Paused', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press P to Resume', 0, 160, VIRTUAL_WIDTH, 'center')
end