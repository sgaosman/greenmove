-- Plant toxicity data for common household pets
-- Sources:
--   ASPCA Animal Poison Control: https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants
--   RHS Potentially Harmful Plants: https://www.rhs.org.uk/prevention-protection/potentially-harmful-garden-plants
--   Blue Cross Pet Poisons: https://www.bluecross.org.uk/advice/cat/poisonous-substances-for-cats
--   Dogs Trust Poisonous Plants: https://www.dogstrust.org.uk/dog-advice/life-with-your-dog/at-home/poisonous-substances
--   RWAF (Rabbit Welfare Association): https://rabbitwelfare.co.uk/rabbit-care-advice/rabbit-diet/safe-foods/
--   The Tortoise Table (safe plant database): https://www.thetortoisetable.org.uk/
--   Poultry Keeper (toxic plants for chickens): https://poultrykeeper.com/feeding-chickens/poisonous-plants-for-chickens/
-- Animals: dog, cat, rabbit, guinea_pig, tortoise, chicken

-- 1. Lavender (Lavandula angustifolia)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (1, 'dog', 1, 'mild', 'Contains linalool and linalyl acetate — may cause nausea and vomiting if consumed in quantity');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (1, 'cat', 1, 'mild', 'Contains linalool — cats lack glucuronidase enzyme making them more sensitive');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (1, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (1, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (1, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (1, 'chicken', 0, NULL, NULL);

-- 2. English Rose (Rosa)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (2, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (2, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (2, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (2, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (2, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (2, 'chicken', 0, NULL, NULL);

-- 3. Rhododendron (Rhododendron ponticum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (3, 'dog', 1, 'severe', 'Contains grayanotoxins — all parts toxic — can cause vomiting, diarrhoea, cardiac failure');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (3, 'cat', 1, 'severe', 'Contains grayanotoxins — all parts toxic — potentially fatal');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (3, 'rabbit', 1, 'severe', 'All parts highly toxic — can be fatal');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (3, 'guinea_pig', 1, 'severe', 'All parts highly toxic — can be fatal');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (3, 'tortoise', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (3, 'chicken', 1, 'severe', 'All parts toxic to poultry');

-- 4. Male Fern (Dryopteris filix-mas)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (4, 'dog', 1, 'moderate', 'Contains filicin compounds — can cause digestive upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (4, 'cat', 1, 'moderate', 'Contains filicin compounds — can cause digestive upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (4, 'rabbit', 1, 'mild', 'Not recommended for rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (4, 'guinea_pig', 1, 'mild', 'Not recommended for guinea pigs');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (4, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (4, 'chicken', 0, NULL, NULL);

-- 5. Clematis (Clematis montana)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (5, 'dog', 1, 'moderate', 'Contains protoanemonin — causes drooling, vomiting, diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (5, 'cat', 1, 'moderate', 'Contains protoanemonin — causes drooling, vomiting, diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (5, 'rabbit', 1, 'moderate', 'Irritant sap — toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (5, 'guinea_pig', 1, 'moderate', 'Irritant sap — toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (5, 'tortoise', 1, 'moderate', 'Irritant — should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (5, 'chicken', 0, NULL, 'Generally avoided by chickens');

-- 6. Hydrangea (Hydrangea macrophylla)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (6, 'dog', 1, 'moderate', 'Contains cyanogenic glycosides — leaves and buds most toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (6, 'cat', 1, 'moderate', 'Contains cyanogenic glycosides — can cause vomiting and lethargy');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (6, 'rabbit', 1, 'moderate', 'Toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (6, 'guinea_pig', 1, 'moderate', 'Toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (6, 'tortoise', 1, 'moderate', 'Should not be fed to tortoises');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (6, 'chicken', 1, 'mild', 'Mildly toxic to poultry');

-- 7. Foxglove (Digitalis purpurea)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (7, 'dog', 1, 'fatal', 'Contains cardiac glycosides (digitoxin) — all parts extremely toxic — can cause cardiac arrest');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (7, 'cat', 1, 'fatal', 'Contains cardiac glycosides — all parts extremely toxic — can cause cardiac arrest');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (7, 'rabbit', 1, 'fatal', 'All parts extremely toxic — can be fatal');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (7, 'guinea_pig', 1, 'fatal', 'All parts extremely toxic — can be fatal');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (7, 'tortoise', 1, 'fatal', 'Extremely toxic to all animals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (7, 'chicken', 1, 'fatal', 'Extremely toxic to poultry');

-- 8. Bluebell (Hyacinthoides non-scripta)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (8, 'dog', 1, 'moderate', 'Contains glycosides — bulbs most toxic — causes vomiting, diarrhoea, lethargy');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (8, 'cat', 1, 'moderate', 'Contains glycosides — all parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (8, 'rabbit', 1, 'moderate', 'Toxic — bulbs especially dangerous');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (8, 'guinea_pig', 1, 'moderate', 'Toxic — should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (8, 'tortoise', 1, 'moderate', 'Toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (8, 'chicken', 1, 'mild', 'Mildly toxic');

-- 9. Wisteria (Wisteria sinensis)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (9, 'dog', 1, 'moderate', 'Seeds and pods contain lectin and wisterin — causes vomiting, diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (9, 'cat', 1, 'moderate', 'Seeds and pods toxic — causes gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (9, 'rabbit', 1, 'moderate', 'Seeds and pods toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (9, 'guinea_pig', 1, 'moderate', 'Seeds and pods toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (9, 'tortoise', 1, 'moderate', 'Toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (9, 'chicken', 1, 'mild', 'Seeds toxic to poultry');

-- 10. Japanese Maple (Acer palmatum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (10, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (10, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (10, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (10, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (10, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (10, 'chicken', 0, NULL, NULL);

-- 11. Rosemary (Salvia rosmarinus)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (11, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (11, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (11, 'rabbit', 0, NULL, 'Safe in small amounts');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (11, 'guinea_pig', 0, NULL, 'Safe in small amounts');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (11, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (11, 'chicken', 0, NULL, NULL);

-- 12. Snowdrop (Galanthus nivalis)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (12, 'dog', 1, 'moderate', 'Contains galantamine and lycorine — bulbs most toxic — causes vomiting, diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (12, 'cat', 1, 'moderate', 'Contains galantamine and lycorine — bulbs most toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (12, 'rabbit', 1, 'moderate', 'Bulbs toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (12, 'guinea_pig', 1, 'moderate', 'Bulbs toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (12, 'tortoise', 1, 'moderate', 'Toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (12, 'chicken', 1, 'mild', 'Bulbs mildly toxic');

-- 13. Buddleia (Buddleja davidii)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (13, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (13, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (13, 'rabbit', 0, NULL, 'Safe — leaves can be offered');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (13, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (13, 'tortoise', 0, NULL, 'Flowers safe for tortoises');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (13, 'chicken', 0, NULL, NULL);

-- 14. Hellebore (Helleborus orientalis)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (14, 'dog', 1, 'severe', 'Contains protoanemonin and helleborin — all parts toxic — causes severe gastrointestinal distress');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (14, 'cat', 1, 'severe', 'All parts toxic — can cause depression, abdominal pain, diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (14, 'rabbit', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (14, 'guinea_pig', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (14, 'tortoise', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (14, 'chicken', 1, 'moderate', 'Toxic to poultry');

-- 15. Camellia (Camellia japonica)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (15, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (15, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (15, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (15, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (15, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (15, 'chicken', 0, NULL, NULL);

-- 16. Honeysuckle (Lonicera periclymenum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (16, 'dog', 1, 'mild', 'Berries mildly toxic — can cause digestive upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (16, 'cat', 1, 'mild', 'Berries mildly toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (16, 'rabbit', 0, NULL, 'Leaves and flowers safe for rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (16, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (16, 'tortoise', 0, NULL, 'Flowers safe for tortoises');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (16, 'chicken', 0, NULL, NULL);

-- 17. Echinacea (Echinacea purpurea)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (17, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (17, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (17, 'rabbit', 0, NULL, 'Safe — sometimes used as herbal supplement');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (17, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (17, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (17, 'chicken', 0, NULL, NULL);

-- 18. Hosta (Hosta)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (18, 'dog', 1, 'mild', 'Contains saponins — causes vomiting, diarrhoea, depression');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (18, 'cat', 1, 'mild', 'Contains saponins — causes vomiting and diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (18, 'rabbit', 0, NULL, 'Safe for rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (18, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (18, 'tortoise', 0, NULL, 'Safe for tortoises');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (18, 'chicken', 0, NULL, NULL);

-- 19. Heather (Calluna vulgaris)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (19, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (19, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (19, 'rabbit', 0, NULL, 'Safe — rabbits enjoy heather');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (19, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (19, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (19, 'chicken', 0, NULL, NULL);

-- 20. Daffodil (Narcissus)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (20, 'dog', 1, 'severe', 'Contains lycorine — bulbs most toxic — causes vomiting, diarrhoea, cardiac arrhythmia');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (20, 'cat', 1, 'severe', 'Contains lycorine — all parts toxic — bulbs especially dangerous');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (20, 'rabbit', 1, 'severe', 'All parts toxic — bulbs especially dangerous');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (20, 'guinea_pig', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (20, 'tortoise', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (20, 'chicken', 1, 'severe', 'Toxic to poultry');

-- 21. Geranium Hardy (Geranium)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (21, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (21, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (21, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (21, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (21, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (21, 'chicken', 0, NULL, NULL);

-- 22. Box (Buxus sempervirens)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (22, 'dog', 1, 'severe', 'Contains steroidal alkaloids — all parts toxic — can cause fatal respiratory failure');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (22, 'cat', 1, 'severe', 'Contains steroidal alkaloids — all parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (22, 'rabbit', 1, 'severe', 'All parts highly toxic — can be fatal');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (22, 'guinea_pig', 1, 'severe', 'All parts highly toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (22, 'tortoise', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (22, 'chicken', 1, 'severe', 'Toxic to poultry');

-- 23. Allium (Allium hollandicum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (23, 'dog', 1, 'severe', 'All Allium species toxic to dogs — causes oxidative damage to red blood cells (Heinz body anaemia)');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (23, 'cat', 1, 'severe', 'Cats especially sensitive to Allium — causes haemolytic anaemia');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (23, 'rabbit', 1, 'moderate', 'Alliums toxic to rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (23, 'guinea_pig', 1, 'moderate', 'Alliums toxic to guinea pigs');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (23, 'tortoise', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (23, 'chicken', 1, 'mild', 'Can taint eggs and cause anaemia in large amounts');

-- 24. Sage (Salvia officinalis)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (24, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (24, 'cat', 0, NULL, 'Safe in small amounts');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (24, 'rabbit', 0, NULL, 'Safe in moderation');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (24, 'guinea_pig', 0, NULL, 'Safe in small amounts');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (24, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (24, 'chicken', 0, NULL, 'Beneficial herb for chickens');

-- 25. Thyme (Thymus vulgaris)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (25, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (25, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (25, 'rabbit', 0, NULL, 'Safe — rabbits enjoy thyme');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (25, 'guinea_pig', 0, NULL, 'Safe in small amounts');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (25, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (25, 'chicken', 0, NULL, 'Beneficial herb for chickens');

-- 26. Blueberry (Vaccinium corymbosum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (26, 'dog', 0, NULL, 'Safe — healthy treat in moderation');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (26, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (26, 'rabbit', 0, NULL, 'Safe as occasional treat');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (26, 'guinea_pig', 0, NULL, 'Safe as occasional treat');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (26, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (26, 'chicken', 0, NULL, 'Safe — chickens enjoy berries');

-- 27. Apple Tree (Malus domestica)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (27, 'dog', 1, 'mild', 'Seeds contain amygdalin (cyanide precursor) — flesh is safe — seeds, leaves and stems toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (27, 'cat', 1, 'mild', 'Seeds, leaves, and stems contain cyanogenic glycosides');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (27, 'rabbit', 1, 'mild', 'Seeds and woody parts contain cyanide — fruit flesh safe');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (27, 'guinea_pig', 1, 'mild', 'Seeds toxic — fruit flesh safe as treat');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (27, 'tortoise', 0, NULL, 'Fruit safe for tortoises');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (27, 'chicken', 0, NULL, 'Fruit safe — avoid large amounts of seeds');

-- 28. Strawberry (Fragaria x ananassa)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (28, 'dog', 0, NULL, 'Safe — healthy treat');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (28, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (28, 'rabbit', 0, NULL, 'Safe as occasional treat');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (28, 'guinea_pig', 0, NULL, 'Safe — good source of vitamin C');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (28, 'tortoise', 0, NULL, 'Safe for tortoises');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (28, 'chicken', 0, NULL, 'Safe — chickens love strawberries');

-- 29. Runner Bean (Phaseolus coccineus)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (29, 'dog', 1, 'moderate', 'Raw beans contain lectin phytohaemagglutinin — must be cooked — raw beans toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (29, 'cat', 1, 'moderate', 'Raw beans toxic due to lectins');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (29, 'rabbit', 1, 'moderate', 'Raw beans toxic — avoid entirely');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (29, 'guinea_pig', 1, 'moderate', 'Raw beans toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (29, 'tortoise', 0, NULL, 'Leaves safe for tortoises');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (29, 'chicken', 1, 'moderate', 'Raw beans toxic to poultry');

-- 30. Courgette (Cucurbita pepo)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (30, 'dog', 0, NULL, 'Safe — healthy vegetable');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (30, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (30, 'rabbit', 0, NULL, 'Safe in moderation');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (30, 'guinea_pig', 0, NULL, 'Safe — good vegetable for guinea pigs');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (30, 'tortoise', 0, NULL, 'Safe for tortoises');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (30, 'chicken', 0, NULL, 'Safe for chickens');

-- 31. Tomato (Solanum lycopersicum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (31, 'dog', 1, 'mild', 'Green parts and unripe fruit contain solanine and tomatine — ripe fruit safe');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (31, 'cat', 1, 'mild', 'Green parts contain solanine — ripe fruit safe in small amounts');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (31, 'rabbit', 1, 'mild', 'Leaves and stems toxic — ripe fruit safe as treat');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (31, 'guinea_pig', 1, 'mild', 'Leaves and stems toxic — ripe fruit safe');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (31, 'tortoise', 0, NULL, 'Ripe fruit safe — avoid leaves');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (31, 'chicken', 0, NULL, 'Ripe fruit safe — avoid green parts');

-- 32. Lettuce (Lactuca sativa)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (32, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (32, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (32, 'rabbit', 0, NULL, 'Safe — staple food but avoid iceberg in excess due to lactucarium');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (32, 'guinea_pig', 0, NULL, 'Safe — good leafy green');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (32, 'tortoise', 0, NULL, 'Safe but low nutritional value');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (32, 'chicken', 0, NULL, 'Safe for chickens');

-- 33. Sweetpea (Lathyrus odoratus)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (33, 'dog', 1, 'moderate', 'Seeds contain lathyrogens — causes weakness, tremors, paralysis if consumed in quantity');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (33, 'cat', 1, 'moderate', 'Seeds toxic — can cause neurological symptoms');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (33, 'rabbit', 1, 'moderate', 'Seeds and pods toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (33, 'guinea_pig', 1, 'moderate', 'Seeds and pods toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (33, 'tortoise', 1, 'mild', 'Seeds should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (33, 'chicken', 1, 'mild', 'Seeds toxic to poultry');

-- 34. Ivy (Hedera helix)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (34, 'dog', 1, 'moderate', 'Contains triterpenoid saponins — leaves and berries toxic — causes drooling, vomiting, diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (34, 'cat', 1, 'moderate', 'Contains triterpenoid saponins — causes gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (34, 'rabbit', 1, 'moderate', 'Toxic — should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (34, 'guinea_pig', 1, 'moderate', 'Toxic — should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (34, 'tortoise', 1, 'moderate', 'Toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (34, 'chicken', 1, 'mild', 'Berries toxic to poultry');

-- 35. Penstemon (Penstemon)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (35, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (35, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (35, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (35, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (35, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (35, 'chicken', 0, NULL, NULL);

-- 36. Crocosmia (Crocosmia)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (36, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (36, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (36, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (36, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (36, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (36, 'chicken', 0, NULL, NULL);

-- 37. Astilbe (Astilbe)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (37, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (37, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (37, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (37, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (37, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (37, 'chicken', 0, NULL, NULL);

-- 38. Primrose (Primula vulgaris)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (38, 'dog', 1, 'mild', 'Contains primulin — may cause mild gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (38, 'cat', 1, 'mild', 'May cause mild gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (38, 'rabbit', 0, NULL, 'Safe for rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (38, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (38, 'tortoise', 0, NULL, 'Safe for tortoises');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (38, 'chicken', 0, NULL, NULL);

-- 39. Mint (Mentha spicata)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (39, 'dog', 0, NULL, 'Safe in moderation');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (39, 'cat', 0, NULL, 'Safe — many cats enjoy mint');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (39, 'rabbit', 0, NULL, 'Safe — rabbits enjoy mint');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (39, 'guinea_pig', 0, NULL, 'Safe in small amounts');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (39, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (39, 'chicken', 0, NULL, 'Beneficial herb for chickens');

-- 40. Rhubarb (Rheum rhabarbarum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (40, 'dog', 1, 'severe', 'Leaves contain high oxalic acid — can cause kidney failure — stalks less dangerous');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (40, 'cat', 1, 'severe', 'Leaves highly toxic due to oxalic acid — can cause kidney failure');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (40, 'rabbit', 1, 'severe', 'Leaves highly toxic — can cause kidney damage');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (40, 'guinea_pig', 1, 'severe', 'Leaves highly toxic due to oxalic acid');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (40, 'tortoise', 1, 'severe', 'Leaves toxic — avoid entirely');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (40, 'chicken', 1, 'severe', 'Leaves toxic to poultry');

-- 41. Peace Lily (Spathiphyllum wallisii)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (41, 'dog', 1, 'moderate', 'Contains calcium oxalate crystals — causes oral irritation, drooling, difficulty swallowing');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (41, 'cat', 1, 'moderate', 'Contains calcium oxalate crystals — causes intense oral burning, drooling');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (41, 'rabbit', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (41, 'guinea_pig', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (41, 'tortoise', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (41, 'chicken', 1, 'mild', 'Mildly toxic');

-- 42. Snake Plant (Dracaena trifasciata)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (42, 'dog', 1, 'mild', 'Contains saponins — causes nausea, vomiting, diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (42, 'cat', 1, 'mild', 'Contains saponins — causes nausea, vomiting, diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (42, 'rabbit', 1, 'mild', 'Contains saponins — should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (42, 'guinea_pig', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (42, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (42, 'chicken', 0, NULL, NULL);

-- 43. Spider Plant (Chlorophytum comosum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (43, 'dog', 0, NULL, 'Non-toxic — safe for pets');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (43, 'cat', 0, NULL, 'Non-toxic but mildly hallucinogenic to cats — may cause mild digestive upset if eaten in quantity');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (43, 'rabbit', 0, NULL, 'Safe for rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (43, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (43, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (43, 'chicken', 0, NULL, NULL);

-- 44. Pothos (Epipremnum aureum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (44, 'dog', 1, 'moderate', 'Contains insoluble calcium oxalate crystals — causes oral pain, drooling, vomiting');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (44, 'cat', 1, 'moderate', 'Contains calcium oxalate crystals — causes intense oral irritation');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (44, 'rabbit', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (44, 'guinea_pig', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (44, 'tortoise', 1, 'moderate', 'Toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (44, 'chicken', 0, NULL, NULL);

-- 45. Monstera (Monstera deliciosa)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (45, 'dog', 1, 'moderate', 'Contains calcium oxalate crystals — causes oral irritation, drooling, vomiting');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (45, 'cat', 1, 'moderate', 'Contains calcium oxalate crystals — causes intense oral burning');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (45, 'rabbit', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (45, 'guinea_pig', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (45, 'tortoise', 1, 'moderate', 'Toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (45, 'chicken', 0, NULL, NULL);

-- 46. Aloe Vera (Aloe barbadensis)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (46, 'dog', 1, 'moderate', 'Contains saponins and anthraquinones — causes vomiting, diarrhoea, lethargy');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (46, 'cat', 1, 'moderate', 'Contains saponins and anthraquinones — causes vomiting, diarrhoea, tremors');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (46, 'rabbit', 1, 'moderate', 'Latex is toxic — should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (46, 'guinea_pig', 1, 'moderate', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (46, 'tortoise', 0, NULL, 'Gel is generally safe');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (46, 'chicken', 0, NULL, NULL);

-- 47. Rubber Plant (Ficus elastica)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (47, 'dog', 1, 'mild', 'Sap can cause skin irritation and mild gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (47, 'cat', 1, 'mild', 'Sap causes oral irritation and gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (47, 'rabbit', 1, 'mild', 'Sap is irritant');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (47, 'guinea_pig', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (47, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (47, 'chicken', 0, NULL, NULL);

-- 48. Basil (Ocimum basilicum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (48, 'dog', 0, NULL, 'Safe for dogs');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (48, 'cat', 0, NULL, 'Safe for cats');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (48, 'rabbit', 0, NULL, 'Safe — rabbits enjoy basil');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (48, 'guinea_pig', 0, NULL, 'Safe — good herb for guinea pigs');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (48, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (48, 'chicken', 0, NULL, 'Safe herb for chickens');

-- 49. Chives (Allium schoenoprasum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (49, 'dog', 1, 'moderate', 'Allium species — causes oxidative damage to red blood cells');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (49, 'cat', 1, 'severe', 'Cats especially sensitive — causes haemolytic anaemia');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (49, 'rabbit', 1, 'moderate', 'Alliums toxic to rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (49, 'guinea_pig', 1, 'moderate', 'Alliums toxic to guinea pigs');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (49, 'tortoise', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (49, 'chicken', 1, 'mild', 'Can taint eggs — avoid in quantity');

-- 50. Orchid Moth (Phalaenopsis)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (50, 'dog', 0, NULL, 'Non-toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (50, 'cat', 0, NULL, 'Non-toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (50, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (50, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (50, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (50, 'chicken', 0, NULL, NULL);

-- 51. ZZ Plant (Zamioculcas zamiifolia)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (51, 'dog', 1, 'moderate', 'Contains calcium oxalate crystals — causes oral irritation and gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (51, 'cat', 1, 'moderate', 'Contains calcium oxalate crystals — causes oral pain, drooling');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (51, 'rabbit', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (51, 'guinea_pig', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (51, 'tortoise', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (51, 'chicken', 0, NULL, NULL);

-- 52. Boston Fern (Nephrolepis exaltata)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (52, 'dog', 0, NULL, 'Non-toxic — one of the safest ferns');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (52, 'cat', 0, NULL, 'Non-toxic — safe houseplant for cat owners');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (52, 'rabbit', 0, NULL, 'Safe for rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (52, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (52, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (52, 'chicken', 0, NULL, NULL);

-- 53. Jade Plant (Crassula ovata)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (53, 'dog', 1, 'moderate', 'Toxic compound unknown — causes vomiting, depression, incoordination');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (53, 'cat', 1, 'moderate', 'Causes vomiting, depression, incoordination');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (53, 'rabbit', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (53, 'guinea_pig', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (53, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (53, 'chicken', 0, NULL, NULL);

-- 54. Calathea (Calathea orbifolia)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (54, 'dog', 0, NULL, 'Non-toxic — safe for pets');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (54, 'cat', 0, NULL, 'Non-toxic — safe for cats');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (54, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (54, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (54, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (54, 'chicken', 0, NULL, NULL);

-- 55. Parlour Palm (Chamaedorea elegans)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (55, 'dog', 0, NULL, 'Non-toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (55, 'cat', 0, NULL, 'Non-toxic — excellent pet-safe houseplant');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (55, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (55, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (55, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (55, 'chicken', 0, NULL, NULL);

-- 56. String of Pearls (Curio rowleyanus)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (56, 'dog', 1, 'moderate', 'Contains pyrrolizidine alkaloids — causes vomiting, diarrhoea, lethargy');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (56, 'cat', 1, 'moderate', 'Toxic — causes drooling, vomiting, diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (56, 'rabbit', 1, 'moderate', 'Toxic — should be kept out of reach');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (56, 'guinea_pig', 1, 'moderate', 'Toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (56, 'tortoise', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (56, 'chicken', 0, NULL, NULL);

-- 57. Chinese Money Plant (Pilea peperomioides)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (57, 'dog', 0, NULL, 'Non-toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (57, 'cat', 0, NULL, 'Non-toxic — safe for cats');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (57, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (57, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (57, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (57, 'chicken', 0, NULL, NULL);

-- 58. Cast Iron Plant (Aspidistra elatior)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (58, 'dog', 0, NULL, 'Non-toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (58, 'cat', 0, NULL, 'Non-toxic — excellent pet-safe houseplant');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (58, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (58, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (58, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (58, 'chicken', 0, NULL, NULL);

-- 59. Parsley (Petroselinum crispum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (59, 'dog', 0, NULL, 'Safe in culinary amounts');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (59, 'cat', 0, NULL, 'Safe in small amounts');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (59, 'rabbit', 0, NULL, 'Safe — rabbits enjoy parsley');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (59, 'guinea_pig', 0, NULL, 'Safe — good source of vitamin C');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (59, 'tortoise', 0, NULL, 'Safe in moderation');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (59, 'chicken', 0, NULL, 'Safe herb for chickens');

-- 60. Coriander (Coriandrum sativum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (60, 'dog', 0, NULL, 'Safe for dogs');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (60, 'cat', 0, NULL, 'Safe for cats');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (60, 'rabbit', 0, NULL, 'Safe — rabbits enjoy coriander');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (60, 'guinea_pig', 0, NULL, 'Safe — good herb for guinea pigs');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (60, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (60, 'chicken', 0, NULL, 'Safe for chickens');

-- 61. Globe Thistle (Echinops ritro)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (61, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (61, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (61, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (61, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (61, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (61, 'chicken', 0, NULL, NULL);

-- 62. Sea Holly (Eryngium maritimum)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (62, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (62, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (62, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (62, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (62, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (62, 'chicken', 0, NULL, NULL);

-- 63. Verbena (Verbena bonariensis)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (63, 'dog', 1, 'mild', 'May cause mild gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (63, 'cat', 1, 'mild', 'May cause mild gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (63, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (63, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (63, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (63, 'chicken', 0, NULL, NULL);

-- 64. Pinks (Dianthus)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (64, 'dog', 1, 'mild', 'May cause mild gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (64, 'cat', 1, 'mild', 'May cause mild gastrointestinal upset and dermatitis');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (64, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (64, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (64, 'tortoise', 0, NULL, 'Flowers safe for tortoises');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (64, 'chicken', 0, NULL, NULL);

-- 65. Stonecrop (Sedum spectabile)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (65, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (65, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (65, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (65, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (65, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (65, 'chicken', 0, NULL, NULL);

-- 66. Bearded Iris (Iris germanica)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (66, 'dog', 1, 'moderate', 'Rhizomes contain irisin — causes vomiting, diarrhoea, drooling');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (66, 'cat', 1, 'moderate', 'Rhizomes most toxic — causes gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (66, 'rabbit', 1, 'moderate', 'Rhizomes toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (66, 'guinea_pig', 1, 'moderate', 'Rhizomes toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (66, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (66, 'chicken', 0, NULL, NULL);

-- 67. Marsh Marigold (Caltha palustris)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (67, 'dog', 1, 'moderate', 'Contains protoanemonin — irritant to mucous membranes');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (67, 'cat', 1, 'moderate', 'Contains protoanemonin — toxic if ingested');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (67, 'rabbit', 1, 'moderate', 'Toxic fresh — less so when dried');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (67, 'guinea_pig', 1, 'moderate', 'Toxic — should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (67, 'tortoise', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (67, 'chicken', 0, NULL, 'Generally avoided by poultry');

-- 68. Siberian Iris (Iris sibirica)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (68, 'dog', 1, 'moderate', 'Rhizomes contain irisin — causes vomiting, diarrhoea');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (68, 'cat', 1, 'moderate', 'Rhizomes most toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (68, 'rabbit', 1, 'moderate', 'Rhizomes toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (68, 'guinea_pig', 1, 'moderate', 'Rhizomes toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (68, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (68, 'chicken', 0, NULL, NULL);

-- 69. Ligularia (Ligularia dentata)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (69, 'dog', 1, 'mild', 'Contains pyrrolizidine alkaloids — toxic in large amounts');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (69, 'cat', 1, 'mild', 'Contains pyrrolizidine alkaloids');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (69, 'rabbit', 1, 'moderate', 'Pyrrolizidine alkaloids particularly harmful to rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (69, 'guinea_pig', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (69, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (69, 'chicken', 1, 'mild', 'Pyrrolizidine alkaloids can accumulate');

-- 70. Meadowsweet (Filipendula ulmaria)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (70, 'dog', 0, NULL, 'Contains salicylates — safe in garden context');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (70, 'cat', 1, 'moderate', 'Contains salicylates — cats cannot metabolise aspirin-like compounds');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (70, 'rabbit', 0, NULL, 'Safe for rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (70, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (70, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (70, 'chicken', 0, NULL, NULL);

-- 71. Purple Loosestrife (Lythrum salicaria)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (71, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (71, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (71, 'rabbit', 0, NULL, 'Safe for rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (71, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (71, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (71, 'chicken', 0, NULL, NULL);

-- 72. Gorse (Ulex europaeus)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (72, 'dog', 0, NULL, 'Spines are physical hazard but plant is not chemically toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (72, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (72, 'rabbit', 0, NULL, 'Safe — rabbits eat gorse in the wild');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (72, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (72, 'tortoise', 0, NULL, 'Flowers safe');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (72, 'chicken', 0, NULL, NULL);

-- 73. Broom (Cytisus scoparius)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (73, 'dog', 1, 'moderate', 'Contains sparteine alkaloid — can affect heart rhythm');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (73, 'cat', 1, 'moderate', 'Contains sparteine — toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (73, 'rabbit', 1, 'moderate', 'Contains toxic alkaloids');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (73, 'guinea_pig', 1, 'moderate', 'Contains toxic alkaloids');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (73, 'tortoise', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (73, 'chicken', 0, NULL, NULL);

-- 74. Pieris (Pieris japonica)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (74, 'dog', 1, 'severe', 'Contains grayanotoxins like rhododendron — all parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (74, 'cat', 1, 'severe', 'Contains grayanotoxins — all parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (74, 'rabbit', 1, 'severe', 'All parts highly toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (74, 'guinea_pig', 1, 'severe', 'All parts highly toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (74, 'tortoise', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (74, 'chicken', 1, 'severe', 'Toxic to poultry');

-- 75. Azalea (Rhododendron Azalea)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (75, 'dog', 1, 'severe', 'Contains grayanotoxins — all parts toxic — can cause cardiac failure');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (75, 'cat', 1, 'severe', 'Contains grayanotoxins — all parts toxic — potentially fatal');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (75, 'rabbit', 1, 'severe', 'All parts highly toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (75, 'guinea_pig', 1, 'severe', 'All parts highly toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (75, 'tortoise', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (75, 'chicken', 1, 'severe', 'Toxic to poultry');

-- 76. Bilberry (Vaccinium myrtillus)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (76, 'dog', 0, NULL, 'Safe — related to blueberry');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (76, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (76, 'rabbit', 0, NULL, 'Safe as occasional treat');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (76, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (76, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (76, 'chicken', 0, NULL, NULL);

-- 77. Silver Birch (Betula pendula)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (77, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (77, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (77, 'rabbit', 0, NULL, 'Safe — rabbits enjoy birch branches');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (77, 'guinea_pig', 0, NULL, 'Branches safe for gnawing');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (77, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (77, 'chicken', 0, NULL, NULL);

-- 78. Rowan (Sorbus aucuparia)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (78, 'dog', 1, 'mild', 'Raw berries contain parasorbic acid — can cause mild digestive upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (78, 'cat', 1, 'mild', 'Raw berries mildly toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (78, 'rabbit', 0, NULL, 'Leaves and bark safe');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (78, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (78, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (78, 'chicken', 0, NULL, 'Berries safe for chickens');

-- 79. Hawthorn (Crataegus monogyna)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (79, 'dog', 0, NULL, 'Berries and leaves non-toxic — thorns are physical hazard');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (79, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (79, 'rabbit', 0, NULL, 'Safe — rabbits enjoy hawthorn leaves');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (79, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (79, 'tortoise', 0, NULL, 'Leaves and berries safe');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (79, 'chicken', 0, NULL, 'Berries safe for chickens');

-- 80. Wild Rose (Rosa canina)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (80, 'dog', 0, NULL, 'Non-toxic — rose hips are safe');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (80, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (80, 'rabbit', 0, NULL, 'Safe — rabbits enjoy rose leaves');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (80, 'guinea_pig', 0, NULL, 'Rose hips good source of vitamin C');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (80, 'tortoise', 0, NULL, 'Flowers and leaves safe');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (80, 'chicken', 0, NULL, NULL);

-- 81. Scots Pine (Pinus sylvestris)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (81, 'dog', 0, NULL, 'Pine needles can cause mild stomach irritation if eaten in quantity');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (81, 'cat', 0, NULL, 'Generally safe — essential oils can be irritating');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (81, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (81, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (81, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (81, 'chicken', 0, NULL, NULL);

-- 82. Holly (Ilex aquifolium)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (82, 'dog', 1, 'moderate', 'Berries contain saponins and methylxanthines — causes vomiting, diarrhoea, drowsiness');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (82, 'cat', 1, 'moderate', 'Berries toxic — causes gastrointestinal upset and depression');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (82, 'rabbit', 1, 'moderate', 'Berries and leaves toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (82, 'guinea_pig', 1, 'moderate', 'Berries and leaves toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (82, 'tortoise', 1, 'moderate', 'Berries toxic — leaves have spines');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (82, 'chicken', 1, 'mild', 'Berries mildly toxic to poultry');

-- 83. Privet (Ligustrum ovalifolium)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (83, 'dog', 1, 'moderate', 'Contains ligustrin glycoside — berries and leaves toxic — causes gastrointestinal upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (83, 'cat', 1, 'moderate', 'Berries and leaves toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (83, 'rabbit', 1, 'moderate', 'Toxic — should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (83, 'guinea_pig', 1, 'moderate', 'Toxic — should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (83, 'tortoise', 1, 'moderate', 'Toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (83, 'chicken', 1, 'mild', 'Berries mildly toxic');

-- 84. Pyracantha (Pyracantha coccinea)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (84, 'dog', 0, NULL, 'Berries non-toxic — thorns are physical hazard');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (84, 'cat', 0, NULL, 'Non-toxic but thorns are hazard');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (84, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (84, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (84, 'tortoise', 0, NULL, 'Berries safe');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (84, 'chicken', 0, NULL, 'Berries safe for chickens');

-- 85. Cotoneaster (Cotoneaster horizontalis)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (85, 'dog', 1, 'mild', 'Berries contain cyanogenic glycosides — mildly toxic in large quantities');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (85, 'cat', 1, 'mild', 'Berries mildly toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (85, 'rabbit', 1, 'mild', 'Berries should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (85, 'guinea_pig', 1, 'mild', 'Berries should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (85, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (85, 'chicken', 0, NULL, NULL);

-- 86. Mahonia (Mahonia aquifolium)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (86, 'dog', 1, 'mild', 'Contains berberine alkaloids — berries mildly toxic in quantity');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (86, 'cat', 1, 'mild', 'Contains berberine — mildly toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (86, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (86, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (86, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (86, 'chicken', 0, NULL, NULL);

-- 87. Bog Rosemary (Andromeda polifolia)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (87, 'dog', 1, 'severe', 'Contains grayanotoxins — related to rhododendron — all parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (87, 'cat', 1, 'severe', 'Contains grayanotoxins — all parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (87, 'rabbit', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (87, 'guinea_pig', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (87, 'tortoise', 1, 'severe', 'All parts toxic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (87, 'chicken', 1, 'severe', 'Toxic to poultry');

-- 88. Ragged Robin (Silene flos-cuculi)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (88, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (88, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (88, 'rabbit', 0, NULL, 'Safe wildflower for rabbits');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (88, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (88, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (88, 'chicken', 0, NULL, NULL);

-- 89. Royal Fern (Osmunda regalis)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (89, 'dog', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (89, 'cat', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (89, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (89, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (89, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (89, 'chicken', 0, NULL, NULL);

-- 90. Prayer Plant (Maranta leuconeura)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (90, 'dog', 0, NULL, 'Non-toxic — safe houseplant');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (90, 'cat', 0, NULL, 'Non-toxic — safe for cats');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (90, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (90, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (90, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (90, 'chicken', 0, NULL, NULL);

-- 91. Tradescantia (Tradescantia zebrina)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (91, 'dog', 1, 'mild', 'Sap can cause skin irritation and mild digestive upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (91, 'cat', 1, 'mild', 'Sap causes skin irritation and allergic dermatitis');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (91, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (91, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (91, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (91, 'chicken', 0, NULL, NULL);

-- 92. Philodendron (Philodendron scandens)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (92, 'dog', 1, 'moderate', 'Contains calcium oxalate crystals — causes oral irritation, drooling, vomiting');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (92, 'cat', 1, 'moderate', 'Contains calcium oxalate crystals — causes intense oral burning');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (92, 'rabbit', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (92, 'guinea_pig', 1, 'moderate', 'Contains calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (92, 'tortoise', 1, 'moderate', 'Toxic if consumed');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (92, 'chicken', 0, NULL, NULL);

-- 93. Dragon Tree (Dracaena marginata)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (93, 'dog', 1, 'moderate', 'Contains saponins — causes vomiting (occasionally with blood), depression, anorexia');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (93, 'cat', 1, 'moderate', 'Contains saponins — causes vomiting, depression, dilated pupils');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (93, 'rabbit', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (93, 'guinea_pig', 1, 'mild', 'Should be avoided');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (93, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (93, 'chicken', 0, NULL, NULL);

-- 94. African Violet (Saintpaulia)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (94, 'dog', 0, NULL, 'Non-toxic — safe for pets');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (94, 'cat', 0, NULL, 'Non-toxic — safe for cats');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (94, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (94, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (94, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (94, 'chicken', 0, NULL, NULL);

-- 95. Nerve Plant (Fittonia albivenis)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (95, 'dog', 0, NULL, 'Non-toxic — safe for pets');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (95, 'cat', 0, NULL, 'Non-toxic — safe for cats');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (95, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (95, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (95, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (95, 'chicken', 0, NULL, NULL);

-- 96. Peperomia (Peperomia obtusifolia)
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (96, 'dog', 0, NULL, 'Non-toxic — safe for pets');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (96, 'cat', 0, NULL, 'Non-toxic — safe for cats');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (96, 'rabbit', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (96, 'guinea_pig', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (96, 'tortoise', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (96, 'chicken', 0, NULL, NULL);

-- Additional animals: bird, horse, snake, pigeon
-- Sources: Avian toxicology databases, BHS (British Horse Society),
-- BSAVA Small Animal Formulary, Pigeon fancier veterinary guides

-- bird
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (1, 'bird', 1, 'mild', 'Essential oils can irritate respiratory system');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (2, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (3, 'bird', 1, 'severe', 'Grayanotoxins cause cardiac and neurological effects');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (4, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (5, 'bird', 1, 'moderate', 'Protoanemonin causes oral and GI irritation');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (6, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (7, 'bird', 1, 'fatal', 'Cardiac glycosides — even small amounts can be lethal to birds');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (8, 'bird', 1, 'moderate', 'Glycosides cause GI distress');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (9, 'bird', 1, 'moderate', 'Seeds and pods contain lectins and glycosides');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (10, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (11, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (12, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (13, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (14, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (15, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (16, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (17, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (18, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (19, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (20, 'bird', 1, 'severe', 'Lycorine and other alkaloids — bulbs especially dangerous');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (21, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (22, 'bird', 1, 'severe', 'Steroidal alkaloids affect nervous system');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (23, 'bird', 1, 'moderate', 'Thiosulphates cause oxidative damage');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (24, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (25, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (26, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (27, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (28, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (29, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (30, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (31, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (32, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (33, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (34, 'bird', 1, 'moderate', 'Saponins and polyacetylene compounds');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (35, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (36, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (37, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (38, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (39, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (40, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (41, 'bird', 1, 'moderate', 'Calcium oxalate crystals irritate crop and GI tract');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (42, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (43, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (44, 'bird', 1, 'moderate', 'Calcium oxalate crystals — common cause of bird poisoning');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (45, 'bird', 1, 'moderate', 'Calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (46, 'bird', 1, 'mild', 'Saponins may cause mild GI upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (47, 'bird', 1, 'mild', 'Latex sap can irritate crop');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (48, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (49, 'bird', 1, 'moderate', 'Thiosulphates — allium family toxic to birds');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (50, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (51, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (52, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (53, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (54, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (55, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (56, 'bird', 1, 'moderate', 'Curcin-type toxins cause vomiting and organ damage');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (57, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (58, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (59, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (60, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (61, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (62, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (63, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (64, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (65, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (66, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (67, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (68, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (69, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (70, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (71, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (72, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (73, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (74, 'bird', 1, 'severe', 'Grayanotoxins — highly toxic to birds');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (75, 'bird', 1, 'severe', 'Grayanotoxins — highly toxic to birds');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (76, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (77, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (78, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (79, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (80, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (81, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (82, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (83, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (84, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (85, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (86, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (87, 'bird', 1, 'severe', 'Grayanotoxins — highly toxic to birds');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (88, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (89, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (90, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (91, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (92, 'bird', 1, 'moderate', 'Calcium oxalate crystals');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (93, 'bird', 1, 'mild', 'Saponins may cause mild GI symptoms');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (94, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (95, 'bird', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (96, 'bird', 0, NULL, NULL);

-- horse
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (1, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (2, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (3, 'horse', 1, 'severe', 'Grayanotoxins cause colic, cardiac arrhythmia, and collapse');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (4, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (5, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (6, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (7, 'horse', 1, 'fatal', 'Cardiac glycosides — small amounts can kill a horse');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (8, 'horse', 1, 'moderate', 'Glycosides cause GI disturbance');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (9, 'horse', 1, 'moderate', 'Seeds and pods contain lectins — causes colic');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (10, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (11, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (12, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (13, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (14, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (15, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (16, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (17, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (18, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (19, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (20, 'horse', 1, 'severe', 'Lycorine alkaloids — bulbs cause severe GI distress and tremors');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (21, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (22, 'horse', 1, 'severe', 'Steroidal alkaloids cause colic, respiratory failure');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (23, 'horse', 1, 'moderate', 'Organosulphides cause haemolytic anaemia');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (24, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (25, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (26, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (27, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (28, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (29, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (30, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (31, 'horse', 1, 'moderate', 'Solanine in leaves and stems — causes GI and neurological signs');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (32, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (33, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (34, 'horse', 1, 'moderate', 'Saponins and falcarinol — causes GI upset and dermatitis');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (35, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (36, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (37, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (38, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (39, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (40, 'horse', 1, 'severe', 'Oxalic acid in leaves causes kidney damage');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (41, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (42, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (43, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (44, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (45, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (46, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (47, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (48, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (49, 'horse', 1, 'moderate', 'Allium family — causes haemolytic anaemia');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (50, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (51, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (52, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (53, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (54, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (55, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (56, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (57, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (58, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (59, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (60, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (61, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (62, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (63, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (64, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (65, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (66, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (67, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (68, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (69, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (70, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (71, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (72, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (73, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (74, 'horse', 1, 'severe', 'Grayanotoxins — highly dangerous to horses');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (75, 'horse', 1, 'severe', 'Grayanotoxins — causes cardiac and GI symptoms');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (76, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (77, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (78, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (79, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (80, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (81, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (82, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (83, 'horse', 1, 'moderate', 'Ligustrin and syringin cause GI upset');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (84, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (85, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (86, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (87, 'horse', 1, 'severe', 'Grayanotoxins — highly dangerous to horses');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (88, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (89, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (90, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (91, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (92, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (93, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (94, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (95, 'horse', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (96, 'horse', 0, NULL, NULL);

-- snake
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (1, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (2, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (3, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (4, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (5, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (6, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (7, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (8, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (9, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (10, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (11, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (12, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (13, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (14, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (15, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (16, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (17, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (18, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (19, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (20, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (21, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (22, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (23, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (24, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (25, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (26, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (27, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (28, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (29, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (30, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (31, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (32, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (33, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (34, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (35, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (36, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (37, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (38, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (39, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (40, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (41, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (42, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (43, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (44, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (45, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (46, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (47, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (48, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (49, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (50, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (51, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (52, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (53, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (54, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (55, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (56, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (57, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (58, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (59, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (60, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (61, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (62, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (63, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (64, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (65, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (66, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (67, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (68, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (69, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (70, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (71, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (72, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (73, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (74, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (75, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (76, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (77, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (78, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (79, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (80, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (81, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (82, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (83, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (84, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (85, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (86, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (87, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (88, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (89, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (90, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (91, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (92, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (93, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (94, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (95, 'snake', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (96, 'snake', 0, NULL, NULL);

-- pigeon
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (1, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (2, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (3, 'pigeon', 1, 'severe', 'Grayanotoxins cause cardiac and neurological effects');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (4, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (5, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (6, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (7, 'pigeon', 1, 'fatal', 'Cardiac glycosides — lethal even in small quantities');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (8, 'pigeon', 1, 'moderate', 'Glycosides cause GI distress');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (9, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (10, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (11, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (12, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (13, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (14, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (15, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (16, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (17, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (18, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (19, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (20, 'pigeon', 1, 'severe', 'Lycorine alkaloids cause severe GI distress');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (21, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (22, 'pigeon', 1, 'moderate', 'Steroidal alkaloids cause GI and neurological signs');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (23, 'pigeon', 1, 'moderate', 'Thiosulphates damage red blood cells');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (24, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (25, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (26, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (27, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (28, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (29, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (30, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (31, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (32, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (33, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (34, 'pigeon', 1, 'mild', 'Saponins may cause mild GI upset if berries ingested');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (35, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (36, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (37, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (38, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (39, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (40, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (41, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (42, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (43, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (44, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (45, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (46, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (47, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (48, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (49, 'pigeon', 1, 'moderate', 'Allium family — causes oxidative damage to red blood cells');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (50, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (51, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (52, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (53, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (54, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (55, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (56, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (57, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (58, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (59, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (60, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (61, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (62, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (63, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (64, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (65, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (66, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (67, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (68, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (69, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (70, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (71, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (72, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (73, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (74, 'pigeon', 1, 'severe', 'Grayanotoxins — dangerous to all birds');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (75, 'pigeon', 1, 'severe', 'Grayanotoxins — dangerous to all birds');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (76, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (77, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (78, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (79, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (80, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (81, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (82, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (83, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (84, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (85, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (86, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (87, 'pigeon', 1, 'severe', 'Grayanotoxins — dangerous to all birds');
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (88, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (89, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (90, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (91, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (92, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (93, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (94, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (95, 'pigeon', 0, NULL, NULL);
INSERT INTO plant_toxicity (plant_id, animal, toxic_flag, severity, notes) VALUES (96, 'pigeon', 0, NULL, NULL);

