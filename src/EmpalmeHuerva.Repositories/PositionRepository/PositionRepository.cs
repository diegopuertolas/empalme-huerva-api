using EmpalmeHuerva.Domain.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace EmpalmeHuerva.Repositories.PositionRepository;

public class PositionRepository : IPositionRepository
{
    private readonly string _connectionString;

    public PositionRepository(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection") ?? "Not found";
    }

    public async Task<IEnumerable<Position>> GetAllPositions()
    {
        var positions = new List<Position>();

        using (var connection = new SqlConnection(_connectionString))
        {
            await connection.OpenAsync();

            string query = "SELECT Id, Name, Abbreviation FROM Positions";

            using (var command = new SqlCommand(query, connection))
            {
                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var position = new Position
                        {
                            Id = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            Abbreviation = reader.GetString(2)
                        };

                        positions.Add(position);
                    }
                }
            }
        }

        return positions;
    }
}