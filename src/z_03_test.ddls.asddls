@AbapCatalog.sqlViewName: 'ZG03TEST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Association sFlight and Bookings'
@OData.publish:true


define view Z_03_test as select from sflights
association [0..*] to sbook  
on sflights.carrid = sbook.carrid and sflights.connid = sbook.connid and sflights.fldate = sbook.fldate 
association [0..*] to ZC_00_CustomerWithBookings on ZC_00_CustomerWithBookings.FlightDate = sflights.fldate

{ 
    @UI.lineItem: [{position: 10, importance: #HIGH }]
    @UI.identification: [{ position: 20 }]
    @UI.dataPoint.title: 'CarrID'
    key sflights.carrid as carrierid,
     @UI.lineItem: [{position: 20, importance: #HIGH }]
   
    key sflights.carrname as carriername,
     @UI.lineItem: [{position: 30, importance: #HIGH }]
    
    key sflights.connid as connectionid,
     @UI.identification: [{ position: 50 }]
    @UI.dataPoint.title: 'Country from'
    key sflights.countryfr as countryfrom,
     @UI.identification: [{ position: 60 }]
    @UI.dataPoint.title: 'Country to'
    key sflights.countryto as countryto,
     @UI.lineItem: [{position: 50, importance: #HIGH }]
     @UI.identification: [{ position: 70 }]
    @UI.dataPoint.title: 'City from'
    key sflights.cityfrom as cityfrom,
     @UI.lineItem: [{position: 60, importance: #HIGH }]
     @UI.identification: [{ position: 80 }]
    @UI.dataPoint.title: 'City to'
    key sflights.cityto as cityto, 
    @UI.identification: [{ position: 30 }]
    @UI.dataPoint.title: 'Airport from'
    key sflights.airpfrom as airportfrom,
     @UI.identification: [{ position: 40 }]
    @UI.dataPoint.title: 'Airport to'
    key sflights.airpto as airportto,
     @UI.lineItem: [{position: 40, importance: #HIGH }]
     @UI.identification: [{ position: 90 }]
    @UI.dataPoint.title: 'Flightdate'
    key sflights.fldate as flightdate,
      @UI.identification: [{ position: 100 }]
    @UI.dataPoint.title: 'Available seats' 
    key (sflights.seatsmax-sflights.seatsocc) as seatavailable ,
    //key(sflights.seatsmax)/(seatavailable),
    @UI.lineItem: [{position: 70, importance: #HIGH }]
    @EndUserText.label: 'Utilization Rate in %'
    division(sflights.seatsocc, sflights.seatsmax, 2) as utiliza,
        sflights.seatsmax as seatsmaximum,
        sflights.seatsocc as seatsoccupied,

      
         @UI.facet: [
  { position: 10, type: #IDENTIFICATION_REFERENCE, label: 'General Information' },
  { position: 20, type: #LINEITEM_REFERENCE, label: 'Bookings', targetElement: 'sbook' }
  ]
  
  @UI: { 
    lineItem: [{ position: 10 }],
    identification: [{ position: 10 }]
  }
  carrid,
  
  @UI: { 
    lineItem: [{ position: 20 }],
    identification: [{ position: 20 }]
  }
  connid,
  
  @UI: { 
    lineItem: [{ position: 30 }],
    identification: [{ position: 30 }]
  }
  fldate,
  
  /*@UI: { 
    lineItem: [{ position: 40 }],
    identification: [{ position: 40 }]
  }
  PriceInEUR,
  
  
  @UI: { 
    identification: [{ position: 50 }]
  }
  Planetype,*/
  
  @UI: { 
    identification: [{ position: 60 }]
  }
  seatsmax,
  
  @UI: { 
    identification: [{ position: 70 }]
  }
  seatsocc,
  
  @UI: { 
    identification: [{ position: 80 }]
  }
  /*Paymentsum,
  
  @UI: { 
    identification: [{ position: 90 }]
  }
  SeatsmaxB,
  
  @UI: { 
    identification: [{ position: 100 }]
  }
  SeatsoccB,
  
  @UI: { 
    identification: [{ position: 110 }]
  }
  SeatsmaxF,
  
  @UI: { 
    identification: [{ position: 120 }]
  }
  SeatsoccF,
 
  @UI: { 
    identification: [{ position: 130 }]
  }
  Countryfr,
  
  @UI: { 
    identification: [{ position: 140 }]
  }
  Cityfrom,
  
  @UI: {
    lineItem: [{ position: 50 }], 
    identification: [{ position: 150 }]
  } 
  Airpfrom,
  
  @UI: { 
    identification: [{ position: 160 }]
  }
  Countryto,
  
  @UI: { 
    identification: [{ position: 170 }]
  } 
  Cityto,
  
  @UI: { 
    lineItem: [{ position: 60 }],
    identification: [{ position: 180 }]
  } */
  airpto,
  
  @UI: { 
    identification: [{ position: 190 }]
  }
  /* Deptime,
  
  @UI: { 
    identification: [{ position: 200 }]
  }
  Arrtime,
  
  @UI: { 
    identification: [{ position: 210 }]
  }
  Fltype,
  
  @UI: { 
    identification: [{ position: 220 }]
  }
  Period,
  @UI: { 
    lineItem: [{ position: 90 }],
    identification: [{ position: 230 }]
  }
  Percentage,
  
  @UI: { 
    lineItem: [{ position: 70 }],
    identification: [{ position: 240 }]
  }
  FlightTotalSeats,
  
  @UI: { 
    lineItem: [{ position: 90 }],
    identification: [{ position: 250 }]
  }
  FlightTotalOccSeats, */
        

     ZC_00_CustomerWithBookings.CustomerName as CustomerName,
     ZC_00_CustomerWithBookings.CustomerId as CustomerID,
     ZC_00_CustomerWithBookings.CustomerStreet as CustomerStreet,
     ZC_00_CustomerWithBookings.CustomerPostcode as CustomerPostcode,
     ZC_00_CustomerWithBookings.CustomerCity as CustomerCity,
     ZC_00_CustomerWithBookings.CustomerCountry as CustomerCountry,
     ZC_00_CustomerWithBookings.CustomerDiscount as CustomerDiscount,
          @UI.lineItem: [{position: 90, importance: #HIGH }]
     
     ZC_00_CustomerWithBookings.LuggageWeight as LuggageWeight,
     ZC_00_CustomerWithBookings.LuggageWeightUnit as LuggageUnit,
     
     ZC_00_CustomerWithBookings.FlightClass as FlightClass,
     
     ZC_00_CustomerWithBookings.Amount as Amount,
     ZC_00_CustomerWithBookings.CurrencyCode as CurrencyCode,
     
     ZC_00_CustomerWithBookings.CounterId as CounterID,
    
     ZC_00_CustomerWithBookings.Bookingnumber as BookingNumber,
     
       
        
        sbook as book,
        
        ZC_00_CustomerWithBookings as CustWBooks
    
   }    

where 

sflights.fldate > $session.system_date
