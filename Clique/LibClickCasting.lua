local LIBCC_MAJOR, LIBCC_MINOR = "LibClickCasting-1.0", 1
local LibCC = LibStub:NewLibrary(LIBCC_MAJOR, LIBCC_MINOR)

if not LibCC then return end -- No upgrade needed

function LibCC:RegisterFrame(frame)
end
