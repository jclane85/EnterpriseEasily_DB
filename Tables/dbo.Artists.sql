CREATE TABLE [dbo].[Artists]
(
    [Id]             UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [MusicBrainzId]  NVARCHAR(64)     NOT NULL,
    [Name]           NVARCHAR(512)    NOT NULL,
    [CachedAt]       DATETIME2        NOT NULL DEFAULT GETUTCDATE(),

    CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [UQ_Artists_MusicBrainzId] UNIQUE ([MusicBrainzId])
);
GO

CREATE NONCLUSTERED INDEX [IX_Artists_MusicBrainzId]
    ON [dbo].[Artists] ([MusicBrainzId]);
GO
