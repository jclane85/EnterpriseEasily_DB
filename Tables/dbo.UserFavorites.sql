CREATE TABLE [dbo].[UserFavorites]
(
    [UserId]    UNIQUEIDENTIFIER NOT NULL,
    [SongId]    UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME2        NOT NULL DEFAULT GETUTCDATE(),

    CONSTRAINT [PK_UserFavorites] PRIMARY KEY CLUSTERED ([UserId], [SongId]),
    CONSTRAINT [FK_UserFavorites_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_UserFavorites_Songs] FOREIGN KEY ([SongId]) REFERENCES [dbo].[Songs] ([Id])
);
GO
