using EmpalmeHuerva.Domain.Entities;

namespace EmpalmeHuerva.Repositories.PositionRepository;

public interface IPositionRepository
{
    Task<IEnumerable<Position>> GetAllPositions();
    Task<Position?> GetPositionById(int id);
    // Task CreatePosition(Position position);
    // Task UpdatePosition(int id, Position position);
    // Task DeletePosition(int id);
}