local obs = obslua
local ffi = require("ffi")

-- Put a sound of your choosing next to "Beep on replay save.lua" and don't forget to match its name either in code below or rename your file.
PROP_AUDIO_FILEPATH = script_path() .. "scanner_photo1.wav"

ffi.cdef[[
    bool PlaySound(const char *pszSound, void *hmod, uint32_t fdwSound);
]]

function playsound(filepath)
    os.execute("/usr/bin/play " .. filepath)
end

function on_event(event) 
  if event == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_SAVED 
    then playsound(PROP_AUDIO_FILEPATH) 
  end 
end

function script_load(settings)
  obs.obs_frontend_add_event_callback(on_event)
end

-- This Lua script was downloaded from https://gist.github.com/snakecase/e816384a071cec31efbb4b9e429c108d

-- Credits: upgradeQ (https://gist.github.com/upgradeQ/b2412242d76790d7618d6b0996c4562f), gima (https://gitlab.com/gima/obsnotification)
-- Thank you guys!
-- Modified by Superspeed500 to work on Linux. Requires the package sox.
