CREATE MATERIALIZED VIEW IF NOT EXISTS ref_adresse.mvw_bal_localisation
TABLESPACE pg_default
AS
 WITH bal_priorise AS (
         SELECT row_number() OVER () AS id,
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
            bal."position",
            bal.geometry,
            concat_ws(' '::text, bal.numero::text, bal.suffixe, bal.voie_nom, bal.lieudit_complement_nom, cp.code_postal::text, bal.commune_nom) AS adresse_complete,
            '#'::text || SUBSTRING(md5(bal.voie_nom::text) FROM 1 FOR 6) AS hex_color,
            row_number() OVER (PARTITION BY bal.* ORDER BY (
                CASE bal."position"
                    WHEN 'entrée'::text THEN 1
                    WHEN 'bâtiment'::text THEN 2
                    WHEN 'logement'::text THEN 3
                    WHEN 'cage d’escalier'::text THEN 4
                    WHEN 'segment'::text THEN 5
                    WHEN 'parcelle'::text THEN 6
                    WHEN 'délivrance postale'::text THEN 7
                    ELSE 8
                END)) AS priorite,
            cp.code_postal
           FROM ref_adresse.bal
             JOIN ref_limites_administratives.cp_commune cp ON cp.code_insee = bal.commune_insee::double precision
        )
 SELECT bal_priorise.id,
    bal_priorise.uid_adresse,
    bal_priorise.cle_interop,
    bal_priorise.commune_insee,
    bal_priorise.commune_nom,
    bal_priorise.commune_deleguee_insee,
    bal_priorise.commune_deleguee_nom,
    bal_priorise.voie_nom,
    bal_priorise.lieudit_complement_nom,
    bal_priorise.numero,
    bal_priorise.suffixe,
    bal_priorise.cad_parcelles,
    bal_priorise.source,
    bal_priorise.date_der_maj,
    bal_priorise.certification_commune,
    bal_priorise.voie_nom_bre,
    bal_priorise.voie_nom_fra,
    bal_priorise."position",
    bal_priorise.geometry,
    bal_priorise.adresse_complete,
    bal_priorise.hex_color,
    bal_priorise.priorite,
    bal_priorise.code_postal
   FROM bal_priorise
  WHERE bal_priorise.priorite = 1 ;
  
  
REFRESH MATERIALIZED VIEW ref_adresse.mvw_bal_localisation;