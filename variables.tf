##### Variables for GCS bucket #####
variable "name" {
  description = "the name of the new bucket that will be created"
  type        = string
}

variable "force_destroy" {
  description = <<-EOT
  {
   "type": "json",
   "purpose": "autocomplete",
   "data": [
  "true",
  "false"
   ],
    "description": "When set to true, enables forced deletion of contained objects."
   }
   EOT
  type        = bool
  default     = false
}

variable "location" {
  description = <<-EOT
    {
   "type": "json",
   "purpose": "autocomplete",
   "data":[ "asia-east1",
        "asia-east2",
        "asia-northeast1",
        "asia-northeast2",
        "asia-northeast3",
        "asia-south1",
        "asia-south2",
        "asia-southeast1",
        "asia-southeast2",
        "australia-southeast1",
        "australia-southeast2",
        "europe-central2",
        "europe-north1",
        "europe-west1",
        "europe-west2",
        "europe-west3",
        "europe-west4",
        "europe-west6",
        "northamerica-northeast1",
        "northamerica-northeast2",
        "southamerica-east1",
        "southamerica-west1",
        "us-central1",
        "us-east1",
        "us-east4",
        "us-west1",
        "us-west2",
        "us-west3",
        "us-west4"
    ],
   "description": "the location of the bucket"
}
  EOT
  type        = string
}

variable "project_id" {
  description = "the ID of the project where the bucket will be created"
  type        = string
}

variable "storage_class" {
  description = <<-EOT
    {
   "type": "json",
   "purpose": "autocomplete",
   "data":[ "STANDARD",
            "MULTI-REGIONAL",
            "REGIONAL",
            "NEARLINE",
            "COLDLINE",
            "ARCHIVE"
        ],
   "description": "determines the type of storage of the bucket."
}
  EOT
  type        = string
  default     = null
}

variable "labels" {
  description = "a map of key/value label pairs to assign to the bucket"
  type        = map(string)
  default     = null
}

variable "uniform_bucket_level_access" {
  description = <<-EOT
  {
   "type": "json",
   "purpose": "autocomplete",
   "data": [
      "true",
      "false"
   ],
   "default" : true,
   "description": "enables uniform bucket level access to a bucket"
   }
   EOT
  type        = bool
  default     = true
}

variable "lifecycle_rule" {
  description = "lifecycle rule for a gcs bucket"
  type = list(object({
    action    = any
    condition = any
  }))
  default = []
}

variable "bucket_object_versioning" {
  description = <<-EOT
  {
   "type": "json",
   "purpose": "autocomplete",
   "data": [
      "true",
      "false"
   ],
   "default" : true,
   "description": "enabling versioning can help retain a noncurrent object version"
   }
   EOT
  type        = bool
  default     = true
}

variable "cors" {
  description = "cors configuration for the bucket"
  type        = any
  default     = []
}

variable "retention_policy" {
  description = "configuration of the bucket's data retention policy for how long objects in the bucket should be retained"
  type = object({
    is_locked        = bool
    retention_period = number
  })
  default = null
}

variable "log_object_bucket" {
  description = "a gcs bucket that can receive log objects"
  type        = string
  default     = null
}

variable "log_object_prefix" {
  description = "the object prefix for log objects which defaults to gcs bucket name"
  type        = string
  default     = null
}

variable "encryption" {
  description = "a cloud KMS key that will be used to encrypt objects inserted into this bucket"
  type = object({
    kms_key_name = string
  })
  default = null
}
