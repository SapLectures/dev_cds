@AbapCatalog.sqlViewName: 'ZHYILDIZ_2943_V1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Eğitim Örnek'
define view ZHYILDIZ_2943_CDS_001 as select from ekko 
   inner join       ekpo on   ekpo.ebeln = ekko.ebeln  
   left outer join  mara on   mara.matnr = ekpo.matnr
   left outer join  makt on ( makt.matnr = mara.matnr 
                        and   makt.spras = $session.system_language )
   right outer join lfa1 on   lfa1.lifnr = ekko.lifnr
{
    key ekpo.ebeln as PurchaseOrder,
    key ekpo.ebelp as ItemNo,
    ekpo.matnr as MaterialNo,
    makt.maktx as Description,
    ekpo.werks as Plant,
    ekpo.lgort as StorageLoc,
    @Semantics.unitOfMeasure: true
    ekpo.meins as UOM,
    lfa1.lifnr as Vendor,
    lfa1.name1 as Name,
    concat_with_space(lfa1.stras, lfa1.mcod3, 2) as VendorAddress
}
