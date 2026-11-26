using System.Net.NetworkInformation;
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
        return Ok(await _service.GetAllPositions());
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Position?>> GetPositionById(int id)
    {
        var position = await _service.GetPositionById(id);

        if (position is null) return NotFound();

        return Ok(position);
    }
}