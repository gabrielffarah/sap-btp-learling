@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS com association'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDD_CDS_ASSOCIATION 
as select from /dmo/customer as _Customer
  association [0..*] to /dmo/travel as _Travel 
    on _Customer.customer_id = _Travel.customer_id
{
// Chaves da entidade (Cliente + Viagem)
  key _Customer.customer_id,
  key _Travel.travel_id,
  
      // Campos do Cliente
      _Customer.first_name,
      _Customer.last_name,
      _Customer.city,
      
      // Campos da Viagem acessados via Association (Path Expression)
      _Travel.agency_id,
      _Travel.begin_date,
      _Travel.end_date,
      
      @Semantics.amount.currencyCode: 'currency_code'
      _Travel.booking_fee,
      
      @Semantics.amount.currencyCode: 'currency_code'
      _Travel.total_price,
      
      _Travel.currency_code,
      _Travel.status,
      
      _Travel
    
}
