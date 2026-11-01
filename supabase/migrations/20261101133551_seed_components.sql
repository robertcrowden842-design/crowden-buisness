/*
# Seed engineering components catalog

## Summary
Inserts a representative set of ~40 engineering components across 8 categories
(Bearings, Fasteners, Motors, Seals, Gears, Sensors, Valves, Couplings) so the
search application has real data to display and filter on. Each row includes
part number, manufacturer, price, stock, rating, material, specs (JSON), and
where applicable an image URL and datasheet URL.

## Data
- 40 component rows spanning the categories above.
- Prices, stock levels, and ratings are realistic for industrial components.
- Specs are stored as JSONB key/value pairs (e.g. {" bore_mm": 25, "outer_mm": 52}).

## Security
- No schema or policy changes — INSERT only.
*/

INSERT INTO components (part_number, name, category, subcategory, manufacturer, description, material, specs, price, stock, rating, image_url, datasheet_url) VALUES
-- Bearings
('BRG-6204-2RS', 'Deep Groove Ball Bearing 6204-2RS', 'Bearings', 'Ball Bearings', 'SKF', 'Sealed deep groove ball bearing for high-speed applications. Low friction, maintenance-free operation.', 'Chrome Steel', '{"bore_mm": 20, "outer_mm": 47, "width_mm": 14, "dynamic_load_kn": 12.7, "static_load_kn": 6.2, "max_rpm": 13000, "seal_type": "2RS"}', 12.50, 340, 4.7, NULL, NULL),
('BRG-6205-ZZ', 'Deep Groove Ball Bearing 6205-ZZ', 'Bearings', 'Ball Bearings', 'NTN', 'Shielded ball bearing suitable for electric motors and general machinery.', 'Chrome Steel', '{"bore_mm": 25, "outer_mm": 52, "width_mm": 15, "dynamic_load_kn": 14.0, "static_load_kn": 6.9, "max_rpm": 12000, "seal_type": "ZZ"}', 14.20, 215, 4.5, NULL, NULL),
('BRG-30205-Tapered', 'Tapered Roller Bearing 30205', 'Bearings', 'Tapered Roller', 'Timken', 'Tapered roller bearing designed for combined radial and axial loads.', 'Case-Hardened Steel', '{"bore_mm": 25, "outer_mm": 52, "width_mm": 16.25, "dynamic_load_kn": 32.0, "static_load_kn": 35.0, "max_rpm": 9000}', 28.75, 128, 4.6, NULL, NULL),
('BRG-22210-CA-W33', 'Spherical Roller Bearing 22210', 'Bearings', 'Spherical Roller', 'FAG', 'Spherical roller bearing with self-aligning capability for heavy-duty applications.', 'Bearing Steel', '{"bore_mm": 50, "outer_mm": 90, "width_mm": 23, "dynamic_load_kn": 133, "static_load_kn": 144, "max_rpm": 7500}', 89.00, 52, 4.4, NULL, NULL),
('BRG-NJ-305-E', 'Cylindrical Roller Bearing NJ 305 E', 'Bearings', 'Cylindrical Roller', 'INA', 'Single-row cylindrical roller bearing for high radial load capacity.', 'Case-Hardened Steel', '{"bore_mm": 25, "outer_mm": 62, "width_mm": 17, "dynamic_load_kn": 39.5, "static_load_kn": 36.5, "max_rpm": 11000}', 42.30, 87, 4.3, NULL, NULL),
('BRG-51208-Thrust', 'Thrust Ball Bearing 51208', 'Bearings', 'Thrust Bearings', 'NSK', 'Axial thrust ball bearing for单向 axial loads in heavy machinery.', 'Chrome Steel', '{"bore_mm": 40, "outer_mm": 68, "width_mm": 19, "dynamic_load_kn": 33.5, "static_load_kn": 87.0, "max_rpm": 3400}', 31.90, 96, 4.2, NULL, NULL),

-- Fasteners
('FST-M8-1.25-50-Bolt', 'Hex Bolt M8 x 1.25 x 50mm', 'Fasteners', 'Hex Bolts', 'Unbrako', 'High-tensile hex head bolt, partially threaded, grade 8.8.', 'Carbon Steel', '{"thread": "M8 x 1.25", "length_mm": 50, "head": "Hex", "grade": "8.8", "tensile_mpa": 800, "finish": "Zinc Plated"}', 0.85, 5000, 4.6, NULL, NULL),
('FST-M10-1.5-60-Bolt', 'Hex Bolt M10 x 1.5 x 60mm', 'Fasteners', 'Hex Bolts', 'Unbrako', 'High-tensile hex head bolt, grade 10.9, fully threaded.', 'Alloy Steel', '{"thread": "M10 x 1.5", "length_mm": 60, "head": "Hex", "grade": "10.9", "tensile_mpa": 1040, "finish": "Black Oxide"}', 1.45, 3200, 4.8, NULL, NULL),
('FST-M6-1.0-Socket-Cap', 'Socket Head Cap Screw M6 x 1.0 x 30mm', 'Fasteners', 'Socket Cap Screws', 'Din 912', 'Allen socket head cap screw, grade 12.9, precision fastening.', 'Alloy Steel', '{"thread": "M6 x 1.0", "length_mm": 30, "head": "Socket Cap", "grade": "12.9", "tensile_mpa": 1220, "finish": "Black Oxide"}', 0.65, 7500, 4.7, NULL, NULL),
('FST-316-SS-Washer-M8', 'Flat Washer M8 - 316 Stainless', 'Fasteners', 'Washers', 'Nord-Lock', 'Corrosion-resistant flat washer for marine and chemical environments.', '316 Stainless Steel', '{"id_mm": 8.4, "od_mm": 16, "thickness_mm": 1.6, "material": "AISI 316", "finish": "Passivated"}', 0.18, 12000, 4.5, NULL, NULL),
('FST-Nyloc-Nut-M10', 'Nylon Insert Lock Nut M10 x 1.5', 'Fasteners', 'Nuts', 'Whittet-Higgins', 'All-metal self-locking nut with nylon insert for vibration resistance.', 'Carbon Steel', '{"thread": "M10 x 1.5", "type": "Nyloc", "grade": "8", "finish": "Zinc Plated"}', 0.42, 4800, 4.4, NULL, NULL),
('FST-M5-Wing-Nut', 'Wing Nut M5 x 0.8', 'Fasteners', 'Nuts', 'Accuride', 'Wing nut for hand-tightening applications.', 'Brass', '{"thread": "M5 x 0.8", "type": "Wing", "finish": "Polished"}', 0.30, 3000, 4.0, NULL, NULL),

-- Motors
('MTR-AC-3PH-1HP', '3-Phase AC Induction Motor 1HP', 'Motors', 'AC Induction', 'Siemens', 'Three-phase AC induction motor, TEFC enclosure, foot-mounted, 4-pole.', 'Cast Iron / Copper', '{"power_hp": 1, "voltage_v": 230, "phases": 3, "rpm": 1725, "frame": "143T", "enclosure": "TEFC", "efficiency": 89.5}', 285.00, 34, 4.6, NULL, NULL),
('MTR-Servo-750W', 'AC Servo Motor 750W', 'Motors', 'Servo', 'Yaskawa', 'High-precision AC servo motor with integrated encoder for automation.', 'Aluminum / Copper', '{"power_w": 750, "voltage_v": 230, "rated_torque_nm": 2.4, "max_rpm": 5000, "encoder": "17-bit", "ip_rating": "IP65"}', 645.00, 18, 4.8, NULL, NULL),
('MTR-Stepper-NEMA23', 'Stepper Motor NEMA 23 - 2.8A', 'Motors', 'Stepper', 'Applied Motion', 'Bipolar stepper motor, 1.8° step angle, for CNC and 3D printer applications.', 'Steel / Copper', '{"frame": "NEMA 23", "step_angle_deg": 1.8, "current_a": 2.8, "holding_torque_kg_cm": 19, "inductance_mh": 2.8}', 72.50, 86, 4.5, NULL, NULL),
('MTR-DC-12V-250W', 'DC Motor 12V 250W', 'Motors', 'DC Motor', 'Baldor', 'Permanent magnet DC motor for automotive and robotics applications.', 'Steel / Copper', '{"voltage_v": 12, "power_w": 250, "rpm": 2750, "torque_nm": 0.9, "shaft_dia_mm": 8}', 94.00, 62, 4.3, NULL, NULL),
('MTR-BLDC-1KW', 'Brushless DC Motor 1kW 48V', 'Motors', 'BLDC', 'Kelly', 'High-efficiency brushless DC motor for e-bikes and small EVs.', 'Aluminum / Copper', '{"voltage_v": 48, "power_w": 1000, "rated_rpm": 3000, "max_rpm": 6000, "ip_rating": "IP67"}', 178.00, 44, 4.7, NULL, NULL),

-- Seals
('SL-OR-32-47-7-NBR', 'Oil Seal 32x47x7 NBR', 'Seals', 'Oil Seals', 'Parker', 'Rotary shaft oil seal with nitrile rubber lip and metal case.', 'NBR / Steel', '{"inner_mm": 32, "outer_mm": 47, "width_mm": 7, "material": "NBR", "temp_range_c": "-30 to 120", "pressure_mpa": 0.05}', 3.85, 2200, 4.3, NULL, NULL),
('SL-OR-40-62-10-VITON', 'Oil Seal 40x62x10 FKM', 'Seals', 'Oil Seals', 'Freudenberg', 'High-temperature rotary shaft seal with Viton (FKM) lip.', 'FKM / Steel', '{"inner_mm": 40, "outer_mm": 62, "width_mm": 10, "material": "FKM", "temp_range_c": "-20 to 200", "pressure_mpa": 0.05}', 6.50, 1450, 4.6, NULL, NULL),
('SL-O-Ring-AS568-024', 'O-Ring AS568-024 NBR', 'Seals', 'O-Rings', 'Apple Rubber', 'Standard AS568 size 024 O-ring for static sealing.', 'NBR', '{"dash_size": "024", "id_mm": 26.7, "cs_mm": 3.53, "material": "NBR 70A", "temp_range_c": "-30 to 120"}', 0.22, 15000, 4.1, NULL, NULL),
('SL-O-Ring-AS568-110', 'O-Ring AS568-110 EPDM', 'Seals', 'O-Rings', 'Parker', 'EPDM O-ring for water and steam applications.', 'EPDM', '{"dash_size": "110", "id_mm": 82.55, "cs_mm": 5.33, "material": "EPDM 70A", "temp_range_c": "-50 to 150"}', 1.85, 3400, 4.4, NULL, NULL),
('SL-Gasket-Custom-Klingersil', 'Gasket Sheet C-4401', 'Seals', 'Gaskets', 'Klinger', 'Compressed fiber gasket sheet for flange sealing in chemicals.', 'Aramid Fiber', '{"thickness_mm": 1.5, "width_mm": 1000, "length_mm": 1000, "material": "Aramid/NBR", "temp_range_c": "-100 to 440"}', 38.50, 120, 4.2, NULL, NULL),

-- Gears
('GR-Spur-M2-Z20', 'Spur Gear Module 2, 20 Teeth', 'Gears', 'Spur Gears', 'KHK', 'Spur gear, module 2, 20 teeth, bore 10mm, steel.', 'Carbon Steel', '{"module": 2, "teeth": 20, "pitch_dia_mm": 40, "bore_mm": 10, "face_width_mm": 20, "material": "S45C"}', 14.75, 540, 4.4, NULL, NULL),
('GR-Helical-M2.5-Z30', 'Helical Gear Module 2.5, 30 Teeth', 'Gears', 'Helical Gears', 'KHK', 'Helical gear for smooth, quiet power transmission.', 'Carbon Steel', '{"module": 2.5, "teeth": 30, "helix_angle_deg": 20, "pitch_dia_mm": 79.7, "bore_mm": 16, "material": "S45C"}', 28.00, 280, 4.5, NULL, NULL),
('GR-Bevel-M3-Z20-Z20', 'Bevel Gear Pair Module 3, 20:20', 'Gears', 'Bevel Gears', 'KHK', 'Straight bevel gear pair, 1:1 ratio, 90° shaft angle.', 'Carbon Steel', '{"module": 3, "teeth_pinion": 20, "teeth_gear": 20, "ratio": "1:1", "shaft_angle_deg": 90, "material": "S45C"}', 72.00, 95, 4.3, NULL, NULL),
('GR-Worm-M4-1-30', 'Worm Gear Set Module 4, 1:30', 'Gears', 'Worm Gears', 'KHK', 'Worm and wheel set, 30:1 reduction ratio for high-torque applications.', 'Bronze / Steel', '{"module": 4, "ratio": "1:30", "worm_starts": 1, "wheel_teeth": 30, "center_dist_mm": 80}', 148.00, 48, 4.6, NULL, NULL),
('GR-Rack-M2-L1000', 'Rack Module 2, 1000mm Length', 'Gears', 'Racks', 'KHK', 'Linear rack for converting rotary to linear motion.', 'Carbon Steel', '{"module": 2, "length_mm": 1000, "width_mm": 20, "height_mm": 15, "material": "S45C"}', 35.50, 160, 4.2, NULL, NULL),

-- Sensors
('SN-PRX-IND-M12', 'Inductive Proximity Sensor M12', 'Sensors', 'Proximity', 'Omron', 'Inductive proximity sensor for non-contact metal detection.', 'Stainless / ABS', '{"type": "Inductive", "diameter_mm": 12, "sensing_range_mm": 4, "voltage_v": "6-30 DC", "output": "PNP NO", "ip_rating": "IP67"}', 24.50, 380, 4.6, NULL, NULL),
('SN-PRX-CAP-M18', 'Capacitive Proximity Sensor M18', 'Sensors', 'Proximity', 'Omron', 'Capacitive sensor for detecting liquids, plastics, and metals.', 'Stainless / PTFE', '{"type": "Capacitive", "diameter_mm": 18, "sensing_range_mm": 10, "voltage_v": "10-36 DC", "output": "PNP NO", "ip_rating": "IP65"}', 38.00, 210, 4.4, NULL, NULL),
('SN-LOAD-CELL-5KG', 'Strain Gauge Load Cell 5kg', 'Sensors', 'Force', 'Mettler Toledo', 'Single-point load cell for bench scales up to 5kg.', 'Aluminum', '{"capacity_kg": 5, "rated_output_mv_v": 2.0, "excitation_v": "5-12 DC", "accuracy": "C3", "material": "Aluminum 2024"}', 42.00, 165, 4.7, NULL, NULL),
('SN-TMP-PT100-RTD', 'PT100 RTD Temperature Sensor', 'Sensors', 'Temperature', 'Endress+Hauser', 'PT100 RTD probe, class A accuracy, stainless sheath.', '316 Stainless Steel', '{"sensor": "PT100", "accuracy": "Class A", "sheath_dia_mm": 6, "length_mm": 100, "connection": "3-wire"}', 28.50, 320, 4.5, NULL, NULL),
('SN-ENCODER-1024', 'Rotary Encoder 1024 PPR', 'Sensors', 'Encoders', 'Baumer', 'Incremental rotary encoder, 1024 pulses per revolution.', 'Aluminum', '{"type": "Incremental", "resolution_ppr": 1024, "shaft_mm": 6, "voltage_v": "5-30 DC", "max_rpm": 6000, "ip_rating": "IP54"}', 95.00, 78, 4.6, NULL, NULL),

-- Valves
('VLV-BALL-1IN-316', 'Ball Valve 1" NPT 316 SS', 'Valves', 'Ball Valves', 'Swagelok', 'Two-piece ball valve, full port, 316 stainless steel body.', '316 Stainless Steel', '{"port": "1 inch NPT", "body_material": "316 SS", "pressure_psi": 1000, "temp_range_c": "-29 to 149", "handle": "Locking Lever"}', 65.00, 140, 4.7, NULL, NULL),
('VLV-SOL-12V-1.2', 'Solenoid Valve 12V DC 1/2"', 'Valves', 'Solenoid Valves', 'ASCO', '2-way normally closed solenoid valve for air and water.', 'Brass', '{"port": "1/2 inch NPT", "voltage_v": 12, "orifice_mm": 7, "pressure_psi": 145, "flow_cv": 1.2, "type": "2/2 NC"}', 48.00, 95, 4.3, NULL, NULL),
('VLV-CHECK-3.4-SS', 'Check Valve 3/4" SS', 'Valves', 'Check Valves', 'Hy-Lok', 'Swing check valve preventing backflow in process lines.', '316 Stainless Steel', '{"port": "3/4 inch NPT", "body_material": "316 SS", "pressure_psi": 3000, "crack_psi": 0.5}', 32.50, 180, 4.2, NULL, NULL),
('VLV-PRV-3.4-BR', 'Pressure Relief Valve 3/4"', 'Valves', 'Relief Valves', 'Watts', 'Adjustable pressure relief valve, brass body.', 'Brass', '{"port": "3/4 inch NPT", "set_pressure_psi": 75, "range_psi": "10-150", "body_material": "Brass"}', 28.75, 220, 4.1, NULL, NULL),

-- Couplings
('CPL-Flex-Jaw-L100', 'Jaw Flexible Coupling L100', 'Couplings', 'Jaw', 'Lovejoy', 'Jaw-type flexible coupling with Buna spider, bore 10mm x 10mm.', 'Aluminum / Buna', '{"type": "Jaw", "size": "L100", "bore_a_mm": 10, "bore_b_mm": 10, "outer_mm": 30, "max_torque_nm": 8, "max_rpm": 12000}', 18.50, 260, 4.4, NULL, NULL),
('CPL-Oldham-6.35', 'Oldham Coupling 1/4"', 'Couplings', 'Oldham', 'Ruland', 'Zero-backlash Oldham coupling for stepper motors.', 'Aluminum / Acetal', '{"type": "Oldham", "bore_a_inch": 0.25, "bore_b_inch": 0.25, "outer_mm": 41, "max_torque_nm": 1.6, "max_rpm": 6000}', 24.00, 175, 4.6, NULL, NULL),
('CPL-Bellows-6.8mm', 'Bellows Coupling 6mm x 8mm', 'Couplings', 'Bellows', 'Ruland', 'High-torsional-stiffness bellows coupling for servos.', 'Stainless Steel', '{"type": "Bellows", "bore_a_mm": 6, "bore_b_mm": 8, "outer_mm": 19, "max_torque_nm": 0.7, "max_rpm": 10000}', 32.00, 130, 4.7, NULL, NULL),
('CPL-Disc-6.8mm', 'Disc Coupling 6mm x 8mm', 'Couplings', 'Disc', 'R+W', 'Metal disc coupling for high-torque servo applications.', 'Stainless Steel', '{"type": "Disc", "bore_a_mm": 6, "bore_b_mm": 8, "outer_mm": 30, "max_torque_nm": 5, "max_rpm": 14000}', 68.00, 72, 4.5, NULL, NULL)
ON CONFLICT (part_number) DO NOTHING;