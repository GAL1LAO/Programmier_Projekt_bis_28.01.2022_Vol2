@AbapCatalog.sqlViewName: 'ZC03CUSTWBOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer with Bookings'
@OData.publish:true
define view ZC_00_CustomerWithBookings    
   as select from ZI_00_CustomerWithBookings2
{
     @ObjectModel.foreignKey.association: '_Airline'
      @UI: { lineItem: [{ position: 10 } ,
                        { type: #FOR_ACTION, invocationGrouping: #CHANGE_SET, position: 0, dataAction: 'MPC_EXT:CancelFlight',  label: 'Cancel Flight' },
                        { type: #FOR_ACTION, invocationGrouping: #CHANGE_SET, position: 1, dataAction: 'MPC_EXT:KeepFlight'  ,  label: 'Keep Flight' }] ,
             selectionField: [{ position: 10 }]}    
  key ZI_00_CustomerWithBookings2.Bookingnumber ,     
  key _Bookings.ConnectionId ,   
  key _Bookings.FlightDate,
 // key _Bookings.Bookingnumber,
      CustomerId,
     @UI.lineItem: [{position: 10, importance: #HIGH }]
     @EndUserText.label: 'Customer Name'
      CustomerName,
      CustomerStreet,
      CustomerPostcode,
      CustomerCity,
      CustomerCountry,
      CustomerDiscount,       
      _Bookings.LuggageWeight,
      _Bookings.LuggageWeightUnit,
      _Bookings.FlightClass,
      _Bookings.Amount,
      _Bookings.CurrencyCode,
      _Bookings.OrderDate,
      _Bookings.AgencyNumber,
      _Bookings.CounterId,
      _Bookings.CarrierId
             
     
   }
    where
   ZI_00_CustomerWithBookings2.Bookingnumber  <> '00000000'
