--[[[
@module Deathknight Blood Rotation
@author Conor663
@version 7.0.3
]]--
local spells = kps.spells.deathknight
local env = kps.env.deathknight

kps.rotations.register("DEATHKNIGHT","BLOOD",
{	
	{ spells.gorefiendsGrasp,	'keys.alt'},																				--Gorefiends Grasp
	
    {{"nested"}, 				'kps.interrupt and target.isInterruptable', {												--Interrupts
        {spells.mindFreeze},																								--Mind Freeze
        {spells.asphyxiate, 	'not spells.mindFreeze.isRecastAt("target")'},												--Asphyxiate
    }},
	
	{{"nested"}, 				'kps.multiTarget', {																		--Multi Target
		{ spells.deathStrike,	'player.hp < 0.9', "target" },																--DeathStrike self heal
		{ spells.bloodBoil,		'target.myDebuffDuration(spells.bloodPlague) < 2 and target.distance <= 10', "target" },	--Blood Boil for Blood Plague
		{ spells.deathsCaress,	'target.myDebuffDuration(spells.bloodPlague) < 2 and target.distance > 10', "target" },		--Death's Caress
		{ spells.deathStrike, 	'player.buffDuration(spells.bloodShield) <= 4', "target" },									--DeathStrike no Bloodshield
		{ spells.deathStrike,	'player.runicPower > 60', "target" },														--DeathStrike RP dump
		{ spells.deathAndDecay,	'keys.shift'},																				--Death and Decay
		{ spells.marrowrend,	'player.buffStacks(spells.boneShield) < 5', "target" },										--Marrowrend 5
		{ spells.bloodBoil,		'target.distance <= 10', "target" },														--Blood Boil
		{ spells.marrowrend,	'player.buffStacks(spells.boneShield) < 8', "target" },										--Marrowrend 8
		{ spells.marrowrend, 	'player.buffDuration(spells.boneShield) <= 4', "target" },									--Marrowrend Boneshield dropping off
		{ spells.heartStrike,	'player.buffStacks(spells.boneShield) >= 5', "target" },									--Heart Strike
		{ spells.deathStrike,	"target" },																					--DeathStrike Filler
	}},
	
	{{"nested"}, 				'not kps.multiTarget', {																	--Single Target
		{ spells.deathStrike,	'player.hp < 0.9', "target" },																--DeathStrike self heal
		{ spells.bloodBoil,		'target.myDebuffDuration(spells.bloodPlague) < 2 and target.distance <= 10', "target" },	--Blood Boil for Blood Plague
		{ spells.deathsCaress,	'target.myDebuffDuration(spells.bloodPlague) < 2 and target.distance > 10', "target" },		--Death's Caress
		{ spells.deathStrike, 	'player.buffDuration(spells.bloodShield) <= 4', "target" },									--DeathStrike no Bloodshield
		{ spells.marrowrend,	'player.buffStacks(spells.boneShield) < 5', "target" },										--Marrowrend 5
		{ spells.deathStrike,	'player.runicPower > 60', "target" },														--DeathStrike RP dump
		{ spells.deathAndDecay,	'player.hasBuff(spells.crimsonScourge) and keys.shift'},									--Death and Decay
		{ spells.marrowrend,	'player.buffStacks(spells.boneShield) < 8', "target" },										--Marrowrend 8
		{ spells.marrowrend, 	'player.buffDuration(spells.boneShield) <= 4', "target" },									--Marrowrend Boneshield dropping off
		{ spells.heartStrike,	'player.buffDuration(spells.boneShield) > 6', "target" },									--Heart Strike
		{ spells.deathStrike,	"target" },																					--DeathStrike Filler
	}},
}
,"Blood 7.0.3")
