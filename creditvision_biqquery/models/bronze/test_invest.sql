{{ config(
    materialized='table',
    cluster_by=['fiscal_code']
) }}

SELECT
  FiscalCode AS fiscal_code,
  COALESCE(Name, 'N/A') AS name,
  COALESCE(Gender, 'N/A') AS gender,
  COALESCE(DateOfBirth, 'N/A') AS dob,
  COALESCE(PlaceOfBirth, 'N/A') AS pob,
  Id AS investigation_id,
  `_airbyte_extracted_at` AS extracted_at
FROM `creditvision-lakehouse-as-1.dev__cv__raw_area__1.cadastral_InvestigationFCInfos`
WHERE FiscalCode IS NOT NULL
