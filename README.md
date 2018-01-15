# fluent-elasticsearch
A Fluent image setting with Elasticsearch output plugin to send event data to Elasticsearch server.

You must have a server with Elasticsearch installed and configured on port 9200.

# hands-on
Ensure that Elasticsearch is running and run the container:

```bash
docker run -d -p 24224:24224 bortes/fluent-elasticsearch
```

After that, just run your desired dockerized application and setting logger output. For example:

```bash
docker run -d -p 8080:80 --log-driver=fluentd --log-opt fluentd-address=localhost:24224 tutum/hello-world
```

# next steps
Enable the pipeline for Elasticsearch.

# more info
Based on [Fluent](https://docs.fluentd.org/v1.0/articles/config-file) with [Elasticsearch plugin](https://github.com/uken/fluent-plugin-elasticsearch).
