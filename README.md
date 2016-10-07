# UnsubscibeWatcher

This will watch your mailgun account and remove one email address from they unsubscribe list.
People would accidently click on the unsubscribe link for one of our mailing lists :-/

It needs system env's set for these:

```export UNSUB_MAILGUN_API_KEY="your api key"
export UNSUB_DOMAIN="domain to watch"
export UNSUB_EMAIL="email address to watch"```
