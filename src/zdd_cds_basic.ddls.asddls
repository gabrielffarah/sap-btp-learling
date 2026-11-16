@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Basica de Treinamento'
@Metadata.ignorePropagatedAnnotations: true  
define view entity ZDD_CDS_BASIC 
  as select from /dmo/agency
{
  key agency_id as AgencyId,
      name      as Name,
      city      as City,
      country_code as CountryCode
}
