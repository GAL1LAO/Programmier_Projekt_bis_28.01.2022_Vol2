@AbapCatalog.sqlViewName: 'Z03SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SCAARR VIEW'
define view Z_03_CARR as select from scarr 
association[1] to z03_main_view as _FLIGHT on _FLIGHT.Carrid = scarr.carrid

{
    key carrid as Carrid,
    carrname as Carrname   
   
}
