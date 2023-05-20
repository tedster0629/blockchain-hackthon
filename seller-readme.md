## Seller Product Registration Request
URL : http://hostandport/seller/{sellerId}/registerProduct
Body:
{
    "name":"test",
    "product_id":"test_id",
    "product_price":"test_price"
}

## Expected response of registration
{
    "block_address":"23456ytRYkO(7*^8oilhGj45tGDHFFGIU&YT*yu8lojlIUKGiolk;po0&YT%^$#$5JKHGFDRDJGH"
}


## List all seller Products
URL : http://hostandport/seller/{sellerId}/products

## Expected response
Body:
    [
        {
            "product_id":"test_id",
            "product_price":"test_price",
            "product_info":"test_info",
            "block_address":"test_block"
        },
        {
            ......
        }
    ]

## List a particular seller product
URL : http://hostandport/seller/{sellerId}/product/{productId}

## Expected response
Body:
    {
        "product_price":"test_price",
        "product_info":"test_info",
        "block_address":"test_block"
    }

