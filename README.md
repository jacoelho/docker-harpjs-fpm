## jacoelho/harpjs-fpm

Builds a harpjs website and create a deb file from it.

How to run:


```docker run --rm -v $(pwd)/src/:/root/website -e SITENAME=site jacoelho/harpjs-fpm```

The deb will install the website into /var/www/${SITENAME}

