package envexpvar_test

import (
	"testing"

	"github.com/bakins/envexpvar"
)

func TestEnv(t *testing.T) {
	env := envexpvar.Env()
	if len(env) == 0 {
		t.Errorf("environment is empty")
	}
}
