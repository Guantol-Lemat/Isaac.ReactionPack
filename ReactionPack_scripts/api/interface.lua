ReactionPack.Interface = {}

--- @Entry An Entry refers to the value of a table in the key-value pairs
--  The curly braces are not for show, but rather represent the fact that the value Must be a Table.

--- @Costumes An Entry should be formatted like this: {Apply = {Costumes to Apply}, Remove = {Costumes to Remove}}
--  The costumes must be represented by their numerical ID, and not by their path
--  Both Entry.Apply and Entry.Remove can be nil (Entry.Remove = nil) if you have no costumes to Apply or Remove (DO NOT write this: Entry.Remove = {nil})
--- @Tracks An Entry should be formatted like this: {Music Tracks to play}
--  The music tracks must be represented by their Name, as specified in the music.xml file
--- @Sounds An Entry should be formatted like this: {Sounds to Play}
--  The sounds must be represented by their Name, as specified in the sounds.xml file

--- @The_First_Parameter the first parameter of each ADD/EDIT function is a table formatted in this way:
--  local The_First_Parameter = {
--      [Character_ID] = Entry,
--      [Character_ID] = Entry,
--      ...
--  }
--- @NOTE in the case of @Costumes either Apply or Remove can be outright omitted, in that case it will be
--  the same as if Apply/Remove = nil was explicitly written, and instead the Default Apply/Remove is going to be utilized.
--  Essentially writing Apply/Remove = nil would be the same as saying Use Default Apply/Remove

--- @The_Default_Parameter the Default parameter of each ADD function is a table formatted like this:
--  local The_Default_Parameter = Entry
--- This will be used whenever the ID of the character that's currently being played cannot be found in the
--  The_First_Parameter list cannot be found

--- Every ADD function works exactly the same regardless of the set or thing that is being added
--  These functions should only be called before a LATE MC_POST_GAME_STARTED as although
--  the pack will be added, it cannot be accessed by the user in the Settings Menu.
--- @param Costumes-Tracks-Sounds table @see Entry for how to format based on what's being added
--- @param PackName string
--- @param Default table @formatted the same way as a single entry of the Costumes-Tracks-Sounds table
--- The function will FAIL if another Pack with the same PackName has already been added

--- Every EDIT function works exactly the same regardless of the set or thing that is being added
--  These functions should only be called before a LATE MC_POST_GAME_STARTED as although
--  the pack will be added, it cannot be accessed by the user in the Settings Menu.
--- @param Costumes-Tracks-Sounds table @see Entry for how to format based on what's being added
--- @param PackName string
--- @param Overwrite boolean @if an entry for a specific characterID present in the The_First_Parameter
--  is already present in the pack then set this to true if you want to Overwrite it, otherwise it will be
--  skipped.
--- Though it may seem counter intuitive, you can Edit the Default Entry by setting The_First_Parameter as:
--  local The_First_Parameter = {
--      Default = Entry,
--      [Character_ID] = Entry,
--      ...
--  }
--  However in that case Overwrite must be set to true for the changes to be applied

ReactionPack.Interface.AddTraumaCostumePack = ReactionPack.AddTraumaCostumePack

ReactionPack.Interface.EditTraumaCostumePack = ReactionPack.EditTraumaCostumePack

ReactionPack.Interface.AddUghCostumePack = ReactionPack.AddUghCostumePack

ReactionPack.Interface.EditUghCostumePack = ReactionPack.EditUghCostumePack

ReactionPack.Interface.AddNeutralCostumePack = ReactionPack.AddNeutralCostumePack

ReactionPack.Interface.EditNeutralCostumePack = ReactionPack.EditNeutralCostumePack

ReactionPack.Interface.AddPogCostumePack = ReactionPack.AddPogCostumePack

ReactionPack.Interface.EditPogCostumePack = ReactionPack.EditPogCostumePack

ReactionPack.Interface.AddDanceCostumePack = ReactionPack.AddDanceCostumePack

ReactionPack.Interface.EditDanceCostumePack = ReactionPack.EditDanceCostumePack

ReactionPack.Interface.AddTraumaMusicPack = ReactionPack.AddTraumaMusicPack

ReactionPack.Interface.EditTraumaMusicPack = ReactionPack.EditTraumaMusicPack

ReactionPack.Interface.AddUghMusicPack = ReactionPack.AddUghMusicPack

ReactionPack.Interface.EditUghMusicPack = ReactionPack.EditUghMusicPack

ReactionPack.Interface.AddNeutralMusicPack = ReactionPack.AddNeutralMusicPack

ReactionPack.Interface.EditNeutralMusicPack = ReactionPack.EditNeutralMusicPack

ReactionPack.Interface.AddPogMusicPack = ReactionPack.AddPogMusicPack

ReactionPack.Interface.EditPogMusicPack = ReactionPack.EditPogMusicPack

ReactionPack.Interface.AddDanceMusicPack = ReactionPack.AddDanceMusicPack

ReactionPack.Interface.EditDanceMusicPack = ReactionPack.EditDanceMusicPack

ReactionPack.Interface.AddTraumaSoundPack = ReactionPack.AddTraumaSoundPack

ReactionPack.Interface.EditTraumaSoundPack = ReactionPack.EditTraumaSoundPack

ReactionPack.Interface.AddUghSoundPack = ReactionPack.AddUghSoundPack

ReactionPack.Interface.EditUghSoundPack = ReactionPack.EditUghSoundPack

ReactionPack.Interface.AddNeutralSoundPack = ReactionPack.AddNeutralSoundPack

ReactionPack.Interface.EditNeutralSoundPack = ReactionPack.EditNeutralSoundPack

ReactionPack.Interface.AddPogSoundPack = ReactionPack.AddPogSoundPack

ReactionPack.Interface.EditPogSoundPack = ReactionPack.EditPogSoundPack

ReactionPack.Interface.AddDanceSoundPack = ReactionPack.AddDanceSoundPack

ReactionPack.Interface.EditDanceSoundPack = ReactionPack.EditDanceSoundPack