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
}