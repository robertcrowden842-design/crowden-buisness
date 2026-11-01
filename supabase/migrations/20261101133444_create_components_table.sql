/*
# Create engineering components catalog

## Summary
Creates a catalog of engineering components (bearings, fasteners, motors, seals, gears, etc.)
for the Apex Engineering Search application. This is a single-tenant, no-auth app: the catalog
is intentionally public/shared, so anon + authenticated roles can read it.

## New Tables
- `components`
  - `id` (uuid, primary key)
  - `part_number` (text, unique, not null) — manufacturer part number
  - `name` (text, not null) — descriptive name
  - `category` (text, not null) — e.g. Bearings, Fasteners, Motors
  - `subcategory` (text) — finer classification
  - `manufacturer` (text, not null) — brand / OEM
  - `description` (text) — longer description
  - `material` (text) — primary material
  - `specs` (jsonb) — flexible key/value specification pairs
  - `price` (numeric(10,2)) — unit price in USD
  - `stock` (integer, default 0) — units in stock
  - `rating` (numeric(2,1)) — average rating 0–5
  - `image_url` (text) — optional product image URL
  - `datasheet_url` (text) — optional datasheet PDF URL
  - `created_at` (timestamptz, default now())

## Security
- Enable RLS on `components`.
- Grant SELECT to `anon` + `authenticated` so the public catalog is readable.
- Allow anon + authenticated SELECT only (read-only catalog; no writes from the app).

## Indexes
- `idx_components_category` on `category`
- `idx_components_manufacturer` on `manufacturer`
- `idx_components_part_number` on `part_number`
- `idx_components_name_trgm` GIN trigram index on `name` for fuzzy text search
*/

CREATE TABLE IF NOT EXISTS components (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  part_number text UNIQUE NOT NULL,
  name text NOT NULL,
  category text NOT NULL,
  subcategory text,
  manufacturer text NOT NULL,
  description text,
  material text,
  specs jsonb DEFAULT '{}'::jsonb,
  price numeric(10,2),
  stock integer NOT NULL DEFAULT 0,
  rating numeric(2,1) DEFAULT 0,
  image_url text,
  datasheet_url text,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE components ENABLE ROW LEVEL SECURITY;

GRANT SELECT ON components TO anon, authenticated;

DROP POLICY IF EXISTS "anon_select_components" ON components;
CREATE POLICY "anon_select_components"
  ON components FOR SELECT
  TO anon, authenticated USING (true);

CREATE INDEX IF NOT EXISTS idx_components_category ON components (category);
CREATE INDEX IF NOT EXISTS idx_components_manufacturer ON components (manufacturer);
CREATE INDEX IF NOT EXISTS idx_components_part_number ON components (part_number);

-- Trigram index requires the pg_trgm extension
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pg_trgm') THEN
    CREATE EXTENSION pg_trgm;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_components_name_trgm ON components USING GIN (name gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_components_desc_trgm ON components USING GIN (description gin_trgm_ops);
