-- Categorise plants by primary purpose:
--   aesthetic  = ornamental, grown for visual beauty
--   aromatic   = grown for fragrance
--   functional = practical use (air purification, hedging, screening, wildlife habitat)
--   edible     = grown for food (fruit, veg, herbs, seasoning)

-- Edible
UPDATE plants SET purpose = 'edible' WHERE id IN (
    11,  -- Rosemary
    24,  -- Sage
    25,  -- Thyme
    26,  -- Blueberry
    27,  -- Apple Tree
    28,  -- Strawberry
    29,  -- Runner Bean
    30,  -- Courgette
    31,  -- Tomato
    32,  -- Lettuce
    39,  -- Mint
    40,  -- Rhubarb
    48,  -- Basil
    49,  -- Chives
    59,  -- Parsley
    60,  -- Coriander
    76   -- Bilberry
);

-- Aromatic
UPDATE plants SET purpose = 'aromatic' WHERE id IN (
    1,   -- Lavender
    16,  -- Honeysuckle
    33,  -- Sweetpea
    64,  -- Pinks (Dianthus)
    70   -- Meadowsweet
);

-- Functional
UPDATE plants SET purpose = 'functional' WHERE id IN (
    13,  -- Buddleia (butterfly bush - wildlife)
    22,  -- Box (hedging/topiary)
    34,  -- Ivy (ground cover/screening)
    41,  -- Peace Lily (air purification)
    42,  -- Snake Plant (air purification)
    43,  -- Spider Plant (air purification)
    79,  -- Hawthorn (hedging/wildlife)
    81,  -- Scots Pine (windbreak)
    82,  -- Holly (hedging/wildlife)
    83,  -- Privet (hedging)
    84,  -- Pyracantha (security hedging)
    85   -- Cotoneaster (ground cover/wildlife)
);

-- Everything else stays as 'aesthetic' (the default)
