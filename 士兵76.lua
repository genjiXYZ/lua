EnablePrimaryMouseButtonEvents(true)
function OnEvent(event, arg, family)
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    end

    -- 武器按键--
    openkey = 4
    closekey = 5
    if (event == "MOUSE_BUTTON_PRESSED" and arg == openkey) then
        OutputLogMessage("M4 on\n")
        flag = 1
    end
    if (event == "MOUSE_BUTTON_PRESSED" and arg == closekey) then
        OutputLogMessage("M4 off\n")
        flag = 0
    end
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and flag == 1) then
        OutputLogMessage("M4 run\n")
        i = 0
        j = 1
        varsleep = 0
        Click()
    end
end

if (event == "MOUSE_BUTTON_RELEASED" and arg == 1) then
    Stopclick()
end
function Click()
    repeat
        i = i + 1
        if i > 120 then
            varsleep = -8
        elseif i > 60 then
            varsleep = -6
        elseif i > 30 then
            varsleep = -4
        elseif i > 10 then
            varsleep = -2
        end
        PressMouseButton(1)
        MoveMouseRelative(0, 1)
        -- OutputLogMessage(i)
        Sleep(12+varsleep)
    until not IsMouseButtonPressed(1)
end