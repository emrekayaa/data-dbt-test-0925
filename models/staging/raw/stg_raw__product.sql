with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        products_id,
        purchse_price

    from source

)

select * from renamed

select
    products_id,
    cast(purchse_price as float64) as purchase_price
{{ source('raw', 'product') }}
