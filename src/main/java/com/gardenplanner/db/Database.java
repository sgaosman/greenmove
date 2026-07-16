package com.gardenplanner.db;

import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@Component
public class Database {

    private static final String URL = "jdbc:sqlite:garden_planner.db";

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL);
    }

    @PostConstruct
    public void initialise() throws SQLException, IOException {
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement()) {
            stmt.execute("""
                CREATE TABLE IF NOT EXISTS plants (
                    id              INTEGER PRIMARY KEY AUTOINCREMENT,
                    common_name     TEXT NOT NULL,
                    latin_name      TEXT,
                    plant_type      TEXT,
                    description     TEXT,
                    image_url       TEXT,
                    is_indoor       INTEGER DEFAULT 0,
                    purpose         TEXT DEFAULT 'aesthetic'
                )
                """);

            stmt.execute("""
                CREATE TABLE IF NOT EXISTS plant_requirements (
                    plant_id            INTEGER PRIMARY KEY REFERENCES plants(id),
                    min_hardiness       TEXT NOT NULL,
                    soil_types          TEXT,
                    soil_ph             TEXT,
                    drainage            TEXT,
                    min_sun_hours       REAL,
                    sun_preference      TEXT,
                    min_rainfall_mm     REAL,
                    max_rainfall_mm     REAL,
                    pollution_tolerant  INTEGER DEFAULT 1,
                    hard_water_tolerant INTEGER DEFAULT 1
                )
                """);

            stmt.execute("""
                CREATE TABLE IF NOT EXISTS site_profiles (
                    postcode            TEXT PRIMARY KEY,
                    latitude            REAL,
                    longitude           REAL,
                    soil_type           TEXT,
                    soil_drainage       TEXT,
                    soil_ph_range       TEXT,
                    avg_annual_rainfall REAL,
                    avg_sunshine_hours  REAL,
                    winter_min_temp     REAL,
                    rhs_hardiness_zone  TEXT,
                    air_quality_index   INTEGER,
                    water_hardness_ppm  REAL,
                    last_updated        TEXT
                )
                """);

            stmt.execute("""
                CREATE TABLE IF NOT EXISTS plant_toxicity (
                    plant_id    INTEGER NOT NULL REFERENCES plants(id),
                    animal      TEXT NOT NULL,
                    toxic_flag  INTEGER NOT NULL DEFAULT 0,
                    severity    TEXT,
                    notes       TEXT,
                    PRIMARY KEY (plant_id, animal)
                )
                """);

        }

        try (Connection conn = getConnection()) {
            if (countRows(conn, "SELECT COUNT(*) FROM plants") == 0) {
                seedPlants(conn);
                categorizePlants(conn);
            }
        }

        try (Connection conn = getConnection()) {
            if (countRows(conn, "SELECT COUNT(*) FROM plant_toxicity") == 0) {
                seedToxicity(conn);
            }
        }

        try (Connection conn = getConnection()) {
            if (countRows(conn, "SELECT COUNT(*) FROM plants WHERE image_url IS NOT NULL") == 0) {
                executeSqlResource(conn, "/seed_images.sql");
            }
        }
    }

    private int countRows(Connection conn, String sql) throws SQLException {
        try (Statement s = conn.createStatement(); var rs = s.executeQuery(sql)) {
            rs.next();
            return rs.getInt(1);
        }
    }

    private void categorizePlants(Connection conn) throws SQLException {
        try (Statement s = conn.createStatement()) {
            s.execute("UPDATE plants SET purpose = 'edible' WHERE id IN (11,24,25,26,27,28,29,30,31,32,39,40,48,49,59,60,76)");
            s.execute("UPDATE plants SET purpose = 'aromatic' WHERE id IN (1,16,33,64,70)");
            s.execute("UPDATE plants SET purpose = 'functional' WHERE id IN (13,22,34,41,42,43,79,81,82,83,84,85)");
        }
    }

    private void seedPlants(Connection conn) throws SQLException, IOException {
        executeSqlResource(conn, "/seed_plants.sql");
        executeSqlResource(conn, "/seed_gap_plants.sql");
    }

    private void seedToxicity(Connection conn) throws SQLException, IOException {
        executeSqlResource(conn, "/seed_toxicity.sql");
    }

    private void executeSqlResource(Connection conn, String resource) throws SQLException, IOException {
        InputStream is = getClass().getResourceAsStream(resource);
        if (is == null) {
            return;
        }
        String sql = new String(is.readAllBytes(), StandardCharsets.UTF_8);
        try (Statement stmt = conn.createStatement()) {
            for (String statement : sql.split(";")) {
                String trimmed = statement.trim();
                if (!trimmed.isEmpty()) {
                    stmt.execute(trimmed);
                }
            }
        }
    }
}
