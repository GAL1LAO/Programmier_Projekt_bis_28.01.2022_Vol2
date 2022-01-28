@AbapCatalog.sqlViewName: 'Z03LSTMIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'LastminuteTest'
define view z_03_lastminute  
with parameters  p_input : s_f_cur_pr,
                 p_lastminute: int4 
 as select from sbook
association [0..*] to sflights as _Flights on _Flights.carrid = sbook.carrid
and _Flights.connid = sbook.connid
association [0..1] to scustom as _Customer on _Customer.id = sbook.customid

{
  
  key carrid     as CarrierId,
  key connid     as ConnectionId,
  key fldate     as FlightDate,
  key bookid     as Bookingnumber,
      customid   as CustomerId,
      luggweight as LuggageWeight,
      wunit      as LuggageWeightUnit,
      class      as FlightClass,
      forcuram,
      forcurkey  as CurrencyCode,
      order_date as OrderDate,
      agencynum  as AgencyNumber,
      counter    as CounterId,  
      _Flights.cityto,
      _Flights.countryto,  
      _Flights.cityfrom,     
      _Flights,    
      _Customer.name,
      _Customer
      
               
}
where     
  fldate <= dats_add_days(cast($session.system_date as s_date),+ $parameters.p_lastminute, 'NULL')      and   // Last minute definiere?   
  fldate > $session.system_date and
 forcuram < $parameters.p_input
    
