BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Production';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Stock';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Produit';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Type_Produit';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Forme_produit';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Lieu';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Dates';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Application_produit';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Entrepot';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Conditionnement';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Type_stocks';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/




CREATE TABLE Produit(
	id int,
	idProduit VARCHAR2(30) NOT NULL, 
	nomproduit VARCHAR2(30) NOT NULL,
	denominatin VARCHAR2(30),
	prix REAL NOT NULL,
	poidsTotal REAL,
	volume REAL,
	longueur REAL,
	largeur REAL,
	hauteur REAL,
	constraint pk_produit primary key(id)
);

CREATE TABLE Type_Produit(
	id_type INT,
	type_produit VARCHAR(50),
	CONSTRAINT pk_type_produit PRIMARY KEY(id_type)
);


create table Lieu(
	id_lieu int,
	nom_lieu VARCHAR(30),
	type_lieu VARCHAR(30),
	numero_voie int,
	type_voie VARCHAR(30),
	nom_voie VARCHAR(30),
	complement_adresse VARCHAR(30),
	adresse_complet VARCHAR(30),
	codePostal int,
	departement VARCHAR(30),
	region VARCHAR(30),
	ville VARCHAR(30),
	pays VARCHAR(30),
	continent VARCHAR(30),
	nbPersonnel int,
	constraint pk_lieu primary key(id_lieu));

create table Dates(
	id_date int,
	date_ DATE,
	date_description VARCHAR(30),
	numero_trimestre int,
	numero_semaine int,
	numero_jour_semaine int,
	numero_jour_mois int,
	numero_jour_annee int,
	nom_mois int,
	numero_mois int,
	annee int,
	constraint pk_dates primary key(id_date));

CREATE TABLE Forme_produits(
	id_forme_produit int,
	forme VARCHAR(50),
	poids FLOAT,
	volume FLOAT,
	couleur VARCHAR(50),
	CONSTRAINT pk_forme_produit PRIMARY KEY(id_forme_produit)
	);

CREATE TABLE Application_produit(
	id_application INT,
	application_p VARCHAR2(200),
	description_app VARCHAR2(400),
	procede VARCHAR2(500),
	age_recommende VARCHAR(50),
	CONSTRAINT pk_application_produit PRIMARY KEY(id_application)
);

create table Entrepot(
	id_entrepot int,
	nom VARCHAR(30),
	gerant VARCHAR(30),
	longueur REAL,
	largeur REAL,
	perimetre REAL,
	surface REAL,
	adresse VARCHAR(250),
	materiel VARCHAR(250),
	constraint pk_entrepot primary key(id_entrepot));

CREATE TABLE Conditionnement(
	id_conditionnement INT,
	temperature REAL,
	humidite REAL,
	pression REAL,
	validite REAL,
	type_cond VARCHAR(30),
	UVC VARCHAR(30),
	visibilite VARCHAR(30),
	emballage VARCHAR(30),
	CONSTRAINT pk_conditionnement PRIMARY KEY(id_conditionnement)
);

CREATE TABLE Type_stocks(
	id_type_stock INT,
	type_stock VARCHAR(50),
	enjeux VARCHAR(500),
	objectif VARCHAR(500),
	CONSTRAINT pk_type_stock PRIMARY KEY(id_type_stock)
);

create table Production(
	id_produit int,
	id_type int,
	id_forme_produit int,
	id_application int,
	date_debut int,
	date_fin int,
	lieu_depart int,
	lieu_arrive int,
	type_operation VARCHAR(30),
	cout_fabrication REAL,
	quantite int,
	constraint fk_production_Produit FOREIGN KEY (id_produit) REFERENCES Produit(id),
	constraint fk_production_Type FOREIGN KEY (id_type) REFERENCES Type_Produit (id_type),
	constraint fk_production_forme FOREIGN KEY (id_forme_produit) REFERENCES Forme_produits(id_forme_produit),
	constraint fk_production_application FOREIGN KEY(id_application) REFERENCES Application_produit(id_application),
	constraint fk_production_date1 FOREIGN KEY (date_debut) REFERENCES Dates(id_date),
	constraint fk_production_date2 FOREIGN KEY (date_fin) REFERENCES Dates(id_date),
	constraint fk_production_lieu1 FOREIGN KEY (lieu_depart) REFERENCES Lieu(id_lieu),
	constraint fk_production_lieu2 FOREIGN KEY (lieu_arrive) REFERENCES Lieu(id_lieu));

create table Stock(
	id_produit int,
	id_entrepot int,
	id_date int,
	id_conditionnement int,
	id_type_stock int,
	quantite int,
	quantite_sortie int,
	constraint fk_Stock_Produit FOREIGN KEY (id_produit) REFERENCES Produit(id),
	constraint fk_Stock_Entrepot FOREIGN KEY (id_entrepot) REFERENCES Entrepot(id_entrepot),
	constraint fk_Stock_Date FOREIGN KEY (id_date) REFERENCES Dates(id_date),
	constraint fk_Stock_Conditionnement FOREIGN KEY (id_conditionnement) REFERENCES Conditionnement(id_conditionnement),
	constraint fk_Stock_type FOREIGN KEY(id_type_stock) REFERENCES Type_stocks(id_type_stock)
	);
