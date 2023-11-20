# Data Engineering Camp Capstone Project

## Objective
The primary objective of this project is to test and demonstrate various concepts and technologies learned during a data engineering camp. The focus is on the practical application and integration of advanced data engineering tools and methodologies. Key technologies and concepts being tested include:

- **Docker**: An open platform for developing, shipping, and running applications. Docker enables the creation of isolated environments (containers) that can run applications and their dependencies consistently across various computing environments.
- **PostgreSQL Database**: A powerful, open-source object-relational database system known for its reliability, robustness, and performance. PostgreSQL is used for storing and managing structured data.
- **Airbyte**: An open-source data integration tool used for replicating data from various sources to data warehouses. It enables efficient and reliable data extraction and loading, supporting incremental data syncs.
- **Kestra**: A modern orchestration tool designed to handle complex workflows. Kestra facilitates the automation and scheduling of data pipelines, enhancing the manageability of data processing tasks.
- **CI/CD (Continuous Integration/Continuous Deployment)**: A method to frequently deliver apps to customers by introducing automation into the stages of app development. The main concepts attributed to CI/CD are continuous integration, continuous deployment, and continuous delivery.
- **Real-Time Data Processing**: The capability to process data immediately as it becomes available, enabling timely insights and decision-making. This concept is critical in handling streaming data and delivering up-to-date analytics.

This project serves as a platform to implement and validate these technologies and concepts in a cohesive data engineering workflow.

## Consumers
(Describe who the intended users or beneficiaries of this project are. This could include internal teams, external clients, or a particular industry sector.)

## Questions
Outline the key questions your project seeks to answer. These questions guide the project's direction and scope.

### Business Questions
Addressing critical business inquiries, such as:
- **Product Analysis**: Breakdown by category and subcategories.
- **Customer Insights**: Metrics on new customer acquisition, average spending patterns.
- **Order Status Tracking**: Monitoring and analysis of order statuses.
- **Geographical Distribution**: Insights into shipping destinations including country, state, and city.
- **Web Traffic Analysis**: Examination of web visits by country and correlating them with order values.

## Source Datasets
This project leverages data from two primary sources:

1. **AdventureWorks Database**: Utilizing specific tables such as:
   - `person.address`
   - `person.stateprovince`
   - `person.countryregion`
   - `sales.creditcard`
   - `sales.customer`
   - `sales.store`
   - `person.person`
   - `production.product`
   - `production.productsubcategory`
   - `production.productcategory`
   - `sales.salesorderheader`
   - `sales.salesorderdetail`
   - Additional seed tables: `orderstatus` and `online_orders`.

2. **Mock Data via Python Script**: Generated in a Colab notebook, encompassing event data:
   - Fields: `timestamp`, `session_id`, `user_id`, `page_url`, `referrer_url`, `ip_address`, `user_agent`, `device_type`, `duration`, `country`, `order_value`.

## Solution Architecture
Our project's architecture is a sophisticated, cloud-based data processing and analytics pipeline, employing a variety of technologies for data management and visualization:

### Data Storage and Ingestion
- **PostgreSQL Database on GCP SQL**: AdventureWorks database, managed via pgAdmin.
- **Airbyte**: Replicates data from PostgreSQL to Google BigQuery, set to "incremental: append+deduped" sync mode, installed on a GCP VM.

### Data Processing and Transformation
- **BigQuery**: Primary data warehouse.
- **dbt Cloud**: Transforms data into a staging layer; constructs dimensional and fact tables.

### Orchestration
- **Kestra**: Orchestrates Airbyte syncs and dbt Cloud jobs, installed on a GCP VM.

### Visualization and Analytics
- **Omni**: For data visualization; creates a semantic model for dashboards, capable of real-time data presentation.

### Real-Time Data Handling
- **Python Script on Google Colab**: Generates mock event data, streamed into BigQuery for real-time analysis in Omni.

### Version Control
- **GitHub**: Manages all version control.

## Future Enhancements
Potential additions or improvements to the project include:
- Advanced Analytics Features
- Real-Time Data Processing
- User Interface Development
- API Integrations
- Enhanced Data Security
- Scalability Improvements
- **CI/CD Implementation**: For automated testing and deployment.

