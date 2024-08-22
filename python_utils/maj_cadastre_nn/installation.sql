-- Script SQL à éxecuter lors de la première utilisation de l'utilitaire maj_cadastre_nn


-- Création du schéma si n'existe pas
CREATE SCHEMA IF NOT EXISTS ref_cadastre_nn ;

COMMENT ON SCHEMA ref_cadastre_nn
    IS 'Stocke les informations du cadastre non nominatives les plus à jour.
Mises à jour trimestrielles';

-- SEQUENCE: ref_cadastre_nn.date_maj_id_seq

CREATE SEQUENCE IF NOT EXISTS ref_cadastre_nn.date_maj_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

-- Création de la table date_maj
CREATE TABLE IF NOT EXISTS ref_cadastre_nn.date_maj
(
    id integer NOT NULL DEFAULT nextval('ref_cadastre_nn.date_maj_id_seq'::regclass),
    last_date_maj date
);

-- séquence de la table parcelles 
CREATE SEQUENCE IF NOT EXISTS ref_cadastre_nn.parcelles_id_auto_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

-- Création de la table parcelles
CREATE TABLE IF NOT EXISTS ref_cadastre_nn.parcelles
(
    id text COLLATE pg_catalog."default",
    commune text COLLATE pg_catalog."default",
    prefixe text COLLATE pg_catalog."default",
    section text COLLATE pg_catalog."default",
    numero text COLLATE pg_catalog."default",
    contenance double precision,
    arpente boolean,
    created text COLLATE pg_catalog."default",
    updated text COLLATE pg_catalog."default",
    geometry geometry(Geometry,2154),
    id_auto integer NOT NULL DEFAULT nextval('ref_cadastre_nn.parcelles_id_auto_seq'::regclass)
);

-- SEQUENCE: ref_cadastre_nn.batiments_id_seq

CREATE SEQUENCE IF NOT EXISTS ref_cadastre_nn.batiments_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;


-- Création de la table batiments
CREATE TABLE IF NOT EXISTS ref_cadastre_nn.batiments
(
    type text COLLATE pg_catalog."default",
    nom text COLLATE pg_catalog."default",
    commune text COLLATE pg_catalog."default",
    created text COLLATE pg_catalog."default",
    updated text COLLATE pg_catalog."default",
    geometry geometry(MultiPolygon,2154),
    id integer NOT NULL DEFAULT nextval('ref_cadastre_nn.batiments_id_seq'::regclass)
) ;

-- View: ref_cadastre_nn.mvw_parcelles

CREATE MATERIALIZED VIEW IF NOT EXISTS ref_cadastre_nn.mvw_parcelles
TABLESPACE pg_default
AS
 SELECT parcelles.id,
    parcelles.commune,
    parcelles.prefixe,
    parcelles.section,
    parcelles.numero,
    parcelles.contenance,
    parcelles.arpente,
    parcelles.created,
    parcelles.updated,
    parcelles.geometry,
    parcelles.id_auto
   FROM ref_cadastre_nn.parcelles
   ;

-- View: ref_cadastre_nn.mvw_batiments
CREATE MATERIALIZED VIEW IF NOT EXISTS ref_cadastre_nn.mvw_batiments
TABLESPACE pg_default
AS
 SELECT row_number() OVER () AS id_auto,
    batiments.type,
    batiments.nom,
    batiments.commune,
    batiments.created,
    batiments.updated,
    batiments.geometry,
    batiments.id
   FROM ref_cadastre_nn.batiments
;