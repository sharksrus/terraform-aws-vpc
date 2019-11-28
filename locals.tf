locals {
  defaultTags = {
    Environment      = var.env
    BusinessUnit     = var.businessUnit
    TechnicalContact = var.technicalContact
    Product          = var.product
    Owner            = var.owner
  }
}
