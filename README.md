# 🛒 Lista de la Compra — stripped-down fork

This fork is a simplified grocery-list version of the original app.

## Removed from the user-facing application

- Recipe management
- Meal/recipe scheduler
- Supermarket management
- Aisle organization
- Supermarket route optimization
- Recipe/product associations in the product UI

## Kept

- Local shopping lists
- Products
- Multiple household/list selections
- Local peer-to-peer synchronization over a trusted local network
- Import/export and synchronization infrastructure

The original project is a Flutter application with local peer-to-peer synchronization. This fork deliberately keeps the existing synchronization architecture while removing the unwanted grocery-management features from the application UI.

The upstream project is available at:
https://github.com/jaimegonzalezfabregas/lista_de_la_compra
