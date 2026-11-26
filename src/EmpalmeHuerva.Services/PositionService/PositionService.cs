using EmpalmeHuerva.Domain.Entities;
using EmpalmeHuerva.Repositories.PositionRepository;

namespace EmpalmeHuerva.Services.PositionService;

public class PositionService : IPositionService
{
    private readonly IPositionRepository _repository;

    public PositionService(IPositionRepository repository)
    {
        _repository = repository;
    }

    public async Task<IEnumerable<Position>> GetAllPositions()
    {
        return await _repository.GetAllPositions();
    }

    public async Task<Position?> GetPositionById(int id)
    {
        if (id <= 0) throw new ArgumentException("El ID debe ser mayor que cero");

        return await _repository.GetPositionById(id);
    }
}