CREATE TABLE [dbo].[Songs]
(
    [Id]                      UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [MusicBrainzRecordingId]  NVARCHAR(64)     NOT NULL,
    [Title]                   NVARCHAR(512)    NOT NULL,
    [ArtistId]                UNIQUEIDENTIFIER NOT NULL,
    [CachedAt]                DATETIME2        NOT NULL DEFAULT GETUTCDATE(),

    CONSTRAINT [PK_Songs] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [UQ_Songs_MusicBrainzRecordingId] UNIQUE ([MusicBrainzRecordingId]),
    CONSTRAINT [FK_Songs_Artists] FOREIGN KEY ([ArtistId]) REFERENCES [dbo].[Artists] ([Id])
);
GO

CREATE NONCLUSTERED INDEX [IX_Songs_ArtistId]
    ON [dbo].[Songs] ([ArtistId]);
GO

CREATE NONCLUSTERED INDEX [IX_Songs_MusicBrainzRecordingId]
    ON [dbo].[Songs] ([MusicBrainzRecordingId]);
GO
