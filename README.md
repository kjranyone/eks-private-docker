# eks-private-docker
GitHub Action using eksctl with secret docker-registry

# example

```
jobs:
  job-name:
    name: execute kubectl command
    runs-on: ubuntu-latest
    steps:
      - name: execute
        uses: kjranyone/eks-private-docker@master
        with:
          aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws_region: ap-northeast-1
          cluster_name: your cluster name
          secret_name: regcred
          docker_server: ${{ DOCKER_ACCESS_TOKEN }}
          docker_username: ${{ secrets.DOCKER_USER_ID }}
          docker_password: ${{ secrets.DCOKER_PASSWORD }}
          docker_email: your email
          args: replace --force -f ./path/to/file.yml
```
