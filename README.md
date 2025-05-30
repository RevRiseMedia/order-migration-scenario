# Order Schema Migration - Interview Repository

## Overview

This repository contains a technical interview scenario focused on demonstrating your ability to digest schemas, understand scope, highlight issues and explore solutions. 

Within `migrations/current` you'll find the scenario schema. You're tasked with:

- Highlighting the issues you see present in this schema.
- Creating a migration script to fix the issues present (to the best of your ability).
- Outline your deployment strategy.

This task is intentionally open-ended. You will be evaluated based on your ability to demonstrate expertise and understanding.

## Considerations
1. Orders are recreated daily based on their latest order state
2. Orders are only recreated if balance is greater than order amount
3. Orders reference their first ancestor via order_ref for lineage based reporting

Please list any assumptions you've made outside of these considerations when detailing your final solution.

## Technical Requirements
### Languages & Tools
- PostgreSQL 15+ (target databases)
- Docker & Docker Compose

### Key Challenges
1. **Data Transformation**: Follow normalization best-practices
2. **Consistency**: Ensure data integrity
3. **Idempotency**: Support re-running migrations safely
4. **Performance**: Assume large data volumes and handle efficiently
5. **Minimize Downtime**: Solutions should prioritize minimizing downtime (if unavoidable).

## Repository Structure

```
├── docker-compose.yml         # Database containers setup
├── scenario/
│   ├── current/               # The current scenario schema
│   ├── proposed/              # Your proposed migrations, updates, etc... This is your working area
│   ├── data-issues.sql        # Data issues rubric (encrypted)
│   └── sample-data.sql        # Very simple sample data used to seed the database
```

## Getting Started
### Prerequisites
- Docker and Docker Compose
- Git

### Setup
1. Clone the repository:
```bash
git clone https://github.com/RevRiseMedia/order-migration-scenario
cd order-migration-scenario
```

2. Start the databases:
```bash
docker-compose up -d
```

3. Connect to the database (Or how you prefer)
```bash
docker run --network migration-network -it --rm dencold/pgcli postgresql://postgres:postgrespassword@service-db:5432/order_migration
```

**NOTE**: The docker container does not persist any data. You may restart the container to clear state as needed.

## Evaluation Criteria
- Issue inference and solution proposition
- Error handling and edge cases
- Performance considerations
- Database transaction management
- Code quality and organization
- Testing and validation approach
- Documentation and comments

## Additional Considerations
- How would you handle schema changes during migration?
- What strategies would you use for zero-downtime migration?
- How would you validate data consistency post-migration?
- What monitoring would you implement?

This is your opportunity to demonstrate your experience and expertise. Please provide any feedback or insight you feel is relevant to the scope of this scenario.

## License
This is an interview exercise repository. Not for production use. All rights reserved.