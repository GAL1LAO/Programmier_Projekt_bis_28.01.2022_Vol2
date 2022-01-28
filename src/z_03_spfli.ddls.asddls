@AbapCatalog.sqlViewName: 'Z03SPFLI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flugländer u.s.w'
define view z_03_spfli as select from spfli
association[1] to z03_main_view as _Flights on _Flights.Carrid = spfli.carrid and _Flights.Connid = spfli.connid

{
    key carrid as Carrid,
    key connid as Connid,
    countryfr as Countryfr,
    cityfrom as Cityfrom,
    airpfrom as Airpfrom,
    countryto as Countryto,
    cityto as Cityto,
    airpto as Airpto,
    fltime as Fltime,
    deptime as Deptime,
    arrtime as Arrtime,
    distance as Distance,
    distid as Distid,
    fltype as Fltype,
    period as Period,
    _Flights
}
