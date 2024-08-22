CREATE MATERIALIZED VIEW IF NOT EXISTS ref_adresse.mvw_bal_parcelles
TABLESPACE pg_default
AS
 WITH explose_bal AS (
         SELECT DISTINCT bal.id AS id_bal,
            bal.uid_adresse,
            bal.cle_interop,
            bal.commune_insee,
            bal.commune_nom,
            bal.commune_deleguee_insee,
            bal.commune_deleguee_nom,
            bal.voie_nom,
            bal.lieudit_complement_nom,
            bal.numero,
            bal.suffixe,
            bal.cad_parcelles,
            bal.source,
            bal.date_der_maj,
            bal.certification_commune,
            bal.voie_nom_bre,
            bal.voie_nom_fra,
            unnest(string_to_array(bal.cad_parcelles::text, '|'::text)) AS parcelle,
            '#'::text || SUBSTRING(md5(bal.voie_nom::text) FROM 1 FOR 6) AS hex_color
           FROM ref_adresse.bal
          WHERE bal.numero <> 99999
        ), prepare_id_cadastre AS (
         SELECT explose_bal.id_bal,
            explose_bal.uid_adresse,
            explose_bal.cle_interop,
            explose_bal.commune_insee,
            explose_bal.commune_nom,
            explose_bal.commune_deleguee_insee,
            explose_bal.commune_deleguee_nom,
            explose_bal.voie_nom,
            explose_bal.lieudit_complement_nom,
            explose_bal.numero,
            explose_bal.suffixe,
            explose_bal.cad_parcelles,
            explose_bal.source,
            explose_bal.date_der_maj,
            explose_bal.certification_commune,
            explose_bal.voie_nom_bre,
            explose_bal.voie_nom_fra,
            explose_bal.parcelle,
            OVERLAY(explose_bal.parcelle PLACING '0'::text FROM 3 FOR 0) AS id_parcelle_cleaned,
            explose_bal.hex_color
           FROM explose_bal
        ), jointure_cadastre AS (
         SELECT prepare_id_cadastre.id_bal,
            prepare_id_cadastre.uid_adresse,
            prepare_id_cadastre.cle_interop,
            prepare_id_cadastre.commune_insee,
            prepare_id_cadastre.commune_nom,
            prepare_id_cadastre.commune_deleguee_insee,
            prepare_id_cadastre.commune_deleguee_nom,
            prepare_id_cadastre.voie_nom,
            prepare_id_cadastre.lieudit_complement_nom,
            prepare_id_cadastre.numero,
            prepare_id_cadastre.suffixe,
            prepare_id_cadastre.cad_parcelles,
            prepare_id_cadastre.source,
            prepare_id_cadastre.date_der_maj,
            prepare_id_cadastre.certification_commune,
            prepare_id_cadastre.voie_nom_bre,
            prepare_id_cadastre.voie_nom_fra,
            prepare_id_cadastre.parcelle,
            prepare_id_cadastre.id_parcelle_cleaned,
            cad.geom,
            prepare_id_cadastre.hex_color
           FROM prepare_id_cadastre
             LEFT JOIN ref_cadastre.geo_parcelle cad ON prepare_id_cadastre.id_parcelle_cleaned = cad.geo_parcelle
        ), regroup_parcelle AS (
         SELECT jointure_cadastre.id_bal,
            jointure_cadastre.uid_adresse,
            jointure_cadastre.cle_interop,
            jointure_cadastre.commune_insee,
            jointure_cadastre.commune_nom,
            jointure_cadastre.commune_deleguee_insee,
            jointure_cadastre.commune_deleguee_nom,
            jointure_cadastre.voie_nom,
            jointure_cadastre.lieudit_complement_nom,
            jointure_cadastre.numero,
            jointure_cadastre.suffixe,
            jointure_cadastre.cad_parcelles,
            jointure_cadastre.source,
            jointure_cadastre.date_der_maj,
            jointure_cadastre.certification_commune,
            jointure_cadastre.voie_nom_bre,
            jointure_cadastre.voie_nom_fra,
            st_union(jointure_cadastre.geom) AS geom,
            jointure_cadastre.hex_color
           FROM jointure_cadastre
          GROUP BY jointure_cadastre.id_bal, jointure_cadastre.uid_adresse, jointure_cadastre.cle_interop, jointure_cadastre.commune_insee, jointure_cadastre.commune_nom, jointure_cadastre.commune_deleguee_insee, jointure_cadastre.commune_deleguee_nom, jointure_cadastre.voie_nom, jointure_cadastre.lieudit_complement_nom, jointure_cadastre.numero, jointure_cadastre.suffixe, jointure_cadastre.cad_parcelles, jointure_cadastre.source, jointure_cadastre.date_der_maj, jointure_cadastre.certification_commune, jointure_cadastre.voie_nom_bre, jointure_cadastre.voie_nom_fra, jointure_cadastre.hex_color
        )
 SELECT row_number() OVER () AS id_bal_cad,
    regroup_parcelle.id_bal,
    regroup_parcelle.uid_adresse,
    regroup_parcelle.cle_interop,
    regroup_parcelle.commune_insee,
    regroup_parcelle.commune_nom,
    regroup_parcelle.commune_deleguee_insee,
    regroup_parcelle.commune_deleguee_nom,
    regroup_parcelle.voie_nom,
    regroup_parcelle.lieudit_complement_nom,
    regroup_parcelle.numero,
    regroup_parcelle.suffixe,
    regroup_parcelle.cad_parcelles,
    regroup_parcelle.source,
    regroup_parcelle.date_der_maj,
    regroup_parcelle.certification_commune,
    regroup_parcelle.voie_nom_bre,
    regroup_parcelle.voie_nom_fra,
    regroup_parcelle.geom,
    regroup_parcelle.hex_color
   FROM regroup_parcelle ;
   
REFRESH MATERIALIZED VIEW ref_adresse.mvw_bal_parcelles;