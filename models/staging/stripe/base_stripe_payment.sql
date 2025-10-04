with source as (
        select * from {{ source('stripe', 'payment') }}
  ),
  renamed as (
      select
          {{ adapter.quote("ID") }},
        {{ adapter.quote("ORDERID") }},
        {{ adapter.quote("PAYMENTMETHOD") }},
        {{ adapter.quote("STATUS") }},
        {{ adapter.quote("AMOUNT") }},
        {{ adapter.quote("CREATED") }},
        {{ adapter.quote("_BATCHED_AT") }}

      from source
  )
  select * from renamed
    