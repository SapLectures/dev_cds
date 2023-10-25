@AbapCatalog.sqlViewName: 'ZHYILDIZ_2943_V1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Eğitim Örnek'
define view ZHYILDIZ_2943_CDS_001 as select from mara 
    left outer join makt on makt.matnr = mara.matnr
{
    mara.matnr,
    makt.maktx
}
