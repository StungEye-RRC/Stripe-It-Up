# IMPORTANT: Missing Steps

## Missing Step 1
Missing from [the Stripe screencast](https://youtu.be/iZgYeyzEMj0) is the addition of the following script tag to the `<head>` section of the application layout file ([app/views/layouts/applications.html.erb](https://github.com/StungEye-RRC/Stripe-It-Up/blob/master/app/views/layouts/application.html.erb)):

    <script src="https://js.stripe.com/v3/"></script>

This script tag *must* be added to the `<head>` of section of the application layout for the Stripe checkout to function. Without it you will see a "500 Error" in your browser's developer console when you click on the "Buy Now" button.

See [my version of the application layout with this script included here](https://github.com/StungEye-RRC/Stripe-It-Up/blob/master/app/views/layouts/application.html.erb).

## Missing Step 2

In order for the Stripe API to function you will need to set a company name in your Stripe account. Without this the API will only respond with a 500 error code. You do not need to supply Stripe with any banking or credit card details, just the name of a fictional company so that you can access the "sandbox" version of the API. When using this sandbox API you can use the following test creditcard number to make purchases: 4242424242424242
