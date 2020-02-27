library(CmooreFunctions)

basicSetup()

sales_raw <- read.csv("C:\\Users\\C6728215\\Documents\\sales dashboard\\sales_data_sample.csv", stringsAsFactors = FALSE)

sales_processed <- sales_raw %>% 
  select(QUANTITYORDERED, PRICEEACH, SALES, ORDERDATE, STATUS, PRODUCTLINE, PRODUCTCODE, MSRP, CUSTOMERNAME, DEALSIZE) %>% 
  mutate(price_match = ifelse(round(QUANTITYORDERED * PRICEEACH, 0) == round(SALES, 0), 'Y', 'N'),
         ORDERDATE = as.Date(word(ORDERDATE), '%m/%d/%Y'))

colnames(sales_processed) <- qc(quantity, price_each, sale_value, order_date, status, product_line,
                                product_code, msrp, customer, deal_size, match)

saveRDS(sales_processed, file = 'sales_cleaned.RDS')

x <-  readRDS('sales_cleaned.RDS')
