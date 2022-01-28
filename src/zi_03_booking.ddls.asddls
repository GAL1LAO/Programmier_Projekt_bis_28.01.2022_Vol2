@AbapCatalog.sqlViewName: 'ZI00BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking'

define view ZI_00_Booking
  as select from sbook  
  association [1] to ZI_00_CustomerWithBookings2 as _CustWBooks on _CustWBooks.CustomerId = sbook.customid 
  {
  key carrid     as CarrierId,
  key connid     as ConnectionId,
  key fldate     as FlightDate,
  key bookid     as Bookingnumber,
      customid   as CustomerId,
      luggweight as LuggageWeight,
      wunit      as LuggageWeightUnit,
      class      as FlightClass,
      forcuram   as Amount,
      forcurkey  as CurrencyCode,
      order_date as OrderDate,
      agencynum  as AgencyNumber,
      counter    as CounterId,
      _CustWBooks
             
}


 
  

