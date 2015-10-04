USE [AnatomyOfASystem]
GO

CREATE TABLE [dbo].[person](
	[personId] [bigint] IDENTITY(1,1) NOT NULL,
	[honorificPrefix] [nvarchar](20) NULL,
	[givenName] [nvarchar](50) NULL,
	[additionalName] [nvarchar](50) NULL,
	[inheritedName] [nvarchar](50) NULL,
	[honorificSuffix] [nvarchar](20) NULL,
	[birthName] [nvarchar](150) NULL,
	[displayName] [nvarchar](100) NOT NULL,
	[dateOfBirth] [date] NULL,
	[placeOfBirth] [nvarchar](100) NULL,
	[countryOfBirth] [smallint] NULL,
	[dateOfDeath] [date] NULL,
	[placeOfDeath] [nvarchar](100) NULL,
	[countryOfDeath] [smallint] NULL,
	[gender] [tinyint] NULL,
	[isPrecededBy] [bigint] NULL,
	[isSupersededBy] [bigint] NULL,
	[recordCreated] [timestamp] NOT NULL,
	[recordStatus] [smallint] NOT NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[personId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[person] ADD  CONSTRAINT [DF_person_systemStatus]  DEFAULT ((1)) FOR [recordStatus]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier for the person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'personId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Honorific prefix or prefixes preceding a person''s name, e.g., Mr, Mrs, Dr.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'honorificPrefix'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Given name or first name of a person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'givenName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An additional name for a Person, can be used for a middle name.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'additionalName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An inherited  name is a component of a personal name that is inherited as a matronymic, patronymic or family name.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'inheritedName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Honorific suffix or suffixes following a person''s name, e.g., PhD, M.D.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'honorificSuffix'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Birth names, unlike other data about a person tend to be persistent and are recorded by some public sector information systems. The full name should be recorded in a single field.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'birthName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the person, usually comprising one or more of the given, additional, matronymic or patronymic names in a preferred order.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'displayName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date on which a person was born.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The place (address, building or otherwise) where a person was born.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'placeOfBirth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The country in which a person was born. Represented by an object in the country table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'countryOfBirth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date on which a person died.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The place (address, building or otherwise) where a person died.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'placeOfDeath'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The country in which a person died. Represented by an object in the country table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'countryOfDeath'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The gender of this person, represented by the following enumeration:
1 - Male
2 - Female
0 - Undecided' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'gender'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The previous version of this Person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'isPrecededBy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The next version of this Person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'isSupersededBy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When this Person record was created.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'recordCreated'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status of this object, following a common enumeration listed in a separate table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'person', @level2type=N'COLUMN',@level2name=N'recordStatus'
GO


