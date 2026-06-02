using {com.sap.productos as productos} from '../db/schema';

service CustomerService {
    entity Customers as projection on productos.Customer;
}
