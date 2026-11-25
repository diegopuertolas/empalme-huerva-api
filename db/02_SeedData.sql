USE [EmpalmeHuervaDb];
GO

INSERT INTO dbo.Positions (Name, Abbreviation) VALUES
(N'Portero', N'POR'),
(N'Defensa', N'DEF'),
(N'Centrocampista', N'MED'),
(N'Extremo', N'EXT'),
(N'Delantero', N'DEL');
GO

INSERT INTO dbo.Players (FirstName, LastName, Nickname, JerseyNumber, IsCaptain, PositionId) VALUES
(N'Adahy', N'Álvarez', NULL, 1, 0, 4),
(N'Diego', N'Puértolas', NULL, 4, 0, 3),
(N'Daniel', N'Pot', NULL, 5, 0, 4),
(N'Marcos', N'Muñoz', NULL, 6, 0, 3),
(N'Hugo', N'Munárriz', NULL, 7, 0, 1),
(N'Sergio', N'Casado', NULL, 8, 1, 2),
(N'Elian', N'Alfaro', NULL, 9, 0, 2),
(N'Darío', N'de Julian', NULL, 10, 0, 5),
(N'Daniel', N'Ferrández', NULL, 11, 0, 2),
(N'Marcos', N'Regaño', NULL, 14, 0, 5);
GO

INSERT INTO dbo.StaffMembers (FullName, Role, IsHeadCoach, IsActive) VALUES
(N'Emilio', N'Entrenador Principal', 1, 1)
GO

INSERT INTO dbo.Matches (Opponent, Competition, MatchDate, GoalsFor, GoalsAgainst, IsHomeGame, IsPlayed) VALUES
(N'Atlético Ebro F7', N'Liga MLA Aragón - 3ªB G3', '2026-10-18 17:00:00', 3, 1, 1, 1),
(N'Real Zaragoza Peñas', N'Liga MLA Aragón - 3ªB G3', '2026-10-25 18:30:00', 2, 2, 0, 1),
(N'CD Monzalbarba', N'Liga MLA Aragón - 3ªB G3', '2026-11-29 17:00:00', NULL, NULL, 1, 0);
GO

INSERT INTO dbo.PlayerMatchStats (MinutesPlayed, Goals, Assists, YellowCards, WasStarter, PlayerId, MatchId) VALUES
(50, 0, 0, 0, 1, 1, 1),
(50, 1, 0, 0, 1, 2, 1),
(50, 2, 1, 0, 1, 7, 1),
(40, 0, 2, 1, 1, 8, 1),
(50, 0, 0, 0, 1, 1, 2),
(50, 1, 1, 0, 1, 9, 2),
(45, 1, 0, 0, 1, 5, 2);
GO

INSERT INTO dbo.Fans (FullName, Email, MemberNumber, JoinDate) VALUES
(N'Laura Sánchez', N'laura.sanchez@example.com', 101, '2026-09-01'),
(N'Pablo Navarro', N'pablo.navarro@example.com', 102, '2026-09-05'),
(N'Elena Torres', N'elena.torres@example.com', 103, '2026-09-12');
GO