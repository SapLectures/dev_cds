@AbapCatalog.sqlViewName: 'ZHYILDIZ_2943_V3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ÖDEV - 2 CDS - 2'
define view ZHYILDIZ_2943_CDS_003
  as select from ZHYILDIZ_2943_CDS_002 as _items
{
  _items.FaturaBelgesi                                                                                as FaturaBelgesi,


  sum(_items.Conversion_Netwr)                                                                        as ToplamNetDeger,

  _items.MusteriAd                                                                                    as MusteriAdSoyad,

  @Aggregation.referenceElement: ['FaturaAdedi']
  count(distinct _items.FaturaBelgesi)                                                                as FaturaAdedi,

  cast(sum(_items.Conversion_Netwr) as float) / cast( count(distinct _items.FaturaBelgesi) as float )  as OrtalamaMiktar,

  cast(substring(_items.fkdat,1,4) as abap.numc(4))                                                    as FaturalamaYili,

  cast(substring(_items.fkdat,4,2) as abap.numc(2))                                                    as FaturalamaAyi,

  cast(substring(_items.fkdat,6,2) as abap.numc(2))                                                    as FaturalamaGunu,

  substring(_items.inco2_l, 1, 3)                                                                      as IncotermYeri

}

group by
  FaturaBelgesi,
  MusteriAd,
  fkdat,
  inco2_l
