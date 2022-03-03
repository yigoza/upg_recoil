Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetCurrentPedWeapon(PlayerPedId()) == false then
			Citizen.Wait(200)
		end
		if IsPedShooting(PlayerPedId()) or IsPedDoingDriveby(PlayerPedId()) then
			local _,wep = GetCurrentPedWeapon(PlayerPedId())
			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if recoils[wep] and recoils[wep] ~= 0 then
				tv = 0
				if GetFollowPedCamViewMode() ~= 4 then
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						SetGameplayCamRelativePitch(p+multiper+recoils[wep], 0.2)

					if RandomXSekme then
						SetGameplayCamRelativeHeading(GetGameplayCamRelativeHeading()- recoils[wep] )
					end

						tv = tv+0.1
					until tv >= recoils[wep]
				else
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						if recoils[wep] > 0.1 then
							SetGameplayCamRelativePitch(p+multiper+recoils[wep], 1.2)
							tv = tv+0.6
							if RandomXSekme then
								SetGameplayCamRelativeHeading(GetGameplayCamRelativeHeading()- recoils[wep] )
							end
						else
							SetGameplayCamRelativePitch(p+multiper+recoils[wep], 0.2)
							tv = tv+0.1
							if RandomXSekme then
								SetGameplayCamRelativeHeading(GetGameplayCamRelativeHeading()- recoils[wep] )
							end
						end
					until tv >= recoils[wep]
				end
			end
		end
	end
end)