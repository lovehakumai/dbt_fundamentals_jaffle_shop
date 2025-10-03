with orders as (
    select
        order_id,
        customer_id
    from {{ ref('stg_jaffle_shop__orders') }}
),
payments as (
    select
        order_id,
        amount
    from {{ ref('stg_stripe__payments')}}
),
final as (
    select
        o.order_id,
        o.customer_id,
        p.amount / 100 as amount
    from orders o
    left join payments p using (order_id)
)

select * from final