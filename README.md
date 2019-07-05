# Headless Wordpress with Next.js Front-end

Base Template

---
# WordPress installation & set up

Run the following command (Requires docker and mysql to be installed and running)

1. Pull down the boilerplate code (no spaces for the folder name or domain name)

```
curl https://sense-wordpress-boilerplate.s3-ap-southeast-2.amazonaws.com/boilerplate.sh -o boilerplate.sh && sh boilerplate.sh project=<project-name> domain=<domain-name>
```

2. Run to install from composer.

```
yarn dev:wordpress
```
