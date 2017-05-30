DROP TABLE IF EXISTS DecisionChances;
DROP TABLE IF EXISTS Decisions;
DROP TABLE IF EXISTS SimulationLogs;
DROP TABLE IF EXISTS Needs;
DROP TABLE IF EXISTS Productions;
DROP TABLE IF EXISTS ProductIngredients;
DROP TABLE IF EXISTS NodeLinks;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Nodes;
DROP TABLE IF EXISTS Simulations;

CREATE TABLE Simulations (
	[Id] int NOT NULL PRIMARY KEY IDENTITY(0,1),
	[Name] nvarchar(100) NOT NULL,
	[NeedFulfillSortByPriority] int NOT NULL,
	[NeedFulfillSortByQuantity] int NOT NULL,
	[ProductionSortByDistance] int NOT NULL,
	[ProductionSortByFinalCost] int NOT NULL,
	[ProductionSortByInitialCost] int NOT NULL,
	[ProductPriceIncreasePerQuality] float NOT NULL,
	[ProductPriceIncreasePerIntermediary] float NOT NULL
);

CREATE TABLE Nodes (
	[Id] int NOT NULL IDENTITY(0,1) CONSTRAINT PK_Nodes PRIMARY KEY,
	[SimulationId] int NOT NULL,
	[Name] nvarchar(200) NOT NULL,
	[SpendingLimit] float NOT NULL
);

CREATE TABLE Products (
	[Id] int NOT NULL IDENTITY(0,1) CONSTRAINT PK_Products PRIMARY KEY,
	[SimulationId] int NOT NULL,
	[Name] nvarchar(200) NOT NULL
);

CREATE TABLE NodeLinks (
	[Id] int NOT NULL IDENTITY(0,1) CONSTRAINT PK_NodeLinks PRIMARY KEY,
	[SimulationId] int NOT NULL,
	[NodeId] int NOT NULL,
	[LinkId] int NOT NULL,
	UNIQUE(LinkId, NodeId)
);

CREATE TABLE ProductIngredients (
	[ProductId] int NOT NULL CONSTRAINT FK_ProductIngredient_Product REFERENCES Products(Id) ON DELETE CASCADE,
	[IngredientId] int NOT NULL CONSTRAINT FK_ProductsIngredient_Ingredient REFERENCES Products(Id)
);

CREATE TABLE Productions (
	[Id] int NOT NULL IDENTITY(0,1) CONSTRAINT PK_Productions PRIMARY KEY,
	[NodeId] int NOT NULL,
	[ProductId] int NOT NULL,
	[Quantity] int NOT NULL,
	[Quality] int NOT NULL,
	[Price] float NOT NULL
);

CREATE TABLE Needs (
	[Id] int NOT NULL IDENTITY(0,1) CONSTRAINT PK_Needs PRIMARY KEY,
	[NodeId] int NOT NULL,
	[ProductId] int NOT NULL,
	[Quantity] int NOT NULL,
	[Priority] int NOT NULL
);

CREATE TABLE SimulationLogs(
	[Id] int NOT NULL IDENTITY(0,1) PRIMARY KEY,
	[SimulationId] int NOT NULL,
	[NodeId] int NOT NULL,
	[IterationNumber] int NOT NULL,
	[Type] int NOT NULL,
	[Content] nvarchar(100)
);

CREATE TABLE Decisions(
	[Id] int NOT NULL PRIMARY KEY IDENTITY(0,1),
	[Name] nvarchar(50) NOT NULL
);

CREATE TABLE DecisionChances(
	[Id] int NOT NULL IDENTITY(0,1) CONSTRAINT PK_DecisionChances PRIMARY KEY,
	[SimulationId] int NOT NULL,
	[DecisionId] int NOT NULL,
	[Chance] float NOT NULL,
	[Enabled] bit NOT NULL
);