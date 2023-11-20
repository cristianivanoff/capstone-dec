# Data Engineering Camp Capstone Project

## Objective
This project serves as the capstone project for the 16-week training program at the [Data Engineering Camp](https://dataengineercamp.com/). It is designed to test and demonstrate the practical application and integration of various data engineering technologies and concepts learned during the course. 

While the camp included training on technologies like Airflow for orchestration, this project uniquely incorporates [Kestra](https://kestra.io/) as an alternative tool to explore its capabilities. This choice exemplifies the project's commitment to not only applying learned concepts but also exploring new, potentially more effective solutions in the field of data engineering. 

A primary focus was to explore the implementation of CI/CD (Continuous Integration/Continuous Deployment) practices. However, due to time constraints, the full integration of CI/CD was not completed, highlighting the realistic challenges of project time management.

Another significant aspect of this project was the exploration and utilization of [Omni](https://omni.co/), a cutting-edge BI tool, for creating a semantic layer and developing interactive dashboards. This allowed me to test Omni's capabilities in creating comprehensive visualizations and aiding in data-driven decision-making, reflecting my commitment to evaluating and leveraging the best tools available in the industry.

Key areas of focus include:

- **Docker**: An open platform for developing, shipping, and running applications. Docker enables the creation of isolated environments (containers) that can run applications and their dependencies consistently across various computing environments.
- **PostgreSQL Database**: A powerful, open-source object-relational database system known for its reliability, robustness, and performance. PostgreSQL is used for storing and managing structured data.
- **Airbyte**: An open-source data integration tool used for replicating data from various sources to data warehouses. It enables efficient and reliable data extraction and loading, supporting incremental data syncs.
- **Kestra**: A modern orchestration tool designed to handle complex workflows. Kestra facilitates the automation and scheduling of data pipelines, enhancing the manageability of data processing tasks.
- **Real-Time Data Processing**: The capability to process data immediately as it becomes available, enabling timely insights and decision-making. This concept is critical in handling streaming data and delivering up-to-date analytics.
- **Omni**: A sophisticated BI tool used for creating a semantic layer and interactive dashboards, enabling powerful data visualization and analytics.

This capstone project aims to encapsulate the learnings from the camp, showcasing the ability to design, implement, and manage a comprehensive data engineering solution.

## Consumers
The primary audience for this project includes fellow students participating in the Data Engineering Camp, as well as anyone with an interest in data engineering. This project serves as a practical example and a learning resource, showcasing the application of various data engineering concepts and technologies. It is particularly useful for those looking to understand how different data engineering tools can be integrated into a cohesive workflow and for individuals seeking insights into modern data engineering practices.

## Business Questions
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
The diagram belows gives you an overview of this projects architecture.

![DataEngineering_3](https://github.com/cristianivanoff/capstone-dec/assets/72450060/8c765ae0-c7c2-4856-9122-790eaa0190cb)

My project's architecture is a sophisticated, cloud-based data processing and analytics pipeline, employing a variety of technologies for data management and visualization:

### Data Storage and Ingestion
- **PostgreSQL Database on GCP SQL**: AdventureWorks database, managed via pgAdmin.
  This is the ER-diagram from [w3resource](https://www.w3resource.com/sql-exercises/adventureworks/sql-adventureworks-sales-schema.php) showing the realtions between the sales tables.
  ![Skärmavbild 2023-11-20 kl  17 30 23](https://github.com/cristianivanoff/capstone-dec/assets/72450060/b32af3f4-cf85-4ae2-946d-943733864f2f)

   The database is installed on GCP SQL. Google Cloud SQL is a fully-managed database service that makes it easy to set-up, maintain, manage and administer your relational MySQL, PostgreSQL, and SQL Server databases in the cloud. Hosted on Google Cloud Platform, Cloud SQL provides a database infrastructure for applications running anywhere.

   ![Skärmavbild 2023-11-20 kl  19 45 25](https://github.com/cristianivanoff/capstone-dec/assets/72450060/93b369e2-7042-4da8-b5e0-23d0da937827)

   ![Skärmavbild 2023-11-20 kl  19 46 09](https://github.com/cristianivanoff/capstone-dec/assets/72450060/11ef6291-04e4-4c9c-afcd-fe5a78ac2f70)

   The database is managed through PGAdmin and data was restored into the database.

   ![Skärmavbild 2023-11-20 kl  19 50 43](https://github.com/cristianivanoff/capstone-dec/assets/72450060/3d04dac9-134e-4253-b462-43939f940423)

- **Airbyte**: Replicates data from PostgreSQL to Google BigQuery, set to "incremental: append+deduped" sync mode, installed on a virtual machine on GCP Compute.
  ![Skärmavbild 2023-11-20 kl  17 37 32](https://github.com/cristianivanoff/capstone-dec/assets/72450060/0c891914-121b-47ab-afaa-b88ac2a64098)

  Two connections are created in Airbyte but only one is used - the connection to BigQuery.
   ![Skärmavbild 2023-11-20 kl  17 35 44](https://github.com/cristianivanoff/capstone-dec/assets/72450060/e89dfd56-621c-40d5-b5b6-5fd0cefa9f69)

   One source is created to connect to the Adventureworks source database.
   ![Skärmavbild 2023-11-20 kl  17 35 53](https://github.com/cristianivanoff/capstone-dec/assets/72450060/11829593-4ea7-42c8-9725-8cc64270f288)

   The connection Postgres -> BigQuery have all active streams.

   ![Skärmavbild 2023-11-20 kl  19 56 16](https://github.com/cristianivanoff/capstone-dec/assets/72450060/f973a772-2793-4dc8-a45c-5cfe91de4aad)

### Data Processing and Transformation
- **BigQuery**: Primary data warehouse.
  ![Skärmavbild 2023-11-20 kl  20 00 46](https://github.com/cristianivanoff/capstone-dec/assets/72450060/005b7d85-b6e5-4c6a-aec6-3ec2e96022b4)

- **dbt Cloud**: In this phase of the project, data undergoes crucial processing and transformation steps to make it suitable for analysis.
   - *The transformation process* includes staging layers and the creation of dimensional and fact tables.
   - *YAML Files* for Testing and Contracts: Each table has an associated YAML file that defines tests and contracts, ensuring data quality and integrity.
   - *Potential Enhancements:* While the current setup effectively handles the data transformation needs, there are areas identified for potential enhancement. These include the implementation of snapshots to track historical changes over time, and the use of advanced window functions for more sophisticated analysis. However, due to limited time, these enhancements were not fully explored in the current iteration of the project.
  These processing and transformation steps are critical for turning raw data into actionable insights and form the backbone of any data-driven decision-making process.
  
   ![Skärmavbild 2023-11-20 kl  20 04 42](https://github.com/cristianivanoff/capstone-dec/assets/72450060/7c47dab1-decf-4f82-854b-57ac2f4267bc)
  
   ![Skärmavbild 2023-11-20 kl  20 05 58](https://github.com/cristianivanoff/capstone-dec/assets/72450060/efb051ab-093c-496d-9322-3c97bfe9cc5f)

   A simplyfied diagram of the sales mart:
  
  ![DataEngineering_sales_mart](https://github.com/cristianivanoff/capstone-dec/assets/72450060/c0170ce1-c032-44fd-9cb1-368d5fe8d954)

### Orchestration
- **Kestra**: Orchestrates Airbyte syncs and dbt Cloud jobs, installed on a virtual machine on GCP Compute.
  
![Skärmavbild 2023-11-20 kl  20 33 19](https://github.com/cristianivanoff/capstone-dec/assets/72450060/04820be3-e80f-4565-9ced-d9a11e256c6b)

Statistics on GCP Compute dashboard
![Skärmavbild 2023-11-20 kl  20 35 06](https://github.com/cristianivanoff/capstone-dec/assets/72450060/90bd0adb-555d-44a7-8b4c-91de487ed24e)


### Visualization and Analytics
- **Omni**: For data visualization; creates a semantic model for dashboards, capable of real-time data presentation.
  View files contain view configuration, fields (dimensions and measures), relationships, and query definition (if the view is based upon a query in Omni rather than a database table).
  ![Skärmavbild 2023-11-20 kl  20 37 30](https://github.com/cristianivanoff/capstone-dec/assets/72450060/fa2f5771-4bd6-467c-b724-76f171b19b4c)

  Relationships describe how tables join together in SQL, and allow querying with dimensions and measures in different tables from the workbook UI. Relationships are all stored in a single model file
  
   ![Skärmavbild 2023-11-20 kl  20 37 19](https://github.com/cristianivanoff/capstone-dec/assets/72450060/04b36844-c849-4945-aa00-4281f8ca9504)

  Topics enable the curation of self serve querying in Omni. Topics allow the curation of tables and join paths for a specific database view.
  Once defined, Topics will be displayed in the Workbook view.

   Topics are a declaration of desired base tables, and any associated tables that can be joined for analysis. By default, Omni will add all non-fanout tables that are joinable to a topic (ie. tables with many_to_one or one_to_one relationships to another table). The list of joinable tables can also be curated, both to remove joins generated by default or to force in tables that would fan out the base table (ie. many_to_many or one_to_many joins).
  
   ![Skärmavbild 2023-11-20 kl  20 37 09](https://github.com/cristianivanoff/capstone-dec/assets/72450060/498c4575-037a-427f-b659-c93ce35c67e7)

   Omni's workbook UI is focused on asking any question of both modeled and un-modeled data in your databases. Each workbook contains one or more tabs, where data can be queried either using a UI-driven pivot-table experience or by writing SQL.

   The URL will update with each user action, allowing easy back and forward motions in your browser, and instant shareability of results (across all of the tabs in your workbook). The URL is structured such that each tab is encoded individually, for easy portability. The URL structure will contain a reference to each tab, and a final reference to the active tab.
   ![Skärmavbild 2023-11-20 kl  20 43 13](https://github.com/cristianivanoff/capstone-dec/assets/72450060/0dfc0d33-9d50-4fa8-886a-a317c2f72efc)

  The dashboard created:
  
   ![Skärmavbild 2023-11-20 kl  20 36 43](https://github.com/cristianivanoff/capstone-dec/assets/72450060/bcbe988c-3184-4885-9796-f8979fd65e96)

  
   ![Skärmavbild 2023-11-20 kl  20 36 53](https://github.com/cristianivanoff/capstone-dec/assets/72450060/969f6e80-9fab-4d2c-b58e-794246691f3e)


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

