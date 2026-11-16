@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CD exemplo'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZDD_CDS_EXEMPLO 
  as select from /dmo/travel as Travel
  left outer join /dmo/agency as Agency
    on Travel.agency_id = Agency.agency_id
{
  key Travel.agency_id       as AgencyId,
      Agency.name            as AgencyName,
      Travel.currency_code   as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum( Travel.total_price ) as TotalPriceSum,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      min( Travel.total_price ) as MinPrice,
      count(*)                  as TotalTrips
}
group by
  Travel.agency_id,
  Agency.name,
  Travel.currency_code
having
  Travel.currency_code = 'USD'
  and sum( Travel.total_price ) > 1000
