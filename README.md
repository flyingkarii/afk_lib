# Kari's AFK Library

## Features
- Every configurable number of seconds, if they still haven't moved count a player as AFK.
- After a configurable number of seconds, call a hook that you can do anything in.
- Currently, this addon has a built-in usage of VoidCases. Please make an issue if you want a version without that.

## Config

- KariAfk.SecondsUntilAfk: the number of seconds of not moving to be considered afk. does not call the hook at this time. (default 900 seconds)
- KariAfk.AFKKeyRewards.SecondsToCheck: the number of seconds to wait before calling the hook, repeats.
- KariAfk.AFKKeyRewards.Chance: the chance for the built-in VoidCases key to be given.
- KariAfk.AFKKeyRewards.JobChances: a table of ['job command'] = chance number
- KariAfk.AFKKeyRewards.UsergroupChances: a table of ['usergroup'] = chance number
- KariAfk.AFKKeyRewards.Detections: a list of the built-in detections for movement, jumping, noclip, and more. 

## Notes
I will likely re-write this soon to be solely an actual AFK library, not a void cases + afk system. It will include repeating afk rewards, actions upon them being set as afk, delayed actions upon being afk, and developer ability to add their own support, including hooks for onAFK and onAFKForTime
