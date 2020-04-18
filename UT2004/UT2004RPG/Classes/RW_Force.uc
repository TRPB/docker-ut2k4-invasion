class RW_Force extends RPGWeapon
	HideDropDown
	CacheExempt;

var int LastFlashCount;

function SetModifiedWeapon(Weapon w, bool bIdentify)
{
	Super.SetModifiedWeapon(w, bIdentify);

	if (ProjectileFire(FireMode[0]) != None && ProjectileFire(FireMode[1]) != None)
		AIRatingBonus *= 1.5;
}

static function bool AllowedFor(class<Weapon> Weapon, Pawn Other)
{
	local int x;

	for (x = 0; x < NUM_FIRE_MODES; x++)
		if (class<ProjectileFire>(Weapon.default.FireModeClass[x]) != None)
			return true;

	return false;
}

simulated event WeaponTick(float dt)
{
	local Projectile P;
	local ProjectileSpeedChanger C;

	if ( Role == ROLE_Authority && Instigator != None
	     && (WeaponAttachment(ThirdPersonActor) == None || LastFlashCount != WeaponAttachment(ThirdPersonActor).FlashCount) )
	{
		foreach Instigator.CollidingActors(class'Projectile', P, 200)
			if (P.Instigator == Instigator && P.Speed == P.default.Speed && P.MaxSpeed == P.default.MaxSpeed)
			{
				if (!bIdentified)
					Identify();
				P.Speed *= 1.0 + 0.2 * Modifier;
				P.MaxSpeed *= 1.0 + 0.2 * Modifier;
				P.Velocity *= 1.0 + 0.2 * Modifier;
				if (Level.NetMode != NM_Standalone)
				{
					C = spawn(class'ProjectileSpeedChanger',,,P.Location, P.Rotation);
					if (C != None)
					{
						C.Modifier = Modifier;
						C.ModifiedProjectile = P;
						C.SetBase(P);
						if (P.AmbientSound != None)
						{
							C.AmbientSound = P.AmbientSound;
							C.SoundRadius = P.SoundRadius;
						}
						else
							C.bAlwaysRelevant = true;
					}
				}
			}
		if (WeaponAttachment(ThirdPersonActor) != None)
			LastFlashCount = WeaponAttachment(ThirdPersonActor).FlashCount;
	}

	Super.WeaponTick(dt);
}

defaultproperties
{
	PostFixPos=" of Force"
	MaxModifier=5
	ModifierOverlay=Shader'XGameShaders.PlayerShaders.PlayerTransRed'
	AIRatingBonus=0.02
}
