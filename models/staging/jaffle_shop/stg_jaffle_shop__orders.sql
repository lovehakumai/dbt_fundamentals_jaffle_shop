with source as (
        select * from {{ source('jaffle_shop', 'orders') }}
  ),
  renamed as (
      select
          {{ adapter.quote("ID") }} as {{ adapter.quote("ORDER_ID") }},
        {{ adapter.quote("USER_ID") }},
        {{ adapter.quote("ORDER_DATE") }},
        {{ adapter.quote("STATUS") }} as {{adapter.quote("ORDER_STATUS")}},
        {{ adapter.quote("_ETL_LOADED_AT") }}

      from source
  )
  select * from renamed
    