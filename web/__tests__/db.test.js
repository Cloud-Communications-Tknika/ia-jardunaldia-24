const { getHiriak } = require("../db");

// Mock SQLite response
jest.mock("sqlite3", () => ({
  verbose: () => ({
    Database: jest.fn(() => ({
      all: jest.fn((query, params, callback) => {
        callback(null, [
          { id: "H1", izena: "Bilbo", probintzia: "Bizkaia" },
          { id: "H2", izena: "Donostia", probintzia: "Gipuzkoa" },
          { id: "H3", izena: "Gasteiz", probintzia: "Araba" },
        ]);
      }),
    })),
  }),
}));

describe("Database operations", () => {
  describe("getHiriak", () => {
    it("should return list of cities", async () => {
      const hiriak = await getHiriak();

      expect(Array.isArray(hiriak)).toBe(true);
      expect(hiriak.length).toBe(3);

      expect(hiriak[0]).toHaveProperty("id");
      expect(hiriak[0]).toHaveProperty("izena");
      expect(hiriak[0]).toHaveProperty("probintzia");
    });

    it("should have correct city data", async () => {
      const hiriak = await getHiriak();

      expect(hiriak[0]).toEqual({
        id: "H1",
        izena: "Bilbo",
        probintzia: "Bizkaia",
      });
    });
  });
});
