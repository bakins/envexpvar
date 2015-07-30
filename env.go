// Package envexpvar exposes process environmental variables
// via expvar
package envexpvar

import (
	"expvar"
	"strings"
	"syscall"
)

func Env() map[string]string {
	vals := syscall.Environ()
	e := make(map[string]string, len(vals))
	for _, i := range vals {
		// this is not particularly speedy. Good enough for a first try
		parts := strings.SplitN(i, "=", 2)
		k := parts[0]
		// There can be multiple values for an environment variable (see stdlib syscall source)
		// so just call Getenv on each.  We could optimize and do the "magic" here, but
		// there is little performance gane to be had for potentially buggy code.
		if v, ok := syscall.Getenv(k); ok {
			e[k] = v
		}
	}
	return e
}

// helper to "cast" for expvar
func env() interface{} {
	return interface{}(Env())
}

func init() {
	expvar.Publish("environment", expvar.Func(env))
}
