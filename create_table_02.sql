create table NEO_STORAGE_VEX as
select
    cast('1' || a.warehouse_id || a.sku_code as int) id,
    a.sku_code,
    a.warehouse_id,
    b.name as warehouse_name,
    a.qty_preout,
    a.qty_prein,
    a.qty_storage,
    a.qty_share,
    a.qty_available
from
    NEO_STORAGE a
    inner join NEO_WAREHOUSE b on a.warehouse_id = b.id
;

create table NEO_SHARE_STORAGE_VEX as
select
    cast('2' || a.share_store_id || a.sku_code as int) as id,
    a.sku_code,
    a.share_store_id,
    b.name as share_store_name a.qty_preout,
    a.qty_prein,
    a.qty_storage
from
    NEO_SHARE_STORAGE a
    inner join NEO_SHARE_STORE b on a.share_store_id = b.id
;

create table NEO_CHANNEL_STORAGE_VEX as
select
    cast('3' || a.channel_id || a.sku_code as int) as id,
    a.sku_code,
    a.channel_id,
    b.name as channel_name,
    a.qty_preout,
    a.qty_prein,
    a.qty_storage
from
    NEO_CHANNEL_STORAGE a
    inner join NEO_CHANNEL b on a.channel_id = b.id
;

create table NEO_WAREHOUSE_SHARE_EDG as
select
    rownum as id,
    cast('1' || a.warehouse_id || b.sku_code as int) warehouse_sku,
    cast('2' || a.share_store_id || c.sku_code as int) share_store_sku,
    a.ratio
from
    NEO_WAREHOUSE_SHARE_RATIO a,
    NEO_STORAGE b,
    NEO_SHARE_STORAGE c
where
    a.warehouse_id = b.warehouse_id
    and a.share_store_id = c.share_store_id
    and b.sku_code = c.sku_code
;

create table NEO_SHARE_CHANNEL_EDG as
select
    rownum as id,
    cast('2' || a.share_store_id || b.sku_code as int) share_store_sku,
    cast('3' || a.channel_id || b.sku_code as int) as channel_sku,
    a.ratio
from
    NEO_SHARE_CHANNEL_RATIO a,
    NEO_SHARE_STORAGE b,
    NEO_CHANNEL_STORAGE c
where
    a.share_store_id = b.share_store_id
    and a.channel_id = c.channel_id
    and b.sku_code = c.sku_code
;