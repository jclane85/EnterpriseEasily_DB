CREATE TABLE [dbo].[Users]
(
    [Id]          UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Auth0Sub]    NVARCHAR(128)    NOT NULL,
    [Email]       NVARCHAR(256)    NOT NULL,
    [DisplayName] NVARCHAR(256)    NOT NULL,
    [Role]        NVARCHAR(20)     NOT NULL DEFAULT 'User',
    [CreatedAt]   DATETIME2        NOT NULL DEFAULT GETUTCDATE(),

    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [UQ_Users_Auth0Sub] UNIQUE ([Auth0Sub]),
    CONSTRAINT [CK_Users_Role] CHECK ([Role] IN ('User', 'Admin'))
);
GO

CREATE NONCLUSTERED INDEX [IX_Users_Auth0Sub]
    ON [dbo].[Users] ([Auth0Sub]);
GO
