UT2004RPG v2.2
Mutator for UT2004
Created by Mysterial (mysterial@comcast.net)
Special thanks to:
Erik: artifact models and skins
Lordtarac a.k.a John Malm: UT2004RPG website
[LIMB]LightBringer, TheDruidXpawX, and all the players on their servers: testing beta releases
TheDruidXpawX: Healing magic weapon
Matthias Berthold: German translation
Fobos: Spanish translation
2/13/06

NOTE TO SERVER ADMINS: Please read UT2004RPG_ServerAdminReadme.txt before upgrading!

NOTE: This version overwrites previous versions. You will not lose your data.

To install the .ut2mod version, open UT2004RPG.ut2mod, which should open the UT2004 installer.
To install the manual .zip version, extract it to your UT2004 folder. By default that's C:\UT2004.

This mutator adds a persistent levelup system to UT2004. Frags will give you EXP towards a levelup. After a levelup, you get a (configurable) number of points to use on statistics such as weapon speed, health, adrenaline, and damage modifiers, as well as special abilities. Bonus EXP is given for killing players of higher level than you, multikills, sprees, winning a match, and (in properly setup gametypes) scoring game objectives. Everything is saved to .ini and reloaded in future games when that player joins.

The stats are Weapon Speed (%), Starting Health, Max Adrenaline, Damage Bonus (%), Damage Reduction (%), and Max Ammo. There are also 21 special abilities (it may be possible to download more from the Internet)

Bots are supported and will choose certain stats more than others depending on their tendencies (e.g. aggressive bots choose attack-oriented stats most often). They will go for abilities sometimes too.

As if all this wasn't enough, UT2004RPG features magical weapons and artifacts. Any weapon you pick up has a chance of being magical and having special modifiers, such as increased damage. Additionally, artifacts are special pickups placed randomly throughout the level which can be activated to give an ability or bonus. Artifacts consume your Adrenaline when in use.

Online play is fully supported. Player data is protected by unique PlayerID (tied to CD keys) so data stealing and/or impersonation won't happen.

If you use this mutator with Invasion, EXP gained for kills of monsters is equal to the number of points you get for killing them. Monsters are given a level equal to the Wave times two, and all their points are always evenly distributed between Damage Bonus and Damage Reduction.

Vehicles are fully supported. They will take on the advantages of your stats when you enter them. In Assault, unmanned turrets that fire back (for example, the turrets in AS-Mothership) are given a level equal to the lowest level player in the game.

There is a configuration menu for UT2004RPG where you can change many game settings. To access it, go to the Mutator tab, add UT2004RPG to your mutator list, and click the Configure Mutator button. Hover your mouse over any option to get detailed information about what it does.

The source to the abilities, magic weapons, and artifacts has been included in UT2004\UT2004RPG\Classes\ so coders can make their own. All you need to do is create a package with your new ability classes and then add the class names to the bottom of UT2004RPG.ini like has been done for the included abilities.

FAQ
Q: What's the max level? Max stats?
-OR-
Q: UT2004RPG.ini only contains info for 18 levels in the .ini! Is the max level that low?
A: UT2004RPG has no max level or max stat limit. You can go as high as you want. In the .ini, all levels above the highest level listed will require the EXP for that highest level listed.

Q: Why don't I get EXP for scoring in CTF, Double Domination, or Bombing Run?
A: UT2004RPG requires gametypes to use the ScoreObjective() function in order for it to be able to detect scoring events. Unfortunately, CTF, DDOM, and BR were not coded to use that function. Onslaught and Assault do, and so may custom gametypes.

Q: Do players get EXP for teamkills?
A: No.

Q: All of the abilities say "Can't Buy"! WTF?
A: The abilities have requirements, such as being above a certain level or a stat being above a certain number. You can find out any requirements an ability has by clicking the Info button.

Q: I get hitches while playing with UT2004RPG that I don't get when playing the standard game.
A: This is probably caused by autosaving, since it writes to disk. You can try turning autosaving off (set it to 0), but be warned that if you have autosaving off, exiting UT2004 directly from the midgame menu will not save data. This is a UT2004 bug. When autosaving is off always quit to the main menu first, then quit the game from there.

Q: Can I use my save data from UT2003RPG with UT2004RPG?
A: Sorry, no. UT2004RPG saves data differently. The new way is faster and more extendable, but it is not compatible with the old version.

KNOWN ISSUES:
-When you hit someone with a Penetrating weapon, it may appear to spawn two beams, one that hits the target and one that goes through it. It may also appear that the two beams' aims are different. This is a bug in the xEmitter system DE used for most of the weapon effects. Regardless of how it looks, your weapon is always firing exactly where it's supposed to.
-A couple of the options in the mutator configuration menu require the first UT2004 patch to be editable.

You can find the latest version of UT2004RPG at the official website: http://mysterial.linuxgangster.org/UTRPG/

Feel free to discuss this mod on my forums at http://mysterial.linuxgangster.org/forum/ or email me.

MAGIC WEAPON LIST:
-Damage: A weapon with no text, only a + rating (e.g. "Rocket Launcher +3") does 10% more damage for each + (so a Bio Rifle +3 is 30% more damage)
-Protection: you take 10% less damage for each + while holding this weapon.
-Force: Projectiles shot by this weapon are 20% faster for each +
-Piercing: Damage from this weapon ignores shields
-Penetrating: Hitscan shots fired by this weapon go through any players they hit (like the zoom instagib beam does)
-Infinity: This weapon has infinite ammo
-Sturdy: Enemy fire can't push you around while holding this weapon
-Luck: While holding this weapon, fortune smiles upon you. Useful pickups seem to materialize out of thin air in front of you!
-Misfortune: You aren't so lucky with this weapon. For some reason, pickups seem to spontaneously combust right before you get to them
-Poison: This weapon poisons those hit with it, causing additional damage to them over time
-Energy/Draining: This weapon gives/takes adrenaline equal to 2% of the damage caused by it for each +/-
-Healing: Self damage and team damage from this weapon heal instead of hurt. Healing amount is equal to 5% of what the damage would have been for each +

ARTIFACT LIST: (By default, press the bracket keys to switch artifacts and U to use one. Artifacts consume adrenaline while in use)
-Globe of Invulnerability: God mode on command. But watch out - it uses your adrenaline fast!
-Triple Damage: This fabled artifact is the big brother to the double damage
-Boots of Flight: Fly, fly away!
-Lightning Rod: This artifact will strike at your enemies with weak but fast firing lightning bolts so long as they are in your sight. The amount of adrenaline used is proportional to the number of targets in range
-Teleporter: This cousin to the translocator will warp you to a random point
-Summoning Charm: This artifact will summon a monster to aid you. It will follow you around and attack any enemies it sees. The amount of adrenaline used depends on the monster summoned (which is chosen at random)


Changes from v2.1
-Fixed an exploit that allowed a player using the invulnerability artifact to stay invulnerable forever
-Fixed Adrenal Drip ending if the owner used the Redeemer guided fire
-Added German translation

Changes from v2.0
-Fixed bug that caused spawning nonmagical weapons while magic weapons were on to be very slow (performance)
-Fixed headshot bonus EXP being awarded for team damage
-Fixed vampire giving 1 health for hits that don't do any damage
-Fixed healing magic weapon never identifying itself
-Adrenal Drip no longer regenerates adrenaline while the owner has an active artifact
-More checks to prevent Ghost selecting invalid points
-RPG HUD is now properly hidden when the rest of the HUD is (i.e. when using "togglescreenshotmode")
-It is now possible to suicide when being affected by Ghost by using the command "mutate ghostsuicide" or by binding "Suicide Ghost" to a key in the Controls menu
-Fixed ammo issues in netplay when magic weapons are off
-Weapons of Evil's Sentinel Deployer can no longer be magical because the magic weapon code breaks its upgrade menu
-Adjusted Vampirism ability so that the health cap is applied after all abilities, so that if the victim has a matching Retaliation ability that does less or equal damage than the Vampirism effect heals, the attacker will not lose health unless he/she was already above the maximum amount Vampirism will heal
-Ghost ability is now regenerated after an Invasion wave
-Slightly increased Ghost movement speed
-Changed artifact configuration in UT2004RPG.ini so that a Chance can be specified for each artifact (like magic weapons)
-Added ConfigMonsterList array that, if specified in UT2004RPG.ini (under [UT2004RPG.MutUT2004RPG]), will be used for summoning abilities instead of the automatically generated monster list
-Retaliation will no longer kill attackers by itself
-Fixed a no weapon/weapon not firing/weapon stuck firing bug (most frequently occurred when returning from a guided Redeemer missle)
-Fixed weapons with a damage bonus doing 1 point of damage to teammates even when team damage is off
-Fixed a zombie pawn getting left around if a player is in Ghost mode when an Invasion wave ends and revives all the players

Changes from v1.2
-Fixed Cautiousness self-healing exploits
-Fixed Max Ammo stat when magic weapons are turned off
-Fixed Speed Switcher ability when magic weapons are turned off
-Fixed bots getting listed as the highest level player when Fake Bot Levels is on
-Capped bot levels generated in Fake Bot Levels mode to a maximum of 25 levels above the lowest level player
-Fixed Ultima not giving EXP for kills if its owner didn't respawn by the time it went off
-Fixed Teleporter and Summoning Charm sometimes using adrenaline without triggering the effect
-By default, the EXP required for each level now increases by 5 per level forever instead of being capped at 150
-Translocator can no longer be magical because it was confusing the bots
-Increased the size of the EXP bar so the numbers are more readable
-Level/EXP display now adjusts its position/size if necessary to show really high levels
-Added Level/EXP text to stats menu
-Ghost ability causes its owner to drop the flag
-Fixed superweapons being replenished after each Invasion wave if magic weapons were enabled
-Added SuperAmmoClassNames array to UT2004RPG.ini that lists any additional ammo types that should be considered as belonging to a superweapon
-Fixed UDamage Reward mutator causing infinite duration UDamage pickups to be dropped if the victim was using a Triple Damage artifact
-EXP is now awarded for destroying Assault turrets
-EXP for attacking monsters is now awarded by damage and not by kills, so that multiple players attacking a monster will share the EXP (killer always gets at least 1 EXP)
-Damage/kill experience is now shared between linked players
-Changing teams now kills all of that player's summoned monsters
-Changed the summoned monster tinted skin to an emitter effect
-Fixed some issues with artifacts and vehicles
-Added Healing magic weapon, courtesy of Druid
-Restored "Bot Bonus Levels" option since some people prefer it to "Fake Bot Levels"
-Fixed Awareness not drawing health bars for monsters on the local player's team in listen/standalone games
-Ghost no longer activates when killed by falling off of AS-Convoy
-Fixed magic weapon effects being applied to damage that wasn't caused by a weapon
-Fixed summoned monsters not benefiting from summoner's Health Bonus
-Fixed "Reset Player Data Next Game" option not resetting data for players that actually played in the next game

Changes from v1.1
-Fixed Jailbreak
-Fixed ChaosUT
-Failsafe to prevent crashes when playing any other gametypes that destroy pawns without killing them
-Fixed random undesired switching to best weapon when a magic weapon has no ammo (really this time)
-Replaced "Bot Bonus Levels" with "Fake Bot Levels" which turns off saving of bot data and instead simply gives them a level near that of the human player(s)
-Added Ironman mode. If activated, only the winning player/team's data is saved - losers lose the EXP they gained that match (NOTE: In Invasion, players that leave the server midway still get their data saved if the remaining players win)
-Added "Use Official Redirect Server" option. This option, on by default, causes servers to redirect clients to a special official redirect server for UT2004RPG files (all other files continue to use whatever redirect the server admin has set up)

Changes from v1.0
-French translation
-In Invasion, the monsters are now auto adjusted based on the lowest level player that remains alive (previously, it was the lowest level player, period)
-Fixed Invasion monsters only getting levels equal to the Wave instead of levels equal to the Wave times two
-Fixed players killed by enemy Invasion monsters not dropping any artifacts they were carrying
-Fixed bug where if a magical weapon with an overlay effect ran out of ammo on a net client, it would constantly force the owner's weapon to switch to that player's highest priority weapon
-Fixed custom crosshairs with magical weapons
-Fixed super health max not being updated immediately when Health Bonus stat is increased (it was waiting until next respawn)
-Fixed entering/exiting a vehicle with active artifacts would cause those artifacts to stop draining adrenaline
-Fixed player's pawn being left around when becoming a spectator
-Fixed ability level in stats menu not always updating when buying an ability in an instant action game
-Fixed ability list in stats menu resetting to the top after buying something
-Fixed Assault
-Players always get at least 1 experience point for completing a game objective
-The default EXP for winning a match is now 50 (was 10)
-Decreased the default EXP bonus for killing players of a higher level
-Summoned monsters suicide if their Master becomes a spectator or leaves the game
-Summoned monsters only celebrate for their own kills, not their Master's
-Summoned monsters now ignore enemy monsters of the same species
-Fixed infinite recursion crash if a player's own monster knocked the player off the level
-Fixed players being affected by Ghost at the same time the game does a round reset getting screwed up
-Fixed throwing a weapon when having another of the same type but different magical properties would not properly reduce ammo
-No EXP is given for spawn kills
-Possible fix for summoned monsters still not always having tinted skins
-Made summoned monsters' tinted skin in team games be a little more red or blue
	NOTE: You can adjust this in UT2004RPG.ini by creating a new section called [UT2004RPG.FriendlyMonsterSkinner] and adding the lines:
	TeamColor[0]=(R=255,B=150,G=150,A=255)
	TeamColor[1]=(R=150,B=255,G=150,A=255)
	Substituting your own values for R, G, and B within the range 0 to 255.

Changes from UT2003RPG v4.0
-Fixed exchanged fire modes weapon setting not working on magic weapons
-Fixed Denial level 2 not working properly with the minigun if Magical Starting Weapons option was on
-Fixed Damage magic weapon (those with only a plus/minus rating) changing the weapon's damage by the wrong amount
-Fixed RW_Infinity Accessed None
-Fixed Weapons of Evil's PIC having broken zoom if it was magical
-Fixed infinite recursion crashes with Arena mutator and Mutant gametype
-Fixed Rocket Launcher couldn't do homing if it was magical
-Fixed Cautiousness ability could heal you in an instant action game if you were playing at a low bot skill level
-Summoning Charm limited to 4 simultaneous monsters
-Artifacts now display a message when you try to use one without sufficient Adrenaline
-EXP is now awarded for First Blood
-Fixed some hacks that are no longer necessary due to changes from UT2003 to UT2004
-Bonus experience from multikills is now capped to 100 per kill
-Weapon Speed stat capped to 1000 by default for performance reasons
-Damage Bonus and Damage Reduction now only give 0.5% per point instead of 1% per point
-Adjusted experience table to account for the additional EXP bonuses that are now available