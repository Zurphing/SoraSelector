# SoraSelector
Turns the "Summon Effects" menu into a "Sora Select", allowing you to choose KH1, KH2, or KH3 Sora. Heavy WIP for now. </br>
Credits to Napstio for assisting in getting voices to load from a.us files. </br>


Currently, here's how the mod works: </br>
The options are based on the settings for "Summon Effects"; Auto, Full, and Off. </br>
The models are loaded based on P_EX100, P_EX101, and P_EX103, all playable world variants/drive variants, and the base H_EX500 high poly model. </br>

Voices are loaded from each models a.us file, which points to a file in remastered/obj/xxx.a.us/voice/us/battle. </br>
This currently poses an issue with world-specific quotes like party members, as there is no way to account for using different quotes when in differnt worlds</br>

As a result, an alternate version has been uploaded that will utilize swapping 03sys/ARIF's "Voice" field, to instead load voices per-world. </br>

If you intend on repurposing this mod to use other models, you should provide all gameplay models already as an MDLX, use the included P_EX100.a.us file, and comment out sections in the Lua regarding for example, "P_EX103_NM" </br>
Applying remastered textures to PAX Effects is already handled in the mod.yml. </br>

Note: P_EX100 -> KH2 Sora Option, P_EX101 -> KH1 Sora Option, P_EX103 -> KH3 Sora Option.
