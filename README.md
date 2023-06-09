
# to run the container  docker run -p 4242:4242 sample-stripe1
# to build the container  docker build -t sample-stripe1 .  
# Accept a payment

A Java implementation for creating a PaymentIntent on the server.

You can [🎥 watch a video](https://youtu.be/-uyXCnPXegE) to see how this server was implemented and [read the transcripts](./TRANSCRIPTS.md).


## Requirements

- Maven
- Java

## How to run

1. Confirm `.env` configuration

Ensure the API keys are configured in `.env` in this directory. It should include the following keys:

```yaml
# Stripe API keys - see https://stripe.com/docs/development/quickstart#api-keys
STRIPE_PUBLISHABLE_KEY=pk_test...
STRIPE_SECRET_KEY=sk_test...

# Required to verify signatures in the webhook handler.
# See README on how to use the Stripe CLI to test webhooks
STRIPE_WEBHOOK_SECRET=whsec_...

# Path to front-end implementation. Note: PHP has it's own front end implementation.
STATIC_DIR=../../client/html
DOMAIN=http://localhost:4242
```

2. Build the jar

```
mvn package
```

3. Run the packaged jar

```
java -cp target/sample-jar-with-dependencies.jar com.stripe.sample.Server
```

4. If you're using the html client, go to `localhost:4242` to see the demo. For
   react, visit `localhost:3000`.
