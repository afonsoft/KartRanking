GO
ALTER TABLE [Kart_Videos_Grupo] DROP CONSTRAINT [FK_Kart_Videos_Grupo_Usuarios]
GO
ALTER TABLE [Kart_Videos_Grupo] DROP CONSTRAINT [FK_Kart_Videos_Grupo_Kart_Grupo]
GO
ALTER TABLE [Kart_Videos_Grupo] DROP CONSTRAINT [FK_Kart_Videos_Grupo_Kart_Calendario_Campeonato]
GO
ALTER TABLE [Kart_Usuario_Grupo] DROP CONSTRAINT [FK2_Kart_Usuario_Grupo_Kart_Usuario_Grupo]
GO
ALTER TABLE [Kart_Usuario_Grupo] DROP CONSTRAINT [FK1_Kart_Usuario_Grupo_Kart_Usuario_Grupo]
GO
ALTER TABLE [Kart_Usuario_Equipe_Campeonato] DROP CONSTRAINT [FK_Kart_Usuario_Equipe_Campeonato_Usuarios]
GO
ALTER TABLE [Kart_Usuario_Equipe_Campeonato] DROP CONSTRAINT [FK_Kart_Usuario_Equipe_Campeonato_Kart_Equipe_Campeonato]
GO
ALTER TABLE [Kart_Resultado_Calendario] DROP CONSTRAINT [FK2_Kart_Resultado_Calendario_Kart_Resultado_Calendario]
GO
ALTER TABLE [Kart_Resultado_Calendario] DROP CONSTRAINT [FK_Kart_Resultado_Calendario_Kart_Calendario_Campeonato]
GO
ALTER TABLE [Kart_Regras_Grupo] DROP CONSTRAINT [FK_Kart_Regras_Grupo_Usuarios]
GO
ALTER TABLE [Kart_Regras_Grupo] DROP CONSTRAINT [FK_Kart_Regras_Grupo_Kart_Grupo]
GO
ALTER TABLE [Kart_Ponto_Grupo] DROP CONSTRAINT [FK_Kart_Ponto_Grupo_Kart_Grupo]
GO
ALTER TABLE [Kart_Noticias_Grupo] DROP CONSTRAINT [FK_Kart_Noticias_Grupo_Usuarios]
GO
ALTER TABLE [Kart_Noticias_Grupo] DROP CONSTRAINT [FK_Kart_Noticias_Grupo_Kart_Grupo]
GO
ALTER TABLE [Kart_log_erro] DROP CONSTRAINT [FK_Kart_log_erro_Usuarios]
GO
ALTER TABLE [Kart_Grid_Calendario] DROP CONSTRAINT [FK_Kart_Grid_Calendario_Kart_Calendario_Campeonato]
GO
ALTER TABLE [Kart_Equipe_Campeonato_Desativados] DROP CONSTRAINT [FK_Kart_Equipe_Campeonato_Desativados_Kart_Equipe_Campeonato]
GO
ALTER TABLE [Kart_Equipe_Campeonato_Desativados] DROP CONSTRAINT [FK_Kart_Equipe_Campeonato_Desativados_Kart_Campeonato]
GO
ALTER TABLE [Kart_Equipe_Campeonato] DROP CONSTRAINT [FK_Kart_Equipe_Campeonato_Kart_Campeonato]
GO
ALTER TABLE [Kart_Campeonato_Usuario_Desativados] DROP CONSTRAINT [FK_Kart_Campeonato_Usuario_Desativados_Kart_Campeonato]
GO
ALTER TABLE [Kart_Campeonato] DROP CONSTRAINT [FK_Kart_Campeonato_Kart_Grupo]
GO
ALTER TABLE [Kart_Calendario_Campeonato] DROP CONSTRAINT [FK_Kart_Calendario_Campeonato_Kart_Campeonato]
GO
ALTER TABLE [Kart_Album_Grupo] DROP CONSTRAINT [FK_Kart_Album_Grupo_Kart_Grupo]
GO
ALTER TABLE [Kart_Album_Grupo] DROP CONSTRAINT [FK_Kart_Album_Grupo_Kart_Calendario_Campeonato]
GO
ALTER TABLE [Kart_Videos_Grupo] DROP CONSTRAINT [DF_Kart_Videos_Grupo_dtCriacao]
GO
ALTER TABLE [Kart_Usuario_Grupo] DROP CONSTRAINT [DF_Kart_Usuario_Grupo_dtCriacao]
GO
ALTER TABLE [Kart_Usuario_Grupo] DROP CONSTRAINT [DF_Kart_Usuario_Grupo_Aprovado]
GO
ALTER TABLE [Kart_Usuario_Grupo] DROP CONSTRAINT [DF_Kart_Usuario_Grupo_Admin]
GO
ALTER TABLE [Kart_Usuario_Grupo] DROP CONSTRAINT [DF_Kart_Usuario_Grupo_Principal]
GO
ALTER TABLE [Kart_Usuario_Equipe_Campeonato] DROP CONSTRAINT [DF_Kart_Usuario_Equipe_Campeonato_dtCriacao]
GO
ALTER TABLE [Kart_Resultado_Calendario] DROP CONSTRAINT [DF_Kart_Resultado_Calendario_dtCriacao]
GO
ALTER TABLE [Kart_Resultado_Calendario] DROP CONSTRAINT [DF_Kart_Resultado_Calendario_Voltas]
GO
ALTER TABLE [Kart_Resultado_Calendario] DROP CONSTRAINT [DF_Kart_Resultado_Calendario_Ponto]
GO
ALTER TABLE [Kart_Resultado_Calendario] DROP CONSTRAINT [DF_Kart_Resultado_Calendario_tempoHoras1_2]
GO
ALTER TABLE [Kart_Resultado_Calendario] DROP CONSTRAINT [DF_Kart_Resultado_Calendario_tempoHoras1_1]
GO
ALTER TABLE [Kart_Resultado_Calendario] DROP CONSTRAINT [DF_Kart_Resultado_Calendario_tempoHoras1]
GO
ALTER TABLE [Kart_Resultado_Calendario] DROP CONSTRAINT [DF_Kart_Resultado_Calendario_tempo]
GO
ALTER TABLE [Kart_Noticias_Grupo] DROP CONSTRAINT [DF_Kart_Noticias_Grupo_dtCriacao]
GO
ALTER TABLE [Kart_log_erro] DROP CONSTRAINT [DF_Kart_log_erro_dtErro]
GO
ALTER TABLE [Kart_Grupo] DROP CONSTRAINT [DF_Kart_Grupo_Ativo]
GO
ALTER TABLE [Kart_Grupo] DROP CONSTRAINT [DF_Kart_Grupo_dtCriacao]
GO
ALTER TABLE [Kart_Grupo] DROP CONSTRAINT [DF_Kart_Grupo_permitirInsricoesNoSite]
GO
ALTER TABLE [Kart_Grid_Calendario] DROP CONSTRAINT [DF_Kart_Grid_Calendario_dtcriacao]
GO
ALTER TABLE [Kart_Grid_Calendario] DROP CONSTRAINT [DF_Kart_Grid_Calendario_tempoHora1]
GO
ALTER TABLE [Kart_Grid_Calendario] DROP CONSTRAINT [DF_Kart_Grid_Calendario_tempoSegundos]
GO
ALTER TABLE [Kart_Grid_Calendario] DROP CONSTRAINT [DF_Kart_Grid_Calendario_tempo]
GO
ALTER TABLE [Kart_Grid_Calendario] DROP CONSTRAINT [DF_Kart_Grid_Calendario_tempoMinutos]
GO
ALTER TABLE [Kart_Grid_Calendario] DROP CONSTRAINT [DF_Kart_Grid_Calendario_Volta]
GO
ALTER TABLE [Kart_Grid_Calendario] DROP CONSTRAINT [DF_Kart_Grid_Calendario_Pos]
GO
ALTER TABLE [Kart_Equipe_Campeonato] DROP CONSTRAINT [DF_Kart_Equipe_Campeonato_dtCriacao]
GO
ALTER TABLE [Kart_Campeonato] DROP CONSTRAINT [DF_Kart_Campeonato_Ativo]
GO
ALTER TABLE [Kart_Campeonato] DROP CONSTRAINT [DF_Kart_Campeonato_dtCriacao]
GO
ALTER TABLE [Kart_Calendario_Campeonato] DROP CONSTRAINT [DF_Kart_Calendario_Campeonato_Ativo]
GO
ALTER TABLE [Kart_Calendario_Campeonato] DROP CONSTRAINT [DF_Kart_Calendario_Campeonato_dtCriacao]
GO
ALTER TABLE [Kart_Album_Grupo] DROP CONSTRAINT [DF_Kart_Album_Grupo_dtCriacao]
GO
/****** Object:  Table [Kart_Videos_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Videos_Grupo]
GO
/****** Object:  Table [Kart_Regras_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Regras_Grupo]
GO
/****** Object:  Table [Kart_Ponto_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Ponto_Grupo]
GO
/****** Object:  Table [Kart_Noticias_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Noticias_Grupo]
GO
/****** Object:  Table [Kart_log_erro]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_log_erro]
GO
/****** Object:  Table [Kart_log_acesso]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_log_acesso]
GO
/****** Object:  Table [Kart_Grid_Calendario]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Grid_Calendario]
GO
/****** Object:  Table [Kart_Equipe_Campeonato_Desativados]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Equipe_Campeonato_Desativados]
GO
/****** Object:  Table [Kart_Campeonato_Usuario_Desativados]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Campeonato_Usuario_Desativados]
GO
/****** Object:  Table [Kart_Album_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Album_Grupo]
GO
/****** Object:  View [View_Kart_Usuario_Pontos_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
DROP VIEW [View_Kart_Usuario_Pontos_Grupo]
GO
/****** Object:  View [View_Kart_Usuario_Pontos_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
DROP VIEW [View_Kart_Usuario_Pontos_Campeonato]
GO
/****** Object:  View [View_Kart_Usuario_Historico]    Script Date: 21/08/2020 16:27:20 ******/
DROP VIEW [View_Kart_Usuario_Historico]
GO
/****** Object:  View [View_Kart_Equipe_Pontos_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
DROP VIEW [View_Kart_Equipe_Pontos_Campeonato]
GO
/****** Object:  Table [Kart_Usuario_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Usuario_Grupo]
GO
/****** Object:  Table [Kart_Resultado_Calendario]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Resultado_Calendario]
GO
/****** Object:  Table [Kart_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Grupo]
GO
/****** Object:  Table [Kart_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Campeonato]
GO
/****** Object:  Table [Kart_Calendario_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Calendario_Campeonato]
GO
/****** Object:  View [View_Equipe_Usuario]    Script Date: 21/08/2020 16:27:20 ******/
DROP VIEW [View_Equipe_Usuario]
GO
/****** Object:  Table [Kart_Usuario_Equipe_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Usuario_Equipe_Campeonato]
GO
/****** Object:  Table [Kart_Equipe_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
DROP TABLE [Kart_Equipe_Campeonato]
GO
/****** Object:  Table [Kart_Equipe_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Equipe_Campeonato](
	[idEquipeCampeonato] [int] IDENTITY(1,1) NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[NomeEquipe] [nvarchar](200) NOT NULL,
	[Sigla] [nvarchar](50) NOT NULL,
	[dtCriacao] [datetime] NULL,
 CONSTRAINT [PK_Kart_Equipe_Campeonato] PRIMARY KEY CLUSTERED 
(
	[idEquipeCampeonato] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Kart_Usuario_Equipe_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Usuario_Equipe_Campeonato](
	[idUsuarioEquipeCampeonato] [int] IDENTITY(1,1) NOT NULL,
	[idEquipeCampeonato] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[dtCriacao] [datetime] NULL,
 CONSTRAINT [PK_Kart_Usuario_Equipe_Campeonato] PRIMARY KEY CLUSTERED 
(
	[idUsuarioEquipeCampeonato] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [View_Equipe_Usuario]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View_Equipe_Usuario]
AS
SELECT dc.idUsuario, ec.NomeEquipe, ec.Sigla, ec.idEquipeCampeonato, ec.idCampeonato FROM Kart_Equipe_Campeonato ec (NOLOCK)
join Kart_Usuario_Equipe_Campeonato dc (NOLOCK) on (dc.idEquipeCampeonato = ec.idEquipeCampeonato)
GO
/****** Object:  Table [Kart_Calendario_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Calendario_Campeonato](
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
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Kart_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Campeonato](
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
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Kart_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Grupo](
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
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Kart_Resultado_Calendario]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Resultado_Calendario](
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
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Kart_Usuario_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Usuario_Grupo](
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
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [View_Kart_Equipe_Pontos_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View_Kart_Equipe_Pontos_Campeonato]  
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
/****** Object:  View [View_Kart_Usuario_Historico]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View_Kart_Usuario_Historico]  
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
/****** Object:  View [View_Kart_Usuario_Pontos_Campeonato]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View_Kart_Usuario_Pontos_Campeonato]  
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
/****** Object:  View [View_Kart_Usuario_Pontos_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View_Kart_Usuario_Pontos_Grupo]
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
/****** Object:  Table [Kart_Album_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Album_Grupo](
	[idAlbum] [int] IDENTITY(1,1) NOT NULL,
	[idGrupo] [int] NOT NULL,
	[idCalendario] [int] NULL,
	[NomeAlbum] [nvarchar](100) NOT NULL,
	[Descricao] [nvarchar](max) NULL,
	[dtEvento] [datetime] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[UrlFotos] [nvarchar](max) NULL,
	[PathFotos] [nvarchar](max) NULL,
	[dtCriacao] [datetime] NULL,
 CONSTRAINT [PK_Kart_Album_Grupo] PRIMARY KEY CLUSTERED 
(
	[idAlbum] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Kart_Campeonato_Usuario_Desativados]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Campeonato_Usuario_Desativados](
	[idDesativado] [int] IDENTITY(1,1) NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[dtCadastro] [datetime] NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
 CONSTRAINT [PK_Kart_Campeonato_Usuario_Desativados] PRIMARY KEY CLUSTERED 
(
	[idDesativado] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Kart_Equipe_Campeonato_Desativados]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Equipe_Campeonato_Desativados](
	[idDesativados] [int] IDENTITY(1,1) NOT NULL,
	[idEquipeCampeonato] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[dtCadastro] [datetime] NOT NULL,
	[idUsuarioCadastro] [int] NOT NULL,
 CONSTRAINT [PK_Kart_Equipe_Campeonato_Desativados] PRIMARY KEY CLUSTERED 
(
	[idDesativados] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Kart_Grid_Calendario]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Grid_Calendario](
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
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Kart_log_acesso]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_log_acesso](
	[idAcesso] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[dtAcesso] [datetime] NOT NULL,
 CONSTRAINT [PK_Kart_log_acesso] PRIMARY KEY CLUSTERED 
(
	[idAcesso] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Kart_log_erro]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_log_erro](
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
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Kart_Noticias_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Noticias_Grupo](
	[idNoticias] [int] IDENTITY(1,1) NOT NULL,
	[idGrupo] [int] NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Noticia] [varchar](max) NOT NULL,
	[Ativo] [bit] NOT NULL,
	[dtEvento] [datetime] NULL,
	[dtCriacao] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Kart_Noticias_Grupo] PRIMARY KEY CLUSTERED 
(
	[idNoticias] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Kart_Ponto_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Ponto_Grupo](
	[idPontoGrupo] [int] IDENTITY(1,1) NOT NULL,
	[idGrupo] [int] NOT NULL,
	[Pos] [int] NOT NULL,
	[Ponto] [int] NOT NULL,
	[dtCriacao] [datetime] NULL,
	[idUsuarioCadastro] [int] NOT NULL,
 CONSTRAINT [PK_Kart_Ponto_Grupo] PRIMARY KEY CLUSTERED 
(
	[idPontoGrupo] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Kart_Regras_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Regras_Grupo](
	[idRegra] [int] IDENTITY(1,1) NOT NULL,
	[idGrupo] [int] NOT NULL,
	[Regra] [text] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[dtCadastro] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_Kart_Regras_Grupo] PRIMARY KEY CLUSTERED 
(
	[idRegra] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Kart_Videos_Grupo]    Script Date: 21/08/2020 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Kart_Videos_Grupo](
	[idVideo] [int] IDENTITY(1,1) NOT NULL,
	[idGrupo] [int] NOT NULL,
	[idCalendario] [int] NULL,
	[txtTitulo] [varchar](255) NULL,
	[dtEvento] [datetime] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[UrlVideo] [nvarchar](max) NOT NULL,
	[dtCriacao] [datetime] NULL,
 CONSTRAINT [PK_Kart_Videos_Grupo] PRIMARY KEY CLUSTERED 
(
	[idVideo] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [Kart_Album_Grupo] ON 

INSERT [Kart_Album_Grupo] ([idAlbum], [idGrupo], [idCalendario], [NomeAlbum], [Descricao], [dtEvento], [IdUsuario], [UrlFotos], [PathFotos], [dtCriacao]) VALUES (4, 2, NULL, N'Teste', N'', CAST(N'2013-04-02T22:58:11.890' AS DateTime), 1, N'/Fotos/2_020420132258', N'E:\Inetpub\vhosts\afonsoft.com.br\kart.afonsoft.com.br\\Fotos\2_020420132258', CAST(N'2013-04-02T22:58:11.890' AS DateTime))
INSERT [Kart_Album_Grupo] ([idAlbum], [idGrupo], [idCalendario], [NomeAlbum], [Descricao], [dtEvento], [IdUsuario], [UrlFotos], [PathFotos], [dtCriacao]) VALUES (5, 3, 50, N'Rubens Barrichello', N'', CAST(N'2015-07-13T00:00:00.000' AS DateTime), 1, N'/Fotos/3_150720151110', N'E:\Inetpub\vhosts\afonsoft.com.br\kart.afonsoft.com.br\\Fotos\3_150720151110', CAST(N'2015-07-15T11:10:51.197' AS DateTime))
INSERT [Kart_Album_Grupo] ([idAlbum], [idGrupo], [idCalendario], [NomeAlbum], [Descricao], [dtEvento], [IdUsuario], [UrlFotos], [PathFotos], [dtCriacao]) VALUES (6, 10, 94, N'Corrida da Descordia', N'', CAST(N'2017-04-03T00:00:00.000' AS DateTime), 193, N'/Fotos/10_080420172249', N'E:\Inetpub\vhosts\afonsoft.com.br\kart.afonsoft.com.br\\Fotos\10_080420172249', CAST(N'2017-04-08T22:49:30.423' AS DateTime))
INSERT [Kart_Album_Grupo] ([idAlbum], [idGrupo], [idCalendario], [NomeAlbum], [Descricao], [dtEvento], [IdUsuario], [UrlFotos], [PathFotos], [dtCriacao]) VALUES (7, 8, NULL, N'SBC KART', N'', CAST(N'2017-04-19T00:00:00.000' AS DateTime), 183, N'/Fotos/8_030520171644', N'E:\Inetpub\vhosts\afonsoft.com.br\kart.afonsoft.com.br\\Fotos\8_030520171644', CAST(N'2017-05-03T16:44:13.367' AS DateTime))
INSERT [Kart_Album_Grupo] ([idAlbum], [idGrupo], [idCalendario], [NomeAlbum], [Descricao], [dtEvento], [IdUsuario], [UrlFotos], [PathFotos], [dtCriacao]) VALUES (8, 7, NULL, N'1ª Etapa', N'', CAST(N'2018-01-28T00:00:00.000' AS DateTime), 159, N'/Fotos/7_300120181418', N'E:\Inetpub\vhosts\afonsoft.com.br\kart.afonsoft.com.br\\Fotos\7_300120181418', CAST(N'2018-01-30T14:18:09.987' AS DateTime))
INSERT [Kart_Album_Grupo] ([idAlbum], [idGrupo], [idCalendario], [NomeAlbum], [Descricao], [dtEvento], [IdUsuario], [UrlFotos], [PathFotos], [dtCriacao]) VALUES (9, 7, NULL, N'2ª Etapa', N'', CAST(N'2018-02-25T00:00:00.000' AS DateTime), 159, N'/Fotos/7_280220181005', N'E:\Inetpub\vhosts\afonsoft.com.br\kart.afonsoft.com.br\\Fotos\7_280220181005', CAST(N'2018-02-28T10:05:16.093' AS DateTime))
SET IDENTITY_INSERT [Kart_Album_Grupo] OFF
SET IDENTITY_INSERT [Kart_Calendario_Campeonato] ON 

INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (1, 1, CAST(N'2012-01-01T00:00:00' AS SmallDateTime), N'01', N'Granja Viana', N'12:00', NULL, CAST(N'2012-06-25T14:42:56.753' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (2, 2, CAST(N'2012-07-16T00:00:00' AS SmallDateTime), N'Etapa 07', N'Granja Viana', N'22:00', NULL, CAST(N'2012-07-18T15:25:56.123' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (3, 2, CAST(N'2012-08-13T00:00:00' AS SmallDateTime), N'Etapa 08', N'Granja Viana', N'22:00', NULL, CAST(N'2012-08-23T13:40:54.117' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (4, 2, CAST(N'2012-01-16T00:00:00' AS SmallDateTime), N'Etapa 01', N'Granja Viana', N'22:00', NULL, CAST(N'2012-08-29T14:01:38.003' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (5, 2, CAST(N'2012-02-13T00:00:00' AS SmallDateTime), N'Etapa 02', N'Granja Viana', N'22:00', NULL, CAST(N'2012-08-29T14:02:47.563' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (6, 2, CAST(N'2012-03-19T00:00:00' AS SmallDateTime), N'Etapa 03', N'Granja Viana', N'22:00', NULL, CAST(N'2012-08-29T14:03:23.737' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (7, 2, CAST(N'2012-04-16T00:00:00' AS SmallDateTime), N'Etapa 04', N'Granja Viana', N'22:00', NULL, CAST(N'2012-08-29T14:06:54.203' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (8, 2, CAST(N'2012-05-14T00:00:00' AS SmallDateTime), N'Etapa 05', N'Granja Viana', N'22:00', NULL, CAST(N'2012-08-29T14:07:37.080' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (9, 2, CAST(N'2012-06-18T00:00:00' AS SmallDateTime), N'Etapa 06', N'Granja Viana', N'22:00', NULL, CAST(N'2012-08-29T14:08:06.487' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (10, 2, CAST(N'2012-09-18T00:00:00' AS SmallDateTime), N'Etapa 09', N'Aldeia da Serra', N'22:00', NULL, CAST(N'2012-08-29T14:08:41.360' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (11, 2, CAST(N'2012-10-15T00:00:00' AS SmallDateTime), N'Etapa 10', N'Granja Viana', N'22:00', NULL, CAST(N'2012-08-29T14:09:24.393' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (12, 2, CAST(N'2012-11-28T00:00:00' AS SmallDateTime), N'Etapa 11', N'Aldeia da Serra', N'22:00', NULL, CAST(N'2012-08-29T14:09:58.017' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (13, 2, CAST(N'2012-12-17T00:00:00' AS SmallDateTime), N'Etapa 12', N'Granja Viana *** CANCELADA ***', N'22:00', NULL, CAST(N'2012-08-29T14:10:32.563' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (14, 3, CAST(N'2013-01-14T00:00:00' AS SmallDateTime), N'Etapa 01', N'Granja Viana ', N'22:00', NULL, CAST(N'2013-01-04T09:24:29.157' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (15, 4, CAST(N'2013-01-14T00:00:00' AS SmallDateTime), N'Etapa 01', N'Granja Viana', N'22:00', NULL, CAST(N'2013-01-15T09:05:09.153' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (16, 5, CAST(N'2013-01-19T00:00:00' AS SmallDateTime), N'werwe', N'werwer', N'12:31', NULL, CAST(N'2013-01-18T15:21:27.327' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (18, 3, CAST(N'2013-02-18T00:00:00' AS SmallDateTime), N'Etapa 02', N'Granja Viana ', N'22:00', NULL, CAST(N'2013-02-19T11:22:03.687' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (19, 4, CAST(N'2013-02-18T00:00:00' AS SmallDateTime), N'Etapa 02', N'Granja Viana', N'22:00', NULL, CAST(N'2013-03-12T16:10:16.097' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (20, 4, CAST(N'2013-03-11T00:00:00' AS SmallDateTime), N'Etapa 03', N'Granja Viana', N'22:00', NULL, CAST(N'2013-03-12T16:12:54.297' AS DateTime), 1)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (21, 4, CAST(N'2013-04-22T00:00:00' AS SmallDateTime), N'Etapa 04', N'Granja Viana ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (22, 7, CAST(N'2013-04-23T00:00:00' AS SmallDateTime), N'01', N'Granja', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (23, 4, CAST(N'2013-05-13T00:00:00' AS SmallDateTime), N'Etapa 05', N'Granja Viana ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (24, 4, CAST(N'2013-06-10T00:00:00' AS SmallDateTime), N'Etapa 06', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (25, 4, CAST(N'2013-07-15T00:00:00' AS SmallDateTime), N'Etapa 07', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (26, 4, CAST(N'2013-08-12T00:00:00' AS SmallDateTime), N'Etapa 08', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (27, 4, CAST(N'2013-09-16T00:00:00' AS SmallDateTime), N'Etapa 09', N'Granja Viana ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (28, 4, CAST(N'2013-10-14T00:00:00' AS SmallDateTime), N'Etapa 10', N'Granja Viana ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (29, 4, CAST(N'2013-11-10T00:00:00' AS SmallDateTime), N'Etapa 11', N'Granja Viana ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (30, 4, CAST(N'2013-12-09T00:00:00' AS SmallDateTime), N'Etapa 12', N'Granja Viana ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (31, 9, CAST(N'2014-01-20T00:00:00' AS SmallDateTime), N'Etapa 01', N'Granja Viana ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (32, 9, CAST(N'2014-02-17T00:00:00' AS SmallDateTime), N'Etapa 02', N'Granja Viana ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (33, 9, CAST(N'2014-03-17T00:00:00' AS SmallDateTime), N'Etapa 03', N'Granja Viana ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (34, 9, CAST(N'2014-04-14T00:00:00' AS SmallDateTime), N'Etapa 04', N'Granja Viana ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (36, 9, CAST(N'2014-05-19T00:00:00' AS SmallDateTime), N'Etapa 05', N'Granja Viana', N'22:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (37, 9, CAST(N'2014-06-16T00:00:00' AS SmallDateTime), N'Etapa 06', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (38, 9, CAST(N'2014-07-21T00:00:00' AS SmallDateTime), N'Etapa 07', N'Granja Viana', N'22:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (39, 9, CAST(N'2014-08-18T00:00:00' AS SmallDateTime), N'Etapa 08', N'Granja Viana', N'22:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (40, 9, CAST(N'2014-09-22T00:00:00' AS SmallDateTime), N'Etapa 09', N'Granja Viana', N'22:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (41, 9, CAST(N'2014-10-20T00:00:00' AS SmallDateTime), N'Etapa 10', N'Granja Viana', N'22:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (42, 9, CAST(N'2014-11-17T00:00:00' AS SmallDateTime), N'Etapa 11', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (43, 9, CAST(N'2014-12-15T00:00:00' AS SmallDateTime), N'Etapa 12', N'Granja Viana', N'22:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (44, 8, CAST(N'2015-01-19T00:00:00' AS SmallDateTime), N'Etapa 01', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (45, 8, CAST(N'2015-02-09T00:00:00' AS SmallDateTime), N'Etapa 02', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (46, 8, CAST(N'2015-03-16T00:00:00' AS SmallDateTime), N'Etapa 03', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (47, 8, CAST(N'2015-04-13T00:00:00' AS SmallDateTime), N'Etapa 04', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (48, 8, CAST(N'2015-05-18T00:00:00' AS SmallDateTime), N'Etapa 05', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (49, 8, CAST(N'2015-06-22T00:00:00' AS SmallDateTime), N'Etapa 06', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (50, 8, CAST(N'2015-07-20T00:00:00' AS SmallDateTime), N'Etapa 07', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (51, 8, CAST(N'2015-08-17T00:00:00' AS SmallDateTime), N'Etapa 08', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (52, 8, CAST(N'2015-09-21T00:00:00' AS SmallDateTime), N'Etapa 09', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (53, 8, CAST(N'2015-10-19T00:00:00' AS SmallDateTime), N'Etapa 10', N'Granja Viana', N'22:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (54, 8, CAST(N'2015-11-16T00:00:00' AS SmallDateTime), N'Etapa 11', N'Granja Viana', N'22:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (55, 8, CAST(N'2015-12-14T00:00:00' AS SmallDateTime), N'Etapa 12', N'Granja Viana', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (56, 10, CAST(N'2017-01-29T00:00:00' AS SmallDateTime), N'1ª Etapa', N'Aldeia da Serra', N'15:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (57, 10, CAST(N'2017-02-19T00:00:00' AS SmallDateTime), N'2ª Etapa', N'Speedland', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (58, 10, CAST(N'2017-03-26T00:00:00' AS SmallDateTime), N'3ª Etapa', N'Aldeia da Serra', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (59, 10, CAST(N'2017-04-23T00:00:00' AS SmallDateTime), N'4ª Etapa', N'Granja Viana', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (60, 10, CAST(N'2017-05-28T00:00:00' AS SmallDateTime), N'5ª Etapa', N'Interlagos', N'18:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (61, 10, CAST(N'2017-06-25T00:00:00' AS SmallDateTime), N'6ª Etapa', N'Nova Odessa', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (62, 10, CAST(N'2017-06-25T00:00:00' AS SmallDateTime), N'7ª Etapa', N'Nova Odessa', N'14:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (63, 11, CAST(N'2017-01-29T00:00:00' AS SmallDateTime), N'1ª Etapa', N'Aldeia da Serra', N'15:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (64, 11, CAST(N'2017-02-19T00:00:00' AS SmallDateTime), N'2ª Etapa', N'Speedland', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (65, 11, CAST(N'2017-03-26T00:00:00' AS SmallDateTime), N'3ª Etapa', N'Aldeia da Serra', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (66, 11, CAST(N'2017-04-23T00:00:00' AS SmallDateTime), N'4ª Etapa', N'Granja Viana', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (67, 11, CAST(N'2017-05-28T00:00:00' AS SmallDateTime), N'5ª Etapa', N'Interlagos', N'18:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (68, 11, CAST(N'2017-06-25T00:00:00' AS SmallDateTime), N'6ª Etapa', N'Nova Odessa', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (69, 11, CAST(N'2017-06-25T00:00:00' AS SmallDateTime), N'7ª Etapa', N'Nova Odessa', N'14:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (70, 12, CAST(N'2018-01-28T00:00:00' AS SmallDateTime), N'1ª Etapa', N'Granja Viana', N'18:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (71, 12, CAST(N'2018-02-25T00:00:00' AS SmallDateTime), N'2ª Etapa', N'Interlagos', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (72, 12, CAST(N'2018-03-25T00:00:00' AS SmallDateTime), N'3ª Etapa', N'Speedland', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (73, 12, CAST(N'2018-04-29T00:00:00' AS SmallDateTime), N'4ª Etapa', N'Granja Viana', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (74, 12, CAST(N'2018-05-27T00:00:00' AS SmallDateTime), N'5ª Etapa', N'Interlagos', N'18:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (75, 12, CAST(N'2018-06-24T00:00:00' AS SmallDateTime), N'6ª Etapa', N'Nova Odessa', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (76, 12, CAST(N'2018-06-24T00:00:00' AS SmallDateTime), N'7ª Etapa', N'Nova Odessa', N'15:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (77, 13, CAST(N'2017-04-03T00:00:00' AS SmallDateTime), N'etapa 1', N'kart sbc', N'15:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (78, 13, CAST(N'2017-05-17T00:00:00' AS SmallDateTime), N'etapa 2', N'kart sbc', N'20:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (79, 13, CAST(N'2017-06-14T00:00:00' AS SmallDateTime), N'etapa 3 ', N'kart sbc', N'20:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (80, 13, CAST(N'2017-07-19T00:00:00' AS SmallDateTime), N'etapa 5', N'kart sbc', N'20:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (81, 13, CAST(N'2017-08-16T00:00:00' AS SmallDateTime), N'etapa 5', N'kart sbc', N'19:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (82, 14, CAST(N'2017-01-30T00:00:00' AS SmallDateTime), N'1ª Etapa', N'Speedland pista interna horário', N'22:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (83, 14, CAST(N'2017-03-06T00:00:00' AS SmallDateTime), N'2ª Etapa', N'Speedland pista interna horário', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (84, 14, CAST(N'2017-04-03T00:00:00' AS SmallDateTime), N'3ª Etapa', N'Speedland pista aberta anti-horário', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (85, 14, CAST(N'2017-05-08T00:00:00' AS SmallDateTime), N'4ª Etapa ', N'Speedland pista indefinida', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (86, 14, CAST(N'2017-06-05T00:00:00' AS SmallDateTime), N'5ª Etapa', N'Speedland pista indefinida', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (87, 14, CAST(N'2017-07-03T00:00:00' AS SmallDateTime), N'6ª Etapa', N'Speedland pista indefinida', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (88, 14, CAST(N'2017-08-07T00:00:00' AS SmallDateTime), N'7ª Etapa', N'Speedland pista indefinida', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (89, 14, CAST(N'2017-09-04T00:00:00' AS SmallDateTime), N'8ª Etapa', N'Speedland pista indefinida', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (90, 14, CAST(N'2017-10-02T00:00:00' AS SmallDateTime), N'9ª Etapa', N'Speedland pista indefinida', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (91, 14, CAST(N'2017-11-06T00:00:00' AS SmallDateTime), N'10ª Etapa', N'Speedland pista indefinida', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (92, 15, CAST(N'2017-01-30T00:00:00' AS SmallDateTime), N'1ª Etapa', N'Speedland pista interna horário', N'22:30', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (93, 15, CAST(N'2017-03-06T00:00:00' AS SmallDateTime), N'2ª Etapa', N'Speedland pista interna horário', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (94, 15, CAST(N'2017-04-03T00:00:00' AS SmallDateTime), N'3ª Etapa', N'Speedland pista aberta anti-horário', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (95, 15, CAST(N'2017-06-05T00:00:00' AS SmallDateTime), N'5ª Etapa', N'Speedland pista interna horário', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (96, 15, CAST(N'2017-05-08T00:00:00' AS SmallDateTime), N'4ª Etapa', N'Speedland pista aberta anti-horário', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (97, 15, CAST(N'2017-07-03T00:00:00' AS SmallDateTime), N'6ª Etapa', N'Speedland pista aberta anti-horário', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (98, 15, CAST(N'2017-08-14T00:00:00' AS SmallDateTime), N'7ª Etapa ', N'Speedland pista aberta anti-horário', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (99, 15, CAST(N'2017-09-04T00:00:00' AS SmallDateTime), N'8ª Etapa', N'Speedland pista aberta anti-horário', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (100, 15, CAST(N'2017-10-02T00:00:00' AS SmallDateTime), N'9ª Etapa ', N'Speedland pista aberta anti-horário', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (101, 15, CAST(N'2017-11-06T00:00:00' AS SmallDateTime), N'10º Etapa', N'Speedland pista aberta anti-horário', N'22:00', NULL, NULL, NULL)
GO
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (102, 16, CAST(N'2018-02-05T00:00:00' AS SmallDateTime), N'1ª Etapa', N'Speedland ', N'22:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (112, 12, CAST(N'2018-08-26T00:00:00' AS SmallDateTime), N'8ª Etapa', N'Interlagos', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (113, 12, CAST(N'2018-09-30T00:00:00' AS SmallDateTime), N'9ª Etapa', N'Interlagos', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (114, 12, CAST(N'2018-10-28T00:00:00' AS SmallDateTime), N'10ª Etapa', N'Speedland', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (115, 12, CAST(N'2018-11-25T00:00:00' AS SmallDateTime), N'11ª Etapa', N'Nova Odessa', N'14:00', NULL, NULL, NULL)
INSERT [Kart_Calendario_Campeonato] ([idCalendario], [idCampeonato], [Data], [Nome], [Kartodromo], [Horario], [Circuito], [dtCriacao], [Ativo]) VALUES (116, 12, CAST(N'2018-11-25T00:00:00' AS SmallDateTime), N'12ª Etapa', N'Nova Odessa', N'15:00', NULL, NULL, NULL)
SET IDENTITY_INSERT [Kart_Calendario_Campeonato] OFF
SET IDENTITY_INSERT [Kart_Campeonato] ON 

INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (1, 2, CAST(N'2012-01-01T00:00:00.000' AS DateTime), CAST(N'2012-12-30T00:00:00.000' AS DateTime), N'Campeonato 2012', CAST(N'2013-03-20T08:39:42.973' AS DateTime), 0)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (2, 3, CAST(N'2012-01-01T00:00:00.000' AS DateTime), CAST(N'2012-12-31T00:00:00.000' AS DateTime), N'Kart Amigos 2012', CAST(N'2012-07-18T15:24:05.000' AS DateTime), 0)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (3, 4, CAST(N'2013-01-14T00:00:00.000' AS DateTime), CAST(N'2013-12-16T00:00:00.000' AS DateTime), N'Kart - Amigos 2013', CAST(N'2013-01-04T09:23:46.580' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (4, 3, CAST(N'2013-01-14T00:00:00.000' AS DateTime), CAST(N'2013-12-31T00:00:00.000' AS DateTime), N'Kart Amigos 2013', CAST(N'2013-01-04T09:28:23.300' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (5, 1, CAST(N'2013-01-17T00:00:00.000' AS DateTime), CAST(N'2013-01-15T00:00:00.000' AS DateTime), N'dasdasd', CAST(N'2013-01-18T15:20:36.237' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (6, 2, CAST(N'2013-03-01T00:00:00.000' AS DateTime), CAST(N'2013-03-20T00:00:00.000' AS DateTime), N'TESTE', CAST(N'2013-03-20T08:40:11.653' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (7, 2, CAST(N'2013-01-01T00:00:00.000' AS DateTime), CAST(N'2013-03-27T00:00:00.000' AS DateTime), N'teste 2013', CAST(N'2013-03-20T08:46:44.123' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (8, 3, CAST(N'2015-01-19T00:00:00.000' AS DateTime), CAST(N'2015-12-31T00:00:00.000' AS DateTime), N'Kart Amigos 2015', CAST(N'2015-01-20T08:28:48.130' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (9, 3, CAST(N'2014-11-17T00:00:00.000' AS DateTime), CAST(N'2014-11-17T00:00:00.000' AS DateTime), N'Etapa 11', CAST(N'2014-11-04T10:48:38.570' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (10, 6, CAST(N'2017-01-29T00:00:00.000' AS DateTime), CAST(N'2017-06-25T00:00:00.000' AS DateTime), N'KAB Classe Ouro 2017', CAST(N'2017-02-05T21:14:11.220' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (11, 6, CAST(N'2017-01-29T00:00:00.000' AS DateTime), CAST(N'2017-06-25T00:00:00.000' AS DateTime), N'KAB Classe Prata 2017', CAST(N'2017-02-05T21:17:36.877' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (12, 7, CAST(N'2018-01-28T00:00:00.000' AS DateTime), CAST(N'2018-11-25T00:00:00.000' AS DateTime), N'KAB 2018', CAST(N'2018-01-30T13:45:40.300' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (13, 8, CAST(N'2018-07-04T00:00:00.000' AS DateTime), CAST(N'2017-12-06T00:00:00.000' AS DateTime), N'BettaGroup Kart 2017', CAST(N'2017-05-03T16:16:40.100' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (14, 9, CAST(N'2017-01-30T00:00:00.000' AS DateTime), CAST(N'2017-11-06T00:00:00.000' AS DateTime), N'Copa Outback de Kart', CAST(N'2017-04-05T18:05:13.390' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (15, 10, CAST(N'2017-01-30T00:00:00.000' AS DateTime), CAST(N'2017-11-06T00:00:00.000' AS DateTime), N'Copa Outback de Kart Temporada 2017', CAST(N'2018-01-19T14:48:50.837' AS DateTime), 0)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (16, 10, CAST(N'2018-02-05T00:00:00.000' AS DateTime), CAST(N'2018-11-05T00:00:00.000' AS DateTime), N'Copa Outback de Kart Temporada 2018', CAST(N'2018-01-19T14:48:12.743' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (17, 12, CAST(N'2018-04-10T00:00:00.000' AS DateTime), CAST(N'2018-12-02T00:00:00.000' AS DateTime), N'', CAST(N'2018-04-25T10:51:48.170' AS DateTime), 0)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (18, 13, CAST(N'2018-05-26T00:00:00.000' AS DateTime), CAST(N'2018-11-25T00:00:00.000' AS DateTime), N'Kart dos Amigos', CAST(N'2018-05-08T16:52:44.200' AS DateTime), 1)
INSERT [Kart_Campeonato] ([idCampeonato], [idGrupo], [dtInicio], [dtFim], [NomeCampeonato], [dtCriacao], [Ativo]) VALUES (19, 15, CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2018-12-31T00:00:00.000' AS DateTime), N'Mamulengos CUP 2018', CAST(N'2018-05-22T11:05:45.787' AS DateTime), 1)
SET IDENTITY_INSERT [Kart_Campeonato] OFF
SET IDENTITY_INSERT [Kart_Campeonato_Usuario_Desativados] ON 

INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (1, 9, 14, CAST(N'2014-04-04T10:08:27.300' AS DateTime), 1)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (3, 9, 80, CAST(N'2014-04-04T10:09:01.583' AS DateTime), 1)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (4, 9, 40, CAST(N'2014-08-20T09:58:23.630' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (5, 9, 52, CAST(N'2014-08-20T09:58:30.103' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (6, 9, 66, CAST(N'2014-08-20T09:58:36.360' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (7, 9, 67, CAST(N'2014-08-20T09:58:44.470' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (8, 9, 17, CAST(N'2014-08-20T09:58:57.327' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (9, 9, 21, CAST(N'2014-08-20T09:59:05.920' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (10, 9, 19, CAST(N'2014-08-20T09:59:11.663' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (11, 9, 35, CAST(N'2014-08-20T09:59:23.690' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (12, 9, 13, CAST(N'2014-08-20T09:59:32.253' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (13, 9, 71, CAST(N'2014-08-20T09:59:41.550' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (14, 9, 68, CAST(N'2014-08-20T09:59:48.383' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (15, 9, 61, CAST(N'2014-08-20T10:00:00.770' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (16, 9, 65, CAST(N'2014-08-20T10:00:16.497' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (17, 9, 63, CAST(N'2014-08-20T10:00:25.980' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (18, 9, 22, CAST(N'2014-08-20T10:00:39.367' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (19, 9, 73, CAST(N'2014-08-20T10:00:44.653' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (20, 9, 64, CAST(N'2014-08-20T10:00:50.410' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (21, 9, 100, CAST(N'2014-08-20T10:01:03.327' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (22, 9, 25, CAST(N'2014-08-20T10:01:08.007' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (23, 9, 8, CAST(N'2014-08-20T10:01:14.497' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (24, 9, 62, CAST(N'2014-08-20T10:01:19.600' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (25, 9, 18, CAST(N'2014-08-20T10:01:36.103' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (26, 9, 36, CAST(N'2014-08-20T10:01:44.417' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (27, 9, 70, CAST(N'2014-08-20T10:01:51.953' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (28, 9, 74, CAST(N'2014-08-20T10:02:05.323' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (29, 9, 30, CAST(N'2014-08-20T10:02:12.373' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (30, 9, 53, CAST(N'2014-08-20T10:02:17.133' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (31, 9, 23, CAST(N'2014-08-20T10:02:22.903' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (32, 9, 72, CAST(N'2014-08-20T10:02:44.697' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (33, 9, 85, CAST(N'2014-08-20T10:02:45.197' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (34, 9, 77, CAST(N'2014-08-20T10:02:57.113' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (35, 9, 84, CAST(N'2014-08-20T10:03:06.803' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (36, 9, 37, CAST(N'2014-08-20T10:03:11.013' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (37, 9, 38, CAST(N'2014-08-20T10:03:16.460' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (38, 9, 9, CAST(N'2014-08-20T10:03:22.153' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (39, 9, 39, CAST(N'2014-08-20T10:03:31.403' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (40, 9, 78, CAST(N'2014-08-20T10:03:40.280' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (41, 9, 59, CAST(N'2014-08-20T10:04:21.933' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (42, 9, 43, CAST(N'2014-08-20T10:04:28.657' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (43, 9, 81, CAST(N'2014-08-20T10:04:37.017' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (44, 9, 33, CAST(N'2014-08-20T10:04:46.130' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (45, 9, 31, CAST(N'2014-08-20T10:04:55.037' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (46, 9, 24, CAST(N'2014-08-20T10:05:02.273' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (47, 9, 6, CAST(N'2014-08-20T10:05:11.777' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (48, 9, 60, CAST(N'2014-08-20T10:05:15.863' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (49, 9, 34, CAST(N'2014-08-20T10:05:21.323' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (50, 9, 44, CAST(N'2014-08-20T10:06:00.963' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (51, 9, 82, CAST(N'2014-08-20T10:06:01.477' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (52, 9, 32, CAST(N'2014-08-20T10:06:12.867' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (53, 9, 46, CAST(N'2014-08-20T10:06:18.340' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (54, 9, 104, CAST(N'2014-08-20T10:06:23.660' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (55, 9, 69, CAST(N'2014-08-20T10:06:40.073' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (56, 9, 20, CAST(N'2014-08-20T10:06:46.703' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (57, 9, 45, CAST(N'2014-08-20T10:06:59.697' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (58, 9, 58, CAST(N'2014-08-20T10:07:06.810' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (59, 9, 28, CAST(N'2014-08-20T10:07:27.823' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (60, 9, 107, CAST(N'2014-08-20T10:07:37.840' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (61, 8, 116, CAST(N'2015-01-20T09:52:22.240' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (62, 8, 40, CAST(N'2015-01-20T09:52:32.833' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (63, 8, 77, CAST(N'2015-01-20T09:52:39.333' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (64, 8, 36, CAST(N'2015-01-20T09:52:43.850' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (65, 8, 52, CAST(N'2015-01-20T09:52:49.163' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (66, 8, 111, CAST(N'2015-01-20T09:52:56.677' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (67, 8, 66, CAST(N'2015-01-20T09:53:03.413' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (68, 8, 64, CAST(N'2015-01-20T09:53:08.100' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (69, 8, 67, CAST(N'2015-01-20T09:53:14.867' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (70, 8, 46, CAST(N'2015-01-20T09:53:21.413' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (71, 8, 17, CAST(N'2015-01-20T09:53:34.163' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (72, 8, 21, CAST(N'2015-01-20T09:53:40.177' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (73, 8, 19, CAST(N'2015-01-20T09:53:46.240' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (74, 8, 73, CAST(N'2015-01-20T09:53:50.927' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (75, 8, 84, CAST(N'2015-01-20T09:53:55.537' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (76, 8, 37, CAST(N'2015-01-20T09:54:02.177' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (77, 8, 60, CAST(N'2015-01-20T09:54:06.710' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (78, 8, 100, CAST(N'2015-01-20T09:54:11.460' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (79, 8, 38, CAST(N'2015-01-20T09:54:17.600' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (80, 8, 25, CAST(N'2015-01-20T09:54:21.990' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (81, 8, 85, CAST(N'2015-01-20T09:54:29.943' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (82, 8, 72, CAST(N'2015-01-20T09:54:36.567' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (83, 8, 6, CAST(N'2015-01-20T09:54:44.677' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (84, 8, 47, CAST(N'2015-01-20T09:54:50.850' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (85, 8, 74, CAST(N'2015-01-20T09:54:58.020' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (86, 8, 30, CAST(N'2015-01-20T09:55:04.257' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (87, 8, 70, CAST(N'2015-01-20T09:55:12.350' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (88, 8, 39, CAST(N'2015-01-20T09:55:17.413' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (89, 8, 62, CAST(N'2015-01-20T09:55:23.257' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (90, 8, 97, CAST(N'2015-01-20T09:55:29.897' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (91, 8, 117, CAST(N'2015-01-20T09:55:35.067' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (92, 8, 23, CAST(N'2015-01-20T09:55:40.317' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (93, 8, 78, CAST(N'2015-01-20T09:55:44.927' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (94, 8, 53, CAST(N'2015-01-20T09:55:52.257' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (95, 8, 9, CAST(N'2015-01-20T09:55:57.787' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (96, 8, 44, CAST(N'2015-01-20T09:56:08.960' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (97, 8, 58, CAST(N'2015-01-20T09:56:19.663' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (98, 8, 35, CAST(N'2015-01-20T09:56:25.867' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (99, 8, 27, CAST(N'2015-01-20T09:56:31.490' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (100, 8, 34, CAST(N'2015-01-20T09:56:36.053' AS DateTime), 2)
GO
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (101, 8, 14, CAST(N'2015-01-20T09:56:40.193' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (102, 8, 31, CAST(N'2015-01-20T09:56:44.537' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (103, 8, 24, CAST(N'2015-01-20T09:56:50.100' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (104, 8, 69, CAST(N'2015-01-20T09:56:57.053' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (105, 8, 8, CAST(N'2015-01-20T09:57:01.583' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (106, 8, 18, CAST(N'2015-01-20T09:57:06.460' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (107, 8, 32, CAST(N'2015-01-20T09:57:11.317' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (108, 8, 29, CAST(N'2015-01-20T09:57:20.647' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (109, 8, 107, CAST(N'2015-01-20T09:57:36.380' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (110, 8, 55, CAST(N'2015-01-20T09:57:41.960' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (111, 8, 33, CAST(N'2015-01-20T09:57:47.317' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (112, 8, 22, CAST(N'2015-01-20T09:57:57.507' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (113, 8, 101, CAST(N'2015-01-20T09:58:03.817' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (114, 8, 45, CAST(N'2015-01-20T09:58:14.677' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (115, 8, 81, CAST(N'2015-01-20T09:58:25.583' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (116, 8, 83, CAST(N'2015-01-20T09:58:32.647' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (117, 8, 61, CAST(N'2015-01-20T09:58:38.507' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (118, 8, 59, CAST(N'2015-01-20T09:58:46.067' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (119, 8, 80, CAST(N'2015-01-20T09:58:53.380' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (120, 8, 71, CAST(N'2015-01-20T09:59:01.960' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (121, 8, 68, CAST(N'2015-01-20T09:59:10.927' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (122, 8, 103, CAST(N'2015-01-20T09:59:21.583' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (123, 8, 13, CAST(N'2015-01-20T09:59:27.897' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (124, 8, 65, CAST(N'2015-01-20T09:59:53.427' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (125, 8, 106, CAST(N'2015-01-20T10:00:04.617' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (126, 8, 82, CAST(N'2015-01-20T10:00:24.630' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (127, 8, 63, CAST(N'2015-01-20T10:13:54.913' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (128, 8, 104, CAST(N'2015-01-20T10:14:04.553' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (129, 8, 120, CAST(N'2015-01-21T09:47:50.327' AS DateTime), 2)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (131, 13, 188, CAST(N'2017-04-03T14:21:18.857' AS DateTime), 183)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (132, 15, 211, CAST(N'2017-04-09T19:20:05.820' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (133, 12, 276, CAST(N'2018-01-30T13:46:14.597' AS DateTime), 159)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (134, 12, 273, CAST(N'2018-01-30T13:46:20.097' AS DateTime), 159)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (135, 12, 169, CAST(N'2018-01-30T13:46:27.800' AS DateTime), 159)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (136, 12, 175, CAST(N'2018-01-30T13:46:39.597' AS DateTime), 159)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (137, 12, 277, CAST(N'2018-01-30T13:46:45.970' AS DateTime), 159)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (138, 12, 180, CAST(N'2018-01-30T13:46:52.580' AS DateTime), 159)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (142, 16, 207, CAST(N'2018-02-23T10:24:38.273' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (143, 16, 255, CAST(N'2018-02-23T10:25:17.273' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (144, 16, 246, CAST(N'2018-02-23T10:26:48.960' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (145, 16, 250, CAST(N'2018-02-23T10:27:01.413' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (146, 16, 214, CAST(N'2018-02-23T10:27:18.370' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (147, 16, 242, CAST(N'2018-02-23T10:27:49.480' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (148, 16, 257, CAST(N'2018-02-23T10:28:02.197' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (149, 16, 249, CAST(N'2018-02-23T10:28:22.323' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (150, 16, 216, CAST(N'2018-02-23T10:28:33.667' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (151, 16, 217, CAST(N'2018-02-23T10:28:44.063' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (152, 16, 218, CAST(N'2018-02-23T10:28:55.187' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (153, 16, 219, CAST(N'2018-02-23T10:29:05.233' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (154, 16, 265, CAST(N'2018-02-23T10:30:07.760' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (155, 16, 198, CAST(N'2018-02-23T10:30:49.667' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (156, 16, 221, CAST(N'2018-02-23T11:09:51.397' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (157, 16, 245, CAST(N'2018-02-23T11:13:18.163' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (158, 16, 205, CAST(N'2018-02-23T11:13:25.153' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (159, 16, 210, CAST(N'2018-02-23T11:13:37.933' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (160, 16, 196, CAST(N'2018-02-23T12:20:25.757' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (161, 16, 223, CAST(N'2018-02-23T12:20:33.397' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (162, 16, 232, CAST(N'2018-02-23T12:20:39.443' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (163, 16, 226, CAST(N'2018-02-23T12:20:56.787' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (164, 16, 248, CAST(N'2018-02-23T12:21:52.867' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (165, 16, 227, CAST(N'2018-02-23T12:21:59.100' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (166, 16, 243, CAST(N'2018-02-23T12:22:05.850' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (167, 16, 228, CAST(N'2018-02-23T12:22:13.177' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (168, 16, 256, CAST(N'2018-02-23T12:22:29.397' AS DateTime), 193)
INSERT [Kart_Campeonato_Usuario_Desativados] ([idDesativado], [idCampeonato], [idUsuario], [dtCadastro], [IdUsuarioCadastro]) VALUES (170, 16, 203, CAST(N'2018-03-02T15:16:38.310' AS DateTime), 198)
SET IDENTITY_INSERT [Kart_Campeonato_Usuario_Desativados] OFF
SET IDENTITY_INSERT [Kart_Equipe_Campeonato] ON 

INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (1, 1, N'AFONSOFT', N'AFT', CAST(N'2012-06-27T15:42:17.910' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (3, 2, N'Barrica', N'BAR', CAST(N'2012-07-24T23:49:04.760' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (4, 2, N'Afonsoft', N'AFT', CAST(N'2012-07-24T23:49:43.900' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (5, 2, N'GMUDO', N'GMD', CAST(N'2012-07-25T11:12:39.727' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (6, 2, N'Mauricoca', N'MCC', CAST(N'2012-07-25T17:05:52.620' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (7, 1, N'TESTE', N'TST', CAST(N'2012-08-10T15:51:48.323' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (8, 2, N'Palada', N'FPA', CAST(N'2012-08-23T14:20:27.053' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (9, 2, N'Lezinho', N'MGO', CAST(N'2012-08-23T14:21:20.210' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (10, 2, N'Chicão', N'FCO', CAST(N'2012-08-23T14:21:42.443' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (11, 2, N'Jão', N'JAO', CAST(N'2012-08-23T14:22:11.693' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (12, 2, N'Tassio', N'TSS', CAST(N'2012-08-23T14:22:25.723' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (13, 2, N'Kim Leal', N'KIM', CAST(N'2012-08-23T14:22:41.413' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (14, 2, N'Thomas Somlo', N'THM', CAST(N'2012-08-23T14:23:52.287' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (15, 1, N'TESTE2', N'TST2', CAST(N'2012-08-23T15:46:08.460' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (16, 2, N'Juneca', N'CJJ', CAST(N'2012-08-29T13:49:03.173' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (17, 2, N'Fuscão', N'MCI', CAST(N'2012-08-29T14:12:42.393' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (18, 2, N'Christophe', N'CSG', CAST(N'2012-08-29T14:14:11.050' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (19, 2, N'TIM - L.F.A.', N'LFA', CAST(N'2012-08-29T14:17:28.753' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (20, 2, N'Leandro', N'LSA', CAST(N'2012-08-29T14:21:33.203' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (21, 2, N'Jefferson', N'JFE', CAST(N'2012-08-29T14:22:01.940' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (22, 2, N'Renato', N'RCB', CAST(N'2012-08-29T14:22:19.377' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (23, 2, N'Celsimar', N'CLM', CAST(N'2012-08-29T14:22:50.017' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (24, 2, N'Edu Prontolight', N'EDD', CAST(N'2012-08-29T14:28:06.253' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (25, 2, N'Ralph', N'RLP', CAST(N'2012-09-19T08:48:47.447' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (26, 2, N'Emerson ', N'EMS', CAST(N'2012-09-19T09:40:15.757' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (27, 2, N'Red Flag', N'RRF', CAST(N'2012-12-18T09:15:02.583' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (28, 2, N'Gleissão', N'GLE', CAST(N'2012-12-18T09:15:29.227' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (29, 2, N'Max', N'MAX', CAST(N'2012-12-18T09:15:47.693' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (30, 2, N'Marião', N'MAL', CAST(N'2013-01-15T09:16:00.060' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (31, 2, N'Júlio', N'JAL', CAST(N'2013-01-15T09:16:26.120' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (32, 2, N'Mário Fernandes', N'MFE', CAST(N'2013-01-15T09:16:52.293' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (33, 2, N'Leandro Avellar', N'LEO', CAST(N'2013-01-15T09:17:10.560' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (34, 4, N'Barrica', N'MOC', CAST(N'2013-01-17T11:14:50.897' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (35, 4, N'Gmuds', N'GMU', CAST(N'2013-01-17T11:15:20.430' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (37, 4, N'Cacilds', N'AFO', CAST(N'2013-01-17T11:18:13.147' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (38, 4, N'Lezinho', N'EDU', CAST(N'2013-01-17T11:18:29.913' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (39, 4, N'Tassio', N'TAS', CAST(N'2013-01-17T11:18:47.367' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (40, 4, N'Victor', N'VIC', CAST(N'2013-01-17T11:19:00.850' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (41, 4, N'Mauriçoca', N'MAU', CAST(N'2013-01-17T11:19:38.850' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (42, 4, N'Assaid', N'ASS', CAST(N'2013-01-17T11:22:59.960' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (43, 4, N'Ralph', N'RAL', CAST(N'2013-01-17T11:23:24.773' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (44, 4, N'Algodoal', N'ALG', CAST(N'2013-01-17T11:23:43.540' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (45, 4, N'L.Mesquita', N'LME', CAST(N'2013-01-17T11:24:15.897' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (46, 4, N'Renato ANGST', N'REA', CAST(N'2013-01-17T11:24:46.570' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (47, 4, N'Allan', N'ALL', CAST(N'2013-01-17T11:25:01.350' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (48, 4, N'Danilo ', N'DAN', CAST(N'2013-01-17T11:25:17.743' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (49, 4, N'Ebertton', N'EBE', CAST(N'2013-01-17T11:25:33.163' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (50, 4, N'Pimentel', N'PTL', CAST(N'2013-01-17T11:25:53.523' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (51, 4, N'Mario', N'MAL', CAST(N'2013-01-17T11:27:21.757' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (52, 4, N'Gustavo Lima', N'GUS', CAST(N'2013-01-17T11:27:59.617' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (53, 4, N'Palada', N'PAL', CAST(N'2013-01-17T11:28:15.193' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (54, 4, N'Alouche', N'LUZ', CAST(N'2013-01-17T11:28:35.053' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (55, 4, N'Renato Castelo', N'RCA', CAST(N'2013-01-17T11:28:54.727' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (56, 4, N'Jefferson', N'JEF', CAST(N'2013-01-17T11:29:09.413' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (57, 4, N'Celsimar', N'CLS', CAST(N'2013-01-17T11:29:24.663' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (58, 4, N'Chicão', N'FCO', CAST(N'2013-01-17T11:29:50.397' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (59, 4, N'Gleissão', N'GLE', CAST(N'2013-01-17T11:30:37.227' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (60, 4, N'Fernandes', N'MFE', CAST(N'2013-01-17T11:35:07.850' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (61, 4, N'Julio Algodoal', N'JAL', CAST(N'2013-01-17T11:35:50.367' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (62, 1, N'teste15', N'tst5', CAST(N'2013-03-12T15:02:22.050' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (63, 4, N'Farina', N'FAR', CAST(N'2013-03-12T17:45:09.787' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (64, 6, N'teste', N'tst', CAST(N'2013-03-20T08:47:16.697' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (65, 6, N'teste2013', N'tst20', CAST(N'2013-03-20T08:47:30.970' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (66, 7, N'teste', N'tst', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (67, 7, N'teste2013', N'tst20', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (68, 4, N'Leandro', N'LGS', CAST(N'2013-04-23T09:59:45.397' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (69, 4, N'Samir', N'SAM', CAST(N'2013-04-23T09:54:35.080' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (70, 4, N'Rosalem', N'RRS', CAST(N'2013-04-23T09:55:36.013' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (71, 4, N'Caio Gomes', N'CAI', CAST(N'2013-05-14T08:56:14.880' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (72, 4, N'Fernando', N'FEN', CAST(N'2013-05-14T08:56:51.090' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (73, 4, N'Thomas', N'THM', CAST(N'2013-05-14T08:57:37.030' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (74, 4, N'Rodolfo Caio', N'ROD', CAST(N'2013-05-14T09:21:09.877' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (75, 4, N'Ribamar', N'RIB', CAST(N'2013-08-14T00:19:49.680' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (76, 4, N'Alfredo', N'ALF', CAST(N'2013-08-14T00:21:28.960' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (77, 4, N'Pedro Ivo', N'PED', CAST(N'2013-08-14T00:22:59.953' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (78, 4, N'Felipe ', N'FSC', CAST(N'2013-08-14T00:23:24.557' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (79, 4, N'Victor Lima', N'VLM', CAST(N'2013-08-14T00:23:39.907' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (80, 4, N'Ronaldo Assis', N'RAS', CAST(N'2013-08-14T00:24:04.400' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (81, 4, N'Amir Nassis', N'AMN', CAST(N'2013-08-14T00:28:14.063' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (82, 4, N'David ', N'DVD', CAST(N'2013-08-14T00:30:17.837' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (83, 4, N'Silvio Cavalcante', N'SIC', CAST(N'2013-08-14T00:33:11.230' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (84, 4, N'Arthur', N'ANR', CAST(N'2013-10-09T15:57:14.203' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (85, 4, N'Barbara', N'BMO', CAST(N'2013-10-09T15:57:29.850' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (86, 4, N'Sidnei', N'SNR', CAST(N'2013-10-09T15:57:45.137' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (87, 4, N'Sandro', N'SDN', CAST(N'2013-10-09T15:57:55.840' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (88, 4, N'Huascar', N'HUS', CAST(N'2013-10-09T16:00:12.513' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (89, 4, N'Luis Felipe', N'LFE', CAST(N'2013-12-09T08:49:21.793' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (90, 4, N'Gustavo Michel', N'GMA', CAST(N'2013-12-09T08:57:53.557' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (91, 4, N'Ricci', N'RCC', CAST(N'2013-12-09T09:19:34.003' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (92, 4, N'Thiago Notaroberto', N'THN', CAST(N'2013-12-09T09:24:20.967' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (93, 4, N'Cris kanazawa', N'CKZ', CAST(N'2013-12-09T09:26:29.263' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (94, 4, N'Giovanny', N'GIO', CAST(N'2013-12-13T14:36:08.700' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (96, 9, N'Lezinho', N'EDU', CAST(N'2014-03-18T08:57:23.337' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (97, 9, N'Mauriçoca', N'MAU', CAST(N'2014-03-18T08:57:37.577' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (98, 9, N'Cacilds', N'AFO', CAST(N'2014-03-18T08:57:50.933' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (99, 9, N'Barrichello', N'MOC', CAST(N'2014-03-18T09:00:43.890' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (100, 9, N'Fernando', N'FSN', CAST(N'2014-03-18T09:23:43.023' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (101, 9, N'Luiz', N'LFA', CAST(N'2014-03-18T09:01:16.200' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (102, 9, N'Rodrigo', N'RRS', CAST(N'2014-03-18T09:01:59.053' AS DateTime))
GO
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (103, 9, N'Felipe', N'FSC', CAST(N'2014-03-18T09:11:57.443' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (104, 9, N'Ralph', N'RLP', CAST(N'2014-03-18T09:12:11.873' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (105, 9, N'Tássio', N'TAS', CAST(N'2014-03-18T09:12:51.980' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (106, 9, N'Alfredo', N'ALF', CAST(N'2014-03-18T09:13:06.800' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (107, 9, N'Gmud', N'VPR', CAST(N'2014-03-18T09:13:49.310' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (108, 9, N'Chico', N'FCO', CAST(N'2014-03-18T09:14:05.660' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (109, 9, N'Renato', N'RAN', CAST(N'2014-03-18T09:14:35.520' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (110, 9, N'Victor', N'VIC', CAST(N'2014-03-18T09:14:53.693' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (111, 9, N'Alexandre Martins', N'AMA', CAST(N'2014-03-18T09:15:13.757' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (112, 9, N'João Pedro', N'JPZ', CAST(N'2014-03-18T09:16:21.913' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (113, 9, N'Gmuds', N'GMU', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (114, 9, N'Assaid', N'ASS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (115, 9, N'Algodoal', N'ALG', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (116, 9, N'L.Mesquita', N'LME', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (117, 9, N'Renato ANGST', N'REA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (118, 9, N'Allan', N'ALL', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (119, 9, N'Danilo ', N'DAN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (120, 9, N'Ebertton', N'EBE', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (121, 9, N'Pimentel', N'PTL', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (122, 9, N'Mario', N'MAL', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (123, 9, N'Gustavo Lima', N'GUS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (124, 9, N'Palada', N'PAL', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (125, 9, N'Alouche', N'LUZ', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (126, 9, N'Renato Castelo', N'RCA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (127, 9, N'Jefferson', N'JEF', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (128, 9, N'Celsimar', N'CLS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (129, 9, N'Gleissão', N'GLE', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (130, 9, N'Fernandes', N'MFE', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (131, 9, N'Julio Algodoal', N'JAL', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (132, 9, N'Farina', N'FAR', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (133, 9, N'Leandro', N'LGS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (134, 9, N'Samir', N'SAM', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (135, 9, N'Caio Gomes', N'CAI', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (136, 9, N'Thomas', N'THM', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (137, 9, N'Rodolfo Caio', N'ROD', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (138, 9, N'Ribamar', N'RIB', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (139, 9, N'Pedro Ivo', N'PED', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (141, 9, N'Ronaldo Assis', N'RAS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (142, 9, N'Amir Nassis', N'AMN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (143, 9, N'David ', N'DVD', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (144, 9, N'Silvio Cavalcante', N'SIC', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (145, 9, N'Arthur', N'ANR', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (146, 9, N'Barbara', N'BMO', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (147, 9, N'Sidnei', N'SNR', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (148, 9, N'Sandro', N'SDN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (149, 9, N'Huascar', N'HUS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (150, 9, N'Luis Felipe', N'LFE', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (151, 9, N'Gustavo Michel', N'GMA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (152, 9, N'Ricci', N'RCC', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (153, 9, N'Thiago Notaroberto', N'THN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (154, 9, N'Cris kanazawa', N'CKZ', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (155, 9, N'Giovanny', N'GIO', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (156, 9, N'Victor Lima', N'VLM', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (157, 9, N'Daniel Gabriel', N'DGA', CAST(N'2014-03-18T10:01:42.687' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (158, 9, N'Rogerio Roberto', N'ROR', CAST(N'2014-03-18T10:01:58.163' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (159, 9, N'Luiz Gustavo', N'LGU', CAST(N'2014-03-18T10:02:10.737' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (160, 9, N'Rogerio Cerqueira', N'ROG', CAST(N'2014-03-18T10:02:22.717' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (161, 5, N'AFONSOFT', N'AFT', CAST(N'2014-03-20T13:13:42.430' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (162, 9, N'Paladino', N'FPA', CAST(N'2014-03-23T12:01:39.480' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (163, 9, N'Eduardo Tadeu', N'ETA', CAST(N'2014-03-23T12:08:56.940' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (164, 9, N'Convidados', N'CON', CAST(N'2014-03-23T12:12:49.820' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (165, 9, N'Tavares', N'TAV', CAST(N'2014-05-26T09:35:33.013' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (166, 9, N'Rafael Mario', N'RAM', CAST(N'2014-05-26T09:56:37.123' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (167, 9, N'Maximilliano', N'MAX', CAST(N'2014-06-17T10:22:12.413' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (168, 9, N'Bruno Macedo', N'BRM', CAST(N'2014-06-17T10:22:25.080' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (169, 9, N'Douglas', N'DLG', CAST(N'2014-06-17T10:22:37.920' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (170, 9, N'Igor', N'IGO', CAST(N'2014-06-17T10:22:52.943' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (171, 9, N'Rodrigo Santos', N'RDS', CAST(N'2014-06-17T10:25:05.857' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (172, 9, N'Caio Esteves', N'CAE', CAST(N'2014-08-04T13:28:01.850' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (173, 9, N'Rafael Pereira', N'RAP', CAST(N'2014-08-04T13:28:17.747' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (174, 9, N'Ricardo Michellini', N'RMI', CAST(N'2014-08-04T13:28:37.153' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (175, 9, N'Thiago Alves', N'THA', CAST(N'2014-08-04T13:28:53.283' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (176, 9, N'Paulo Esteves', N'PAE', CAST(N'2014-08-04T13:35:41.463' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (177, 9, N'Paulo Roberto (PAI)', N'PRP', CAST(N'2014-08-20T08:22:08.830' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (178, 9, N'Willians', N'WTN', CAST(N'2014-08-20T08:32:34.537' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (179, 9, N'Antonio Esteves', N'EST', CAST(N'2014-10-22T15:52:09.857' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (180, 9, N'Carlos Eduardo-Ralph', N'CED', CAST(N'2014-10-22T15:54:39.430' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (181, 9, N'Gustavo BMS', N'GUB', CAST(N'2014-12-16T08:55:03.030' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (182, 9, N'Jefferson BMS', N'JBM', CAST(N'2014-12-16T08:55:19.600' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (183, 8, N'Lezinho', N'EDU', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (184, 8, N'Mauriçoca', N'MAU', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (185, 8, N'Cacilds', N'AFO', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (186, 8, N'Barrichello', N'MOC', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (187, 8, N'Fernando', N'FSN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (188, 8, N'Luiz', N'LFA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (189, 8, N'Rodrigo', N'RRS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (190, 8, N'Felipe', N'FSC', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (191, 8, N'Ralph', N'RLP', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (192, 8, N'Tássio', N'TAS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (193, 8, N'Alfredo', N'ALF', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (194, 8, N'Gmud', N'VPR', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (195, 8, N'Chico', N'FCO', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (196, 8, N'Renato', N'RAN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (197, 8, N'Victor', N'VIC', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (198, 8, N'Alexandre Martins', N'AMA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (199, 8, N'João Pedro', N'JPZ', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (200, 8, N'Gmuds', N'GMU', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (201, 8, N'Assaid', N'ASS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (202, 8, N'Algodoal', N'ALG', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (203, 8, N'L.Mesquita', N'LME', NULL)
GO
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (204, 8, N'Renato ANGST', N'REA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (205, 8, N'Allan', N'ALL', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (206, 8, N'Danilo ', N'DAN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (207, 8, N'Ebertton', N'EBE', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (208, 8, N'Pimentel', N'PTL', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (209, 8, N'Mario', N'MAL', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (210, 8, N'Gustavo Lima', N'GUS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (211, 8, N'Palada', N'PAL', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (212, 8, N'Alouche', N'LUZ', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (213, 8, N'Renato Castelo', N'RCA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (214, 8, N'Jefferson', N'JEF', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (215, 8, N'Celsimar', N'CLS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (216, 8, N'Gleissão', N'GLE', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (217, 8, N'Fernandes', N'MFE', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (218, 8, N'Julio Algodoal', N'JAL', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (219, 8, N'Farina', N'FAR', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (220, 8, N'Leandro', N'LGS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (221, 8, N'Samir', N'SAM', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (222, 8, N'Caio Gomes', N'CAI', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (223, 8, N'Thomas', N'THM', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (224, 8, N'Rodolfo Caio', N'ROD', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (225, 8, N'Ribamar', N'RIB', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (226, 8, N'Pedro Ivo', N'PED', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (227, 8, N'Ronaldo Assis', N'RAS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (228, 8, N'Amir Nassis', N'AMN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (229, 8, N'David ', N'DVD', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (230, 8, N'Silvio Cavalcante', N'SIC', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (231, 8, N'Arthur', N'ANR', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (232, 8, N'Barbara', N'BMO', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (233, 8, N'Sidnei', N'SNR', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (234, 8, N'Sandro', N'SDN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (235, 8, N'Huascar', N'HUS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (236, 8, N'Luis Felipe', N'LFE', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (237, 8, N'Gustavo Michel', N'GMA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (238, 8, N'Ricci', N'RCC', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (239, 8, N'Thiago Notaroberto', N'THN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (240, 8, N'Cris kanazawa', N'CKZ', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (241, 8, N'Giovanny', N'GIO', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (242, 8, N'Victor Lima', N'VLM', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (243, 8, N'Daniel Gabriel', N'DGA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (244, 8, N'Rogerio Roberto', N'ROR', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (245, 8, N'Luiz Gustavo', N'LGU', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (246, 8, N'Rogerio Cerqueira', N'ROG', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (247, 8, N'Paladino', N'FPA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (248, 8, N'Eduardo Tadeu', N'ETA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (249, 8, N'Convidados', N'CON', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (250, 8, N'Tavares', N'TAV', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (251, 8, N'Rafael Mario', N'RAM', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (252, 8, N'Maximilliano', N'MAX', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (253, 8, N'Bruno Macedo', N'BRM', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (254, 8, N'Douglas', N'DLG', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (255, 8, N'Igor', N'IGO', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (256, 8, N'Rodrigo Santos', N'RDS', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (257, 8, N'Caio Esteves', N'CAE', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (258, 8, N'Rafael Pereira', N'RAP', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (259, 8, N'Ricardo Michellini', N'RMI', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (260, 8, N'Thiago Alves', N'THA', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (261, 8, N'Paulo Esteves', N'PAE', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (262, 8, N'Paulo Roberto (PAI)', N'PRP', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (263, 8, N'Willians', N'WTN', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (264, 8, N'Antonio Esteves', N'EST', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (265, 8, N'Carlos Eduardo-Ralph', N'CED', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (266, 8, N'Gustavo BMS', N'GUB', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (267, 8, N'Jefferson BMS', N'JBM', NULL)
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (268, 8, N'Cayto', N'CAY', CAST(N'2015-01-21T09:15:36.480' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (269, 8, N'Itamar', N'ITA', CAST(N'2015-01-21T09:16:01.200' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (270, 8, N'Soares', N'FSO', CAST(N'2015-01-21T09:16:16.857' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (271, 8, N'Kinoshita', N'KNO', CAST(N'2015-01-21T09:16:37.027' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (272, 8, N'Felipe Rodrigues', N'FRO', CAST(N'2015-01-21T09:18:36.217' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (273, 8, N'Bruno Teixeira', N'BTE', CAST(N'2015-01-21T09:19:32.357' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (274, 8, N'Vannucci', N'VNU', CAST(N'2015-01-21T09:19:54.717' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (275, 8, N'Gordex', N'AGG', CAST(N'2015-03-17T09:10:10.670' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (276, 8, N'Daniel Brasil', N'DAB', CAST(N'2015-03-17T09:10:36.017' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (277, 8, N'Abrãao Paes', N'ABP', CAST(N'2015-03-17T09:11:05.297' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (278, 8, N'Paulo Guedes', N'PGU', CAST(N'2015-03-17T09:15:15.510' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (279, 8, N'Rodrigo Sanae', N'RSA', CAST(N'2015-08-07T13:10:37.350' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (280, 8, N'Plabo Moreira', N'PLM', CAST(N'2015-08-07T13:19:21.180' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (281, 8, N'Alex Simão', N'ALX', CAST(N'2015-08-07T13:23:56.520' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (282, 10, N'KAB Ouro', N'OURO', CAST(N'2017-02-05T20:50:59.813' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (283, 10, N'KAB Prata', N'PRATA', CAST(N'2017-02-05T20:51:16.753' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (284, 12, N'Nando Pinheiro', N'NANDO', CAST(N'2017-02-05T22:09:33.787' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (285, 12, N'Jochen Rueckmann', N'JOCH', CAST(N'2017-02-05T22:09:56.817' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (286, 12, N'Julio Cesar', N'JULIO', CAST(N'2017-02-05T22:10:15.300' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (287, 12, N'Frank', N'FRANK', CAST(N'2017-02-05T22:10:32.597' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (288, 12, N'Marco Tuti', N'TUTI', CAST(N'2017-02-05T22:10:59.020' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (289, 12, N'Lucas Moreira', N'LUKA', CAST(N'2017-02-05T22:11:17.097' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (290, 12, N'Lucas Alves', N'PQNO', CAST(N'2017-02-05T22:11:38.630' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (291, 12, N'Reinaldo ', N'POLAK', CAST(N'2017-02-05T22:11:58.143' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (292, 12, N'Reginaldo', N'REGIS', CAST(N'2017-02-05T22:12:14.473' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (296, 13, N'Moreno', N'MRN', CAST(N'2017-04-03T14:20:01.030' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (303, 14, N'Outback Racig', N'OR   ', CAST(N'2017-04-05T23:35:33.697' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (304, 15, N'OUTBACK RACING', N'C.O.K', CAST(N'2017-04-07T11:16:58.060' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (305, 12, N'Adolfo', N'ADOL', CAST(N'2018-01-30T13:58:48.127' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (306, 12, N'Renato', N'RENT', CAST(N'2018-01-30T13:48:39.893' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (307, 12, N'Angelo Lourezon', N'NENE', CAST(N'2018-01-30T13:49:30.050' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (308, 12, N'Carlinhos F1', N'CARL', CAST(N'2018-01-30T13:49:59.050' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (309, 12, N'Fabio Alves', N'FALV', CAST(N'2018-01-30T13:50:27.143' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (310, 12, N'  Francisco Silva', N'FRCI', CAST(N'2018-01-30T13:50:55.627' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (311, 12, N'Gilberto Mota', N'GILM', CAST(N'2018-01-30T13:51:17.987' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (312, 12, N'Jhonatan', N'JHON', CAST(N'2018-01-30T13:51:58.520' AS DateTime))
GO
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (313, 12, N'Kevin', N'KEVN', CAST(N'2018-01-30T13:52:17.363' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (314, 12, N'Magno', N'MAGN', CAST(N'2018-01-30T13:52:40.173' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (315, 12, N'Marco Apolo', N'MAAC', CAST(N'2018-01-30T13:52:57.800' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (316, 12, N'Ricardo', N'RICD', CAST(N'2018-01-30T13:53:27.817' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (317, 12, N'Thiago', N'THIA', CAST(N'2018-01-30T13:53:45.410' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (318, 12, N'Wagner', N'WAGN', CAST(N'2018-01-30T13:54:02.003' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (319, 12, N'Wagner Nunes', N'WAGH', CAST(N'2018-01-30T13:54:20.127' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (320, 12, N'Charles Games', N'GAME', CAST(N'2018-01-30T14:03:04.300' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (321, 12, N'Charles Garcia', N'GARC', CAST(N'2018-01-30T14:04:08.410' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (322, 16, N'RER BLUE KART FIGHT', N'RDBKF', CAST(N'2018-06-03T19:38:27.373' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (323, 12, N'Fabio Lourezon', N'FLOU', CAST(N'2018-02-28T09:36:03.040' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (324, 12, N'Ricardo Kojima', N'KOJI', CAST(N'2018-02-28T09:36:39.603' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (325, 12, N'Wellington', N'WELL', CAST(N'2018-02-28T09:37:13.980' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (326, 12, N'Bryan', N'BRYA', CAST(N'2018-02-28T09:38:06.040' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (327, 12, N'Francisco Frutuoso', N'FFRU', CAST(N'2018-02-28T09:39:33.650' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (328, 12, N'José Luiz', N'ZELU', CAST(N'2018-02-28T09:39:54.573' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (329, 12, N'Eduardo F1', N'EDUF', CAST(N'2018-02-28T09:40:26.260' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (330, 12, N'Adilson', N'ADIL', CAST(N'2018-02-28T09:40:40.637' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (338, 16, N'MCLAREN DA Z/L ', N'MZLKR', CAST(N'2018-06-03T19:41:47.513' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (339, 16, N'BURRARI KART', N'SBK', CAST(N'2018-06-03T21:19:09.503' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (340, 16, N'LOTUS KART MANÍACOS', N'LKM', CAST(N'2018-06-03T21:20:03.267' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (341, 17, N'Metrô Alvinegro', N'MA', CAST(N'2018-04-25T10:26:39.490' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (342, 17, N'Gladiador Tricolor', N'GT', CAST(N'2018-04-25T10:34:04.883' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (343, 17, N'Haja Álcool', N'HA', CAST(N'2018-04-25T10:34:29.083' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (344, 17, N'Lobo Fantasma', N'LF', CAST(N'2018-04-25T10:34:51.227' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (345, 17, N'MC Laren', N'ML', CAST(N'2018-04-25T10:35:11.053' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (347, 17, N'Só Álcool', N'SA', CAST(N'2018-04-25T10:37:24.303' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (348, 18, N'JAPECANGA´S TEAM', N'JPT', CAST(N'2018-05-08T16:58:38.967' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (349, 18, N'Limited Racing', N'LR', CAST(N'2018-05-08T17:02:46.357' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (350, 18, N'Los Autos Locos', N'LAL', CAST(N'2018-05-08T17:03:51.247' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (351, 18, N'Rulfos Lenhador TEAM', N'RL', CAST(N'2018-05-08T17:16:37.060' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (352, 18, N'The Flintstones ', N'TF', CAST(N'2018-05-08T17:19:00.107' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (353, 18, N'Scuderia Já REZZOLVE', N'SJ', CAST(N'2018-05-08T17:06:37.340' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (354, 18, N'No Breack SCUDERIA', N'NB', CAST(N'2018-05-08T17:19:28.980' AS DateTime))
INSERT [Kart_Equipe_Campeonato] ([idEquipeCampeonato], [idCampeonato], [NomeEquipe], [Sigla], [dtCriacao]) VALUES (355, 18, N'SKID Racing', N'SR', CAST(N'2018-05-08T17:15:29.123' AS DateTime))
SET IDENTITY_INSERT [Kart_Equipe_Campeonato] OFF
SET IDENTITY_INSERT [Kart_Equipe_Campeonato_Desativados] ON 

INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (3, 198, 8, CAST(N'2015-01-20T10:18:17.630' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (4, 202, 8, CAST(N'2015-01-20T10:18:22.990' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (5, 205, 8, CAST(N'2015-01-20T10:18:27.693' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (6, 264, 8, CAST(N'2015-01-20T10:18:32.990' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (7, 242, 8, CAST(N'2015-01-20T10:18:41.490' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (8, 223, 8, CAST(N'2015-01-20T10:18:48.427' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (9, 239, 8, CAST(N'2015-01-20T10:18:54.443' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (10, 201, 8, CAST(N'2015-01-20T10:18:59.677' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (11, 228, 8, CAST(N'2015-01-20T10:19:05.803' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (12, 231, 8, CAST(N'2015-01-20T10:19:09.567' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (13, 232, 8, CAST(N'2015-01-20T10:19:12.880' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (14, 222, 8, CAST(N'2015-01-20T10:19:20.803' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (15, 215, 8, CAST(N'2015-01-20T10:19:25.177' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (16, 240, 8, CAST(N'2015-01-20T10:19:30.757' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (17, 243, 8, CAST(N'2015-01-20T10:19:36.507' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (18, 206, 8, CAST(N'2015-01-20T10:19:40.710' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (19, 229, 8, CAST(N'2015-01-20T10:19:45.647' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (20, 195, 8, CAST(N'2015-01-20T10:20:07.270' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (21, 254, 8, CAST(N'2015-01-20T10:20:16.317' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (22, 207, 8, CAST(N'2015-01-20T10:20:22.460' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (23, 219, 8, CAST(N'2015-01-20T10:20:28.270' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (24, 217, 8, CAST(N'2015-01-20T10:20:33.507' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (25, 187, 8, CAST(N'2015-01-20T10:20:39.397' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (26, 216, 8, CAST(N'2015-01-20T10:20:43.880' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (27, 194, 8, CAST(N'2015-01-20T10:20:48.757' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (28, 241, 8, CAST(N'2015-01-20T10:20:56.287' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (29, 266, 8, CAST(N'2015-01-20T10:21:02.693' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (30, 210, 8, CAST(N'2015-01-20T10:21:06.270' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (31, 237, 8, CAST(N'2015-01-20T10:21:10.210' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (32, 235, 8, CAST(N'2015-01-20T10:21:15.677' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (33, 255, 8, CAST(N'2015-01-20T10:21:20.257' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (34, 214, 8, CAST(N'2015-01-20T10:21:24.710' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (35, 267, 8, CAST(N'2015-01-20T10:21:28.380' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (36, 199, 8, CAST(N'2015-01-20T10:21:32.757' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (37, 218, 8, CAST(N'2015-01-20T10:21:44.287' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (38, 203, 8, CAST(N'2015-01-20T10:22:13.210' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (39, 220, 8, CAST(N'2015-01-20T10:22:19.443' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (40, 236, 8, CAST(N'2015-01-20T10:22:25.397' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (41, 245, 8, CAST(N'2015-01-20T10:22:31.287' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (42, 209, 8, CAST(N'2015-01-20T10:22:35.333' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (43, 252, 8, CAST(N'2015-01-20T10:22:39.163' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (44, 211, 8, CAST(N'2015-01-20T10:22:43.567' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (45, 247, 8, CAST(N'2015-01-20T10:22:47.583' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (46, 258, 8, CAST(N'2015-01-20T10:22:56.193' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (47, 213, 8, CAST(N'2015-01-20T10:23:05.067' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (48, 226, 8, CAST(N'2015-01-20T10:23:11.850' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (49, 196, 8, CAST(N'2015-01-20T10:23:18.130' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (50, 225, 8, CAST(N'2015-01-20T10:23:23.507' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (51, 238, 8, CAST(N'2015-01-20T10:23:29.757' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (52, 224, 8, CAST(N'2015-01-20T10:23:35.067' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (53, 189, 8, CAST(N'2015-01-20T10:23:40.193' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (54, 221, 8, CAST(N'2015-01-20T10:23:45.350' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (55, 234, 8, CAST(N'2015-01-20T10:23:50.990' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (56, 227, 8, CAST(N'2015-01-20T10:23:58.663' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (57, 260, 8, CAST(N'2015-01-20T10:24:17.880' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (58, 230, 8, CAST(N'2015-01-20T10:24:23.817' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (59, 233, 8, CAST(N'2015-01-20T10:24:29.617' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (60, 244, 8, CAST(N'2015-01-20T10:24:35.990' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (61, 246, 8, CAST(N'2015-01-20T10:24:42.507' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (62, 259, 8, CAST(N'2015-01-20T10:24:47.490' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (63, 208, 8, CAST(N'2015-01-20T10:24:54.037' AS DateTime), 2)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (64, 287, 12, CAST(N'2018-01-30T13:47:38.567' AS DateTime), 159)
INSERT [Kart_Equipe_Campeonato_Desativados] ([idDesativados], [idEquipeCampeonato], [idCampeonato], [dtCadastro], [idUsuarioCadastro]) VALUES (65, 289, 12, CAST(N'2018-01-30T13:54:52.033' AS DateTime), 159)
SET IDENTITY_INSERT [Kart_Equipe_Campeonato_Desativados] OFF
SET IDENTITY_INSERT [Kart_Grid_Calendario] ON 

INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (6, 3, 1, 2, 3, 0, 0, 0, 45, 749, CAST(N'2012-08-23T14:17:05.460' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (7, 3, 2, 6, 8, 0, 0, 0, 45, 786, CAST(N'2012-08-23T14:25:53.130' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (8, 3, 3, 7, 9, 0, 0, 0, 46, 876, CAST(N'2012-08-23T14:26:12.960' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (9, 3, 4, 5, 6, 0, 0, 0, 47, 62, CAST(N'2012-08-23T14:26:34.037' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (11, 3, 6, 8, 10, 0, 0, 0, 47, 647, CAST(N'2012-08-23T14:39:03.880' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (12, 3, 7, 9, 11, 0, 0, 0, 47, 662, CAST(N'2012-08-23T14:39:45.147' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (13, 3, 8, 10, 12, 0, 0, 0, 48, 106, CAST(N'2012-08-23T14:40:01.553' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (14, 3, 12, 13, 14, 0, 0, 0, 53, 33, CAST(N'2012-08-23T14:40:35.287' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (15, 3, 13, 14, 13, 0, 0, 0, 55, 812, CAST(N'2012-08-23T14:41:06.723' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (16, 3, 5, 1, 4, 0, 0, 0, 47, 439, CAST(N'2012-08-23T14:42:57.223' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (17, 2, 1, 2, 3, 0, 1, 0, 32, 942, CAST(N'2012-08-29T13:43:26.907' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (18, 2, 2, 1, 4, 0, 1, 0, 35, 54, CAST(N'2012-08-29T13:43:41.517' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (19, 2, 7, 3, 5, 0, 1, 0, 47, 91, CAST(N'2012-08-29T13:43:56.847' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (20, 2, 6, 5, 6, 0, 1, 0, 45, 829, CAST(N'2012-08-29T13:44:10.097' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (21, 2, 3, 10, 12, 0, 1, 0, 43, 83, CAST(N'2012-08-29T13:44:29.753' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (22, 2, 4, 8, 10, 0, 1, 0, 44, 259, CAST(N'2012-08-29T13:44:49.657' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (23, 2, 8, 7, 9, 0, 1, 0, 47, 904, CAST(N'2012-08-29T13:45:28.097' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (24, 2, 11, 17, 16, 0, 1, 0, 57, 280, CAST(N'2012-08-29T13:52:14.940' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (25, 4, 4, 7, 9, 0, 1, 0, 6, 863, CAST(N'2012-08-29T14:24:49.330' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (26, 4, 5, 2, 3, 0, 1, 0, 6, 871, CAST(N'2012-08-29T14:25:02.393' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (27, 4, 2, 18, 10, 0, 1, 0, 6, 82, CAST(N'2012-08-29T14:25:15.423' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (28, 4, 6, 1, 4, 0, 1, 0, 6, 887, CAST(N'2012-08-29T14:25:29.283' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (29, 4, 7, 20, 19, 0, 1, 0, 6, 950, CAST(N'2012-08-29T14:26:10.860' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (30, 4, 8, 5, 6, 0, 1, 0, 7, 259, CAST(N'2012-08-29T14:26:24.783' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (31, 4, 9, 6, 8, 0, 1, 0, 7, 654, CAST(N'2012-08-29T14:26:44.533' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (32, 4, 10, 23, 21, 0, 1, 0, 7, 654, CAST(N'2012-08-29T14:27:02.110' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (33, 4, 14, 25, 24, 0, 1, 0, 8, 319, CAST(N'2012-08-29T14:29:01.940' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (34, 4, 15, 22, 22, 0, 1, 0, 9, 73, CAST(N'2012-08-29T14:29:22.300' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (35, 4, 17, 24, 20, 0, 1, 0, 9, 242, CAST(N'2012-08-29T14:29:38.313' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (36, 5, 1, 2, 3, 0, 1, 0, 5, 599, CAST(N'2012-08-29T14:40:29.253' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (37, 5, 2, 23, 21, 0, 1, 0, 5, 829, CAST(N'2012-08-29T14:40:48.283' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (38, 5, 3, 18, 10, 0, 1, 0, 5, 960, CAST(N'2012-08-29T14:41:04.533' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (39, 5, 4, 1, 4, 0, 1, 0, 6, 402, CAST(N'2012-08-29T14:41:15.753' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (40, 5, 5, 20, 19, 0, 1, 0, 6, 942, CAST(N'2012-08-29T14:41:27.423' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (41, 5, 6, 25, 24, 0, 1, 0, 6, 815, CAST(N'2012-08-29T14:41:40.503' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (42, 5, 7, 5, 6, 0, 1, 0, 7, 250, CAST(N'2012-08-29T14:41:54.110' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (43, 5, 8, 22, 22, 0, 1, 0, 7, 335, CAST(N'2012-08-29T14:42:06.453' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (44, 5, 11, 21, 23, 0, 1, 0, 8, 865, CAST(N'2012-08-29T14:42:23.563' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (45, 5, 12, 8, 10, 0, 1, 0, 9, 274, CAST(N'2012-08-29T14:42:44.127' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (46, 5, 14, 24, 20, 0, 1, 0, 11, 17, CAST(N'2012-08-29T14:43:10.563' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (47, 5, 16, 3, 5, 0, 1, 0, 12, 554, CAST(N'2012-08-29T14:43:23.173' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (48, 5, 17, 10, 12, 0, 1, 0, 12, 897, CAST(N'2012-08-29T14:43:47.597' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (49, 5, 18, 7, 9, 0, 1, 0, 13, 559, CAST(N'2012-08-29T14:44:08.923' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (50, 5, 22, 19, 18, 0, 1, 0, 30, 976, CAST(N'2012-08-29T14:44:28.830' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (51, 15, 1, 7, 38, 0, 1, 0, 3, 383, CAST(N'2013-01-17T11:37:12.570' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (52, 15, 2, 2, 34, 0, 1, 0, 5, 223, CAST(N'2013-01-17T11:37:33.633' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (53, 15, 3, 10, 39, 0, 1, 0, 6, 407, CAST(N'2013-01-17T11:40:31.757' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (54, 15, 4, 35, 40, 0, 1, 0, 6, 636, CAST(N'2013-01-17T11:50:41.693' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (55, 15, 5, 1, 37, 0, 1, 0, 6, 665, CAST(N'2013-01-17T11:51:01.883' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (56, 15, 6, 3, 35, 0, 1, 0, 6, 788, CAST(N'2013-01-17T11:51:18.600' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (57, 15, 7, 26, 43, 0, 1, 0, 8, 67, CAST(N'2013-01-17T11:51:34.553' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (58, 15, 8, 27, 42, 0, 1, 0, 8, 616, CAST(N'2013-01-17T11:51:53.647' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (59, 15, 9, 36, 47, 0, 1, 0, 10, 225, CAST(N'2013-01-17T11:55:55.303' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (60, 15, 10, 34, 61, 0, 1, 0, 10, 584, CAST(N'2013-01-17T11:56:40.790' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (61, 15, 11, 32, 44, 0, 1, 0, 10, 769, CAST(N'2013-01-17T11:57:05.070' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (62, 15, 12, 31, 45, 0, 1, 0, 11, 112, CAST(N'2013-01-17T11:57:27.837' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (63, 15, 13, 37, 48, 0, 1, 0, 11, 260, CAST(N'2013-01-17T13:04:01.850' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (64, 15, 14, 33, 60, 0, 1, 0, 12, 161, CAST(N'2013-01-17T13:04:21.053' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (65, 15, 15, 38, 49, 0, 1, 0, 12, 365, CAST(N'2013-01-17T13:15:48.710' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (66, 15, 16, 28, 46, 0, 1, 0, 12, 380, CAST(N'2013-01-17T13:16:07.867' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (67, 15, 17, 39, 52, 0, 1, 0, 15, 37, CAST(N'2013-01-17T13:20:13.757' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (69, 19, 1, 2, 34, 0, 1, 0, 10, 864, CAST(N'2013-03-12T17:07:49.880' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (70, 19, 2, 5, 41, 0, 1, 0, 11, 970, CAST(N'2013-03-12T17:08:01.627' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (71, 19, 3, 10, 39, 0, 1, 0, 12, 186, CAST(N'2013-03-12T17:08:41.893' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (72, 19, 4, 3, 35, 0, 1, 0, 12, 499, CAST(N'2013-03-12T17:21:13.103' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (73, 19, 5, 26, 43, 0, 1, 0, 15, 161, CAST(N'2013-03-12T17:24:33.410' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (74, 20, 1, 1, 37, 0, 1, 0, 8, 768, CAST(N'2013-03-12T17:40:16.797' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (75, 20, 2, 2, 34, 0, 1, 0, 10, 282, CAST(N'2013-03-12T17:40:35.300' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (76, 20, 3, 40, 63, 0, 1, 0, 12, 529, CAST(N'2013-03-12T17:48:20.123' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (77, 20, 4, 3, 35, 0, 1, 0, 13, 814, CAST(N'2013-03-12T17:48:35.410' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (78, 20, 5, 28, 46, 0, 1, 0, 14, 233, CAST(N'2013-03-12T17:48:56.127' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (79, 20, 6, 5, 41, 0, 1, 0, 14, 530, CAST(N'2013-03-12T17:49:34.583' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (80, 20, 7, 10, 39, 0, 1, 0, 14, 537, CAST(N'2013-03-12T17:50:05.283' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (81, 20, 8, 35, 40, 0, 1, 0, 14, 688, CAST(N'2013-03-12T17:50:25.767' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (82, 20, 9, 21, 57, 0, 1, 0, 17, 959, CAST(N'2013-03-12T17:50:40.867' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (83, 20, 10, 7, 38, 0, 1, 0, 18, 491, CAST(N'2013-03-12T17:51:04.377' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (84, 20, 11, 22, 55, 0, 1, 0, 22, 171, CAST(N'2013-03-12T17:51:32.583' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (85, 20, 13, 23, 56, 0, 1, 0, 26, 216, CAST(N'2013-03-12T17:52:50.240' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (87, 21, 1, 20, 54, 0, 0, 0, 50, 934, CAST(N'2013-04-23T09:37:29.663' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (88, 21, 2, 2, 34, 0, 0, 0, 51, 430, CAST(N'2013-04-23T09:37:50.100' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (89, 21, 3, 33, 60, 0, 0, 0, 51, 645, CAST(N'2013-04-23T09:38:21.660' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (90, 21, 4, 40, 63, 0, 0, 0, 51, 715, CAST(N'2013-04-23T09:38:42.347' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (91, 21, 5, 1, 37, 0, 0, 0, 51, 720, CAST(N'2013-04-23T09:38:54.763' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (92, 21, 6, 7, 38, 0, 0, 0, 51, 766, CAST(N'2013-04-23T09:39:27.180' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (93, 21, 7, 26, 43, 0, 0, 0, 51, 814, CAST(N'2013-04-23T09:39:44.527' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (94, 21, 8, 10, 39, 0, 0, 0, 52, 264, CAST(N'2013-04-23T09:40:37.320' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (95, 21, 9, 34, 61, 0, 0, 0, 53, 54, CAST(N'2013-04-23T09:41:08.863' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (96, 21, 10, 3, 35, 0, 0, 0, 53, 137, CAST(N'2013-04-23T09:41:25.930' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (97, 21, 11, 28, 46, 0, 0, 0, 53, 340, CAST(N'2013-04-23T09:41:47.050' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (98, 21, 12, 42, 70, 0, 0, 0, 53, 717, CAST(N'2013-04-23T09:58:44.260' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (99, 21, 13, 32, 44, 0, 0, 0, 55, 125, CAST(N'2013-04-23T09:59:02.263' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (100, 21, 14, 44, 68, 0, 0, 0, 55, 244, CAST(N'2013-04-23T10:02:29.603' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (101, 21, 15, 43, 69, 0, 0, 0, 59, 11, CAST(N'2013-04-23T10:02:52.443' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (102, 23, 1, 5, 41, 0, 1, 0, 3, 297, CAST(N'2013-05-14T08:32:55.233' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (103, 23, 2, 2, 34, 0, 1, 0, 3, 442, CAST(N'2013-05-14T08:33:12.270' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (104, 23, 3, 20, 54, 0, 1, 0, 3, 836, CAST(N'2013-05-14T08:33:32.130' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (105, 23, 4, 7, 38, 0, 1, 0, 3, 863, CAST(N'2013-05-14T08:33:54.687' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (106, 23, 5, 10, 39, 0, 1, 0, 4, 497, CAST(N'2013-05-14T08:34:17.167' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (107, 23, 6, 8, 58, 0, 1, 0, 4, 822, CAST(N'2013-05-14T08:34:37.040' AS DateTime))
GO
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (108, 23, 7, 3, 35, 0, 1, 0, 5, 323, CAST(N'2013-05-14T08:34:56.777' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (109, 23, 8, 40, 63, 0, 1, 0, 5, 754, CAST(N'2013-05-14T08:35:20.690' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (110, 23, 9, 43, 69, 0, 1, 0, 6, 349, CAST(N'2013-05-14T08:35:38.320' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (111, 23, 10, 45, 74, 0, 1, 0, 6, 664, CAST(N'2013-05-14T09:22:26.270' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (112, 23, 11, 47, 72, 0, 1, 0, 6, 994, CAST(N'2013-05-14T09:22:48.280' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (113, 23, 12, 13, 73, 0, 1, 0, 7, 275, CAST(N'2013-05-14T09:23:05.193' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (114, 23, 13, 42, 70, 0, 1, 0, 7, 688, CAST(N'2013-05-14T09:23:24.600' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (115, 23, 14, 44, 68, 0, 1, 0, 11, 991, CAST(N'2013-05-14T09:23:39.683' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (116, 23, 15, 46, 71, 0, 1, 0, 43, 220, CAST(N'2013-05-14T09:23:58.047' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (117, 24, 8, 10, 39, 0, 0, 0, 47, 817, CAST(N'2013-08-13T23:04:43.747' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (118, 24, 9, 20, 54, 0, 0, 0, 47, 931, CAST(N'2013-08-13T23:05:19.177' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (119, 24, 10, 1, 37, 0, 0, 0, 48, 70, CAST(N'2013-08-13T23:05:43.417' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (120, 24, 11, 2, 34, 0, 0, 0, 48, 143, CAST(N'2013-08-13T23:06:15.133' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (121, 24, 13, 5, 41, 0, 0, 0, 48, 303, CAST(N'2013-08-13T23:06:44.710' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (122, 24, 14, 26, 43, 0, 0, 0, 48, 761, CAST(N'2013-08-13T23:07:22.650' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (123, 24, 16, 3, 35, 0, 0, 0, 49, 249, CAST(N'2013-08-13T23:08:00.810' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (124, 24, 17, 28, 46, 0, 0, 0, 49, 339, CAST(N'2013-08-13T23:08:28.530' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (125, 24, 18, 40, 63, 0, 0, 0, 49, 812, CAST(N'2013-08-13T23:09:08.387' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (126, 24, 19, 47, 72, 0, 0, 0, 50, 628, CAST(N'2013-08-13T23:10:30.787' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (127, 25, 1, 10, 39, 0, 1, 0, 5, 343, CAST(N'2013-08-14T00:10:25.187' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (128, 25, 2, 2, 34, 0, 1, 0, 5, 808, CAST(N'2013-08-14T00:11:17.277' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (129, 25, 3, 5, 41, 0, 1, 0, 6, 35, CAST(N'2013-08-14T00:11:39.493' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (130, 25, 4, 1, 37, 0, 1, 0, 6, 350, CAST(N'2013-08-14T00:12:01.097' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (131, 25, 5, 52, 81, 0, 1, 0, 6, 426, CAST(N'2013-08-14T00:34:19.200' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (132, 25, 6, 7, 38, 0, 1, 0, 6, 659, CAST(N'2013-08-14T00:34:57.267' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (133, 25, 7, 43, 69, 0, 1, 0, 6, 722, CAST(N'2013-08-14T00:35:27.453' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (134, 25, 8, 53, 75, 0, 1, 0, 6, 736, CAST(N'2013-08-14T00:35:52.397' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (135, 25, 9, 3, 35, 0, 1, 0, 6, 801, CAST(N'2013-08-14T00:36:14.080' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (136, 25, 10, 47, 72, 0, 1, 0, 6, 946, CAST(N'2013-08-14T00:36:45.437' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (137, 25, 11, 55, 77, 0, 1, 0, 7, 161, CAST(N'2013-08-14T00:37:04.250' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (138, 25, 12, 42, 70, 0, 1, 0, 7, 172, CAST(N'2013-08-14T00:37:28.587' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (139, 25, 13, 56, 76, 0, 1, 0, 7, 211, CAST(N'2013-08-14T00:38:05.763' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (140, 25, 14, 26, 43, 0, 1, 0, 7, 783, CAST(N'2013-08-14T00:40:39.563' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (141, 25, 15, 57, 78, 0, 1, 0, 8, 450, CAST(N'2013-08-14T00:41:12.200' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (142, 25, 16, 58, 79, 0, 1, 0, 11, 849, CAST(N'2013-08-14T00:41:41.090' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (143, 25, 17, 59, 80, 0, 1, 0, 18, 828, CAST(N'2013-08-14T00:42:12.493' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (144, 26, 1, 20, 54, 0, 0, 0, 47, 338, CAST(N'2013-08-14T10:55:13.147' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (145, 26, 2, 7, 38, 0, 0, 0, 47, 468, CAST(N'2013-08-14T10:55:32.583' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (146, 26, 3, 5, 41, 0, 0, 0, 47, 545, CAST(N'2013-08-14T10:55:52.863' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (147, 26, 4, 10, 39, 0, 0, 0, 47, 860, CAST(N'2013-08-14T10:56:13.503' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (148, 26, 5, 1, 37, 0, 0, 0, 47, 896, CAST(N'2013-08-14T10:56:34.687' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (149, 26, 6, 47, 72, 0, 0, 0, 48, 228, CAST(N'2013-08-14T10:57:21.973' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (150, 26, 7, 2, 34, 0, 0, 0, 48, 310, CAST(N'2013-08-14T10:57:56.730' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (151, 26, 8, 40, 63, 0, 0, 0, 48, 404, CAST(N'2013-08-14T10:59:30.173' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (152, 26, 9, 55, 77, 0, 0, 0, 48, 601, CAST(N'2013-08-14T10:59:49.940' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (153, 26, 10, 43, 69, 0, 0, 0, 48, 981, CAST(N'2013-08-14T11:00:04.790' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (154, 26, 11, 42, 70, 0, 0, 0, 49, 299, CAST(N'2013-08-14T11:00:27.600' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (155, 26, 12, 56, 76, 0, 0, 0, 49, 328, CAST(N'2013-08-14T11:03:58.480' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (156, 26, 13, 60, 82, 0, 0, 0, 49, 456, CAST(N'2013-08-14T11:04:21.117' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (157, 26, 14, 57, 78, 0, 0, 0, 50, 277, CAST(N'2013-08-14T11:04:40.087' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (158, 26, 15, 61, 83, 0, 0, 0, 52, 193, CAST(N'2013-08-14T11:05:00.400' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (159, 27, 1, 2, 34, 0, 1, 0, 9, 920, CAST(N'2013-10-09T15:48:13.423' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (160, 27, 2, 7, 38, 0, 1, 0, 10, 881, CAST(N'2013-10-09T15:48:31.613' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (161, 27, 3, 3, 35, 0, 1, 0, 11, 521, CAST(N'2013-10-09T15:48:54.123' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (162, 27, 4, 1, 37, 0, 1, 0, 12, 433, CAST(N'2013-10-09T15:49:15.230' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (163, 27, 5, 28, 46, 0, 1, 0, 12, 848, CAST(N'2013-10-09T15:49:39.037' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (164, 27, 6, 56, 76, 0, 1, 0, 14, 897, CAST(N'2013-10-09T15:50:00.940' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (165, 27, 7, 20, 54, 0, 1, 0, 14, 932, CAST(N'2013-10-09T15:50:42.403' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (166, 27, 8, 10, 39, 0, 1, 0, 15, 918, CAST(N'2013-10-09T15:50:58.253' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (167, 27, 10, 26, 43, 0, 1, 0, 16, 673, CAST(N'2013-10-09T15:51:20.407' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (168, 27, 12, 55, 77, 0, 1, 0, 27, 124, CAST(N'2013-10-09T15:51:44.820' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (169, 27, 14, 47, 72, 0, 1, 0, 41, 271, CAST(N'2013-10-09T15:52:21.310' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (170, 27, 16, 59, 80, 0, 1, 0, 56, 898, CAST(N'2013-10-09T15:52:43.743' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (171, 27, 17, 57, 78, 0, 2, 0, 24, 370, CAST(N'2013-10-09T15:53:12.977' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (172, 27, 19, 42, 70, 0, 99, 0, 99, 999, CAST(N'2013-10-09T15:53:36.347' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (173, 27, 9, 62, 88, 0, 1, 0, 16, 215, CAST(N'2013-10-09T16:01:17.753' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (174, 27, 11, 63, 87, 0, 2, 0, 36, 958, CAST(N'2013-10-09T16:05:32.347' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (175, 27, 13, 64, 85, 0, 1, 0, 31, 907, CAST(N'2013-10-09T16:07:16.883' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (176, 27, 15, 65, 86, 0, 1, 0, 51, 646, CAST(N'2013-10-09T16:08:01.327' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (177, 27, 18, 66, 84, 0, 2, 0, 36, 958, CAST(N'2013-10-09T16:08:22.247' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (178, 28, 1, 2, 34, 0, 0, 0, 48, 132, CAST(N'2013-11-11T15:53:07.903' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (179, 28, 2, 10, 39, 0, 0, 0, 48, 434, CAST(N'2013-11-11T15:53:27.500' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (180, 28, 3, 42, 70, 0, 0, 0, 48, 597, CAST(N'2013-11-11T15:53:50.523' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (181, 28, 4, 1, 37, 0, 0, 0, 49, 178, CAST(N'2013-11-11T15:54:08.167' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (182, 28, 5, 3, 35, 0, 0, 0, 49, 336, CAST(N'2013-11-11T15:54:37.450' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (183, 28, 6, 5, 41, 0, 0, 0, 49, 562, CAST(N'2013-11-11T15:54:56.840' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (185, 28, 8, 28, 46, 0, 0, 0, 49, 725, CAST(N'2013-11-11T15:56:32.813' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (186, 28, 9, 7, 38, 0, 0, 0, 49, 448, CAST(N'2013-11-11T15:58:42.153' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (187, 28, 10, 57, 78, 0, 0, 0, 49, 829, CAST(N'2013-11-11T16:00:49.513' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (188, 28, 11, 52, 81, 0, 0, 0, 50, 215, CAST(N'2013-11-11T16:01:04.833' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (189, 28, 12, 26, 43, 0, 0, 0, 50, 219, CAST(N'2013-11-11T16:01:25.440' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (190, 28, 13, 56, 76, 0, 0, 0, 50, 909, CAST(N'2013-11-11T16:01:48.823' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (191, 28, 15, 55, 77, 0, 0, 0, 51, 236, CAST(N'2013-11-11T16:02:15.877' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (192, 28, 17, 43, 69, 0, 0, 0, 54, 320, CAST(N'2013-11-11T16:02:44.050' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (193, 28, 18, 59, 80, 0, 0, 0, 57, 645, CAST(N'2013-11-11T16:42:34.727' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (194, 28, 19, 65, 86, 0, 0, 0, 58, 345, CAST(N'2013-11-11T16:42:58.703' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (195, 28, 20, 63, 87, 0, 1, 0, 0, 333, CAST(N'2013-11-11T16:43:19.623' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (196, 28, 21, 64, 85, 0, 1, 0, 2, 10, CAST(N'2013-11-11T16:43:35.083' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (197, 28, 23, 66, 84, 0, 1, 0, 29, 37, CAST(N'2013-11-11T16:43:57.657' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (198, 28, 16, 70, 90, 0, 0, 0, 52, 405, CAST(N'2013-12-09T09:02:27.183' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (199, 29, 1, 20, 54, 0, 1, 0, 5, 428, CAST(N'2013-12-09T09:05:29.723' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (200, 29, 2, 7, 38, 0, 1, 0, 5, 769, CAST(N'2013-12-09T09:05:52.873' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (201, 29, 3, 2, 34, 0, 1, 0, 5, 991, CAST(N'2013-12-09T09:06:07.210' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (202, 29, 4, 5, 41, 0, 1, 0, 6, 588, CAST(N'2013-12-09T09:06:23.933' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (203, 29, 5, 3, 35, 0, 1, 0, 7, 5, CAST(N'2013-12-09T09:06:41.997' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (204, 29, 6, 26, 43, 0, 1, 0, 7, 14, CAST(N'2013-12-09T09:07:11.327' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (205, 29, 7, 42, 70, 0, 1, 0, 7, 306, CAST(N'2013-12-09T09:14:45.120' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (206, 29, 8, 1, 37, 0, 1, 0, 7, 794, CAST(N'2013-12-09T09:15:01.217' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (207, 29, 9, 56, 76, 0, 1, 0, 7, 833, CAST(N'2013-12-09T09:15:16.583' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (208, 29, 10, 47, 72, 0, 1, 0, 8, 362, CAST(N'2013-12-09T09:15:37.690' AS DateTime))
GO
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (209, 29, 11, 43, 69, 0, 1, 0, 8, 762, CAST(N'2013-12-09T09:15:51.793' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (210, 29, 12, 57, 78, 0, 1, 0, 10, 120, CAST(N'2013-12-09T09:16:13.150' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (211, 29, 13, 70, 90, 0, 1, 0, 10, 432, CAST(N'2013-12-09T09:17:07.970' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (212, 29, 14, 10, 39, 0, 1, 0, 11, 436, CAST(N'2013-12-09T09:17:29.030' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (213, 29, 15, 62, 88, 0, 1, 0, 11, 620, CAST(N'2013-12-09T09:17:47.623' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (214, 29, 16, 65, 86, 0, 1, 0, 12, 488, CAST(N'2013-12-09T09:18:07.047' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (215, 29, 18, 72, 91, 0, 1, 0, 13, 500, CAST(N'2013-12-09T09:21:33.343' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (216, 29, 19, 59, 80, 0, 1, 0, 14, 650, CAST(N'2013-12-09T09:22:05.573' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (217, 29, 21, 64, 85, 0, 1, 0, 17, 17, CAST(N'2013-12-09T09:22:24.217' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (218, 29, 23, 55, 77, 0, 1, 0, 29, 457, CAST(N'2013-12-09T09:22:53.527' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (219, 29, 25, 66, 84, 0, 1, 0, 34, 174, CAST(N'2013-12-09T09:23:12.153' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (220, 29, 26, 68, 92, 0, 1, 0, 38, 751, CAST(N'2013-12-09T09:25:20.607' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (221, 29, 28, 73, 93, 0, 1, 0, 41, 419, CAST(N'2013-12-09T09:27:24.923' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (222, 30, 1, 2, 34, 0, 0, 0, 51, 177, CAST(N'2013-12-13T14:21:05.437' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (223, 30, 2, 55, 77, 0, 0, 0, 51, 238, CAST(N'2013-12-13T14:21:23.393' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (224, 30, 3, 1, 37, 0, 0, 0, 51, 953, CAST(N'2013-12-13T14:21:36.670' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (225, 30, 4, 10, 39, 0, 0, 0, 52, 111, CAST(N'2013-12-13T14:21:54.530' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (226, 30, 5, 57, 78, 0, 0, 0, 52, 129, CAST(N'2013-12-13T14:22:10.177' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (227, 30, 6, 5, 41, 0, 0, 0, 52, 346, CAST(N'2013-12-13T14:22:27.197' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (228, 30, 7, 42, 70, 0, 0, 0, 52, 347, CAST(N'2013-12-13T14:22:46.247' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (229, 30, 9, 26, 43, 0, 0, 0, 52, 391, CAST(N'2013-12-13T14:23:12.563' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (230, 30, 10, 47, 72, 0, 0, 0, 52, 409, CAST(N'2013-12-13T14:23:33.543' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (231, 30, 11, 20, 54, 0, 0, 0, 52, 438, CAST(N'2013-12-13T14:23:52.733' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (232, 30, 12, 43, 69, 0, 0, 0, 53, 472, CAST(N'2013-12-13T14:24:06.897' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (233, 30, 13, 62, 88, 0, 0, 0, 53, 625, CAST(N'2013-12-13T14:24:22.327' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (234, 30, 14, 70, 90, 0, 0, 0, 53, 832, CAST(N'2013-12-13T14:24:39.597' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (235, 30, 15, 65, 86, 0, 0, 0, 55, 748, CAST(N'2013-12-13T14:24:56.710' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (236, 30, 16, 64, 85, 0, 1, 0, 1, 550, CAST(N'2013-12-13T14:25:12.730' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (237, 30, 17, 63, 87, 0, 1, 0, 4, 764, CAST(N'2013-12-13T14:25:32.557' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (238, 30, 18, 66, 84, 0, 1, 0, 5, 770, CAST(N'2013-12-13T14:25:48.063' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (239, 30, 8, 74, 94, 0, 0, 0, 52, 359, CAST(N'2013-12-13T14:37:30.150' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (240, 33, 1, 10, 105, 0, 1, 0, 5, 310, CAST(N'2014-03-18T09:21:29.237' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (241, 33, 2, 2, 99, 0, 1, 0, 5, 338, CAST(N'2014-03-18T09:21:50.310' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (242, 33, 3, 56, 106, 0, 1, 0, 5, 758, CAST(N'2014-03-18T09:22:14.477' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (243, 33, 4, 1, 98, 0, 1, 0, 5, 764, CAST(N'2014-03-18T09:22:33.460' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (244, 33, 5, 47, 100, 0, 1, 0, 5, 858, CAST(N'2014-03-18T09:28:57.100' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (245, 33, 6, 5, 97, 0, 1, 0, 5, 998, CAST(N'2014-03-18T09:29:18.440' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (246, 33, 7, 42, 102, 0, 1, 0, 6, 3, CAST(N'2014-03-18T09:29:46.223' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (247, 33, 8, 26, 104, 0, 1, 0, 6, 513, CAST(N'2014-03-18T09:30:02.747' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (248, 33, 9, 57, 103, 0, 1, 0, 6, 993, CAST(N'2014-03-18T09:34:09.167' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (249, 33, 10, 3, 107, 0, 1, 0, 7, 55, CAST(N'2014-03-18T09:35:32.690' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (250, 33, 11, 8, 108, 0, 1, 0, 7, 421, CAST(N'2014-03-18T09:35:51.080' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (251, 33, 12, 28, 117, 0, 1, 0, 7, 598, CAST(N'2014-03-18T09:43:20.443' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (252, 33, 13, 79, 110, 0, 1, 0, 13, 817, CAST(N'2014-03-18T09:43:43.533' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (253, 33, 14, 77, 111, 0, 1, 0, 16, 800, CAST(N'2014-03-18T09:44:00.630' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (254, 33, 15, 78, 112, 0, 1, 0, 46, 997, CAST(N'2014-03-18T09:44:19.287' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (255, 31, 1, 47, 100, 0, 0, 0, 51, 171, CAST(N'2014-03-23T11:53:29.713' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (256, 31, 2, 7, 96, 0, 0, 0, 51, 446, CAST(N'2014-03-23T11:54:03.643' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (257, 31, 3, 1, 98, 0, 0, 0, 51, 294, CAST(N'2014-03-23T11:54:25.717' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (258, 31, 4, 2, 99, 0, 0, 0, 51, 552, CAST(N'2014-03-23T11:56:31.890' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (259, 31, 5, 42, 102, 0, 0, 0, 51, 589, CAST(N'2014-03-23T11:57:08.410' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (260, 31, 6, 56, 106, 0, 0, 0, 51, 592, CAST(N'2014-03-23T11:57:34.167' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (261, 31, 7, 27, 114, 0, 0, 0, 51, 796, CAST(N'2014-03-23T11:57:54.557' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (262, 31, 8, 5, 97, 0, 0, 0, 51, 919, CAST(N'2014-03-23T12:00:02.417' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (263, 31, 9, 43, 134, 0, 0, 0, 52, 37, CAST(N'2014-03-23T12:00:25.660' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (264, 31, 10, 6, 124, 0, 0, 0, 52, 62, CAST(N'2014-03-23T12:03:31.410' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (265, 31, 11, 8, 108, 0, 0, 0, 52, 90, CAST(N'2014-03-23T12:03:55.077' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (266, 31, 13, 28, 117, 0, 0, 0, 52, 768, CAST(N'2014-03-23T12:04:35.917' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (267, 31, 14, 3, 107, 0, 0, 0, 53, 219, CAST(N'2014-03-23T12:05:01.143' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (268, 31, 15, 70, 151, 0, 0, 0, 53, 469, CAST(N'2014-03-23T12:05:27.193' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (269, 31, 12, 86, 164, 0, 0, 0, 52, 263, CAST(N'2014-03-23T12:16:04.540' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (270, 31, 16, 87, 164, 0, 0, 0, 56, 205, CAST(N'2014-03-23T12:16:50.840' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (271, 31, 17, 85, 163, 0, 0, 0, 57, 315, CAST(N'2014-03-23T12:18:38.483' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (272, 31, 18, 88, 164, 0, 1, 0, 41, 25, CAST(N'2014-03-23T12:19:00.823' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (273, 32, 1, 2, 99, 0, 0, 0, 47, 820, CAST(N'2014-03-23T12:32:03.497' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (274, 32, 2, 1, 98, 0, 0, 0, 47, 912, CAST(N'2014-03-23T12:32:18.897' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (275, 32, 3, 10, 105, 0, 0, 0, 48, 225, CAST(N'2014-03-23T12:32:32.700' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (276, 32, 4, 42, 102, 0, 0, 0, 48, 417, CAST(N'2014-03-23T12:32:49.720' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (277, 32, 5, 28, 117, 0, 0, 0, 48, 543, CAST(N'2014-03-23T12:33:09.690' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (278, 32, 6, 8, 108, 0, 0, 0, 48, 601, CAST(N'2014-03-23T12:33:27.147' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (279, 32, 7, 27, 114, 0, 0, 0, 48, 763, CAST(N'2014-03-23T12:33:48.860' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (280, 32, 8, 70, 151, 0, 0, 0, 48, 838, CAST(N'2014-03-23T12:34:09.220' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (281, 32, 9, 55, 139, 0, 0, 0, 48, 881, CAST(N'2014-03-23T12:34:33.087' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (282, 32, 10, 57, 103, 0, 0, 0, 48, 901, CAST(N'2014-03-23T12:34:58.140' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (283, 32, 11, 43, 134, 0, 0, 0, 49, 334, CAST(N'2014-03-23T12:35:13.227' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (284, 32, 12, 81, 160, 0, 0, 0, 49, 806, CAST(N'2014-03-23T12:39:05.683' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (285, 32, 13, 87, 164, 0, 0, 0, 50, 209, CAST(N'2014-03-23T12:39:47.557' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (286, 32, 14, 83, 164, 0, 0, 0, 50, 563, CAST(N'2014-03-23T12:42:43.993' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (287, 32, 15, 84, 157, 0, 0, 0, 55, 652, CAST(N'2014-03-23T12:43:04.663' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (288, 32, 16, 77, 111, 0, 0, 0, 55, 704, CAST(N'2014-03-23T12:43:19.640' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (289, 34, 1, 2, 99, 0, 1, 0, 22, 406, CAST(N'2014-05-26T09:31:13.100' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (290, 34, 2, 1, 98, 0, 1, 0, 22, 503, CAST(N'2014-05-26T09:31:25.190' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (291, 34, 3, 5, 97, 0, 1, 0, 22, 796, CAST(N'2014-05-26T09:31:44.923' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (292, 34, 4, 7, 96, 0, 1, 0, 23, 202, CAST(N'2014-05-26T09:32:04.563' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (293, 34, 5, 3, 107, 0, 1, 0, 25, 577, CAST(N'2014-05-26T09:32:29.960' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (294, 34, 6, 28, 117, 0, 1, 0, 26, 553, CAST(N'2014-05-26T09:32:49.960' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (295, 34, 7, 56, 106, 0, 1, 0, 27, 286, CAST(N'2014-05-26T09:33:18.790' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (296, 34, 8, 57, 103, 0, 1, 0, 27, 828, CAST(N'2014-05-26T09:33:34.780' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (297, 34, 9, 42, 102, 0, 1, 0, 27, 978, CAST(N'2014-05-26T09:33:53.297' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (298, 34, 10, 95, 165, 0, 1, 0, 36, 285, CAST(N'2014-05-26T09:39:06.407' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (299, 34, 11, 81, 160, 0, 1, 0, 36, 721, CAST(N'2014-05-26T09:39:23.240' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (300, 34, 12, 10, 105, 0, 1, 0, 37, 450, CAST(N'2014-05-26T09:39:38.293' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (301, 36, 1, 42, 102, 0, 0, 0, 39, 995, CAST(N'2014-05-26T09:51:50.957' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (302, 36, 2, 2, 99, 0, 0, 0, 40, 184, CAST(N'2014-05-26T09:52:09.130' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (303, 36, 3, 1, 98, 0, 0, 0, 40, 272, CAST(N'2014-05-26T09:52:32.640' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (304, 36, 4, 7, 96, 0, 0, 0, 40, 519, CAST(N'2014-05-26T09:52:51.717' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (305, 36, 5, 10, 105, 0, 0, 0, 40, 520, CAST(N'2014-05-26T09:53:12.777' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (306, 36, 6, 5, 97, 0, 0, 0, 40, 633, CAST(N'2014-05-26T09:53:33.527' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (307, 36, 7, 57, 103, 0, 0, 0, 40, 652, CAST(N'2014-05-26T09:53:51.607' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (308, 36, 8, 96, 166, 0, 0, 0, 41, 637, CAST(N'2014-05-26T09:57:17.607' AS DateTime))
GO
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (309, 37, 1, 42, 102, 0, 0, 0, 51, 15, CAST(N'2014-06-17T09:54:29.063' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (310, 37, 2, 2, 99, 0, 0, 0, 51, 128, CAST(N'2014-06-17T10:01:13.327' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (311, 37, 3, 5, 97, 0, 0, 0, 51, 177, CAST(N'2014-06-17T10:01:32.280' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (312, 37, 4, 57, 103, 0, 0, 0, 51, 336, CAST(N'2014-06-17T10:01:54.010' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (313, 37, 5, 7, 96, 0, 0, 0, 51, 425, CAST(N'2014-06-17T10:02:11.843' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (314, 37, 6, 10, 105, 0, 0, 0, 51, 556, CAST(N'2014-06-17T10:02:28.860' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (315, 37, 7, 3, 107, 0, 0, 0, 51, 787, CAST(N'2014-06-17T10:02:53.277' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (316, 37, 8, 1, 98, 0, 0, 0, 51, 809, CAST(N'2014-06-17T10:05:09.760' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (318, 37, 9, 26, 104, 0, 0, 0, 52, 772, CAST(N'2014-06-17T10:15:31.070' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (319, 37, 10, 95, 165, 0, 0, 0, 52, 769, CAST(N'2014-06-17T10:16:00.273' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (320, 37, 11, 97, 170, 0, 0, 0, 54, 398, CAST(N'2014-06-17T10:26:14.840' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (321, 37, 12, 29, 167, 0, 0, 0, 54, 486, CAST(N'2014-06-17T10:28:34.507' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (322, 37, 13, 96, 166, 0, 0, 0, 54, 616, CAST(N'2014-06-17T10:28:49.873' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (323, 37, 14, 98, 171, 0, 0, 0, 54, 784, CAST(N'2014-06-17T10:29:09.780' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (324, 37, 15, 99, 168, 0, 0, 0, 55, 320, CAST(N'2014-06-17T10:29:26.097' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (325, 37, 16, 100, 169, 0, 1, 0, 3, 529, CAST(N'2014-06-17T10:29:46.987' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (326, 38, 1, 10, 105, 0, 0, 0, 47, 200, CAST(N'2014-08-04T13:16:28.813' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (327, 38, 2, 2, 99, 0, 0, 0, 47, 593, CAST(N'2014-08-04T13:16:46.537' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (328, 38, 3, 42, 102, 0, 0, 0, 47, 630, CAST(N'2014-08-04T13:17:08.953' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (329, 38, 4, 5, 97, 0, 0, 0, 47, 928, CAST(N'2014-08-04T13:17:26.957' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (330, 38, 5, 1, 98, 0, 0, 0, 47, 962, CAST(N'2014-08-04T13:17:44.820' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (331, 38, 7, 26, 104, 0, 0, 0, 48, 187, CAST(N'2014-08-04T13:18:18.640' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (332, 38, 8, 56, 106, 0, 0, 0, 48, 407, CAST(N'2014-08-04T13:18:44.787' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (333, 38, 9, 57, 103, 0, 0, 0, 48, 424, CAST(N'2014-08-04T13:19:05.127' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (334, 38, 10, 79, 110, 0, 0, 0, 49, 637, CAST(N'2014-08-04T13:19:27.560' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (335, 38, 11, 96, 166, 0, 0, 0, 50, 31, CAST(N'2014-08-04T13:20:00.167' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (338, 38, 12, 29, 167, 0, 0, 0, 50, 527, CAST(N'2014-08-04T13:22:17.557' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (339, 38, 14, 97, 170, 0, 0, 0, 50, 933, CAST(N'2014-08-04T13:23:01.110' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (340, 38, 6, 102, 176, 0, 0, 0, 48, 2, CAST(N'2014-08-04T13:37:44.250' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (341, 38, 13, 101, 174, 0, 0, 0, 50, 597, CAST(N'2014-08-04T13:38:11.880' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (342, 38, 15, 105, 172, 0, 0, 0, 51, 298, CAST(N'2014-08-04T13:40:41.733' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (343, 38, 16, 106, 173, 0, 0, 0, 51, 748, CAST(N'2014-08-04T13:40:58.490' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (344, 38, 17, 103, 175, 0, 0, 0, 56, 530, CAST(N'2014-08-04T13:41:19.393' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (345, 39, 1, 2, 99, 0, 1, 0, 5, 391, CAST(N'2014-08-20T08:17:55.640' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (346, 39, 2, 10, 105, 0, 1, 0, 5, 712, CAST(N'2014-08-20T08:18:21.677' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (347, 39, 3, 102, 176, 0, 1, 0, 5, 848, CAST(N'2014-08-20T08:26:38.713' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (348, 39, 4, 57, 103, 0, 1, 0, 6, 116, CAST(N'2014-08-20T08:27:02.173' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (349, 39, 5, 56, 106, 0, 1, 0, 6, 456, CAST(N'2014-08-20T08:27:25.123' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (350, 39, 6, 5, 97, 0, 1, 0, 7, 226, CAST(N'2014-08-20T08:27:52.593' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (351, 39, 7, 26, 104, 0, 1, 0, 7, 381, CAST(N'2014-08-20T08:28:10.330' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (352, 39, 8, 106, 173, 0, 1, 0, 8, 359, CAST(N'2014-08-20T08:28:39.050' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (353, 39, 9, 108, 177, 0, 1, 0, 8, 443, CAST(N'2014-08-20T08:28:56.943' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (354, 39, 10, 29, 167, 0, 1, 0, 9, 242, CAST(N'2014-08-20T08:29:13.200' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (355, 39, 11, 79, 110, 0, 1, 0, 9, 309, CAST(N'2014-08-20T08:29:37.020' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (356, 39, 12, 96, 166, 0, 1, 0, 10, 47, CAST(N'2014-08-20T08:29:56.380' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (357, 39, 13, 109, 178, 0, 1, 0, 12, 103, CAST(N'2014-08-20T08:33:21.617' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (358, 39, 14, 105, 172, 0, 1, 0, 14, 722, CAST(N'2014-08-20T08:33:50.820' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (359, 39, 15, 103, 175, 0, 1, 0, 17, 990, CAST(N'2014-08-20T08:34:12.130' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (360, 40, 1, 10, 105, 0, 0, 0, 47, 572, CAST(N'2014-10-20T11:30:11.927' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (361, 40, 2, 57, 103, 0, 0, 0, 48, 53, CAST(N'2014-10-20T11:30:33.033' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (362, 40, 3, 42, 102, 0, 0, 0, 48, 246, CAST(N'2014-10-20T11:30:59.817' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (363, 40, 4, 5, 97, 0, 0, 0, 48, 431, CAST(N'2014-10-20T11:31:20.707' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (364, 40, 5, 56, 106, 0, 0, 0, 48, 581, CAST(N'2014-10-20T11:31:38.053' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (365, 40, 6, 79, 110, 0, 0, 0, 49, 355, CAST(N'2014-10-20T11:32:01.300' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (366, 40, 7, 96, 166, 0, 0, 0, 49, 853, CAST(N'2014-10-20T11:34:05.787' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (367, 41, 1, 2, 99, 0, 1, 0, 4, 721, CAST(N'2014-10-22T15:46:11.460' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (368, 41, 2, 57, 103, 0, 1, 0, 5, 785, CAST(N'2014-10-22T15:46:40.117' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (369, 41, 3, 7, 96, 0, 1, 0, 6, 6, CAST(N'2014-10-22T15:47:04.717' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (370, 41, 4, 10, 105, 0, 1, 0, 6, 120, CAST(N'2014-10-22T15:48:13.263' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (371, 41, 5, 26, 104, 0, 1, 0, 6, 356, CAST(N'2014-10-22T15:48:48.070' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (372, 41, 6, 79, 110, 0, 1, 0, 6, 622, CAST(N'2014-10-22T15:49:07.600' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (373, 41, 7, 5, 97, 0, 1, 0, 7, 768, CAST(N'2014-10-22T15:49:30.017' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (374, 41, 8, 112, 180, 0, 1, 0, 10, 704, CAST(N'2014-10-22T15:55:36.123' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (375, 41, 9, 105, 172, 0, 1, 0, 12, 507, CAST(N'2014-10-22T15:55:59.443' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (376, 41, 10, 96, 166, 0, 1, 0, 12, 539, CAST(N'2014-10-22T15:56:19.523' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (377, 41, 11, 111, 179, 0, 1, 0, 14, 753, CAST(N'2014-10-22T15:56:39.180' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (378, 42, 1, 10, 105, 0, 0, 0, 50, 391, CAST(N'2014-12-16T08:25:12.590' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (379, 42, 2, 2, 99, 0, 0, 0, 50, 968, CAST(N'2014-12-16T08:25:47.033' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (380, 42, 3, 3, 107, 0, 0, 0, 50, 889, CAST(N'2014-12-16T08:26:05.363' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (381, 42, 4, 56, 106, 0, 0, 0, 51, 16, CAST(N'2014-12-16T08:26:25.050' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (382, 42, 5, 79, 110, 0, 0, 0, 51, 737, CAST(N'2014-12-16T08:27:02.583' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (383, 42, 6, 5, 97, 0, 0, 0, 51, 777, CAST(N'2014-12-16T08:27:35.017' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (384, 42, 7, 96, 166, 0, 0, 0, 51, 986, CAST(N'2014-12-16T08:27:55.033' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (385, 42, 8, 28, 117, 0, 0, 0, 52, 636, CAST(N'2014-12-16T08:28:33.173' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (386, 42, 9, 57, 103, 0, 0, 0, 52, 699, CAST(N'2014-12-16T08:28:58.603' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (387, 42, 10, 105, 172, 0, 0, 0, 54, 55, CAST(N'2014-12-16T08:29:22.610' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (388, 42, 11, 109, 178, 0, 0, 0, 54, 547, CAST(N'2014-12-16T08:30:10.440' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (389, 43, 1, 10, 105, 0, 0, 0, 50, 228, CAST(N'2014-12-16T08:44:55.593' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (390, 43, 2, 42, 102, 0, 0, 0, 51, 31, CAST(N'2014-12-16T08:45:20.273' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (391, 43, 3, 2, 99, 0, 0, 0, 51, 65, CAST(N'2014-12-16T08:45:41.347' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (392, 43, 4, 57, 103, 0, 0, 0, 51, 73, CAST(N'2014-12-16T08:46:00.317' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (393, 43, 5, 5, 97, 0, 0, 0, 51, 928, CAST(N'2014-12-16T08:46:20.380' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (394, 43, 6, 28, 117, 0, 0, 0, 51, 764, CAST(N'2014-12-16T08:46:46.057' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (395, 43, 7, 79, 110, 0, 0, 0, 51, 888, CAST(N'2014-12-16T08:47:04.060' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (396, 43, 8, 112, 180, 0, 0, 0, 52, 418, CAST(N'2014-12-16T08:47:28.990' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (397, 43, 9, 96, 166, 0, 0, 0, 52, 423, CAST(N'2014-12-16T08:48:02.047' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (398, 43, 10, 26, 104, 0, 0, 0, 52, 429, CAST(N'2014-12-16T08:48:31.547' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (399, 43, 11, 99, 168, 0, 0, 0, 52, 581, CAST(N'2014-12-16T08:48:51.420' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (400, 43, 12, 98, 171, 0, 0, 0, 53, 205, CAST(N'2014-12-16T08:49:20.030' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (401, 43, 13, 100, 169, 0, 0, 0, 55, 812, CAST(N'2014-12-16T08:50:01.997' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (402, 43, 14, 86, 164, 0, 0, 0, 56, 613, CAST(N'2014-12-16T08:50:33.507' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (403, 43, 15, 118, 181, 0, 1, 0, 9, 991, CAST(N'2014-12-16T09:09:31.647' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (404, 43, 16, 117, 182, 0, 3, 0, 48, 655, CAST(N'2014-12-16T09:10:23.440' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (406, 44, 1, 5, 184, 0, 1, 0, 4, 493, CAST(N'2015-01-21T09:53:38.653' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (407, 44, 2, 121, 268, 0, 1, 0, 5, 130, CAST(N'2015-01-21T09:54:11.997' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (408, 44, 3, 2, 186, 0, 1, 0, 5, 172, CAST(N'2015-01-21T09:54:43.857' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (409, 44, 4, 7, 183, 0, 1, 0, 5, 243, CAST(N'2015-01-21T09:55:10.450' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (410, 44, 5, 10, 192, 0, 1, 0, 5, 387, CAST(N'2015-01-21T09:55:34.717' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (411, 44, 6, 56, 193, 0, 1, 0, 5, 596, CAST(N'2015-01-21T09:56:02.077' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (412, 44, 7, 20, 188, 0, 1, 0, 5, 718, CAST(N'2015-01-21T09:56:26.217' AS DateTime))
GO
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (413, 44, 8, 57, 190, 0, 1, 0, 6, 75, CAST(N'2015-01-21T09:56:53.827' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (414, 44, 9, 26, 191, 0, 1, 0, 6, 128, CAST(N'2015-01-21T09:57:25.420' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (415, 44, 10, 95, 250, 0, 1, 0, 6, 713, CAST(N'2015-01-21T09:57:53.640' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (416, 44, 11, 122, 269, 0, 1, 0, 7, 380, CAST(N'2015-01-21T09:58:20.047' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (417, 44, 12, 105, 257, 0, 1, 0, 8, 164, CAST(N'2015-01-21T09:58:42.687' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (418, 44, 13, 123, 270, 0, 1, 0, 12, 28, CAST(N'2015-01-21T09:59:14.547' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (419, 44, 14, 124, 271, 0, 1, 0, 13, 543, CAST(N'2015-01-21T09:59:41.593' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (420, 44, 15, 125, 272, 0, 1, 0, 22, 616, CAST(N'2015-01-21T10:01:07.013' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (421, 44, 16, 126, 273, 0, 1, 0, 23, 343, CAST(N'2015-01-21T10:01:28.950' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (422, 44, 17, 127, 274, 0, 1, 0, 25, 418, CAST(N'2015-01-21T10:01:55.420' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (423, 44, 18, 112, 265, 0, 2, 0, 18, 895, CAST(N'2015-01-21T10:02:54.483' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (424, 46, 1, 10, 192, 0, 1, 0, 2, 480, CAST(N'2015-03-17T09:01:26.417' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (425, 46, 2, 5, 184, 0, 1, 0, 2, 815, CAST(N'2015-03-17T09:01:49.870' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (426, 46, 3, 1, 185, 0, 1, 0, 5, 717, CAST(N'2015-03-17T09:02:15.277' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (427, 46, 4, 130, 277, 0, 1, 0, 4, 677, CAST(N'2015-03-17T09:13:13.343' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (428, 46, 5, 2, 186, 0, 4, 0, 4, 982, CAST(N'2015-03-17T09:13:30.033' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (429, 46, 6, 57, 190, 0, 1, 0, 5, 800, CAST(N'2015-03-17T09:13:50.047' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (430, 46, 7, 128, 275, 0, 1, 0, 5, 659, CAST(N'2015-03-17T09:14:08.330' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (431, 46, 8, 102, 278, 0, 1, 0, 6, 273, CAST(N'2015-03-17T09:16:02.550' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (432, 46, 9, 129, 276, 0, 1, 0, 6, 652, CAST(N'2015-03-17T09:16:20.033' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (433, 46, 10, 105, 257, 0, 1, 0, 10, 399, CAST(N'2015-03-17T09:16:38.393' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (434, 47, 1, 121, 268, 0, 0, 0, 48, 648, CAST(N'2015-08-07T13:07:50.877' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (435, 47, 2, 130, 277, 0, 0, 0, 48, 909, CAST(N'2015-08-07T13:08:13.493' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (436, 47, 3, 136, 279, 0, 0, 0, 49, 197, CAST(N'2015-08-07T13:12:40.510' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (437, 47, 4, 128, 275, 0, 0, 0, 49, 416, CAST(N'2015-08-07T13:13:04.400' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (438, 47, 5, 2, 186, 0, 0, 0, 49, 589, CAST(N'2015-08-07T13:13:25.400' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (439, 47, 6, 10, 192, 0, 0, 0, 49, 591, CAST(N'2015-08-07T13:13:44.043' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (440, 47, 7, 7, 183, 0, 0, 0, 49, 751, CAST(N'2015-08-07T13:16:04.783' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (441, 47, 8, 102, 278, 0, 0, 0, 50, 209, CAST(N'2015-08-07T13:16:24.410' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (442, 47, 9, 105, 257, 0, 0, 0, 50, 373, CAST(N'2015-08-07T13:16:44.130' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (443, 47, 10, 5, 184, 0, 0, 0, 50, 496, CAST(N'2015-08-07T13:17:06.033' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (444, 47, 11, 3, 194, 0, 0, 0, 50, 647, CAST(N'2015-08-07T13:17:30.667' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (445, 47, 12, 137, 280, 0, 0, 0, 51, 406, CAST(N'2015-08-07T13:22:20.720' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (446, 47, 13, 57, 190, 0, 0, 0, 51, 410, CAST(N'2015-08-07T13:22:42.437' AS DateTime))
INSERT [Kart_Grid_Calendario] ([idGrid], [idCalendario], [Pos], [idUsuario], [idEquipe], [Volta], [tempoMinutos], [tempoHoras], [tempoSegundos], [tempoMilisegundos], [dtcriacao]) VALUES (447, 47, 14, 138, 281, 0, 0, 0, 51, 600, CAST(N'2015-08-07T13:25:00.320' AS DateTime))
SET IDENTITY_INSERT [Kart_Grid_Calendario] OFF
SET IDENTITY_INSERT [Kart_Grupo] ON 

INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (1, N'Teste de Grupo', N'GRP1                                              ', 1, 1, N'TesteGrupoAAA', CAST(N'2012-06-24T18:09:57.507' AS DateTime), N'São Paulo', N'SP', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (2, N'Teste 2', N'TST2                                              ', 1, 1, N'TESTE2', CAST(N'2013-01-22T11:03:43.470' AS DateTime), N'Praia Grande', N'SP', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (3, N'Amigos Avianca', N'AV2012                                            ', 1, 1, N'KartAmigos', CAST(N'2014-03-26T09:33:56.850' AS DateTime), N'São Paulo', N'SP', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (4, N'Desativado', N'KA13                                              ', 1, 0, N'kartamigos2013', CAST(N'2013-01-04T08:13:04.737' AS DateTime), N'São Paulo', N'SP', 0)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (5, N'Teste 3', N'tst2013                                           ', 41, 1, N'teste2013', CAST(N'2013-03-15T15:23:32.073' AS DateTime), N'sp', N'SP', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (6, N'Kart Clube Amigos da Baixada Prata', N'PRATA                                             ', 159, 1, N'amigosdabaixadaprata', CAST(N'2017-02-05T21:33:17.817' AS DateTime), N'Guaruja', N'SP', 0)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (7, N'Kart Clube Amigos da Baixada', N'KAB                                               ', 159, 1, N'amigosdabaixada', CAST(N'2018-01-29T15:41:48.697' AS DateTime), N'Baixada Santista', N'SP', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (8, N'BettaGroup Kart 2017', N'BGPKA17                                           ', 183, 1, N'BGPKA17', CAST(N'2017-05-03T16:11:15.740' AS DateTime), N'São Paulo', N'SP', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (9, N'Outback Racing', N'Outback                                           ', 193, 1, N'cok', CAST(N'2017-04-05T23:28:08.370' AS DateTime), N'São Paulo', N'SP', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (10, N'Outback Racing Oficial', N'C.O.K                                             ', 198, 1, N'outback', CAST(N'2017-04-06T20:04:16.923' AS DateTime), N'São Paulo', N'SP', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (11, N'Equipe Soul Kart', N'ESK                                               ', 261, 0, N'ESK', CAST(N'2018-02-06T21:44:03.163' AS DateTime), N'Rio de Janeiro', N'RJ', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (12, N'Bolão Duzamigos', N'BDZ                                               ', 296, 1, N'bolaoduzamigos', CAST(N'2018-04-25T10:20:41.617' AS DateTime), N'BLUMENAU', N'SC', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (13, N'KART DOS AMIGOS', N'KDA/SD                                            ', 297, 1, N'kartdosamigos', CAST(N'2018-05-08T16:39:15.277' AS DateTime), N'Natal/RN', N'RN', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (14, N'Associação dos Servidores do Tribunal de Contas', N'ASSECON                                           ', 301, 1, N'assecon', CAST(N'2018-05-10T14:06:43.547' AS DateTime), N'', N'DF', 1)
INSERT [Kart_Grupo] ([idGrupo], [NomeGrupo], [Sigla], [Id_Usuario_Lider], [permitirInsricoes], [UrlAcesso], [dtCriacao], [Cidade], [Estado], [Ativo]) VALUES (15, N'Mamulengos Cup 2018', N'MC                                                ', 292, 0, N'mamulengoscup2018', CAST(N'2018-05-22T11:00:28.023' AS DateTime), N'São Paulo', N'SP', 1)
SET IDENTITY_INSERT [Kart_Grupo] OFF
SET IDENTITY_INSERT [Kart_log_acesso] ON 

INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (1, 1, CAST(N'2014-04-04T09:40:12.340' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (2, 1, CAST(N'2014-04-04T10:07:57.463' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (3, 1, CAST(N'2014-04-04T10:11:30.560' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (4, 4, CAST(N'2014-04-04T10:28:43.397' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (5, 1, CAST(N'2014-04-04T14:09:00.500' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (6, 1, CAST(N'2014-04-04T14:12:02.213' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (7, 1, CAST(N'2014-04-04T14:15:21.440' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (8, 1, CAST(N'2014-04-04T14:22:01.787' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (9, 1, CAST(N'2014-04-04T16:11:39.723' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (10, 1, CAST(N'2014-04-04T16:14:35.600' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (11, 1, CAST(N'2014-04-04T16:18:44.603' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (12, 1, CAST(N'2014-04-04T21:53:12.790' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (13, 1, CAST(N'2014-04-16T14:06:47.110' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (14, 4, CAST(N'2014-04-16T14:27:01.143' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (15, 5, CAST(N'2014-05-13T08:47:30.103' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (16, 1, CAST(N'2014-05-13T09:29:20.430' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (17, 1, CAST(N'2014-05-19T17:56:12.827' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (18, 2, CAST(N'2014-05-26T09:30:23.943' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (19, 2, CAST(N'2014-05-26T09:37:00.407' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (20, 2, CAST(N'2014-06-16T18:41:14.627' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (21, 2, CAST(N'2014-06-17T09:29:20.497' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (22, 2, CAST(N'2014-06-17T09:53:15.697' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (23, 2, CAST(N'2014-06-17T09:56:09.823' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (24, 1, CAST(N'2014-06-17T09:56:09.823' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (25, 2, CAST(N'2014-06-17T10:00:12.580' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (26, 2, CAST(N'2014-06-17T10:14:51.303' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (27, 2, CAST(N'2014-08-04T13:12:54.500' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (28, 1, CAST(N'2014-08-04T13:16:49.530' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (29, 2, CAST(N'2014-08-04T13:32:58.690' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (30, 1, CAST(N'2014-08-04T13:33:52.747' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (31, 1, CAST(N'2014-08-04T13:54:04.687' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (32, 1, CAST(N'2014-08-04T13:55:32.177' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (33, 1, CAST(N'2014-08-04T14:06:49.160' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (34, 1, CAST(N'2014-08-04T14:40:05.697' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (35, 2, CAST(N'2014-08-20T08:15:41.430' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (36, 2, CAST(N'2014-08-20T08:20:56.803' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (37, 2, CAST(N'2014-10-20T11:02:12.067' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (38, 2, CAST(N'2014-10-20T11:28:25.673' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (39, 2, CAST(N'2014-10-22T15:45:27.873' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (40, 2, CAST(N'2014-10-22T16:01:52.867' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (41, 2, CAST(N'2014-11-04T10:47:44.173' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (42, 2, CAST(N'2014-11-04T10:52:39.750' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (43, 2, CAST(N'2014-12-16T08:23:39.517' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (44, 2, CAST(N'2014-12-16T08:41:01.933' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (45, 2, CAST(N'2014-12-16T08:53:43.580' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (46, 2, CAST(N'2014-12-16T09:11:14.717' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (47, 2, CAST(N'2015-01-05T15:29:23.987' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (48, 2, CAST(N'2015-01-20T08:26:59.070' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (49, 2, CAST(N'2015-01-20T09:51:59.897' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (50, 2, CAST(N'2015-01-20T10:13:36.770' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (51, 2, CAST(N'2015-01-21T09:11:04.480' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (52, 2, CAST(N'2015-01-21T09:41:11.733' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (53, 2, CAST(N'2015-01-21T10:10:22.357' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (54, 2, CAST(N'2015-01-21T11:04:58.220' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (55, 2, CAST(N'2015-03-17T08:49:54.260' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (56, 2, CAST(N'2015-03-17T08:56:23.087' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (57, 121, CAST(N'2015-04-14T11:33:19.447' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (58, 1, CAST(N'2015-07-15T11:07:47.147' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (59, 1, CAST(N'2015-07-15T11:18:00.137' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (60, 1, CAST(N'2015-07-15T11:47:38.150' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (61, 1, CAST(N'2015-07-15T13:12:21.387' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (62, 2, CAST(N'2015-08-07T13:04:59.447' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (63, 1, CAST(N'2015-10-06T08:12:42.567' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (64, 139, CAST(N'2016-04-13T19:49:13.617' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (65, 1, CAST(N'2016-08-25T13:47:00.990' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (66, 1, CAST(N'2016-11-07T13:44:58.960' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (67, 162, CAST(N'2017-02-03T15:50:07.267' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (68, 162, CAST(N'2017-02-03T16:02:34.837' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (69, 162, CAST(N'2017-02-03T16:05:50.763' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (70, 162, CAST(N'2017-02-03T16:08:34.427' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (71, 162, CAST(N'2017-02-03T16:22:14.243' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (72, 159, CAST(N'2017-02-05T19:36:09.717' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (73, 159, CAST(N'2017-02-05T19:52:52.110' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (74, 159, CAST(N'2017-02-05T19:57:47.500' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (75, 159, CAST(N'2017-02-05T19:58:26.110' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (76, 159, CAST(N'2017-02-05T20:30:33.000' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (77, 159, CAST(N'2017-02-05T21:52:06.427' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (78, 159, CAST(N'2017-02-06T07:57:57.833' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (79, 182, CAST(N'2017-03-24T13:56:25.523' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (80, 183, CAST(N'2017-04-03T13:47:45.247' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (81, 1, CAST(N'2017-04-03T14:02:09.967' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (82, 188, CAST(N'2017-04-03T14:12:41.780' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (83, 183, CAST(N'2017-04-03T14:15:04.890' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (84, 1, CAST(N'2017-04-03T14:21:12.637' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (85, 1, CAST(N'2017-04-03T14:28:35.170' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (86, 1, CAST(N'2017-04-03T14:31:55.140' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (87, 189, CAST(N'2017-04-04T15:47:12.170' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (88, 193, CAST(N'2017-04-04T23:06:51.700' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (89, 193, CAST(N'2017-04-04T23:18:22.637' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (90, 193, CAST(N'2017-04-04T23:20:37.717' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (91, 193, CAST(N'2017-04-05T08:27:14.217' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (92, 193, CAST(N'2017-04-05T08:52:52.577' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (93, 193, CAST(N'2017-04-05T09:28:21.343' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (94, 193, CAST(N'2017-04-05T09:47:20.737' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (95, 193, CAST(N'2017-04-05T09:48:41.657' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (96, 194, CAST(N'2017-04-05T16:42:24.280' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (97, 193, CAST(N'2017-04-05T17:04:51.967' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (98, 193, CAST(N'2017-04-05T17:08:51.653' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (99, 193, CAST(N'2017-04-05T17:27:00.640' AS DateTime))
GO
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (100, 196, CAST(N'2017-04-05T17:45:56.110' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (101, 193, CAST(N'2017-04-05T17:51:34.530' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (102, 196, CAST(N'2017-04-05T17:53:36.827' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (103, 193, CAST(N'2017-04-05T21:06:26.630' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (104, 193, CAST(N'2017-04-05T22:26:24.523' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (105, 193, CAST(N'2017-04-05T22:57:28.773' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (106, 193, CAST(N'2017-04-05T23:08:51.697' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (107, 193, CAST(N'2017-04-05T23:33:59.980' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (108, 193, CAST(N'2017-04-06T00:11:46.510' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (109, 193, CAST(N'2017-04-06T00:21:22.620' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (110, 196, CAST(N'2017-04-06T00:25:45.527' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (111, 193, CAST(N'2017-04-06T00:31:02.950' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (112, 193, CAST(N'2017-04-06T00:37:53.700' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (113, 197, CAST(N'2017-04-06T00:49:35.217' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (114, 197, CAST(N'2017-04-06T00:56:25.043' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (115, 193, CAST(N'2017-04-06T01:18:40.593' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (116, 193, CAST(N'2017-04-06T06:55:08.867' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (117, 197, CAST(N'2017-04-06T16:01:29.417' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (118, 193, CAST(N'2017-04-06T16:05:48.540' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (119, 193, CAST(N'2017-04-06T19:37:22.483' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (120, 198, CAST(N'2017-04-06T19:57:21.923' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (121, 193, CAST(N'2017-04-06T20:05:20.737' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (122, 199, CAST(N'2017-04-06T20:10:38.393' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (123, 193, CAST(N'2017-04-06T20:22:16.860' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (124, 198, CAST(N'2017-04-06T20:23:13.643' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (125, 199, CAST(N'2017-04-06T20:27:18.813' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (126, 198, CAST(N'2017-04-06T20:33:42.737' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (127, 198, CAST(N'2017-04-07T11:16:01.577' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (128, 198, CAST(N'2017-04-07T18:24:04.357' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (129, 185, CAST(N'2017-04-07T19:40:59.607' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (130, 198, CAST(N'2017-04-08T22:23:44.697' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (131, 193, CAST(N'2017-04-08T22:32:43.480' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (132, 193, CAST(N'2017-04-08T22:56:18.283' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (133, 193, CAST(N'2017-04-08T23:01:25.597' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (134, 193, CAST(N'2017-04-08T23:46:55.427' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (135, 193, CAST(N'2017-04-09T18:13:39.007' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (136, 193, CAST(N'2017-04-09T18:31:58.320' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (137, 193, CAST(N'2017-04-09T18:37:13.070' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (138, 193, CAST(N'2017-04-09T19:09:57.150' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (139, 193, CAST(N'2017-04-09T19:19:36.540' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (140, 198, CAST(N'2017-04-09T19:22:47.290' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (141, 208, CAST(N'2017-04-09T19:29:20.273' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (142, 196, CAST(N'2017-04-09T21:52:15.717' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (143, 196, CAST(N'2017-04-09T21:53:43.280' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (144, 198, CAST(N'2017-04-09T22:04:14.780' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (145, 198, CAST(N'2017-04-09T23:45:32.453' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (146, 198, CAST(N'2017-04-10T01:27:03.490' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (147, 198, CAST(N'2017-04-10T02:11:34.270' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (148, 198, CAST(N'2017-04-10T07:11:55.373' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (149, 198, CAST(N'2017-04-10T14:28:45.450' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (150, 198, CAST(N'2017-04-10T16:17:24.373' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (151, 224, CAST(N'2017-04-10T16:22:22.267' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (152, 1, CAST(N'2017-04-10T17:38:32.097' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (153, 1, CAST(N'2017-04-10T17:51:17.690' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (154, 193, CAST(N'2017-04-13T20:23:31.187' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (155, 1, CAST(N'2017-04-19T15:22:20.480' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (156, 198, CAST(N'2017-04-19T15:30:39.077' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (157, 201, CAST(N'2017-04-23T22:05:22.757' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (158, 224, CAST(N'2017-04-24T18:25:20.887' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (159, 183, CAST(N'2017-05-03T16:09:30.130' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (160, 183, CAST(N'2017-05-03T16:25:45.820' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (161, 183, CAST(N'2017-05-03T16:43:59.740' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (162, 198, CAST(N'2017-05-15T17:36:38.080' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (163, 198, CAST(N'2017-05-23T11:59:02.200' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (164, 198, CAST(N'2017-05-23T12:34:58.593' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (165, 224, CAST(N'2017-05-26T15:00:55.700' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (166, 234, CAST(N'2017-05-27T01:58:09.423' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (167, 1, CAST(N'2017-05-31T16:57:27.190' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (168, 234, CAST(N'2017-06-08T12:52:02.687' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (169, 234, CAST(N'2017-06-08T12:53:59.627' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (170, 193, CAST(N'2017-07-20T22:10:58.507' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (171, 193, CAST(N'2017-07-20T22:18:20.820' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (172, 193, CAST(N'2017-07-21T12:12:24.027' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (173, 193, CAST(N'2017-07-21T12:18:32.247' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (174, 208, CAST(N'2017-08-16T19:23:37.223' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (175, 193, CAST(N'2017-08-16T19:29:52.037' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (176, 193, CAST(N'2017-08-18T12:31:22.527' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (177, 198, CAST(N'2017-08-18T12:34:46.043' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (178, 193, CAST(N'2017-08-18T12:35:52.417' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (179, 193, CAST(N'2017-08-18T12:59:24.857' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (180, 193, CAST(N'2017-08-20T21:18:52.027' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (181, 193, CAST(N'2017-08-20T21:25:34.420' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (182, 193, CAST(N'2017-08-20T21:50:20.890' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (183, 193, CAST(N'2017-08-20T22:28:30.560' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (184, 193, CAST(N'2017-08-20T22:35:50.297' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (185, 193, CAST(N'2017-08-20T22:40:58.610' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (186, 193, CAST(N'2017-08-20T22:50:39.017' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (187, 193, CAST(N'2017-08-21T13:02:38.153' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (188, 193, CAST(N'2017-08-21T13:08:54.060' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (189, 193, CAST(N'2017-08-21T13:22:46.780' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (190, 193, CAST(N'2017-08-21T13:29:28.967' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (191, 193, CAST(N'2017-08-21T13:44:59.517' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (192, 193, CAST(N'2017-08-21T13:51:14.657' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (193, 193, CAST(N'2017-08-21T14:07:22.940' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (194, 193, CAST(N'2017-08-23T20:04:23.553' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (195, 193, CAST(N'2017-08-23T21:27:45.477' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (196, 208, CAST(N'2017-09-06T19:27:10.747' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (197, 193, CAST(N'2017-10-01T23:40:58.687' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (198, 193, CAST(N'2017-10-02T00:42:18.017' AS DateTime))
INSERT [Kart_log_acesso] ([idAcesso], [idUsuario], [dtAcesso]) VALUES (199, 193, CAST(N'2017-10-02T00:58:24.270' AS DateTime))
GO
SET IDENTITY_INSERT [Kart_log_acesso] OFF
SET IDENTITY_INSERT [Kart_Usuario_Grupo] ON 

INSERT [Kart_Usuario_Grupo] ([idGrupoUsuario], [idGrupo], [idUsuario], [Principal], [Admin], [Aprovado], [dtCriacao]) VALUES (1, 3, 1005, NULL, 0, 1, CAST(N'2018-11-10T13:35:48.457' AS DateTime))
INSERT [Kart_Usuario_Grupo] ([idGrupoUsuario], [idGrupo], [idUsuario], [Principal], [Admin], [Aprovado], [dtCriacao]) VALUES (2, 13, 1006, NULL, 0, 1, CAST(N'2018-11-26T17:54:30.027' AS DateTime))
INSERT [Kart_Usuario_Grupo] ([idGrupoUsuario], [idGrupo], [idUsuario], [Principal], [Admin], [Aprovado], [dtCriacao]) VALUES (3, 3, 1008, NULL, 0, 1, CAST(N'2018-11-29T18:43:14.990' AS DateTime))
INSERT [Kart_Usuario_Grupo] ([idGrupoUsuario], [idGrupo], [idUsuario], [Principal], [Admin], [Aprovado], [dtCriacao]) VALUES (1002, 3, 2003, NULL, 0, 1, CAST(N'2018-12-29T22:45:46.110' AS DateTime))
INSERT [Kart_Usuario_Grupo] ([idGrupoUsuario], [idGrupo], [idUsuario], [Principal], [Admin], [Aprovado], [dtCriacao]) VALUES (1003, 3, 2012, NULL, 0, 1, CAST(N'2019-04-08T18:05:04.873' AS DateTime))
INSERT [Kart_Usuario_Grupo] ([idGrupoUsuario], [idGrupo], [idUsuario], [Principal], [Admin], [Aprovado], [dtCriacao]) VALUES (2002, 3, 4003, NULL, 0, 1, CAST(N'2019-07-29T15:20:38.217' AS DateTime))
SET IDENTITY_INSERT [Kart_Usuario_Grupo] OFF
ALTER TABLE [Kart_Album_Grupo] ADD  CONSTRAINT [DF_Kart_Album_Grupo_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO
ALTER TABLE [Kart_Calendario_Campeonato] ADD  CONSTRAINT [DF_Kart_Calendario_Campeonato_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO
ALTER TABLE [Kart_Calendario_Campeonato] ADD  CONSTRAINT [DF_Kart_Calendario_Campeonato_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [Kart_Campeonato] ADD  CONSTRAINT [DF_Kart_Campeonato_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO
ALTER TABLE [Kart_Campeonato] ADD  CONSTRAINT [DF_Kart_Campeonato_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [Kart_Equipe_Campeonato] ADD  CONSTRAINT [DF_Kart_Equipe_Campeonato_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO
ALTER TABLE [Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_Pos]  DEFAULT ((0)) FOR [Pos]
GO
ALTER TABLE [Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_Volta]  DEFAULT ((0)) FOR [Volta]
GO
ALTER TABLE [Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_tempoMinutos]  DEFAULT ((0)) FOR [tempoMinutos]
GO
ALTER TABLE [Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_tempo]  DEFAULT ((0)) FOR [tempoHoras]
GO
ALTER TABLE [Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_tempoSegundos]  DEFAULT ((0)) FOR [tempoSegundos]
GO
ALTER TABLE [Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_tempoHora1]  DEFAULT ((0)) FOR [tempoMilisegundos]
GO
ALTER TABLE [Kart_Grid_Calendario] ADD  CONSTRAINT [DF_Kart_Grid_Calendario_dtcriacao]  DEFAULT (getdate()) FOR [dtcriacao]
GO
ALTER TABLE [Kart_Grupo] ADD  CONSTRAINT [DF_Kart_Grupo_permitirInsricoesNoSite]  DEFAULT ((1)) FOR [permitirInsricoes]
GO
ALTER TABLE [Kart_Grupo] ADD  CONSTRAINT [DF_Kart_Grupo_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO
ALTER TABLE [Kart_Grupo] ADD  CONSTRAINT [DF_Kart_Grupo_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [Kart_log_erro] ADD  CONSTRAINT [DF_Kart_log_erro_dtErro]  DEFAULT (getdate()) FOR [dtErro]
GO
ALTER TABLE [Kart_Noticias_Grupo] ADD  CONSTRAINT [DF_Kart_Noticias_Grupo_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO
ALTER TABLE [Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_tempo]  DEFAULT ((0)) FOR [tempoHoras]
GO
ALTER TABLE [Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_tempoHoras1]  DEFAULT ((0)) FOR [tempoMinutos]
GO
ALTER TABLE [Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_tempoHoras1_1]  DEFAULT ((0)) FOR [tempoSegundos]
GO
ALTER TABLE [Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_tempoHoras1_2]  DEFAULT ((0)) FOR [tempoMilisegundos]
GO
ALTER TABLE [Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_Ponto]  DEFAULT ((0)) FOR [Ponto]
GO
ALTER TABLE [Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_Voltas]  DEFAULT ((0)) FOR [Voltas]
GO
ALTER TABLE [Kart_Resultado_Calendario] ADD  CONSTRAINT [DF_Kart_Resultado_Calendario_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO
ALTER TABLE [Kart_Usuario_Equipe_Campeonato] ADD  CONSTRAINT [DF_Kart_Usuario_Equipe_Campeonato_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO
ALTER TABLE [Kart_Usuario_Grupo] ADD  CONSTRAINT [DF_Kart_Usuario_Grupo_Principal]  DEFAULT ((0)) FOR [Principal]
GO
ALTER TABLE [Kart_Usuario_Grupo] ADD  CONSTRAINT [DF_Kart_Usuario_Grupo_Admin]  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [Kart_Usuario_Grupo] ADD  CONSTRAINT [DF_Kart_Usuario_Grupo_Aprovado]  DEFAULT ((0)) FOR [Aprovado]
GO
ALTER TABLE [Kart_Usuario_Grupo] ADD  CONSTRAINT [DF_Kart_Usuario_Grupo_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO
ALTER TABLE [Kart_Videos_Grupo] ADD  CONSTRAINT [DF_Kart_Videos_Grupo_dtCriacao]  DEFAULT (getdate()) FOR [dtCriacao]
GO
ALTER TABLE [Kart_Album_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Album_Grupo_Kart_Calendario_Campeonato] FOREIGN KEY([idCalendario])
REFERENCES [Kart_Calendario_Campeonato] ([idCalendario])
GO
ALTER TABLE [Kart_Album_Grupo] CHECK CONSTRAINT [FK_Kart_Album_Grupo_Kart_Calendario_Campeonato]
GO
ALTER TABLE [Kart_Album_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Album_Grupo_Kart_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [Kart_Grupo] ([idGrupo])
GO
ALTER TABLE [Kart_Album_Grupo] CHECK CONSTRAINT [FK_Kart_Album_Grupo_Kart_Grupo]
GO
ALTER TABLE [Kart_Calendario_Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Calendario_Campeonato_Kart_Campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [Kart_Campeonato] ([idCampeonato])
GO
ALTER TABLE [Kart_Calendario_Campeonato] CHECK CONSTRAINT [FK_Kart_Calendario_Campeonato_Kart_Campeonato]
GO
ALTER TABLE [Kart_Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Campeonato_Kart_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [Kart_Grupo] ([idGrupo])
GO
ALTER TABLE [Kart_Campeonato] CHECK CONSTRAINT [FK_Kart_Campeonato_Kart_Grupo]
GO
ALTER TABLE [Kart_Campeonato_Usuario_Desativados]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Campeonato_Usuario_Desativados_Kart_Campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [Kart_Campeonato] ([idCampeonato])
GO
ALTER TABLE [Kart_Campeonato_Usuario_Desativados] CHECK CONSTRAINT [FK_Kart_Campeonato_Usuario_Desativados_Kart_Campeonato]
GO
ALTER TABLE [Kart_Equipe_Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Equipe_Campeonato_Kart_Campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [Kart_Campeonato] ([idCampeonato])
GO
ALTER TABLE [Kart_Equipe_Campeonato] CHECK CONSTRAINT [FK_Kart_Equipe_Campeonato_Kart_Campeonato]
GO
ALTER TABLE [Kart_Equipe_Campeonato_Desativados]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Equipe_Campeonato_Desativados_Kart_Campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [Kart_Campeonato] ([idCampeonato])
GO
ALTER TABLE [Kart_Equipe_Campeonato_Desativados] CHECK CONSTRAINT [FK_Kart_Equipe_Campeonato_Desativados_Kart_Campeonato]
GO
ALTER TABLE [Kart_Equipe_Campeonato_Desativados]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Equipe_Campeonato_Desativados_Kart_Equipe_Campeonato] FOREIGN KEY([idEquipeCampeonato])
REFERENCES [Kart_Equipe_Campeonato] ([idEquipeCampeonato])
GO
ALTER TABLE [Kart_Equipe_Campeonato_Desativados] CHECK CONSTRAINT [FK_Kart_Equipe_Campeonato_Desativados_Kart_Equipe_Campeonato]
GO
ALTER TABLE [Kart_Grid_Calendario]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Grid_Calendario_Kart_Calendario_Campeonato] FOREIGN KEY([idCalendario])
REFERENCES [Kart_Calendario_Campeonato] ([idCalendario])
GO
ALTER TABLE [Kart_Grid_Calendario] CHECK CONSTRAINT [FK_Kart_Grid_Calendario_Kart_Calendario_Campeonato]
GO
ALTER TABLE [Kart_log_erro]  WITH CHECK ADD  CONSTRAINT [FK_Kart_log_erro_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [Usuarios] ([idUsuario])
GO
ALTER TABLE [Kart_log_erro] CHECK CONSTRAINT [FK_Kart_log_erro_Usuarios]
GO
ALTER TABLE [Kart_Noticias_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Noticias_Grupo_Kart_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [Kart_Grupo] ([idGrupo])
GO
ALTER TABLE [Kart_Noticias_Grupo] CHECK CONSTRAINT [FK_Kart_Noticias_Grupo_Kart_Grupo]
GO
ALTER TABLE [Kart_Noticias_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Noticias_Grupo_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [Usuarios] ([idUsuario])
GO
ALTER TABLE [Kart_Noticias_Grupo] CHECK CONSTRAINT [FK_Kart_Noticias_Grupo_Usuarios]
GO
ALTER TABLE [Kart_Ponto_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Ponto_Grupo_Kart_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [Kart_Grupo] ([idGrupo])
GO
ALTER TABLE [Kart_Ponto_Grupo] CHECK CONSTRAINT [FK_Kart_Ponto_Grupo_Kart_Grupo]
GO
ALTER TABLE [Kart_Regras_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Regras_Grupo_Kart_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [Kart_Grupo] ([idGrupo])
GO
ALTER TABLE [Kart_Regras_Grupo] CHECK CONSTRAINT [FK_Kart_Regras_Grupo_Kart_Grupo]
GO
ALTER TABLE [Kart_Regras_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Regras_Grupo_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [Usuarios] ([idUsuario])
GO
ALTER TABLE [Kart_Regras_Grupo] CHECK CONSTRAINT [FK_Kart_Regras_Grupo_Usuarios]
GO
ALTER TABLE [Kart_Resultado_Calendario]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Resultado_Calendario_Kart_Calendario_Campeonato] FOREIGN KEY([idCalendario])
REFERENCES [Kart_Calendario_Campeonato] ([idCalendario])
GO
ALTER TABLE [Kart_Resultado_Calendario] CHECK CONSTRAINT [FK_Kart_Resultado_Calendario_Kart_Calendario_Campeonato]
GO
ALTER TABLE [Kart_Resultado_Calendario]  WITH CHECK ADD  CONSTRAINT [FK2_Kart_Resultado_Calendario_Kart_Resultado_Calendario] FOREIGN KEY([idUsuario])
REFERENCES [Usuarios] ([idUsuario])
GO
ALTER TABLE [Kart_Resultado_Calendario] CHECK CONSTRAINT [FK2_Kart_Resultado_Calendario_Kart_Resultado_Calendario]
GO
ALTER TABLE [Kart_Usuario_Equipe_Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Usuario_Equipe_Campeonato_Kart_Equipe_Campeonato] FOREIGN KEY([idEquipeCampeonato])
REFERENCES [Kart_Equipe_Campeonato] ([idEquipeCampeonato])
GO
ALTER TABLE [Kart_Usuario_Equipe_Campeonato] CHECK CONSTRAINT [FK_Kart_Usuario_Equipe_Campeonato_Kart_Equipe_Campeonato]
GO
ALTER TABLE [Kart_Usuario_Equipe_Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Usuario_Equipe_Campeonato_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [Usuarios] ([idUsuario])
GO
ALTER TABLE [Kart_Usuario_Equipe_Campeonato] CHECK CONSTRAINT [FK_Kart_Usuario_Equipe_Campeonato_Usuarios]
GO
ALTER TABLE [Kart_Usuario_Grupo]  WITH CHECK ADD  CONSTRAINT [FK1_Kart_Usuario_Grupo_Kart_Usuario_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [Kart_Grupo] ([idGrupo])
GO
ALTER TABLE [Kart_Usuario_Grupo] CHECK CONSTRAINT [FK1_Kart_Usuario_Grupo_Kart_Usuario_Grupo]
GO
ALTER TABLE [Kart_Usuario_Grupo]  WITH CHECK ADD  CONSTRAINT [FK2_Kart_Usuario_Grupo_Kart_Usuario_Grupo] FOREIGN KEY([idUsuario])
REFERENCES [Usuarios] ([idUsuario])
GO
ALTER TABLE [Kart_Usuario_Grupo] CHECK CONSTRAINT [FK2_Kart_Usuario_Grupo_Kart_Usuario_Grupo]
GO
ALTER TABLE [Kart_Videos_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Videos_Grupo_Kart_Calendario_Campeonato] FOREIGN KEY([idCalendario])
REFERENCES [Kart_Calendario_Campeonato] ([idCalendario])
GO
ALTER TABLE [Kart_Videos_Grupo] CHECK CONSTRAINT [FK_Kart_Videos_Grupo_Kart_Calendario_Campeonato]
GO
ALTER TABLE [Kart_Videos_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Videos_Grupo_Kart_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [Kart_Grupo] ([idGrupo])
GO
ALTER TABLE [Kart_Videos_Grupo] CHECK CONSTRAINT [FK_Kart_Videos_Grupo_Kart_Grupo]
GO
ALTER TABLE [Kart_Videos_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Kart_Videos_Grupo_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [Usuarios] ([idUsuario])
GO
ALTER TABLE [Kart_Videos_Grupo] CHECK CONSTRAINT [FK_Kart_Videos_Grupo_Usuarios]
GO
