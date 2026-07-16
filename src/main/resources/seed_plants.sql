-- Outdoor garden plants (is_indoor = 0)

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Lavender', 'Lavandula angustifolia', 'perennial', 'Fragrant evergreen shrub with purple flowers. Excellent for borders, paths, and attracting pollinators. Thrives in poor, well-drained soil.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(1, 'H5', 'chalk,loam,sand', 'alkaline,neutral', 'free', 1400, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('English Rose', 'Rosa', 'shrub', 'Classic garden shrub with fragrant blooms from June to October. Grows in most soils with good drainage. Feed regularly for best flowering.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(2, 'H6', 'clay,loam,sand,chalk', 'acid,neutral,alkaline', 'free,moist', 1200, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Rhododendron', 'Rhododendron ponticum', 'shrub', 'Spectacular spring-flowering evergreen shrub. Needs acid soil — will not tolerate chalk or lime. Prefers sheltered, woodland conditions.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(3, 'H6', 'clay,loam,sand', 'acid', 'moist', 1000, 'partial_shade', 0, 0);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Male Fern', 'Dryopteris filix-mas', 'perennial', 'Tough, reliable native fern for shady spots. Tolerates most conditions including pollution and dry shade once established.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(4, 'H7', 'any', 'any', 'moist,free,impeded', NULL, 'full_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Clematis', 'Clematis montana', 'climber', 'Vigorous deciduous climber with masses of white or pink flowers in late spring. Plant with roots in shade and top in sun.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(5, 'H6', 'chalk,clay,loam,sand', 'alkaline,neutral', 'moist,free', 1200, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Hydrangea', 'Hydrangea macrophylla', 'shrub', 'Popular deciduous shrub with large flower heads. Flower colour depends on soil pH — blue in acid soil, pink in alkaline.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(6, 'H5', 'clay,loam,sand', 'acid,neutral,alkaline', 'moist', 1000, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Foxglove', 'Digitalis purpurea', 'biennial', 'Tall native wildflower with tubular flowers loved by bees. Self-seeds freely. All parts are toxic if ingested.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(7, 'H7', 'clay,loam,sand', 'acid,neutral', 'moist,free', 1000, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Bluebell', 'Hyacinthoides non-scripta', 'bulb', 'Iconic native spring bulb forming carpets of blue in woodland. Plant in autumn for spring flowers. Prefers undisturbed soil.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(8, 'H7', 'clay,loam,sand', 'acid,neutral', 'moist', 800, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Wisteria', 'Wisteria sinensis', 'climber', 'Stunning deciduous climber with cascading lilac flower racemes in late spring. Needs a sunny wall and strong support.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(9, 'H5', 'chalk,clay,loam,sand', 'acid,neutral,alkaline', 'free,moist', 1400, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Japanese Maple', 'Acer palmatum', 'tree', 'Elegant small tree with stunning autumn colour. Needs shelter from cold winds and late frosts. Ideal for containers or borders.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(10, 'H5', 'clay,loam,sand', 'acid,neutral', 'moist', 1000, 'partial_shade', 0, 0);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Rosemary', 'Salvia rosmarinus', 'shrub', 'Aromatic evergreen herb. Excellent for cooking, borders, and low hedges. Very drought-tolerant once established.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(11, 'H4', 'chalk,loam,sand', 'alkaline,neutral', 'free', 1400, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Snowdrop', 'Galanthus nivalis', 'bulb', 'First flower of spring, appearing January to March. Naturalises well under deciduous trees. Plant bulbs "in the green" after flowering.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(12, 'H7', 'clay,loam,sand', 'acid,neutral,alkaline', 'moist', 800, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Buddleia', 'Buddleja davidii', 'shrub', 'The butterfly bush — fast-growing deciduous shrub that attracts masses of butterflies. Tolerates poor soil and pollution.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(13, 'H5', 'chalk,clay,loam,sand', 'acid,neutral,alkaline', 'free', 1300, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Hellebore', 'Helleborus orientalis', 'perennial', 'Winter-flowering perennial producing nodding flowers from January to April. Evergreen foliage. Excellent for shade and woodland gardens.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(14, 'H7', 'clay,loam,chalk', 'neutral,alkaline', 'moist', 800, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Camellia', 'Camellia japonica', 'shrub', 'Elegant evergreen shrub with glossy leaves and rose-like flowers from late winter. Must have acid soil and shelter from morning sun.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(15, 'H5', 'loam,sand', 'acid', 'moist', 1000, 'partial_shade', 0, 0);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Honeysuckle', 'Lonicera periclymenum', 'climber', 'Vigorous native climber with intensely fragrant flowers from June to September. Loved by moths and bees. Twines around supports.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(16, 'H6', 'clay,loam,sand,chalk', 'acid,neutral,alkaline', 'moist,free', 1000, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Echinacea', 'Echinacea purpurea', 'perennial', 'Bold daisy-like flowers from July to September. Great for borders and cutting. Attracts bees and butterflies. Drought-tolerant once established.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(17, 'H5', 'loam,sand', 'neutral', 'free', 1300, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Hosta', 'Hosta', 'perennial', 'Shade-loving perennial grown for bold, decorative foliage. Needs moist soil. Protect from slugs and snails which can devastate leaves.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(18, 'H7', 'clay,loam', 'acid,neutral', 'moist', 800, 'full_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Heather', 'Calluna vulgaris', 'shrub', 'Low-growing evergreen shrub with tiny flowers from August to November. Needs acid soil. Excellent ground cover for banks and borders.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(19, 'H7', 'sand,loam', 'acid', 'free', 1200, 'full_sun', 1, 0);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Daffodil', 'Narcissus', 'bulb', 'Cheerful spring bulb with yellow or white trumpet flowers. Naturalises in grass and borders. Plant bulbs September to November.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(20, 'H6', 'clay,loam,sand', 'acid,neutral,alkaline', 'moist,free', 1000, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Geranium (Hardy)', 'Geranium', 'perennial', 'Reliable ground-cover perennial with saucer-shaped flowers all summer. Not to be confused with tender pelargoniums. Very low maintenance.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(21, 'H7', 'chalk,clay,loam,sand', 'acid,neutral,alkaline', 'free,moist', 1000, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Box', 'Buxus sempervirens', 'shrub', 'Classic evergreen hedging and topiary shrub. Dense, compact growth. Tolerates heavy clipping. Susceptible to box blight in wet conditions.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(22, 'H6', 'chalk,clay,loam,sand', 'acid,neutral,alkaline', 'free,moist', 800, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Allium', 'Allium hollandicum', 'bulb', 'Dramatic ornamental onion with large purple globe flowers on tall stems in early summer. Plant bulbs in autumn. Deer and rabbit resistant.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(23, 'H5', 'chalk,loam,sand', 'neutral,alkaline', 'free', 1300, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Sage', 'Salvia officinalis', 'perennial', 'Aromatic culinary herb with grey-green leaves and purple flowers. Evergreen in mild winters. Excellent for Mediterranean-style gardens.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(24, 'H5', 'chalk,loam,sand', 'alkaline,neutral', 'free', 1400, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Thyme', 'Thymus vulgaris', 'perennial', 'Low-growing aromatic herb ideal for paving cracks, rockeries, and herb gardens. Flowers attract bees. Very drought-tolerant.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(25, 'H5', 'chalk,loam,sand', 'alkaline,neutral', 'free', 1400, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Blueberry', 'Vaccinium corymbosum', 'shrub', 'Fruit-bearing deciduous shrub needing acid soil. Attractive autumn colour. Grow in ericaceous compost if garden soil is alkaline.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(26, 'H6', 'loam,sand', 'acid', 'moist', 1200, 'full_sun', 0, 0);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Apple Tree', 'Malus domestica', 'tree', 'Productive fruit tree for most UK gardens. Choose a rootstock to suit your space. Needs a pollination partner or choose a self-fertile variety.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(27, 'H6', 'clay,loam', 'neutral', 'moist,free', 1200, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Strawberry', 'Fragaria x ananassa', 'perennial', 'Easy fruit for borders, containers, or dedicated beds. Plant in spring, harvest June to September. Replace plants every 3 years.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(28, 'H5', 'loam,sand', 'acid,neutral', 'free,moist', 1300, 'full_sun', 0, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Runner Bean', 'Phaseolus coccineus', 'annual', 'Productive climbing vegetable with attractive red flowers. Needs support and regular watering. Sow after last frost in late May.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(29, 'H2', 'clay,loam', 'neutral', 'moist', 1200, 'full_sun', 0, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Courgette', 'Cucurbita pepo', 'annual', 'Prolific summer vegetable — one plant can produce 20+ fruits. Needs rich soil and regular watering. Sow indoors April, plant out after frost.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(30, 'H2', 'loam', 'neutral', 'moist', 1300, 'full_sun', 0, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Tomato', 'Solanum lycopersicum', 'annual', 'Britain''s most popular home-grown crop. Grow in greenhouse, grow bags, or sheltered sunny spot outdoors. Regular feeding essential.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(31, 'H1c', 'loam', 'neutral,acid', 'moist', 1400, 'full_sun', 0, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Lettuce', 'Lactuca sativa', 'annual', 'Quick-growing salad crop ready in 6-10 weeks. Sow successionally March to August for continuous harvest. Tolerates partial shade in summer.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(32, 'H3', 'loam,clay', 'neutral', 'moist', 1000, 'partial_shade', 0, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Sweetpea', 'Lathyrus odoratus', 'annual', 'Fragrant climbing annual for cutting gardens. Sow in autumn or spring. Keep picking flowers to extend the season into autumn.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(33, 'H3', 'clay,loam', 'neutral,alkaline', 'moist', 1200, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Ivy', 'Hedera helix', 'climber', 'Evergreen self-clinging climber. Excellent wildlife plant — flowers feed autumn pollinators, berries feed winter birds. Grows almost anywhere.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(34, 'H7', 'any', 'any', 'any', NULL, 'full_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Penstemon', 'Penstemon', 'perennial', 'Long-flowering border perennial with tubular flowers from July to October. Semi-evergreen. Take cuttings in autumn as insurance against hard winters.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(35, 'H4', 'loam,sand', 'neutral', 'free', 1300, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Crocosmia', 'Crocosmia', 'bulb', 'Fiery orange or red arching flower sprays from July to September. Vigorous and spreading. Good cut flower. Corms multiply quickly.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(36, 'H5', 'clay,loam,sand', 'acid,neutral', 'moist,free', 1200, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Astilbe', 'Astilbe', 'perennial', 'Feathery plume flowers in pink, red, or white from June to August. Thrives in moist, boggy conditions where many plants struggle.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(37, 'H7', 'clay,loam', 'acid,neutral', 'moist,waterlogged', 800, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Primrose', 'Primula vulgaris', 'perennial', 'Cheerful native wildflower with pale yellow blooms from February to May. Self-seeds gently in borders and under hedges. Shade tolerant.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(38, 'H7', 'clay,loam', 'acid,neutral', 'moist', 800, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Mint', 'Mentha spicata', 'perennial', 'Vigorous aromatic herb — grow in a pot to contain spreading roots. Hardy and productive. Fresh leaves far superior to dried.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(39, 'H7', 'any', 'any', 'moist', 1000, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Rhubarb', 'Rheum rhabarbarum', 'perennial', 'Reliable low-maintenance vegetable. Large dramatic leaves. Harvest stems from April to June. Leaves are toxic — only eat the stalks.', 0);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(40, 'H7', 'clay,loam', 'neutral', 'moist', 1000, 'partial_shade', 1, 1);

-- Indoor plants (is_indoor = 1)

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Peace Lily', 'Spathiphyllum wallisii', 'perennial', 'Elegant indoor plant with glossy leaves and white sail-like flowers. Thrives in low light. Excellent air purifier. Keep soil consistently moist.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(41, 'H1b', 'loam', 'neutral', 'moist', NULL, 'full_shade', 1, 0);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Snake Plant', 'Dracaena trifasciata', 'perennial', 'Nearly indestructible houseplant with upright sword-shaped leaves. Tolerates neglect, low light, and irregular watering. Great for beginners.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(42, 'H1b', 'sand,loam', 'neutral', 'free', NULL, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Spider Plant', 'Chlorophytum comosum', 'perennial', 'Easy-care trailing plant that produces baby plantlets on long stems. Good air purifier. Sensitive to fluoride in tap water — use filtered if possible.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(43, 'H1c', 'loam', 'neutral', 'moist,free', NULL, 'partial_shade', 1, 0);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Pothos', 'Epipremnum aureum', 'climber', 'Versatile trailing or climbing vine with heart-shaped leaves. Extremely easy to grow. Can trail from shelves or climb a moss pole.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(44, 'H1b', 'loam', 'neutral', 'moist,free', NULL, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Monstera', 'Monstera deliciosa', 'climber', 'Iconic tropical houseplant with large split leaves. Needs bright indirect light and regular misting. Can grow very large in the right conditions.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(45, 'H1b', 'loam', 'neutral', 'moist', NULL, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Aloe Vera', 'Aloe barbadensis', 'perennial', 'Succulent with medicinal gel inside its thick leaves. Needs bright light and infrequent watering. Excellent on a sunny windowsill.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(46, 'H1c', 'sand', 'neutral', 'free', NULL, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Rubber Plant', 'Ficus elastica', 'tree', 'Bold architectural houseplant with large, glossy dark leaves. Tolerates lower light than most ficus. Wipe leaves occasionally to keep them shiny.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(47, 'H1b', 'loam', 'neutral', 'moist,free', NULL, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Basil', 'Ocimum basilicum', 'annual', 'Aromatic culinary herb perfect for a sunny kitchen windowsill. Pinch out flower buds to keep leaves coming. Needs warmth and regular watering.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(48, 'H1c', 'loam', 'neutral', 'moist', NULL, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Chives', 'Allium schoenoprasum', 'perennial', 'Hardy herb that grows well on a windowsill year-round. Pretty purple flowers in summer. Mild onion flavour for salads and cooking.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(49, 'H1c', 'loam', 'neutral', 'moist', NULL, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Orchid (Moth)', 'Phalaenopsis', 'perennial', 'Popular flowering houseplant with long-lasting blooms. Bright indirect light, weekly watering. Reblooms with correct care — cut spike above a node.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(50, 'H1a', 'loam', 'neutral', 'free', NULL, 'partial_shade', 1, 0);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('ZZ Plant', 'Zamioculcas zamiifolia', 'perennial', 'Tough houseplant with waxy dark green leaves. Thrives on neglect — water sparingly. Tolerates low light well. Very slow-growing.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(51, 'H1b', 'sand,loam', 'neutral', 'free', NULL, 'full_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Boston Fern', 'Nephrolepis exaltata', 'perennial', 'Lush trailing fern ideal for hanging baskets or shelves. Needs high humidity — mist regularly or place in a bathroom. Sensitive to dry air.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(52, 'H1b', 'loam', 'neutral,acid', 'moist', NULL, 'partial_shade', 1, 0);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Jade Plant', 'Crassula ovata', 'perennial', 'Long-lived succulent with thick woody stems and oval fleshy leaves. Easy care, bright light. Can live for decades and develop tree-like form.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(53, 'H1c', 'sand,loam', 'neutral', 'free', NULL, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Calathea', 'Calathea orbifolia', 'perennial', 'Striking tropical plant with patterned round leaves. Needs high humidity and filtered water — chlorine and fluoride cause brown leaf tips.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(54, 'H1a', 'loam', 'neutral,acid', 'moist', NULL, 'partial_shade', 1, 0);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Parlour Palm', 'Chamaedorea elegans', 'tree', 'Compact slow-growing palm perfect for tabletops and desks. Tolerates low light and central heating. One of the easiest palms to grow indoors.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(55, 'H1b', 'loam', 'neutral', 'moist', NULL, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('String of Pearls', 'Curio rowleyanus', 'perennial', 'Unusual trailing succulent with bead-like leaves. Needs bright light and well-draining soil. Water sparingly — very prone to overwatering rot.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(56, 'H1c', 'sand', 'neutral', 'free', NULL, 'full_sun', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Chinese Money Plant', 'Pilea peperomioides', 'perennial', 'Trendy houseplant with round pancake-shaped leaves. Easy to propagate — produces many offsets. Bright indirect light and well-drained soil.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(57, 'H1c', 'loam', 'neutral', 'free', NULL, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Cast Iron Plant', 'Aspidistra elatior', 'perennial', 'Virtually indestructible Victorian favourite. Tolerates deep shade, neglect, dust, and temperature fluctuations. Slow-growing but long-lived.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(58, 'H1c', 'any', 'any', 'moist,free', NULL, 'full_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Parsley', 'Petroselinum crispum', 'biennial', 'Essential kitchen herb that grows well on a bright windowsill. Flat-leaf varieties have stronger flavour than curly. Sow seed directly.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(59, 'H1c', 'loam', 'neutral', 'moist', NULL, 'partial_shade', 1, 1);

INSERT INTO plants (common_name, latin_name, plant_type, description, is_indoor) VALUES
('Coriander', 'Coriandrum sativum', 'annual', 'Fast-growing herb for Asian and Mexican cooking. Bolts quickly in heat — sow little and often. Cooler windowsills extend the harvest period.', 1);
INSERT INTO plant_requirements (plant_id, min_hardiness, soil_types, soil_ph, drainage, min_sun_hours, sun_preference, pollution_tolerant, hard_water_tolerant) VALUES
(60, 'H1c', 'loam', 'neutral', 'moist', NULL, 'partial_shade', 1, 1);
