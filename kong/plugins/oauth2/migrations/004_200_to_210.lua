return {
  postgres = {
    up = [[
      DO $$
      BEGIN
        ALTER TABLE IF EXISTS ONLY oauth2_credentials ADD hash_secret BOOLEAN DEFAULT FALSE;
      EXCEPTION WHEN DUPLICATE_COLUMN THEN
        -- Do nothing, accept existing state
      END$$;
    ]],
  },

  cassandra = {
    up = [[
      ALTER TABLE oauth2_credentials ADD hash_secret boolean;
    ]],
  },
}
