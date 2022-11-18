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
EXECUTE IMMEDIATE 'DROP TABLE Prestataire';
EXCEPTION
	WHEN OTHERS THEN
		IF SQLCODE != -942 THEN
		RAISE;
		END IF;
	END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Time_';
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
EXECUTE IMMEDIATE 'DROP TABLE Date_';
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


create table Produit(
	id int,
	idProduit VARCHAR(30) NOT NULL, 
	nomproduit VARCHAR(30) NOT NULL,
	denominatin VARCHAR(30),
	gamme_produit VARCHAR(30) NOT NULL,
	prix REAL NOT NULL,
	poidsTotal REAL,
	volume REAL,
	longueur REAL,
	largeur REAL,
	hauteur REAL,
	constraint pk_produit primary key(id),
	CONSTRAINT chk_Produit_Gamme CHECK gamme_produit IN ('medicaments', 'dispositif medicaux'));

create table Prestataire(
	id_prestataire int
	K_bis BOOLEAN,
	nom VARCHAR(30) NOT NULL,
	localisation VARCHAR(30),
	type_prestataire VARCHAR(30) NOT NULL,
	fonction VARCHAR(30) NOT NULL,
	type VARCHAR(30),
	nomResponsableVARCHAR(30),
	telephone VARCHAR(30) NOT NULL,
	email VARCHAR(30),
	prix REAL,
	constraint pk_prestataire primary key(id_prestataire));

create table Time_(
	id_time int,
	time_ time,
	time_description VARCHAR(30),
	seconde int,
	minute int,
	heure int
	constraint pk_time_ primary key(id_time));

create table Lieu(
	id_lieu int,
	nom_lieu VARCHAR(30)
	type_lieu VARCHAR(30)
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

create table Date_(
	id_date int
	date_ DATE
	date_description VARCHAR(30),
	numero_trimestre int,
	numero_semaine int,
	numero_jour_semaine int,
	numero_jour_mois int,
	numero_jour_annee int,
	nom_mois int,
	numero_mois int,
	annee int,
	constraint pk_date_ primary key(id_date));

create table Entrepot(
	id_entrepot int,
	nom VARCHAR(30),
	gerant VARCHAR(30),
	longueur REAL,
	largeur REAL,
	perimetre REAL,
	surface REAL,
	type_produit VARCHAR(30),
	adresse VARCHAR(250),
	materiel VARCHAR(250),
	constraint pk_entrepot primary key(id_entrepot));

create table Production(
	id_produit int,
	id_prestataire int,
	id_time int,
	date_debut int,
	date_fin int,
	lieu_depart int,
	lieu_arrive int,
	type_operation VARCHAR(30),
	cout_fabrication REAL,
	quantite int,
	constraint fk_production_Produit FOREIGN KEY (id_produit) REFERENCES Produit(id),
	constraint fk_production_Prestataire FOREIGN KEY (id_prestataire) REFERENCES Prestataire(id_prestataire),
	constraint fk_production_time FOREIGN KEY (id_time) REFERENCES Time_(id_time),
	constraint fk_production_date1 FOREIGN KEY (date_debut) REFERENCES Date_(id_date),
	constraint fk_production_date2 FOREIGN KEY (date_fin) REFERENCES Date_(id_date),
	constraint fk_production_lieu1 FOREIGN KEY (lieu_depart) REFERENCES Lieu(id_lieu),
	constraint fk_production_lieu2 FOREIGN KEY (lieu_arrive) REFERENCES Lieu(id_lieu));

create table Stock(
	id_produit int,
	id_entrepot int,
	id_date int,
	quantite int,
	quantite_sortie int,
	constraint fk_Stock_Produit FOREIGN KEY (id_produit) REFERENCES Produit(id),
	constraint fk_Stock_Entrepot FOREIGN KEY (id_produit) REFERENCES Produit(id),
	constraint fk_Stock_Date FOREIGN KEY (id_date) REFERENCES Date_(id_date));