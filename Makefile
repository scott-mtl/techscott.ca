build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://mtlweb.ca --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id ED4F9925YQNZ2 --path '/*'