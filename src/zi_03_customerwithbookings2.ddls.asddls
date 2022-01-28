@AbapCatalog.sqlViewName: 'ZI00CUSTWBOOK2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer with Bookings'
define view ZI_00_CustomerWithBookings2
  as select from scustom as Customer
  association [0..*] to ZI_00_Booking as _Bookings on Customer.id = _Bookings.CustomerId                                                
{
  key Customer.id                                          as CustomerId,
      concat_with_space(Customer.form,Customer.name,1)     as CustomerName,
      Customer.street                                      as CustomerStreet,
      Customer.postcode                                    as CustomerPostcode,
      Customer.city                                        as CustomerCity,
      Customer.country                                     as CustomerCountry,
      @EndUserText.label: 'Customer Discount'
      @EndUserText.quickInfo: 'Customer Discount'
      division(cast(Customer.discount as abap.int4),100,2) as CustomerDiscount,
      _Bookings.Bookingnumber,
      _Bookings      
}


