class AbilityAmmoRegen extends RPGAbility
	abstract;

static simulated function int Cost(RPGPlayerDataObject Data, int CurrentLevel)
{
	if (Data.AmmoMax < 50)
		return 0;
	else
		return Super.Cost(Data, CurrentLevel);
}

static simulated function ModifyPawn(Pawn Other, int AbilityLevel)
{
	local AmmoRegenInv R;
	local Inventory Inv;

	if (Other.Role != ROLE_Authority)
		return;

	//remove old one, if it exists
	//might happen if player levels up this ability while still alive
	Inv = Other.FindInventoryType(class'AmmoRegenInv');
	if (Inv != None)
		Inv.Destroy();

	R = Other.spawn(class'AmmoRegenInv', Other,,,rot(0,0,0));
	R.RegenAmount = AbilityLevel;
	R.GiveTo(Other);
}

defaultproperties
{
	AbilityName="Resupply"
	Description="Adds 1 ammo per level to each ammo type you own every 3 seconds. Does not give ammo to superweapons or the translocator. You must have a Max Ammo stat of at least 50 to purchase this ability. (Max Level: 4)"
	StartingCost=15
	CostAddPerLevel=5
	MaxLevel=4
}
