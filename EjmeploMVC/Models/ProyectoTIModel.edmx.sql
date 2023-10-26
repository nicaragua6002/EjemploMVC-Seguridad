
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/17/2023 15:43:44
-- Generated from EDMX file: C:\Users\Estudiante.MLC24\source\repos\EjmeploMVC\EjmeploMVC\Models\ProyectoTIModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ProyectoTIBD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Equipos'
CREATE TABLE [dbo].[Equipos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Miembros'
CREATE TABLE [dbo].[Miembros] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Cargo] nvarchar(max)  NOT NULL,
    [EquipoId] int  NOT NULL
);
GO

-- Creating table 'Proyectos'
CREATE TABLE [dbo].[Proyectos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [FechaInicio] nvarchar(max)  NOT NULL,
    [FechaFin] nvarchar(max)  NOT NULL,
    [Estado] nvarchar(max)  NOT NULL,
    [Presupuesto] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'Tareas'
CREATE TABLE [dbo].[Tareas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [FechaInicio] nvarchar(max)  NOT NULL,
    [FechaFin] nvarchar(max)  NOT NULL,
    [Estado] nvarchar(max)  NOT NULL,
    [ProyectoId] int  NOT NULL
);
GO

-- Creating table 'Asignaciones'
CREATE TABLE [dbo].[Asignaciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Rol] nvarchar(max)  NOT NULL,
    [Fecha] nvarchar(max)  NOT NULL,
    [MiembroId] int  NOT NULL,
    [TareaId] int  NOT NULL
);
GO

-- Creating table 'Comentarios'
CREATE TABLE [dbo].[Comentarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Texto] nvarchar(max)  NOT NULL,
    [Fecha] nvarchar(max)  NOT NULL,
    [TareaId] int  NOT NULL,
    [UsuarioId] int  NOT NULL
);
GO

-- Creating table 'Valoraciones'
CREATE TABLE [dbo].[Valoraciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Puntuacion] nvarchar(max)  NOT NULL,
    [TareaId] int  NOT NULL,
    [UsuarioId] int  NOT NULL
);
GO

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Equipos'
ALTER TABLE [dbo].[Equipos]
ADD CONSTRAINT [PK_Equipos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Miembros'
ALTER TABLE [dbo].[Miembros]
ADD CONSTRAINT [PK_Miembros]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Proyectos'
ALTER TABLE [dbo].[Proyectos]
ADD CONSTRAINT [PK_Proyectos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tareas'
ALTER TABLE [dbo].[Tareas]
ADD CONSTRAINT [PK_Tareas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Asignaciones'
ALTER TABLE [dbo].[Asignaciones]
ADD CONSTRAINT [PK_Asignaciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comentarios'
ALTER TABLE [dbo].[Comentarios]
ADD CONSTRAINT [PK_Comentarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Valoraciones'
ALTER TABLE [dbo].[Valoraciones]
ADD CONSTRAINT [PK_Valoraciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EquipoId] in table 'Miembros'
ALTER TABLE [dbo].[Miembros]
ADD CONSTRAINT [FK_EquipoMiembro]
    FOREIGN KEY ([EquipoId])
    REFERENCES [dbo].[Equipos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipoMiembro'
CREATE INDEX [IX_FK_EquipoMiembro]
ON [dbo].[Miembros]
    ([EquipoId]);
GO

-- Creating foreign key on [ProyectoId] in table 'Tareas'
ALTER TABLE [dbo].[Tareas]
ADD CONSTRAINT [FK_ProyectoTarea]
    FOREIGN KEY ([ProyectoId])
    REFERENCES [dbo].[Proyectos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProyectoTarea'
CREATE INDEX [IX_FK_ProyectoTarea]
ON [dbo].[Tareas]
    ([ProyectoId]);
GO

-- Creating foreign key on [MiembroId] in table 'Asignaciones'
ALTER TABLE [dbo].[Asignaciones]
ADD CONSTRAINT [FK_MiembroAsignacion]
    FOREIGN KEY ([MiembroId])
    REFERENCES [dbo].[Miembros]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MiembroAsignacion'
CREATE INDEX [IX_FK_MiembroAsignacion]
ON [dbo].[Asignaciones]
    ([MiembroId]);
GO

-- Creating foreign key on [TareaId] in table 'Asignaciones'
ALTER TABLE [dbo].[Asignaciones]
ADD CONSTRAINT [FK_TareaAsignacion]
    FOREIGN KEY ([TareaId])
    REFERENCES [dbo].[Tareas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TareaAsignacion'
CREATE INDEX [IX_FK_TareaAsignacion]
ON [dbo].[Asignaciones]
    ([TareaId]);
GO

-- Creating foreign key on [TareaId] in table 'Comentarios'
ALTER TABLE [dbo].[Comentarios]
ADD CONSTRAINT [FK_TareaComentario]
    FOREIGN KEY ([TareaId])
    REFERENCES [dbo].[Tareas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TareaComentario'
CREATE INDEX [IX_FK_TareaComentario]
ON [dbo].[Comentarios]
    ([TareaId]);
GO

-- Creating foreign key on [TareaId] in table 'Valoraciones'
ALTER TABLE [dbo].[Valoraciones]
ADD CONSTRAINT [FK_TareaValoracion]
    FOREIGN KEY ([TareaId])
    REFERENCES [dbo].[Tareas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TareaValoracion'
CREATE INDEX [IX_FK_TareaValoracion]
ON [dbo].[Valoraciones]
    ([TareaId]);
GO

-- Creating foreign key on [UsuarioId] in table 'Comentarios'
ALTER TABLE [dbo].[Comentarios]
ADD CONSTRAINT [FK_UsuarioComentario]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioComentario'
CREATE INDEX [IX_FK_UsuarioComentario]
ON [dbo].[Comentarios]
    ([UsuarioId]);
GO

-- Creating foreign key on [UsuarioId] in table 'Valoraciones'
ALTER TABLE [dbo].[Valoraciones]
ADD CONSTRAINT [FK_UsuarioValoracion]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioValoracion'
CREATE INDEX [IX_FK_UsuarioValoracion]
ON [dbo].[Valoraciones]
    ([UsuarioId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------