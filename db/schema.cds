namespace com.sap.productos;

using {
    cuid,
    managed
} from '@sap/cds/common';


type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

entity Podructs : cuid, managed {
    Name             : localized String not null;
    Description      : localized String;
    ImageUrl         : String;
    ReleaseDate      : DateTime default current_timestamp;
    DiscontinuedDate : DateTime;
    Price            : Decimal(16, 2);
    Height           : Decimal(16, 2);
    Width            : Decimal(16, 2);
    Depth            : Decimal(16, 2);
    Quantity         : Decimal(16, 2);
    supplier         : Association to Supplier;
    UnitOfMeasure    : Association to UnitOfMeasures;
    Currency         : Association to Currencies;
    Category         : Association to Category;
    ToSalesData      : Association to many SalesData
                           on ToSalesData.product = $self;

};

entity Orders : cuid, managed {
    Date     : Date;
    Customer : String;
    Items    : Association to many OrderItems
                   on Items.order = $self;
};

entity OrderItems : cuid, managed {
    order    : Association to Orders;
    product  : Association to Podructs;
    Quantity : Decimal(16, 2);
    Price    : Decimal(16, 2);
};

entity Supplier : cuid, managed {
    Name     : type of Podructs : Name;
    Address  : Address;
    Email    : String;
    Phone    : String;
    Fax      : String;
    Products : Association to many Podructs
                   on Products.supplier = $self;

};


entity Category {
    key ID   : String(1);
        Name : localized String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : localized String;
        Product     : Association to Podructs
};

entity Currencies {
    key ID          : String(3);
        Description : localized String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : localized String;
};


entity DimensionUnits {
    key ID          : String(2);
        Description : localized String;
};


entity Months {
    key ID               : String(2);
        Description      : localized String;
        ShortDescription : localized String(3);
};

entity ProductReview {
    key Name    : localized String;
        Rating  : Integer;
        Comment : String;

};

entity SalesData : cuid {
    product      : Association to Podructs;
    DeliveryDate : DateTime;
    Revenue      : Decimal(16, 2);
}
