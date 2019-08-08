# kubetutnative

```
gcloud auth login

WARNING: `gcloud auth login` no longer writes application default credentials.

If you need to use ADC, see:
  gcloud auth application-default --help
```

## Run helm tiller locally

https://helm.sh/docs/install/

Start tiller:

```
$ tiller
[main] 2019/08/08 17:08:15 Starting Tiller v2.14.3 (tls=false)
[main] 2019/08/08 17:08:15 GRPC listening on :44134
[main] 2019/08/08 17:08:15 Probes listening on :44135
[main] 2019/08/08 17:08:15 Storage driver is ConfigMap
[main] 2019/08/08 17:08:15 Max history per release is 0
```

Test helm:

```
$ export HELM_HOST=localhost:44134
$ helm version
Client: &version.Version{SemVer:"v2.14.3", GitCommit:"0e7f3b6637f7af8fcfddb3d2941fcc7cbebb0085", GitTreeState:"clean"}
Server: &version.Version{SemVer:"v2.14.3", GitCommit:"0e7f3b6637f7af8fcfddb3d2941fcc7cbebb0085", GitTreeState:"clean"}
```

