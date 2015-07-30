# envexpvar

Expose Process Environment via
[expvar](https://golang.org/pkg/expvar/) in Go.

[![GoDoc](https://godoc.org/github.com/bakins/envexpvar?status.svg)](https://godoc.org/github.com/bakins/envexpvar)[![CircleCI](https://circleci.com/gh/bakins/envexpvar.png?circle-token=:circle-token)](https://circleci.com/gh/bakins/envexpvar)

## Usage:

In your go code simply:

```
import _ "github.com/bakins/envexpvar"
```

And environments variables will be exposed using expvar. Generally
these are exposed on an http endpoint. See the docs for
[expvar](https://golang.org/pkg/expvar/)

An extremely simple example is included in `bin/example/example.go`.
Run this:

```
cd bin/example
go run example.go
```

And then request `/debug/vars` on port 8080 and you will see
"environment" included.

```
$ curl http://localhost:8080/debug/vars
{
"cmdline": ["/var/folders/zs/9j117pqx0c91dy_djv0pk5pc0000gn/T/go-build911455735/command-line-arguments/_obj/exe/example"],
"environment": {"
...
```

## LICENSE
See [LICENSE](./LICENSE)

