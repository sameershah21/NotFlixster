USE [MyProjects]
GO
/****** Object:  Table [dbo].[tbl_Not_Flixster]    Script Date: 6/10/2013 8:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Not_Flixster](
	[OurID] [int] NOT NULL,
	[OurDesc] [varchar](max) NULL,
	[OurCountriesReleasedIn] [varchar](max) NULL,
	[OurRating] [int] NULL,
	[OurTitle] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_Not_Flixster] PRIMARY KEY CLUSTERED 
(
	[OurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Not_Flixster_Reviews]    Script Date: 6/10/2013 8:32:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Not_Flixster_Reviews](
	[OurID] [int] NOT NULL,
	[OurReviewID] [int] NOT NULL,
	[OurReviews] [varchar](max) NULL,
	[OurReviewsDaysAgo] [int] NULL,
 CONSTRAINT [PK_tbl_Not_Flixster_Reviews] PRIMARY KEY CLUSTERED 
(
	[OurReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_Not_Flixster] ([OurID], [OurDesc], [OurCountriesReleasedIn], [OurRating], [OurTitle]) VALUES (1366, N'A small time boxer gets a once in a lifetime chance to fight the heavyweight champ in a bout in which he strives to go the distance for his self-respect. ', N'USA, Canada', 8, N'Rocky')
INSERT [dbo].[tbl_Not_Flixster] ([OurID], [OurDesc], [OurCountriesReleasedIn], [OurRating], [OurTitle]) VALUES (7350, N'Two terminally ill men escape from a cancer ward and head off on a road trip with a wish list of to-dos before they die.', N'USA, Canada', 5, N'The Bucket List')
INSERT [dbo].[tbl_Not_Flixster] ([OurID], [OurDesc], [OurCountriesReleasedIn], [OurRating], [OurTitle]) VALUES (7979, N'After spending years in California, Amir returns to his homeland in Afghanistan to help his old friend Hassan, whose son is in trouble. ', N'USA, Canada, Afghanistan, India', 7, N'The Kite Runner')
INSERT [dbo].[tbl_Not_Flixster] ([OurID], [OurDesc], [OurCountriesReleasedIn], [OurRating], [OurTitle]) VALUES (11036, N'A poor and passionate young man falls in love with a rich young woman and gives her a sense of freedom. They soon are separated by their social differences. ', N'USA, Canada, Brazil, Equador, Spain', 7, N'The Notebook')
INSERT [dbo].[tbl_Not_Flixster] ([OurID], [OurDesc], [OurCountriesReleasedIn], [OurRating], [OurTitle]) VALUES (183494, N'A struggling salesman takes custody of his son as he''s poised to begin a life-changing professional endeavor.', N'USA, Canada, Equador, France, Italy', 8, N'The Pursuit of Happyness')
INSERT [dbo].[tbl_Not_Flixster_Reviews] ([OurID], [OurReviewID], [OurReviews], [OurReviewsDaysAgo]) VALUES (183494, 1, N'nice', 12)
INSERT [dbo].[tbl_Not_Flixster_Reviews] ([OurID], [OurReviewID], [OurReviews], [OurReviewsDaysAgo]) VALUES (183494, 2, N'worth watching 10 times!', 34)
INSERT [dbo].[tbl_Not_Flixster_Reviews] ([OurID], [OurReviewID], [OurReviews], [OurReviewsDaysAgo]) VALUES (183494, 3, N'Did not like it. Children loved it!', 44)
INSERT [dbo].[tbl_Not_Flixster_Reviews] ([OurID], [OurReviewID], [OurReviews], [OurReviewsDaysAgo]) VALUES (1366, 4, N'awesome', 1)
INSERT [dbo].[tbl_Not_Flixster_Reviews] ([OurID], [OurReviewID], [OurReviews], [OurReviewsDaysAgo]) VALUES (1366, 5, N'great', 2)
INSERT [dbo].[tbl_Not_Flixster_Reviews] ([OurID], [OurReviewID], [OurReviews], [OurReviewsDaysAgo]) VALUES (1366, 6, N'SLY will never age!!!!', 3)
INSERT [dbo].[tbl_Not_Flixster_Reviews] ([OurID], [OurReviewID], [OurReviews], [OurReviewsDaysAgo]) VALUES (7350, 7, N'Will Smith has done it again. Awesome acting', 55)
INSERT [dbo].[tbl_Not_Flixster_Reviews] ([OurID], [OurReviewID], [OurReviews], [OurReviewsDaysAgo]) VALUES (7979, 8, N'I almost could not help crying. The keyword here is ALMOST!', 544)
