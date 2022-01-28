@AbapCatalog.sqlViewName: 'Z03MAINVIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Main View (Flight)'
@OData.publish: true

define view z03_main_view as select from sflight

//inner join spfli as Connection on sflight.connid = Connection.connid
//and sflight.carrid = Connection.carrid

association[*] to Z02_Bookings as _Bookings on _Bookings.Carrid = sflight.carrid 
and _Bookings.Connid = sflight.connid 
and _Bookings.Fldate = sflight.fldate 
association[*] to z_03_spfli as _SPFLI on _SPFLI.Carrid = sflight.carrid and _SPFLI.Connid = sflight.connid
association[1..1] to Z_03_CARR as _CARR on _CARR.Carrid = sflight.carrid

 {
 
      @UI.facet: [
  { position: 10, type: #IDENTIFICATION_REFERENCE, label: 'General Information' },
  { position: 20, type: #LINEITEM_REFERENCE, label: 'Bookings', targetElement: '_Bookings' }
  ]
  
     @UI.lineItem: [{position: 10, importance: #HIGH }]
    
    @UI.dataPoint.title: 'CarrID'
    key carrid as Carrid,
    
      @UI.lineItem: [{position: 20, importance: #HIGH }]
    key connid as Connid,
    
     @UI.lineItem: [{position: 30, importance: #HIGH }]
      @UI.identification: [{ position: 30 }]
    @UI.dataPoint.title: 'FlightDate'
    key fldate as Fldate,
        
  //   @UI.lineItem: [{position: 40, importance: #HIGH }]
     @Semantics.amount.currencyCode: 'Currency'
     
    price as Price,
    
  //  @UI.lineItem: [{position: 50, importance: #HIGH }]
     
    currency as Currency,
    
      @UI.lineItem: [{position: 50, importance: #HIGH }]  
  //  @Semantics.amount.currencyCode: 'Currency'
      @EndUserText.quickInfo: 'Price in Euro'
      @UI.dataPoint.title: 'Price in Euro' 
      @EndUserText.label: 'Price in Euro'
    //  @ObjectModel.readOnly: true
      currency_conversion( amount => price,
                    source_currency => currency,
                    target_currency => cast('EUR' as abap.cuky),
                    exchange_rate_date => fldate )                            as PriceInEUR,
    
    @UI.identification: [{ position: 40 }]
    planetype as Planetype,
    
     @UI.identification: [{ position: 60 }]
    seatsmax as Seatsmax,
    
     @UI.identification: [{ position: 70 }]
    seatsocc as Seatsocc,
    
     @UI.identification: [{ position: 80 }]
    paymentsum as Paymentsum,
    
     @UI.identification: [{ position: 90 }]
    seatsmax_b as Seatsmax_B,
    
     @UI.identification: [{ position: 100 }]
    seatsocc_b as Seatsocc_B,
    
     @UI.identification: [{ position: 110 }]
    seatsmax_f as Seatsmax_F,
    
     @UI.identification: [{ position: 120 }]
    seatsocc_f as Seatsocc_F,
    
  //  @UI.identification: [{ position: 50 }]
    @UI.dataPoint.title: 'Available seats' 
    (seatsmax-seatsocc) as seatavailable ,
    //key(sflights.seatsmax)/(seatavailable),
    @UI.lineItem: [{position: 90, importance: #HIGH }]
    @EndUserText.label: 'Utilization Rate in %'
    division(seatsocc, seatsmax, 2) * 100 as utiliza,
        seatsmax as seatsmaximum,
        seatsocc as seatsoccupied,
         
     @UI.lineItem: [{position: 60, importance: #HIGH }]
      @UI.identification: [{ position: 130 }]
    _SPFLI.Cityfrom,
    
     @UI.lineItem: [{position: 70, importance: #HIGH }]
      @UI.identification: [{ position: 140 }]
    _SPFLI.Cityto,  
    
     @UI.identification: [{ position: 150 }]   
    _SPFLI.Countryfr,
    
     @UI.identification: [{ position: 160 }]
     @UI.dataPoint.title: 'Airport from'
    _SPFLI.Airpfrom,
    
     @UI.identification: [{ position: 170 }]     
    _SPFLI.Countryto,
    
     @UI.identification: [{ position: 180 }]
     @UI.dataPoint.title: 'Airport to'
    _SPFLI.Airpto,
    
     @UI.identification: [{ position: 190 }]
     @UI.dataPoint.title: 'Departure time'
    _SPFLI.Deptime,
    
     @UI.identification: [{ position: 200 }]
     @UI.dataPoint.title: 'Arrival time'   
    _SPFLI.Arrtime,
    
     @UI.identification: [{ position: 210 }]
    _SPFLI.Distance,
    
    @UI.identification: [{ position: 20 }]    
    _CARR.Carrname as CarrierName,
    
    _SPFLI,
    _Bookings,
    _CARR
 
}
where 

sflight.fldate > $session.system_date
