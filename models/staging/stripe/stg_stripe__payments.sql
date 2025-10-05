with source as (
        select * from {{ source('stripe', 'payment') }}
  ),
  renamed as (
      select
          {{ adapter.quote("ID") }} as {{ adapter.quote("PAYMENT_ID") }},
        {{ adapter.quote("ORDERID") }} as {{ adapter.quote("ORDER_ID") }},
        {{ adapter.quote("PAYMENTMETHOD") }} as {{ adapter.quote("PAYMENT_METHOD") }},
        {{ adapter.quote("STATUS") }},
        {{ adapter.quote("AMOUNT") }},
        {{ adapter.quote("CREATED") }},
        {{ adapter.quote("_BATCHED_AT") }}

      from source
  )
  select * from renamed
    