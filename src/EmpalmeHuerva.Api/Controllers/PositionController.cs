using EmpalmeHuerva.Domain.Entities;
using EmpalmeHuerva.Services.PositionService;
using Microsoft.AspNetCore.Mvc;

namespace EmpalmeHuerva.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class PositionController : ControllerBase
{
    private readonly IPositionService _service;

    public PositionController(IPositionService service)
    {
        _service = service;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Position>>> GetAllPositions()
    {
        var positions = await _service.GetAllPositions();
        return Ok(positions);
    }
}