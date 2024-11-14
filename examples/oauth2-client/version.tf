terraform {
  required_version = ">= 1.3.0"

  # Use a flexible range in modules that future proofs the module's usage with upcoming minor and patch versions
  required_providers {
    ibmverify = {
      source  = "ibm/ibmverify"
      version = ">= 1.0.0"
    }
  }
}
