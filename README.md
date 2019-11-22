# IMPORTANT: Missing Step

Missing from [the Stripe screencast](https://youtu.be/iZgYeyzEMj0) is the addition of the following script tag to the <head> section of the application layout file (app/views/layouts/applications.html.erb):

    <script src="https://js.stripe.com/v3/"></script>
