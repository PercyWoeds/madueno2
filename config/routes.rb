Mnygo::Application.routes.draw do


  resources :concepts
  resources :quotations
  resources :tranportorders
  resources :ubications
  resources :purchases
  resources :documents
  resources :servicebuys
  resources :instruccions
  resources :puntos
  resources :manifests
  resources :trucks
  resources :marcas
  resources :modelos
  resources :subcontrats
  resources :unidads
  resources :payments

  resources :tanks
  resources :employees
  resources :pumps

  resources :supplier_payments
  resources :inventory_details
  resources :inventories
  resources :payment_methods
  resources :deliveryships
  resources :declarations 
  resources :inventarios  
  resources :deliverymines   

    namespace :inventory do
      resources :suppliers
      resources :overviews
      resources :purchase_orders
      resources :receivings
      resources :adjustments
    end


  resources :serviceorders do 

    collection { post  :dograbarins }  
    collection do 
      put :discontinue 
    end 
  end 


  resources :purchaseorders do 
    collection { get :search   }
    collection { get :receive    }
  
  end 
  
  resources :deliveries do
    collection { get :search   }
    collection { post :import }
    collection do 
      put :discontinue 
    end 
  end 
  
  resources :suppliers do
    collection { post :import  }
  end 

  resources :orders do 
    collection { post :payment  }
    collection { post :imprimir }        
    collection { post :pagar }        
    collection { post :create }        
  end 

  resources :facturas do
    collection { get :generar  }
    collection { post :import }
  end 
  resources :stores  do 
    collection { post :search }    
  end 

  resources :inventories  do 
    collection { get :addCategory  }    
  end 

  resources :carts
  get 'store/index'

  resources :line_items

  resources :items do
    collection { get :update}
  end 

  resources :carts

  devise_for :users, :controllers => { 
    register: 'new_user_registration' ,
    logout: 'destroy_user_session',
    login: 'user_session'
  }

  devise_scope :user  do 
        match '/sessions/user', to: 'devise/sessions#create', via: :post
  end  
  resources :company_user do
    collection { post :new_company_use }
  end 
  
  resources :products   do
    collection { post :import }
    collection { get :search }
    get :who_bought, on: :member
  end 
  resources :products_categories   do
    collection { post :import }

  end 

  resources :customers do
    resources :addresses
    collection { post :import }
    collection { post :import2 }
  end 
  resources :purchases do
     collection { post :datos  }
  end 
  
  resources :employees do
    collection { post :import }
  end 
  resources :trucks do
    collection { post :import }
  end 
  #Manifiesto busqueda de guias

  get 'search_mines', to: 'deliveries#search'
  post 'add_mine', to: 'delliveries#add_mine'


  get 'my_declarations', to: 'declarations#my_deliveries'
 # get 'search_friends', to: 'deliveries#search'

  get 'search_serviceorders', to: 'purchases#search_serviceorders'
  post 'add_serviceorders', to: 'purchases#add_serviceorders'

  post 'add_friend', to: 'deliveries#add_friend'
  post 'items/update', to: 'items#update'

  # Reports
  match 'companies/reports/monthly_profits/:company_id' => 'reports#monthly_profits', via: [:get, :post]
  match 'companies/reports/profits/:company_id' => 'reports#profits' , via: [:get, :post]
  match 'companies/reports/view_monthly_divisions/:company_id/:division_id' => 'reports#report_view_monthly_divisions', via: [:get, :post]
  match 'companies/reports/monthly_divisions/:company_id' => 'reports#report_monthly_divisions', via: [:get, :post]
  match 'companies/reports/divisions/:company_id' => 'reports#report_divisions', via: [:get, :post]
  match 'companies/reports/view_monthly_locations/:company_id/:location_id' => 'reports#report_view_monthly_locations', via: [:get, :post]
  match 'companies/reports/monthly_locations/:company_id' => 'reports#report_monthly_locations', via: [:get, :post]
  match 'companies/reports/locations/:company_id' => 'reports#report_locations', via: [:get, :post]
  match 'companies/reports/view_monthly_customers/:company_id/:customer_id' => 'reports#report_view_monthly_customers', via: [:get, :post]
  match 'companies/reports/monthly_customers/:company_id' => 'reports#report_monthly_customers', via: [:get, :post]
  match 'companies/reports/customers/:company_id' => 'reports#report_customers', via: [:get, :post]
  match 'companies/reports/view_monthly_products/:company_id/:product_id' => 'reports#report_view_monthly_products', via: [:get, :post]
  match 'companies/reports/monthly_products/:company_id' => 'reports#report_monthly_products', via: [:get, :post]
  match 'companies/reports/products/:company_id' => 'reports#report_products', via: [:get, :post]
  match 'companies/reports/view_monthly_sellers/:company_id/:user_id' => 'reports#report_view_monthly_sellers', via: [:get, :post]
  match 'companies/reports/monthly_sellers/:company_id' => 'reports#report_monthly_sellers', via: [:get, :post]
  match 'companies/reports/sellers/:company_id' => 'reports#report_sellers', via: [:get, :post]
  match 'companies/reports/monthly_sales/:company_id' => 'reports#report_monthly_sales', via: [:get, :post]

  match 'companies/reports_guias/:company_id' => 'reports#reports_guias', via: [:get, :post]
  match 'companies/reports_compras/:company_id' => 'reports#reports_compras', via: [:get, :post]
  match 'companies/reports/reports_cpagar/:company_id' => 'reports#reports_cpagar', via: [:get, :post]
  match 'companies/reports/reports_cventas/:company_id' => 'reports#reports_cventas', via: [:get, :post]

  match 'companies/reports/rpt_serviceorder_all/:company_id' => 'reports#rpt_serviceorder_all', via: [:get, :post]
  match 'companies/reports/rpt_purchases_all/:company_id' => 'reports#rpt_purchases_all', via: [:get, :post]

  match 'companies/reports/reports_ccobrar/:company_id' => 'reports#reports_ccobrar', via: [:get, :post]  
  match 'companies/reports/rpt_ccobrar2_pdf/:company_id' => 'reports#rpt_ccobrar2_pdf', via: [:get, :post]  
  match 'companies/reports/rpt_ccobrar3_pdf/:company_id' => 'reports#rpt_ccobrar3_pdf', via: [:get, :post]  

  match 'companies/reports/rpt_facturas_all/:company_id' => 'reports#rpt_facturas_all', via: [:get, :post]


  match 'companies/reports/sales/:company_id' => 'reports#report_sales', via: [:get, :post]
  match 'companies/reports/:company_id' => 'reports#reports', via: [:get, :post]

  # Company users

  match 'company_users/ac_users' => 'company_users#ac_users', via: [:get, :post]
  match 'new_company_use', to: 'company_users#new', via: [:get]
  match 'company_list', to: 'company_users#list_users', via: [:get, :post] 
  resources :company_users

  # Invoices
  match 'invoice/add_kit/:company_id' => 'invoices#add_kit', via: [:get, :post]
  match 'invoices/list_items/:company_id' => 'invoices#list_items', via: [:get, :post]
  match 'invoices/ac_kit/:company_id' => 'invoices#ac_kit', via: [:get, :post]
  match 'invoices/ac_products/:company_id' => 'invoices#ac_products', via: [:get, :post]
  match 'invoices/ac_user/:company_id' => 'invoices#ac_user', via: [:get, :post]
  match 'invoices/ac_customers/:company_id' => 'invoices#ac_customers', via: [:get, :post]
  match 'invoices/new/:company_id' => 'invoices#new', via: [:get, :post]
  
  match 'invoices/do_email/:id' => 'invoices#do_email', via: [:get, :post]
  match 'invoices/do_process/:id' => 'invoices#do_process', via: [:get, :post]
  match 'invoices/email/:id' => 'invoices#email', via: [:get, :post]
  match 'invoices/pdf/:id' => 'invoices#pdf', via: [:get, :post]
  match 'companies/invoices/:company_id' => 'invoices#list_invoices', via: [:get, :post]
  resources :invoices


# Declarations
  
  match 'declarations/list_items/:company_id' => 'invoices#list_items', via: [:get, :post]
  match 'declarations/ac_kit/:company_id' => 'invoices#ac_kit', via: [:get, :post]
  match 'invoices/ac_products/:company_id' => 'invoices#ac_products', via: [:get, :post]
  match 'invoices/ac_user/:company_id' => 'invoices#ac_user', via: [:get, :post]
  match 'invoices/ac_customers/:company_id' => 'invoices#ac_customers', via: [:get, :post]
  match 'invoices/new/:company_id' => 'invoices#new', via: [:get, :post]
  
  match 'invoices/do_email/:id' => 'invoices#do_email', via: [:get, :post]
  match 'invoices/do_process/:id' => 'invoices#do_process', via: [:get, :post]
  match 'invoices/email/:id' => 'invoices#email', via: [:get, :post]
  match 'invoices/pdf/:id' => 'invoices#pdf', via: [:get, :post]
  match 'companies/invoices/:company_id' => 'invoices#list_invoices', via: [:get, :post]
  resources :invoices

  
  # Facturas Ventas
  
  match 'facturas/list_items/:company_id' => 'facturas#list_items', via: [:get, :post]
  match 'facturas/list_items2/:company_id' => 'facturas#list_items2', via: [:get, :post] , :layout => false
  match 'facturas/ac_services/:company_id' => 'facturas#ac_services', via: [:get, :post]
  match 'facturas/ac_user/:company_id' => 'facturas#ac_user', via: [:get, :post]
  match 'facturas/ac_customers/:company_id' => 'facturas#ac_customers', via: [:get, :post]
  match 'facturas/ac_guias/:company_id' => 'facturas#ac_guias', via: [:get, :post]
  match 'facturas/new/:company_id' => 'facturas#new', via: [:get, :post]
  match 'facturas/export/:company_id' => 'facturas#export', via: [:get, :post]
  match 'facturas/export2/:company_id' => 'facturas#export2', via: [:get, :post]
  match 'facturas/rpt_facturas_all/:company_id' => 'facturas#rpt_facturas_all_pdf', via: [:get, :post]
  match 'facturas/rpt_ccobrar2_pdf/:company_id' => 'facturas#rpt_ccobrar2_pdf', via: [:get, :post]

  match 'companies/facturas/generar/:company_id' => 'facturas#generar', via: [:get, :post]
  #match 'serviceorders/rpt_serviceorder_all_pdf/:id' => 'serviceorders#rpt_serviceorder_all_pdf', via: [:get, :post]

  match 'facturas/do_anular/:id' => 'facturas#do_anular', via: [:get, :post]
  match 'facturas/do_email/:id' => 'facturas#do_email', via: [:get, :post]
  match 'facturas/do_process/:id' => 'facturas#do_process', via: [:get, :post]
  match 'facturas/email/:id' => 'facturas#email', via: [:get, :post]
  match 'facturas/pdf/:id' => 'facturas#pdf', via: [:get, :post]
  match 'companies/facturas/:company_id' => 'facturas#list_invoices', via: [:get, :post]
  resources :facturas

# Guias
  
  match 'deliveries/list_items/:company_id' => 'deliveries#list_items', via: [:get, :post]
  match 'deliveries/ac_services/:company_id' => 'deliveries#ac_services', via: [:get, :post]
  match 'deliveries/ac_unidads/:company_id' => 'deliveries#ac_unidads', via: [:get, :post]
  match 'deliveries/ac_user/:company_id' => 'deliveries#ac_user', via: [:get, :post]
  match 'deliveries/ac_customers/:company_id' => 'deliveries#ac_customers', via: [:get, :post]
  match 'deliveries/ac_guiass/:company_id' => 'deliveries#ac_guias', via: [:get, :post]
  match 'deliveries/new/:company_id' => 'deliveries#new', via: [:get, :post]
  match 'deliveries/do_unir/:company_id' => 'deliveries#do_unir', via: [:get, :post]
  match 'companies/deliveries/unir/:company_id' => 'deliveries#unir', via: [:get, :post]

  match 'deliveries/do_email/:id' => 'deliveries#do_email', via: [:get, :post]
  match 'deliveries/do_process/:id' => 'deliveries#do_process', via: [:get, :post]
  match 'deliveries/do_anular/:id' => 'deliveries#do_anular', via: [:get, :post]
  match 'deliveries/email/:id' => 'deliveries#email', via: [:get, :post]
  match 'deliveries/pdf/:id' => 'deliveries#pdf', via: [:get, :post]
  match 'deliveries/guias1/:company_id' => 'deliveries#guias1', via: [:get, :post]

  match 'companies/deliveries/:company_id' => 'deliveries#list_deliveries', via: [:get, :post]
  resources :deliveries

# serviceorders
  
  match 'serviceorders/list_items/:company_id' => 'serviceorders#list_items', via: [:get, :post]
  match 'serviceorders/ac_services/:company_id' => 'serviceorders#ac_services', via: [:get, :post]
  match 'serviceorders/ac_unidads/:company_id' => 'serviceorders#ac_unidads', via: [:get, :post]
  match 'serviceorders/ac_user/:company_id' => 'serviceorders#ac_user', via: [:get, :post]
  match 'serviceorders/ac_customers/:company_id' => 'serviceorders#ac_customers', via: [:get, :post]
  match 'serviceorders/new/:company_id' => 'serviceorders#new', via: [:get, :post]
  match 'serviceorders/do_grabar_ins/:id' => 'serviceorders#do_grabar_ins', via: [:get, :post]

  match 'serviceorders/do_email/:id' => 'serviceorders#do_email', via: [:get, :post]
  match 'serviceorders/do_process/:id' => 'serviceorders#do_process', via: [:get, :post]
  match 'serviceorders/do_anular/:id' => 'serviceorders#do_anular', via: [:get, :post]
  match 'serviceorders/email/:id' => 'serviceorders#email', via: [:get, :post]  
  match 'serviceorders/pdf/:id' => 'serviceorders#pdf', via: [:get, :post]

  match 'serviceorders/rpt_serviceorder_all_pdf/:id' => 'serviceorders#rpt_serviceorder_all_pdf', via: [:get, :post]
  match 'serviceorders/receive/:id' => 'serviceorders#receive', via: [:get, :post]
  
  match 'companies/serviceorders/receive_orderservice/:company_id' => 'serviceorders#list_receive_serviceorders', via: [:get, :post]  
  match 'companies/serviceorders/:company_id' => 'serviceorders#list_serviceorders', via: [:get, :post]
  resources :serviceorders


  match 'purchaseorders/list_items/:company_id' => 'purchaseorders#list_items', via: [:get, :post]
  match 'purchaseorders/ac_products/:company_id' => 'purchaseorders#ac_products', via: [:get, :post]
  match 'purchaseorders/ac_unidads/:company_id' => 'purchaseorders#ac_unidads', via: [:get, :post]
  match 'purchaseorders/ac_user/:company_id' => 'purchaseorders#ac_user', via: [:get, :post]
  match 'purchaseorders/ac_purchases/:company_id' => 'purchaseorders#ac_purchases', via: [:get, :post]
  match 'purchaseorders/new/:company_id' => 'purchaseorders#new', via: [:get, :post]

  match 'purchaseorders/receive/:id' => 'purchaseorders#receive', via: [:get, :post]
  match 'purchaseorders/do_email/:id' => 'purchaseorders#do_email', via: [:get, :post]
  match 'purchaseorders/do_process/:id' => 'purchaseorders#do_process', via: [:get, :post]
  match 'purchaseorders/do_grabar_ins/:id' => 'purchaseorders#do_grabar_ins', via: [:get, :post]
  match 'purchaseorders/email/:id' => 'purchaseorders#email', via: [:get, :post]
  match 'purchaseorders/pdf/:id' => 'purchaseorders#pdf', via: [:get, :post]
  
  match 'companies/purchaseorders/receive/:company_id' => 'purchaseorders#list_receiveorders', via: [:get, :post]
  match 'companies/purchaseorders/:company_id' => 'purchaseorders#list_purchaseorders', via: [:get, :post]

  resources :purchaseorders

  match 'receiveorders/list_items/:company_id' => 'receiveorders#list_items', via: [:get, :post]
match 'receiveorders/ac_products/:company_id' => 'receiveorders#ac_products', via: [:get, :post]
  match 'receiveorders/ac_unidads/:company_id' => 'receiveorders#ac_unidads', via: [:get, :post]
  match 'receiveorders/ac_user/:company_id' => 'receiveorders#ac_user', via: [:get, :post]
  match 'receiveorders/new/:company_id' => 'receiveorders#new', via: [:get, :post]
  

  match 'receiveorders/do_email/:id' => 'receiveorders#do_email', via: [:get, :post]
  match 'receiveorders/do_process/:id' => 'receiveorders#do_process', via: [:get, :post]
  match 'receiveorders/email/:id' => 'receiveorders#email', via: [:get, :post]
  match 'receiveorders/pdf/:id' => 'receiveorders#pdf', via: [:get, :post]
  match 'companies/receiveorders/:company_id' => 'receiveorders#list_receiveorders', via: [:get, :post]
  

  resources :receiveorders
  

  match 'movements/list_items/:company_id' => 'movements#list_items', via: [:get, :post]
  match 'movements/ac_products/:company_id' => 'movements#ac_products', via: [:get, :post]
  match 'movements/ac_unidads/:company_id' => 'movements#ac_unidads', via: [:get, :post]
  match 'movements/ac_user/:company_id' => 'movements#ac_user', via: [:get, :post]
  match 'movements/ac_purchases/:company_id' => 'movements#ac_purchases', via: [:get, :post]
  match 'movements/new/:company_id' => 'movements#new', via: [:get, :post]
  
  match 'movements/do_email/:id' => 'movements#do_email', via: [:get, :post]
  match 'movements/do_process/:id' => 'movements#do_process', via: [:get, :post]
  match 'movements/email/:id' => 'movements#email', via: [:get, :post]
  match 'movements/pdf/:id' => 'movements#pdf', via: [:get, :post]
  match 'companies/movements/:company_id' => 'movements#list_movements', via: [:get, :post]
  resources :movements

  # Purchases
  
  match 'purchases/list_items/:company_id' => 'purchases#list_items', via: [:get, :post]  
  match 'purchases/ac_products/:company_id' => 'purchases#ac_products', via: [:get, :post]
  match 'purchases/ac_user/:company_id' => 'purchases#ac_user', via: [:get, :post]
  match 'purchases/ac_suppliers/:company_id' => 'purchases#ac_suppliers', via: [:get, :post]
  match 'purchases/new/:company_id' => 'purchases#new', via: [:get, :post]  

  match 'purchases/do_email/:id' => 'purchases#do_email', via: [:get, :post]
  match 'purchases/do_process/:id' => 'purchases#do_process', via: [:get, :post]
  match 'purchases/email/:id' => 'purchases#email', via: [:get, :post]
  match 'purchases/pdf/:id' => 'purchases#pdf', via: [:get, :post]
  match 'purchases/search/:id' => 'purchases#search', via: [:get, :post]

  match 'companies/purchases/:company_id' => 'purchases#list_purchases', via: [:get, :post]  
  resources :purchases


  # supplier payments
  
  match 'supplier_payments/list_items/:company_id' => 'supplier_payments#list_items', via: [:get, :post]  
  match 'supplier_payments/ac_products/:company_id' => 'supplier_payments#ac_products', via: [:get, :post]
  match 'supplier_payments/ac_documentos/:company_id' => 'supplier_payments#ac_documentos', via: [:get, :post]
  match 'supplier_payments/ac_user/:company_id' => 'supplier_payments#ac_user', via: [:get, :post]
  match 'supplier_payments/ac_suppliers/:company_id' => 'supplier_payments#ac_suppliers', via: [:get, :post]
  match 'supplier_payments/new/:company_id' => 'supplier_payments#new', via: [:get, :post]  

  match 'supplier_payments/do_email/:id' => 'supplier_payments#do_email', via: [:get, :post]
  match 'supplier_payments/do_process/:id' => 'supplier_payments#do_process', via: [:get, :post]
  match 'supplier_payments/email/:id' => 'supplier_payments#email', via: [:get, :post]
  match 'supplier_payments/pdf/:id' => 'supplier_payments#pdf', via: [:get, :post]
  match 'supplier_payments/search/:id' => 'supplier_payments#search', via: [:get, :post]
  match 'supplier_payments/rpt_purchases_all/:id' => 'supplier_payments#rpt_purchases_all', via: [:get, :post]
  match 'companies/supplier_payments/:company_id' => 'supplier_payments#list_supplierpayments', via: [:get, :post]  
  resources :supplier_payments

# supplier payments
  
  match 'customer_payments/list_items/:company_id' => 'customer_payments#list_items', via: [:get, :post]  
  match 'customer_payments/ac_products/:company_id' => 'customer_payments#ac_products', via: [:get, :post]
  match 'customer_payments/ac_documentos/:company_id' => 'customer_payments#ac_documentos', via: [:get, :post]
  match 'customer_payments/ac_user/:company_id' => 'customer_payments#ac_user', via: [:get, :post]
  match 'customer_payments/ac_customers/:company_id' => 'customer_payments#ac_customers', via: [:get, :post]
  match 'customer_payments/new/:company_id' => 'customer_payments#new', via: [:get, :post]  

  match 'customer_payments/do_email/:id' => 'customer_payments#do_email', via: [:get, :post]
  match 'customer_payments/do_process/:id' => 'customer_payments#do_process', via: [:get, :post]
  match 'customer_payments/email/:id' => 'customer_payments#email', via: [:get, :post]
  match 'customer_payments/pdf/:id' => 'customer_payments#pdf', via: [:get, :post]
  match 'customer_payments/search/:id' => 'customer_payments#search', via: [:get, :post]
  match 'customer_payments/rpt_purchases_all/:id' => 'customer_payments#rpt_purchases_all', via: [:get, :post]
  
  match 'companies/customer_payments/:company_id' => 'customer_payments#list_customerpayments', via: [:get, :post]  
  resources :customer_payments

  match 'inventories_detaisl/additems/:company_id' => 'additems#list', via: [:get, :post]  
  resources :inventory_details
  
  # Customers
  match 'customers/create_ajax/:company_id' => 'customers#create_ajax', via: [:get, :post]
  match 'customers/new/:company_id' => 'customers#new', via: [:get, :post]
  match 'companies/customers/:company_id' => 'customers#list_customers', via: [:get, :post]
  resources :customers

  # Divisions
  match 'divisions/new/:company_id' => 'divisions#new', via: [:get, :post]
  match 'companies/divisions/:company_id' => 'divisions#list_divisions', via: [:get, :post]
  resources :divisions

  match 'trucks/new/:company_id' => 'trucks#new', via: [:get, :post]
  match 'companies/trucks/:company_id' => 'trucks#index', via: [:get, :post]
  resources :trucks

  match 'servicebuys/new/:company_id' => 'servicebuys#new', via: [:get, :post]
  match 'companies/servicebuys/:company_id' => 'servicebuys#index', via: [:get, :post]
  resources :trucks

  match 'empsubs/new/:company_id' => 'empsubs#new', via: [:get, :post]
  match 'companies/empsubs/:company_id' => 'empsubs#index', via: [:get, :post]
  resources :empsubs
  
  match 'subcontrats/new/:company_id' => 'subcontrats#new', via: [:get, :post]
  match 'companies/subcontrats/:company_id' => 'subcontrats#index', via: [:get, :post]
  resources :subcontrats

  # Restocks
  match 'restocks/process/:id' => 'restocks#do_process', via: [:get, :post]
  match 'restocks/new/:company_id/:product_id' => 'restocks#new', via: [:get, :post]
  match 'companies/restocks/:company_id/:product_id' => 'restocks#list_restocks', via: [:get, :post]
  resources :restocks

  # Products kits
  match 'products_kits/list_items/:company_id' => 'products_kits#list_items', via: [:get, :post]
  match 'products_kits/new/:company_id' => 'products_kits#new', via: [:get, :post]
  match 'companies/products_kits/:company_id' => 'products_kits#list_products_kits', via: [:get, :post]
  resources :products_kits

  # Products Categories
  match 'products_categories/ac_categories/:company_id' => 'products_categories#ac_categories', via: [:get, :post]
  match 'products_categories/new/:company_id' => 'products_categories#new', via: [:get, :post]
  match 'companies/products_categories/:company_id' => 'products_categories#list_products_categories', via: [:get, :post]
  resources :products_categories

  # Products
  match 'products/ac_products/:company_id' => 'products#ac_products', via: [:get, :post]
  match 'products/ac_categories/:company_id' => 'products#ac_categories', via: [:get, :post]
  match 'products/new/:company_id' => 'products#new', via: [:get, :post]
  match 'companies/products/:company_id' => 'products#list_products', via: [:get, :post]
  resources :products


  match 'services/ac_services/:company_id' => 'services#ac_services', via: [:get, :post]
  match 'services/new/:company_id' => 'services#new', via: [:get, :post]
  match 'companies/services/:company_id' => 'services#index', via: [:get, :post]
  resources :services

  match 'companies/marcas/:company_id' => 'marcas#index', via: [:get, :post]
  resources :marcas

  match 'companies/modelos/:company_id' => 'modelos#index', via: [:get, :post]
  resources :modelos

  match 'companies/unidads/:company_id' => 'unidads#index', via: [:get, :post]
  resources :unidads

  match 'companies/instruccions/:company_id' => 'instruccions#index', via: [:get, :post]
  resources :unidads

  match 'companies/payments/:company_id' => 'payments#index', via: [:get, :post]
  resources :payments

  # Tanques
  match 'companies/tanks/:company_id' => 'tanks#index', via: [:get, :post]
  resources :tanks  

  match 'companies/pumps/:company_id' => 'pumps#index', via: [:get, :post]
  resources :pumps  

  match 'companies/employees/:company_id' => 'employees#index', via: [:get, :post]
  resources :employees  
  
  # Suppliers
  match 'suppliers/new/:company_id' => 'suppliers#new', via: [:get, :post]
  match 'companies/suppliers/:company_id' => 'suppliers#list_suppliers', via: [:get, :post]
  resources :suppliers

  # Locations
  match 'locations/new/:company_id' => 'locations#new', via: [:get, :post]
  match 'companies/locations/:company_id' => 'locations#list_locations', via: [:get, :post]
  resources :locations
  
  # Companies
  match 'companies/export/:id' => 'companies#export', via: [:get, :post]
  match 'new_company', to: 'companies#new', via: [:get]
  match 'companies/start/:id' => 'companies#start', via: [:get, :post]
  match 'companies/faqs/:id' => 'companies#faqs', via: [:get, :post]
  match 'companies/charts/:id' => 'companies#charts', via: [:get, :post]
  match 'companies/license/:id' => 'companies#license', via: [:get, :post]
  match 'companies/components/:id' => 'companies#components', via: [:get, :post]
  match 'companies/cpagar/:id' => 'companies#cpagar', via: [:get, :post]
  match 'companies/ccobrar/:id' => 'companies#ccobrar', via: [:get, :post]
  resources :companies

  # Users packages
  resources :users_packages

  # Packages
  match 'payment/:slug' => 'packages#payment', via: [:get, :post]
  match 'pricing/:slug' => 'packages#pick_package', via: [:get, :post]
  match 'pricing' => 'packages#pricing', via: [:get, :post]
  resources :packages

  # Pages
  match 'p/:page_name' => 'pages#name_clean', via: [:get, :post]
  match 'dashboard' => 'pages#dashboard', via: [:get, :post]
  match 'err_not_found' => 'pages#err_not_found', via: [:get, :post]
  match 'quick_upload' => 'pages#quick_upload', via: [:get, :post]
  resources :pages

  # Users
  match 'err_perms' => 'users#err_perms', via: [:get, :post]
  match "register" => 'devise/registrations#new' , via: [:get, :post]
  match 'logout' => 'devise/sessions#destroy', via: [:get, :post]
  match 'login' => 'devise/sessions#new', via: [:get, :post]
  resources :users
  
  #Orders
  
  match 'companies/stores/:company_id' => 'stores#index', via: [:get, :post]
  resources :stores

  match 'orders/pdf/:id' => 'orders#pdf', via: [:get, :post]  
  match 'orders/new' => 'orders#new', via: [:get, :post]
  
  match "pagar" => "orders#new" , via: [:get]
  resources :orders

  
  match 'inventories/ac_categories/:company_id' => 'inventories#ac_categories', via: [:get, :post]
  match 'inventories/new/:company_id' => 'inventories#new', via: [:get, :post]  
  match 'inventories/do_email/:id' => 'inventories#do_email', via: [:get, :post]
  match 'inventories/do_process/:id' => 'inventories#do_process', via: [:get, :post]
  match 'inventories/email/:id' => 'inventories#email', via: [:get, :post]
  match 'inventories/pdf/:id' => 'inventories#pdf', via: [:get, :post]
  match 'companies/inventories/:company_id' => 'inventories#list_inventories', via: [:get, :post]
  match 'inventories/addAll/:company_id' => 'inventories#addAll', via: [:get, :post]
  resources :inventories

  match 'inventories/ac_categories/:company_id' => 'inventories#ac_categories', via: [:get, :post]
  match 'inventories/new/:company_id' => 'inventories#new', via: [:get, :post]  
  match 'inventories/do_email/:id' => 'inventories#do_email', via: [:get, :post]
  match 'inventories/do_process/:id' => 'inventories#do_process', via: [:get, :post]
  match 'inventories/email/:id' => 'inventories#email', via: [:get, :post]
  match 'inventories/pdf/:id' => 'inventories#pdf', via: [:get, :post]
  match 'companies/inventarios/:company_id' => 'inventarios#index', via: [:get, :post]
  
  resources :inventarios


  # Sessions
  resources :sessions
  
  # Frontpage
 # match 'dashboard' => 'pages#dashboard', via: [:get,s :post]

  root :to => "pages#frontpage"
  
end
