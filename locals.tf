locals {
  defaultTags = {
    Environment      = var.env
    technicalcontact = var.technicalcontact
    Product          = var.product
    Owner            = var.owner
  }
}
