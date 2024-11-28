Config = {}

-- Items required for cuffing/uncuffing
Config.CuffItems = {
    handcuffs = "Hard Cuffs",
    zip_ties = "Soft Cuffs"
}

Config.UncuffItems = {
    handcuff_key = "Handcuff Key",
    scissors = "Scissors"
}

-- Animation configurations
Config.Animations = {
    cuff = {
        soft = { dict = "mp_arresting", anim = "idle", duration = 3000 },
        hard = { dict = "mp_arrest_paired", anim = "cop_p2_back_left", duration = 3000 }
    },
    uncuff = { dict = "mp_arresting", anim = "a_uncuff", duration = 2000 }
}

-- Key restrictions while cuffed
Config.CuffedKeys = {
    soft = { restrictKeys = {"E"}, movement = true }, -- Soft cuffs restrict fewer actions
    hard = { restrictKeys = {"W", "A", "S", "D", "E", "SPACE"}, movement = false } -- Hard cuffs are stricter
}

-- Ox Target Configurations
Config.TargetOptions = {
    cuff_soft = {
        label = "Soft Cuff",
        icon = "fas fa-handcuffs",
        item = "zip_ties"
    },
    cuff_hard = {
        label = "Hard Cuff",
        icon = "fas fa-handcuffs",
        item = "handcuffs"
    },
    uncuff = {
        label = "Uncuff",
        icon = "fas fa-key",
        item = "handcuff_key"
    }
}
