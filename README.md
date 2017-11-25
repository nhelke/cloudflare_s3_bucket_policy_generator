# cloudflare_s3_bucket_policy_generator
Script to generate S3 Bucket policy which only allows Cloudflare to access the website

    Usage: ./cloudflare_s3_bucket_policy.sh [bucket name]

Fetches fresh [list of IP addresses][ips] from Cloudflare and generates a `GetObject` policy white listed to just those IP addresses.

[ips]: https://www.cloudflare.com/ips/