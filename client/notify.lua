local VALID_TYPES = {
    ["success"] = true,
    ["info"] = true,
    ["warning"] = true,
    ["error"] = true,
    ["debug"] = true
}

local VALID_POSITIONS = {
    ["top-left"] = true,
    ["top-center"] = true,
    ["top-right"] = true,
    ["middle-left"] = true,
    ["middle-center"] = true,
    ["middle-right"] = true,
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
        amb.print.error("[Ambitions-Notify] notificationType is required and must be one of: success, info, warning, error, debug")
        return
    end

    if not notificationDuration or type(notificationDuration) ~= "number" then
        amb.print.error("[Ambitions-Notify] notificationDuration is required and must be a number")
        return
    end

    if not notificationPosition or not VALID_POSITIONS[notificationPosition] then
        amb.print.error("[Ambitions-Notify] notificationPosition is required and must be one of: top-left, top-center, top-right, middle-left, middle-center, middle-right, bottom-left, bottom-center, bottom-right")
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

RegisterCommand("testnotify2", function()
    exports['Ambitions-Notify']:Notify(
        "Success Notification",
        "Operation completed successfully!",
        "success",
        5000,
        "top-right"
    )

    exports['Ambitions-Notify']:Notify(
        "Error Notification",
        "Something went wrong, please try again.",
        "error",
        5000,
        "top-right"
    )

    exports['Ambitions-Notify']:Notify(
        "Warning Notification",
        "Please be careful with this action.",
        "warning",
        5000,
        "top-right"
    )

    exports['Ambitions-Notify']:Notify(
        "Info Notification",
        "This is an informational message for you.",
        "info",
        5000,
        "top-right"
    )

    exports['Ambitions-Notify']:Notify(
        "Debug Notification",
        "This is a debug notification for development.",
        "debug",
        5000,
        "top-right"
    )
end, false)