locals {
  defaultTags = {
    Environment      = var.env
    TechnicalContact = var.technicalContact
    Product          = var.product
    Owner            = var.owner
  }
}
