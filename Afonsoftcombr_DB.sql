USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Kart_Calendario_Campeonato]    Script Date: 01/17/2013 15:07:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Kart_Calendario_Campeonato](
	[idCalendario] [int] IDENTITY(1,1) NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[Data] [smalldatetime] NOT NULL,
	[Nome] [nvarchar](200) NOT NULL,
	[Kartodromo] [nvarchar](200) NOT NULL,
	[Horario] [nchar](5) NOT NULL,
	[Circuito] [nvarchar](50) NULL,
	[dtCriacao] [datetime] NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_Kart_Calendario_Campeonato] PRIMARY KEY CLUSTERED 
(
	[idCalendario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK01_Kart_Calendario_Campeonato] UNIQUE NONCLUSTERED 
(
	[idCalendario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Kart_Campeonato]    Script Date: 01/17/2013 15:07:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Kart_Campeonato](
	[idCampeonato] [int] IDENTITY(1,1) NOT NULL,
	[idGrupo] [int] NOT NULL,
	[dtInicio] [datetime] NOT NULL,
	[dtFim] [datetime] NOT NULL,
	[NomeCampeonato] [nvarchar](200) NOT NULL,
	[dtCriacao] [datetime] NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_Kart_Campeonato] PRIMARY KEY CLUSTERED 
(
	[idCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK01_Kart_Campeonato] UNIQUE NONCLUSTERED 
(
	[idCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Kart_Equipe_Campeonato]    Script Date: 01/17/2013 15:07:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Kart_Equipe_Campeonato](
	[idEquipeCampeonato] [int] IDENTITY(1,1) NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[NomeEquipe] [nvarchar](200) NOT NULL,
	[Sigla] [nvarchar](50) NOT NULL,
	[dtCriacao] [datetime] NULL,
 CONSTRAINT [PK_Kart_Equipe_Campeonato] PRIMARY KEY CLUSTERED 
(
	[idEquipeCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK01_Kart_Equipe_Campeonato] UNIQUE NONCLUSTERED 
(
	[idEquipeCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Kart_Grid_Calendario]    Script Date: 01/17/2013 15:08:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Kart_Grid_Calendario](
	[idGrid] [int] IDENTITY(1,1) NOT NULL,
	[idCalendario] [int] NOT NULL,
	[Pos] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idEquipe] [int] NOT NULL,
	[Volta] [int] NOT NULL,
	[tempoMinutos] [int] NOT NULL,
	[tempoHoras] [int] NOT NULL,
	[tempoSegundos] [int] NOT NULL,
	[tempoMilisegundos] [int] NOT NULL,
	[dtcriacao] [datetime] NULL,
 CONSTRAINT [PK_Kart_Grid_Calendario] PRIMARY KEY CLUSTERED 
(
	[idGrid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Kart_Grupo]    Script Date: 01/17/2013 15:08:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Kart_Grupo](
	[idGrupo] [int] IDENTITY(1,1) NOT NULL,
	[NomeGrupo] [nvarchar](100) NOT NULL,
	[Sigla] [nchar](50) NOT NULL,
	[Id_Usuario_Lider] [int] NOT NULL,
	[permitirInsricoes] [bit] NOT NULL,
	[UrlAcesso] [nvarchar](100) NOT NULL,
	[dtCriacao] [datetime] NULL,
	[Cidade] [nvarchar](200) NOT NULL,
	[Estado] [nchar](2) NOT NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_Kart_Grupo] PRIMARY KEY CLUSTERED 
(
	[idGrupo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK01_Kart_Grupo] UNIQUE NONCLUSTERED 
(
	[idGrupo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Kart_log_erro]    Script Date: 01/17/2013 15:09:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Kart_log_erro](
	[idErro] [int] IDENTITY(1,1) NOT NULL,
	[UserIP] [nchar](20) NULL,
	[URL] [nvarchar](max) NULL,
	[RawUrl] [nvarchar](max) NULL,
	[QueryString] [nvarchar](max) NULL,
	[UserAgent] [nvarchar](max) NULL,
	[Referrer] [nvarchar](max) NULL,
	[Mensagem] [nvarchar](max) NULL,
	[Erro] [nvarchar](max) NULL,
	[Keys] [nvarchar](max) NULL,
	[StackTrace] [text] NULL,
	[TargetSite] [text] NULL,
	[Source] [text] NULL,
	[idUsuario] [int] NULL,
	[Page] [nvarchar](max) NULL,
	[dtErro] [datetime] NULL,
 CONSTRAINT [PK_Kart_log_erro] PRIMARY KEY CLUSTERED 
(
	[idErro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Kart_Ponto_Grupo]    Script Date: 01/17/2013 15:09:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Kart_Ponto_Grupo](
	[idPontoGrupo] [int] IDENTITY(1,1) NOT NULL,
	[idGrupo] [int] NOT NULL,
	[Pos] [int] NOT NULL,
	[Ponto] [int] NOT NULL,
	[dtCriacao] [datetime] NULL,
	[idUsuarioCadastro] [int] NOT NULL,
 CONSTRAINT [PK_Kart_Ponto_Grupo] PRIMARY KEY CLUSTERED 
(
	[idPontoGrupo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Kart_Resultado_Calendario]    Script Date: 01/17/2013 15:10:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Kart_Resultado_Calendario](
	[idResultado] [int] IDENTITY(1,1) NOT NULL,
	[idCalendario] [int] NOT NULL,
	[Pos] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idEquipe] [int] NOT NULL,
	[tempoHoras] [int] NOT NULL,
	[tempoMinutos] [int] NOT NULL,
	[tempoSegundos] [int] NOT NULL,
	[tempoMilisegundos] [int] NOT NULL,
	[Ponto] [int] NOT NULL,
	[Voltas] [int] NOT NULL,
	[dtCriacao] [datetime] NULL,
 CONSTRAINT [PK_Kart_Resultado_Calendario] PRIMARY KEY CLUSTERED 
(
	[idResultado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK01_Kart_Resultado_Calendario] UNIQUE NONCLUSTERED 
(
	[idResultado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Kart_Usuario_Equipe_Campeonato]    Script Date: 01/17/2013 15:10:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Kart_Usuario_Equipe_Campeonato](
	[idUsuarioEquipeCampeonato] [int] IDENTITY(1,1) NOT NULL,
	[idEquipeCampeonato] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[dtCriacao] [datetime] NULL,
 CONSTRAINT [PK_Kart_Usuario_Equipe_Campeonato] PRIMARY KEY CLUSTERED 
(
	[idUsuarioEquipeCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK01_Kart_Usuario_Equipe_Campeonato] UNIQUE NONCLUSTERED 
(
	[idUsuarioEquipeCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK02_Kart_Usuario_Equipe_Campeonato] UNIQUE NONCLUSTERED 
(
	[idUsuario] ASC,
	[idEquipeCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Kart_Usuario_Grupo]    Script Date: 01/17/2013 15:11:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Kart_Usuario_Grupo](
	[idGrupoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idGrupo] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[Principal] [bit] NULL,
	[Admin] [bit] NULL,
	[Aprovado] [bit] NULL,
	[dtCriacao] [datetime] NULL,
 CONSTRAINT [PK_Kart_Usuario_Grupo] PRIMARY KEY CLUSTERED 
(
	[idGrupoUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK01_Kart_Usuario_Grupo] UNIQUE NONCLUSTERED 
(
	[idGrupoUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK02_Kart_Usuario_Grupo] UNIQUE NONCLUSTERED 
(
	[idGrupo] ASC,
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [afonsoftcombr_db]
GO

/****** Object:  Table [afonsoftcombr].[Usuarios]    Script Date: 01/17/2013 15:11:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [afonsoftcombr].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](200) NOT NULL,
	[Apelido] [nchar](30) NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Senha] [nchar](50) NOT NULL,
	[Sexo] [nchar](1) NULL,
	[Peso] [numeric](5, 2) NULL,
	[DtNascimento] [smalldatetime] NULL,
	[MostarInfo] [bit] NULL,
	[Altura] [numeric](3, 2) NULL,
	[Telefone] [nchar](50) NULL,
	[Celular] [nchar](50) NULL,
	[Foto] [image] NULL,
	[Cidade] [nvarchar](200) NULL,
	[Estado] [nchar](2) NULL,
	[Endereco] [nvarchar](max) NULL,
	[Perfil_Facebook] [nvarchar](200) NULL,
	[Perfil_Twitter] [nvarchar](200) NULL,
	[Perfil_Plus] [nvarchar](200) NULL,
	[Perfil_Outros] [nvarchar](200) NULL,
	[Obs] [text] NULL,
	[dtCriacao] [datetime] NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK01_Usuario] UNIQUE NONCLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK02_Usuario] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [afonsoftcombr].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_MostarInfo]  DEFAULT ((1)) FOR [MostarInfo]
GO

ALTER TABLE [afonsoftcombr].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO

ALTER TABLE [afonsoftcombr].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO




ALTER TABLE [afonsoftcombr].[Kart_Usuario_Grupo]  WITH CHECK ADD  CONSTRAINT [FK1_Kart_Usuario_Grupo_Kart_Usuario_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [afonsoftcombr].[Kart_Grupo] ([idGrupo])
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Grupo] CHECK CONSTRAINT [FK1_Kart_Usuario_Grupo_Kart_Usuario_Grupo]
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Grupo]  WITH CHECK ADD  CONSTRAINT [FK2_Kart_Usuario_Grupo_Kart_Usuario_Grupo] FOREIGN KEY([idUsuario])
REFERENCES [afonsoftcombr].[Usuarios] ([idUsuario])
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Grupo] CHECK CONSTRAINT [FK2_Kart_Usuario_Grupo_Kart_Usuario_Grupo]
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Grupo] ADD  CONSTRAINT [DF_Kart_Usuario_Grupo_Principal]  DEFAULT ((0)) FOR [Principal]
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Grupo] ADD  CONSTRAINT [DF_Kart_Usuario_Grupo_Admin]  DEFAULT ((0)) FOR [Admin]
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Grupo] ADD  CONSTRAINT [DF_Kart_Usuario_Grupo_Aprovado]  DEFAULT ((0)) FOR [Aprovado]
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Grupo] ADD  CONSTRAINT [DF_Kart_Usuario_Grupo_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO



ALTER TABLE [afonsoftcombr].[Kart_Usuario_Equipe_Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Usuario_Equipe_Campeonato_Kart_Equipe_Campeonato] FOREIGN KEY([idEquipeCampeonato])
REFERENCES [afonsoftcombr].[Kart_Equipe_Campeonato] ([idEquipeCampeonato])
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Equipe_Campeonato] CHECK CONSTRAINT [FK_Kart_Usuario_Equipe_Campeonato_Kart_Equipe_Campeonato]
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Equipe_Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Usuario_Equipe_Campeonato_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [afonsoftcombr].[Usuarios] ([idUsuario])
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Equipe_Campeonato] CHECK CONSTRAINT [FK_Kart_Usuario_Equipe_Campeonato_Usuarios]
GO

ALTER TABLE [afonsoftcombr].[Kart_Usuario_Equipe_Campeonato] ADD  CONSTRAINT [DF_Kart_Usuario_Equipe_Campeonato_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO



ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Resultado_Calendario_Kart_Calendario_Campeonato] FOREIGN KEY([idCalendario])
REFERENCES [afonsoftcombr].[Kart_Calendario_Campeonato] ([idCalendario])
GO

ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario] CHECK CONSTRAINT [FK_Kart_Resultado_Calendario_Kart_Calendario_Campeonato]
GO

ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario]  WITH CHECK ADD  CONSTRAINT [FK2_Kart_Resultado_Calendario_Kart_Resultado_Calendario] FOREIGN KEY([idUsuario])
REFERENCES [afonsoftcombr].[Usuarios] ([idUsuario])
GO

ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario] CHECK CONSTRAINT [FK2_Kart_Resultado_Calendario_Kart_Resultado_Calendario]
GO

ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_tempo]  DEFAULT ((0)) FOR [tempoHoras]
GO

ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_tempoHoras1]  DEFAULT ((0)) FOR [tempoMinutos]
GO

ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_tempoHoras1_1]  DEFAULT ((0)) FOR [tempoSegundos]
GO

ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_tempoHoras1_2]  DEFAULT ((0)) FOR [tempoMilisegundos]
GO

ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_Ponto]  DEFAULT ((0)) FOR [Ponto]
GO

ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_Voltas]  DEFAULT ((0)) FOR [Voltas]
GO

ALTER TABLE [afonsoftcombr].[Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO



ALTER TABLE [afonsoftcombr].[Kart_Ponto_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Ponto_Grupo_Kart_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [afonsoftcombr].[Kart_Grupo] ([idGrupo])
GO

ALTER TABLE [afonsoftcombr].[Kart_Ponto_Grupo] CHECK CONSTRAINT [FK_Kart_Ponto_Grupo_Kart_Grupo]
GO



ALTER TABLE [afonsoftcombr].[Kart_log_erro]  WITH CHECK ADD  CONSTRAINT [FK_Kart_log_erro_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [afonsoftcombr].[Usuarios] ([idUsuario])
GO

ALTER TABLE [afonsoftcombr].[Kart_log_erro] CHECK CONSTRAINT [FK_Kart_log_erro_Usuarios]
GO

ALTER TABLE [afonsoftcombr].[Kart_log_erro] ADD  CONSTRAINT [DF_Kart_log_erro_dtErro]  DEFAULT (getdate()) FOR [dtErro]
GO



ALTER TABLE [afonsoftcombr].[Kart_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Grupo_Usuarios] FOREIGN KEY([Id_Usuario_Lider])
REFERENCES [afonsoftcombr].[Usuarios] ([idUsuario])
GO

ALTER TABLE [afonsoftcombr].[Kart_Grupo] CHECK CONSTRAINT [FK_Kart_Grupo_Usuarios]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grupo] ADD  CONSTRAINT [DF_Kart_Grupo_permitirInsricoesNoSite]  DEFAULT ((1)) FOR [permitirInsricoes]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grupo] ADD  CONSTRAINT [DF_Kart_Grupo_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grupo] ADD  CONSTRAINT [DF_Kart_Grupo_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO



ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Grid_Calendario_Kart_Calendario_Campeonato] FOREIGN KEY([idCalendario])
REFERENCES [afonsoftcombr].[Kart_Calendario_Campeonato] ([idCalendario])
GO

ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario] CHECK CONSTRAINT [FK_Kart_Grid_Calendario_Kart_Calendario_Campeonato]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario]  WITH CHECK ADD  CONSTRAINT [FK2_Kart_Grid_Calendario_Kart_Grid_Calendario] FOREIGN KEY([idUsuario])
REFERENCES [afonsoftcombr].[Usuarios] ([idUsuario])
GO

ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario] CHECK CONSTRAINT [FK2_Kart_Grid_Calendario_Kart_Grid_Calendario]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_Pos]  DEFAULT ((0)) FOR [Pos]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_Volta]  DEFAULT ((0)) FOR [Volta]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_tempoMinutos]  DEFAULT ((0)) FOR [tempoMinutos]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_tempo]  DEFAULT ((0)) FOR [tempoHoras]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_tempoSegundos]  DEFAULT ((0)) FOR [tempoSegundos]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_tempoHora1]  DEFAULT ((0)) FOR [tempoMilisegundos]
GO

ALTER TABLE [afonsoftcombr].[Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_dtcriacao]  DEFAULT (getdate()) FOR [dtcriacao]
GO



ALTER TABLE [afonsoftcombr].[Kart_Equipe_Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Equipe_Campeonato_Kart_Campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [afonsoftcombr].[Kart_Campeonato] ([idCampeonato])
GO

ALTER TABLE [afonsoftcombr].[Kart_Equipe_Campeonato] CHECK CONSTRAINT [FK_Kart_Equipe_Campeonato_Kart_Campeonato]
GO

ALTER TABLE [afonsoftcombr].[Kart_Equipe_Campeonato] ADD  CONSTRAINT [DF_Kart_Equipe_Campeonato_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO



ALTER TABLE [afonsoftcombr].[Kart_Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Campeonato_Kart_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [afonsoftcombr].[Kart_Grupo] ([idGrupo])
GO

ALTER TABLE [afonsoftcombr].[Kart_Campeonato] CHECK CONSTRAINT [FK_Kart_Campeonato_Kart_Grupo]
GO

ALTER TABLE [afonsoftcombr].[Kart_Campeonato] ADD  CONSTRAINT [DF_Kart_Campeonato_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO

ALTER TABLE [afonsoftcombr].[Kart_Campeonato] ADD  CONSTRAINT [DF_Kart_Campeonato_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO




ALTER TABLE [afonsoftcombr].[Kart_Calendario_Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Calendario_Campeonato_Kart_Campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [afonsoftcombr].[Kart_Campeonato] ([idCampeonato])
GO

ALTER TABLE [afonsoftcombr].[Kart_Calendario_Campeonato] CHECK CONSTRAINT [FK_Kart_Calendario_Campeonato_Kart_Campeonato]
GO

ALTER TABLE [afonsoftcombr].[Kart_Calendario_Campeonato] ADD  CONSTRAINT [DF_Kart_Calendario_Campeonato_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO

ALTER TABLE [afonsoftcombr].[Kart_Calendario_Campeonato] ADD  CONSTRAINT [DF_Kart_Calendario_Campeonato_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO

-- Views

USE [afonsoftcombr_db]
GO

/****** Object:  View [afonsoftcombr].[View_Equipe_Usuario]    Script Date: 01/17/2013 16:59:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [afonsoftcombr].[View_Equipe_Usuario]
AS
SELECT dc.idUsuario, ec.NomeEquipe, ec.Sigla, ec.idEquipeCampeonato, ec.idCampeonato FROM Kart_Equipe_Campeonato ec (NOLOCK)
join Kart_Usuario_Equipe_Campeonato dc (NOLOCK) on (dc.idEquipeCampeonato = ec.idEquipeCampeonato)
GO
USE [afonsoftcombr_db]
GO

/****** Object:  View [afonsoftcombr].[View_Kart_Equipe_Pontos_Campeonato]    Script Date: 01/17/2013 17:03:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [afonsoftcombr].[View_Kart_Equipe_Pontos_Campeonato]  
AS  
SELECT     
	Kart_Equipe_Campeonato.idEquipeCampeonato, 
	Kart_Equipe_Campeonato.NomeEquipe AS Equipe,   
	Kart_Equipe_Campeonato.Sigla, 
	SUM(Kart_Resultado_Calendario.Ponto) AS Pontos, 
	Kart_Grupo.NomeGrupo AS Grupo,   
	Kart_Campeonato.NomeCampeonato AS Campeonato, 
	Kart_Campeonato.idCampeonato, 
	Kart_Grupo.idGrupo  
FROM  Usuarios WITH (NOLOCK) 
INNER JOIN  Kart_Usuario_Grupo WITH (NOLOCK) ON Kart_Usuario_Grupo.idUsuario = Usuarios.idUsuario 
INNER JOIN  Kart_Grupo WITH (NOLOCK) ON Kart_Grupo.idGrupo = Kart_Usuario_Grupo.idGrupo 
INNER JOIN  Kart_Campeonato WITH (NOLOCK) ON Kart_Campeonato.idGrupo = Kart_Usuario_Grupo.idGrupo 
INNER JOIN  Kart_Calendario_Campeonato WITH (NOLOCK) ON Kart_Calendario_Campeonato.idCampeonato = Kart_Campeonato.idCampeonato 
INNER JOIN  Kart_Resultado_Calendario WITH (NOLOCK) ON Kart_Resultado_Calendario.idCalendario = Kart_Calendario_Campeonato.idCalendario AND Kart_Resultado_Calendario.idUsuario = Usuarios.idUsuario
INNER JOIN  Kart_Equipe_Campeonato ON Kart_Equipe_Campeonato.idCampeonato = Kart_Campeonato.idCampeonato 
INNER JOIN  Kart_Usuario_Equipe_Campeonato ON Kart_Usuario_Equipe_Campeonato.idUsuario = Kart_Usuario_Grupo.idUsuario AND Kart_Usuario_Equipe_Campeonato.idEquipeCampeonato = Kart_Equipe_Campeonato.idEquipeCampeonato  
GROUP BY Kart_Equipe_Campeonato.NomeEquipe, 
Kart_Equipe_Campeonato.Sigla, 
Kart_Grupo.NomeGrupo,   
Kart_Campeonato.NomeCampeonato, 
Kart_Campeonato.idCampeonato, 
Kart_Grupo.idGrupo,   
Kart_Equipe_Campeonato.idEquipeCampeonato  


GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Usuarios"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kart_Usuario_Grupo"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 245
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kart_Grupo"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 365
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kart_Campeonato"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 485
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kart_Calendario_Campeonato"
            Begin Extent = 
               Top = 486
               Left = 38
               Bottom = 605
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kart_Resultado_Calendario"
            Begin Extent = 
               Top = 606
               Left = 38
               Bottom = 725
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kart_Equipe_Campeonato"
            Begin Extent = 
               Top = 6
               Left = 282
               Bottom = 125
    ' , @level0type=N'SCHEMA',@level0name=N'afonsoftcombr', @level1type=N'VIEW',@level1name=N'View_Kart_Equipe_Pontos_Campeonato'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'           Right = 488
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kart_Usuario_Equipe_Campeonato"
            Begin Extent = 
               Top = 6
               Left = 526
               Bottom = 125
               Right = 768
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'afonsoftcombr', @level1type=N'VIEW',@level1name=N'View_Kart_Equipe_Pontos_Campeonato'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'afonsoftcombr', @level1type=N'VIEW',@level1name=N'View_Kart_Equipe_Pontos_Campeonato'
GO


USE [afonsoftcombr_db]
GO

/****** Object:  View [afonsoftcombr].[View_Kart_Usuario_Historico]    Script Date: 01/17/2013 17:03:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [afonsoftcombr].[View_Kart_Usuario_Historico]  
AS  
SELECT    
 Usuarios.idUsuario,   
 Usuarios.Nome,   
 SUM(Kart_Resultado_Calendario.Ponto) [Pontos],   
 COUNT(Kart_Resultado_Calendario.idResultado) [Provas],
 ISNULL((SELECT COUNT(A.Pos) FROM Kart_Resultado_Calendario A (NOLOCK) WHERE A.idCalendario = Kart_Resultado_Calendario.idCalendario AND A.idUsuario= Usuarios.idUsuario AND A.Pos = 1),0)[Vitorias],
 ISNULL((SELECT COUNT(A.Pos) FROM Kart_Resultado_Calendario A (NOLOCK) WHERE A.idCalendario = Kart_Resultado_Calendario.idCalendario AND A.idUsuario= Usuarios.idUsuario AND A.Pos in (1,2,3)),0)[Podios]
FROM Usuarios (NOLOCK)  
JOIN Kart_Usuario_Grupo (NOLOCK) ON Kart_Usuario_Grupo.idUsuario = Usuarios.idUsuario  
JOIN Kart_Grupo (NOLOCK) ON Kart_Grupo.idGrupo = Kart_Usuario_Grupo.idGrupo  
JOIN Kart_Campeonato (NOLOCK) ON Kart_Campeonato.idGrupo = Kart_Usuario_Grupo.idGrupo  
JOIN Kart_Calendario_Campeonato (NOLOCK) ON Kart_Calendario_Campeonato.idCampeonato = Kart_Campeonato.idCampeonato  
JOIN Kart_Resultado_Calendario (NOLOCK) ON Kart_Resultado_Calendario.idCalendario = Kart_Calendario_Campeonato.idCalendario AND Kart_Resultado_Calendario.idUsuario= Usuarios.idUsuario 
GROUP BY  
 Usuarios.idUsuario,   
 Usuarios.Nome,
 Kart_Resultado_Calendario.idCalendario  

  
GO


USE [afonsoftcombr_db]
GO

/****** Object:  View [afonsoftcombr].[View_Kart_Usuario_Pontos_Campeonato]    Script Date: 01/17/2013 17:04:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [afonsoftcombr].[View_Kart_Usuario_Pontos_Campeonato]  
AS  
SELECT    
 Usuarios.idUsuario,   
 Usuarios.Nome,   
 SUM(Kart_Resultado_Calendario.Ponto) [Pontos],   
 Kart_Grupo.NomeGrupo [Grupo],  
 Kart_Campeonato.NomeCampeonato [Campeonato],  
 Kart_Campeonato.idCampeonato,  
 Kart_Grupo.idGrupo  
FROM Usuarios (NOLOCK)  
JOIN Kart_Usuario_Grupo (NOLOCK) ON Kart_Usuario_Grupo.idUsuario = Usuarios.idUsuario  
JOIN Kart_Grupo (NOLOCK) ON Kart_Grupo.idGrupo = Kart_Usuario_Grupo.idGrupo  
JOIN Kart_Campeonato (NOLOCK) ON Kart_Campeonato.idGrupo = Kart_Usuario_Grupo.idGrupo  
JOIN Kart_Calendario_Campeonato (NOLOCK) ON Kart_Calendario_Campeonato.idCampeonato = Kart_Campeonato.idCampeonato  
JOIN Kart_Resultado_Calendario (NOLOCK) ON Kart_Resultado_Calendario.idCalendario = Kart_Calendario_Campeonato.idCalendario AND Kart_Resultado_Calendario.idUsuario = Usuarios.idUsuario  
GROUP BY   
 Usuarios.idUsuario,   
 Usuarios.Nome,   
 Kart_Grupo.NomeGrupo,  
 Kart_Campeonato.NomeCampeonato,  
 Kart_Campeonato.idCampeonato,  
 Kart_Grupo.idGrupo  
  
  
GO


USE [afonsoftcombr_db]
GO

/****** Object:  View [afonsoftcombr].[View_Kart_Usuario_Pontos_Grupo]    Script Date: 01/17/2013 17:04:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [afonsoftcombr].[View_Kart_Usuario_Pontos_Grupo]
AS
SELECT  
	Usuarios.idUsuario, 
	Usuarios.Nome, 
	SUM(Kart_Resultado_Calendario.Ponto) [Pontos], 
	Kart_Grupo.NomeGrupo [Grupo],
	Kart_Grupo.idGrupo
FROM Usuarios (NOLOCK)
JOIN Kart_Usuario_Grupo (NOLOCK) ON Kart_Usuario_Grupo.idUsuario = Usuarios.idUsuario
JOIN Kart_Grupo (NOLOCK) ON Kart_Grupo.idGrupo = Kart_Usuario_Grupo.idGrupo
JOIN Kart_Campeonato (NOLOCK) ON Kart_Campeonato.idGrupo = Kart_Usuario_Grupo.idGrupo
JOIN Kart_Calendario_Campeonato (NOLOCK) ON Kart_Calendario_Campeonato.idCampeonato = Kart_Campeonato.idCampeonato
JOIN Kart_Resultado_Calendario (NOLOCK) ON Kart_Resultado_Calendario.idCalendario = Kart_Calendario_Campeonato.idCalendario 
GROUP BY
	Usuarios.idUsuario, 
	Usuarios.Nome,  
	Kart_Grupo.NomeGrupo,
	Kart_Grupo.idGrupo


GO







