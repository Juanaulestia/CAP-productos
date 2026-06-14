using {com.sap.productos as productos} from '../db/schema';

service CatalogService {
    entity Products as projection on productos.Podructs;
    entity Suppliers as projection on productos.Supplier;
}
