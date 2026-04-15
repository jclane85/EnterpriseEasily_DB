CREATE TABLE [dbo].[GuitarTabs]
(
    [Id]                UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [SongId]            UNIQUEIDENTIFIER NOT NULL,
    [SubmittedByUserId] UNIQUEIDENTIFIER NOT NULL,
    [TabType]           NVARCHAR(20)     NOT NULL,
    [Content]           NVARCHAR(MAX)    NOT NULL,
    [Status]            NVARCHAR(20)     NOT NULL DEFAULT 'Pending',
    [CreatedAt]         DATETIME2        NOT NULL DEFAULT GETUTCDATE(),
    [UpdatedAt]         DATETIME2        NOT NULL DEFAULT GETUTCDATE(),

    CONSTRAINT [PK_GuitarTabs] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_GuitarTabs_Songs] FOREIGN KEY ([SongId]) REFERENCES [dbo].[Songs] ([Id]),
    CONSTRAINT [FK_GuitarTabs_Users] FOREIGN KEY ([SubmittedByUserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CK_GuitarTabs_TabType] CHECK ([TabType] IN ('ASCII', 'ChordChart')),
    CONSTRAINT [CK_GuitarTabs_Status] CHECK ([Status] IN ('Pending', 'Approved', 'Rejected'))
);
GO

CREATE NONCLUSTERED INDEX [IX_GuitarTabs_SongId_Status]
    ON [dbo].[GuitarTabs] ([SongId], [Status]);
GO
