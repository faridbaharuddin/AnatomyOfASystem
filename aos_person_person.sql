USE [AnatomyOfASystem]
GO

CREATE TABLE [dbo].[person_person](
	[person_person_id] [bigint] IDENTITY(1,1) NOT NULL,
	[thisPerson] [bigint] NOT NULL,
	[otherPerson] [bigint] NOT NULL,
	[relationshipType] [nvarchar](50) NOT NULL,
	[relationshipStart] [datetime] NULL,
	[relationshipEnd] [datetime] NULL,
	[recordStatus] [smallint] NOT NULL,
 CONSTRAINT [PK_person_person] PRIMARY KEY CLUSTERED 
(
	[person_person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[person_person] ADD  CONSTRAINT [DF_person_person_systemStatus]  DEFAULT ((1)) FOR [recordStatus]
GO

ALTER TABLE [dbo].[person_person]  WITH CHECK ADD  CONSTRAINT [FK_person1] FOREIGN KEY([thisPerson])
REFERENCES [dbo].[person] ([personId])
GO

ALTER TABLE [dbo].[person_person]  WITH CHECK ADD  CONSTRAINT [FK_person2] FOREIGN KEY([otherPerson])
REFERENCES [dbo].[person] ([personId])
GO


