IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'EmpalmeHuervaDb')
BEGIN
    CREATE DATABASE [EmpalmeHuervaDb];
END
GO

USE [EmpalmeHuervaDb];
GO

DROP TABLE IF EXISTS dbo.PlayerMatchStats;
DROP TABLE IF EXISTS dbo.Fans;
DROP TABLE IF EXISTS dbo.Matches;
DROP TABLE IF EXISTS dbo.StaffMembers;
DROP TABLE IF EXISTS dbo.Players;
DROP TABLE IF EXISTS dbo.Positions;
GO

CREATE TABLE dbo.Positions (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL UNIQUE,
    Abbreviation NVARCHAR(5) NOT NULL UNIQUE
);
GO

CREATE TABLE dbo.Players (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(80) NOT NULL,
    LastName NVARCHAR(80) NOT NULL,
    Nickname NVARCHAR(50) NULL,
    JerseyNumber INT NOT NULL UNIQUE,
    IsCaptain BIT NOT NULL DEFAULT 0,
    PositionId INT NOT NULL,

    CONSTRAINT FK_Players_Positions FOREIGN KEY (PositionId)
        REFERENCES dbo.Positions(Id)
);
GO

CREATE TABLE dbo.StaffMembers (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(120) NOT NULL,
    Role NVARCHAR(60) NOT NULL,
    IsHeadCoach BIT NOT NULL DEFAULT 0,
    IsActive BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.Matches (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Opponent NVARCHAR(100) NOT NULL,
    Competition NVARCHAR(80) NOT NULL,
    MatchDate DATETIME2 NOT NULL,
    GoalsFor INT NULL,
    GoalsAgainst INT NULL,
    IsHomeGame BIT NOT NULL DEFAULT 1,
    IsPlayed BIT NOT NULL DEFAULT 0
);
GO

CREATE TABLE dbo.PlayerMatchStats (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    MinutesPlayed INT NOT NULL DEFAULT 0,
    Goals INT NOT NULL DEFAULT 0,
    Assists INT NOT NULL DEFAULT 0,
    YellowCards INT NOT NULL DEFAULT 0,
    WasStarter BIT NOT NULL DEFAULT 0,
    PlayerId INT NOT NULL,
    MatchId INT NOT NULL,

    CONSTRAINT FK_PlayerMatchStats_Players FOREIGN KEY (PlayerId)
        REFERENCES dbo.Players(Id) ON DELETE CASCADE,
    CONSTRAINT FK_PlayerMatchStats_Matches FOREIGN KEY (MatchId)
        REFERENCES dbo.Matches(Id) ON DELETE CASCADE,
    CONSTRAINT UQ_PlayerMatchStats_Player_Match UNIQUE (PlayerId, MatchId)
);
GO

CREATE TABLE dbo.Fans (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(120) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    MemberNumber INT NOT NULL UNIQUE,
    JoinDate DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE)
);
GO