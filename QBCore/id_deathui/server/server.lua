local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('hospital:server:SetLaststandStatus', function(isDead)
	local src = source
	TriggerClientEvent('id_deathui:client:onDeath', src, isDead)
	if isDead then
		local isMuted = MumbleIsPlayerMuted(src)
		if isMuted then return end
		Player(src).state.muted = true
		MumbleSetPlayerMuted(src, true)
	end
end)

RegisterNetEvent('id_deathui:server:UnmuteSync')
AddEventHandler('id_deathui:server:UnmuteSync', function()
	local src = source
	local isMuted = MumbleIsPlayerMuted(src)
	if not isMuted then return end
	Player(src).state.muted = false
	MumbleSetPlayerMuted(src, false)
end)
