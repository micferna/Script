#/bin/bash

echo "email :"
read email
echo "ndd.domain.tld :"
read ndd
sudo certbot certonly --nginx --agree-tos --no-eff-email --email $email -d $ndd
