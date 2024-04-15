provider "oci" {
    region = var.region
}

variable "compartment_ocid" {
    default = "ocid1.compartment.oc1..aaaaaaaazlipe6cgz7ngxjie42czhhtqtl6aseqwitiehd2v3ia2xsbj7eya"
}

variable "region" {
    default = "us-ashburn-1"
}

variable "bucket_name" {
    default = "resource_manager_demo_bucket"
}

data "oci_objectstorage_namespace" "namespace" {
    compartment_id = var.compartment_ocid
}

resource "oci_objectstorage_bucket" "create_bucket"{
    compartment_id = var.compartment_ocid
    name = var.bucket_name
    namespace = data.oci_objectstorage_namespace.namespace.namespace
    access_type = "NoPublicAccess"
}

output "new_bucket" {
    value = oci_objectstorage_bucket.create_bucket
}