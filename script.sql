CREATE DATABASE IF NOT EXISTS kda_workshop CHARACTER SET utf8;
USE kda_workshop;

CREATE TABLE IF NOT EXISTS apprenants(
    id_apprenant INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom_apprenant VARCHAR(50) NOT NULL,
    email_apprenant VARCHAR(255),
    PRIMARY KEY (id_apprenant)
);
CREATE TABLE IF NOT EXISTS projets(
    id_projet INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom_projet VARCHAR(255) NOT NULL,
    description_projet VARCHAR(255),
    PRIMARY KEY (id_projet)
);
CREATE TABLE IF NOT EXISTS realisations(
    id_realisation INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_projet INT UNSIGNED NOT NULL,
    id_apprenant INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_realisation),
    CONSTRAINT fk_projet FOREIGN KEY (id_projet) 
        REFERENCES projets (id_projet)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_apprenant FOREIGN KEY (id_apprenant) 
        REFERENCES apprenants (id_apprenant)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE USER IF NOT EXISTS 'rkota'@'localhost' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON kda_workshop.* TO 'rkota'@'localhost';