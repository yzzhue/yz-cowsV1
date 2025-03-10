Config = {}

-- Lokasi NPC untuk mengambil pekerjaan
Config.NPC = {
    coords = vector4(2407.91, 4778.35, 34.50-1, 311.47),
    model = 'a_m_m_farmer_01', -- Model NPC
    label = "Ambil Pekerjaan",
    anim = { dict = 'amb@world_human_clipboard@male@base', anim = 'base' }
}

Config.yzSpawnSapi = {
    vector4(2402.25, 4792.42, 35.27, 39.71),
    vector4(2407.31, 4819.33, 36.75, 16.23),
    vector4(2438.94, 4813.08, 35.19, 222.11),
    vector4(2445.82, 4762.50, 34.30, 189.07),
    vector4(2440.22, 4736.70, 34.29, 171.76),
    vector4(2482.62, 4725.71, 34.29, 155.19)
}

Config.yzJumlahSapi = 5

Config.yzItem = {
    { name = 'meat', count = { min = 3, max = 5 } },
    { name = 'sususapi', count = { min = 1, max = 3 } }
}

Config.yzBlipssapi = {
    sprite = 141,
    color = 5,
    scale = 0.8,
    label = "Sapi"
}