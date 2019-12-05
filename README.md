# IMPORTANT: Missing Step

Missing from [the Stripe screencast](https://youtu.be/iZgYeyzEMj0) is the addition of the following script tag to the `<head>` section of the application layout file ([app/views/layouts/applications.html.erb](https://github.com/StungEye-RRC/Stripe-It-Up/blob/master/app/views/layouts/application.html.erb)):

    <script src="https://js.stripe.com/v3/"></script>

This script tag *must* be added to the `<head>` of section of the application layout for the Stripe checkout to function. Without it you will see a "500 Error" in your browser's developer console when you click on the "Buy Now" button.

See [my version of the application layout with this script included here](https://github.com/StungEye-RRC/Stripe-It-Up/blob/master/app/views/layouts/application.html.erb).
