@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDs com session'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZDD_CDS_SESSION 
  with parameters 
    p_carrier : /dmo/carrier_id
    
  as select from /dmo/flight 
{
    
    key carrier_id as Companhia,
    key connection_id as Conexao,
    flight_date as Data_Voo,
    
    case carrier_id
      when 'SQ' then 'Singapore Airlines'
      else 'Outra Companhia'
    end as Descricao_Companhia,
    
    $session.system_date as Data_Sistema,
    $session.user as Utilizador
    
}
where carrier_id = $parameters.p_carrier
