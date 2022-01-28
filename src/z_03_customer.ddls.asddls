@AbapCatalog.sqlViewName: 'Z03CUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CustomerView'
define view Z_03_Customer as select from scustom 
association[1] to Z02_Bookings as _Bookings on _Bookings.Customid = scustom.id
{
    key id as Id,    
    name as Name,
    form as Form,
    street as Street,   
    postcode as Postcode,
    city as City,
    country as Country,
    _Bookings
  
}
