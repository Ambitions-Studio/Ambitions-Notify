local VALID_TYPES = {
    ["success"] = true,
    ["info"] = true,
    ["warning"] = true,
    ["error"] = true
}

local VALID_POSITIONS = {
    ["top-left"] = true,
    ["top-center"] = true,
    ["top-right"] = true,
    ["bottom-left"] = true,
    ["bottom-center"] = true,
    ["bottom-right"] = true
}

local function Notify(notificationTitle, notificationMessage, notificationType, notificationDuration, notificationPosition)
    if not notificationTitle or type(notificationTitle) ~= "string" then
        amb.print.error("[Ambitions-Notify] notificationTitle is required and must be a string")
        return
    end

    if notificationMessage ~= false and type(notificationMessage) ~= "string" then
        amb.print.error("[Ambitions-Notify] notificationMessage must be a string or false")
        return
    end

    if not notificationType or not VALID_TYPES[notificationType] then
        amb.print.error("[Ambitions-Notify] notificationType is required and must be one of: success, info, warning, error")
        return
    end

    if not notificationDuration or type(notificationDuration) ~= "number" then
        amb.print.error("[Ambitions-Notify] notificationDuration is required and must be a number")
        return
    end

    if not notificationPosition or not VALID_POSITIONS[notificationPosition] then
        amb.print.error("[Ambitions-Notify] notificationPosition is required and must be one of: top-left, top-center, top-right, bottom-left, bottom-center, bottom-right")
        return
    end

    local description = nil
    if notificationMessage ~= false then
        description = notificationMessage
    end

    local payload = {
        action = "showNotification",
        data = {
            type = notificationType,
            message = notificationTitle,
            description = description,
            duration = notificationDuration,
            position = notificationPosition
        }
    }

    amb.print.info("[Ambitions-Notify] Sending notification:", notificationTitle)
    SendNUIMessage(payload)
end

exports("Notify", Notify)

RegisterCommand("testnotify", function()
    exports['Ambitions-Notify']:Notify(
        "Test Notification",
        "This is a test notification from Lua!",
        "success",
        4000,
        "top-right"
    )
end, false)