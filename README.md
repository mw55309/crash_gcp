# crash_gcp

Test case for crashing google cloud using Snakemake

1. Create a bucket
2. run ```snakemake  --google-lifesciences --default-remote-prefix MY_BUCKET_NAME_HERE --preemption-default 10 --use-conda -r --jobs 100 -np```


What I see, when I run this from an Ubuntu VM on GCP, is lots of jobs submitting fine, and then:

```
Exception in thread Thread-1:
Traceback (most recent call last):
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/threading.py", line 954, in _bootstrap_inner
    self.run()
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/threading.py", line 892, in run
    self._target(*self._args, **self._kwargs)
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/snakemake/executors/google_lifesciences.py", line 917, in _wait_for_jobs
    status = self._retry_request(request)
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/snakemake/executors/google_lifesciences.py", line 886, in _retry_request
    raise ex
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/snakemake/executors/google_lifesciences.py", line 875, in _retry_request
    return request.execute()
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/googleapiclient/_helpers.py", line 134, in positional_wrapper
    return wrapped(*args, **kwargs)
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/googleapiclient/http.py", line 920, in execute
    resp, content = _retry_request(
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/googleapiclient/http.py", line 222, in _retry_request
    raise exception
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/googleapiclient/http.py", line 191, in _retry_request
    resp, content = http.request(uri, method, *args, **kwargs)
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/oauth2client/transport.py", line 173, in new_request
    resp, content = request(orig_request_method, uri, method, body,
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/oauth2client/transport.py", line 280, in request
    return http_callable(uri, method=method, body=body, headers=headers,
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/httplib2/__init__.py", line 1708, in request
    (response, content) = self._request(
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/httplib2/__init__.py", line 1424, in _request
    (response, content) = self._conn_request(conn, request_uri, method, body, headers)
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/site-packages/httplib2/__init__.py", line 1376, in _conn_request
    response = conn.getresponse()
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/http/client.py", line 1345, in getresponse
    response.begin()
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/http/client.py", line 307, in begin
    version, status, reason = self._read_status()
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/http/client.py", line 268, in _read_status
    line = str(self.fp.readline(_MAXLINE + 1), "iso-8859-1")
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/socket.py", line 704, in readinto
    return self._sock.recv_into(b)
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/ssl.py", line 1241, in recv_into
    return self.read(nbytes, buffer)
  File "/home/mwatson9/miniconda3/envs/snakemake/lib/python3.9/ssl.py", line 1099, in read
    return self._sslobj.read(len, buffer)
ssl.SSLError: [SSL: DECRYPTION_FAILED_OR_BAD_RECORD_MAC] decryption failed or bad record mac (_ssl.c:2627)
```
