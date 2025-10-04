with source as (
        select * from {{ source('jaffle_shop', 'my_second_dbt_model') }}
  ),
  renamed as (
      select
          {{ adapter.quote("ID") }}

      from source
  )
  select * from renamed
    