class AbilityHoarding extends RPGAbility
	abstract;

static function bool AbilityIsAllowed(GameInfo Game, MutUT2004RPG RPGMut)
{
	if (Game.IsA('Invasion'))
		return false;

	return true;
}

static simulated function int Cost(RPGPlayerDataObject Data, int CurrentLevel)
{
	if ( Data.WeaponSpeed < 5 || Data.HealthBonus < 5 || Data.AdrenalineMax < 105
	     || Data.Attack < 5 || Data.Defense < 5 || Data.AmmoMax < 5)
		return 0;
	else
		return Super.Cost(Data, CurrentLevel);
}

static function bool OverridePickupQuery(Pawn Other, Pickup item, out byte bAllowPickup, int AbilityLevel)
{
	local Inventory Inv;

	if ( (TournamentHealth(item) != None && Other.Health >= TournamentHealth(item).GetHealMax(Other))
	     || (ShieldPickup(item) != None && Other.ShieldStrength == Other.GetShieldStrengthMax()) )
	{
		//The item won't allow the pickup no matter what we return, and we can't rely on simply reducing
		//Other's health or shield (due to some items having bSuperHeal and others not) so force it manually
		item.AnnouncePickup(Other);
                item.SetRespawn();
		return true;
	}

	if (Ammo(item) != None)
	{
		Inv = Other.FindInventoryType(item.InventoryType);
		if (Inv != None && Ammunition(Inv).AmmoAmount == Ammunition(Inv).MaxAmmo)
			Ammunition(Inv).AmmoAmount -= 1; //force allowed to be picked up by reducing Other's ammo amount (most compatible way)
	}

	return false;
}

defaultproperties
{
	AbilityName="Hoarding"
	Description="Allows you to pick up items even if you don't need them. You need to have at least 5 points in every stat to purchase this ability. (Max Level: 1)"
	StartingCost=25
	CostAddPerLevel=5
	MaxLevel=1
}
