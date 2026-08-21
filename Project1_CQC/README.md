# Project 1 — The Care Home Crisis
## Analysing CQC Care Home Ratings Across England

### Overview
This project analyses 13,585 rated care homes across England using real data 
from the Care Quality Commission (CQC), published August 2026. The analysis 
investigates rating distributions nationally, regionally and locally — with a 
specific focus on West Sussex where I work as a care professional.

### Tools Used
- Python (Pandas) — Data loading, cleaning and preparation
- MySQL — Business question analysis
- Matplotlib — Data visualisation

### Data Source
Care Quality Commission — Care Directory with Filters (August 2026)
cqc.org.uk/about-us/transparency/using-cqc-data

### Data Journey
| Stage | Count |
|---|---|
| Raw CQC locations | 57,009 |
| Active care homes only | 14,789 |
| Rated care homes (final) | 13,585 |

### Key Findings

**1. Only 4.5% of care homes achieve Outstanding nationally**
The vast majority (78.1%) are rated Good — suggesting the sector 
performs adequately but rarely exceptionally.

**2. East Midlands leads for Outstanding ratings (6.5%)**
Despite London's size and resources, it ranks lowest for Outstanding 
proportion at just 2.6% — a significant regional disparity.

**3. West Sussex performs above national average for Good ratings (80.1% vs 78.1%)**
Notably, West Sussex has zero Inadequate care homes — better than the 
national average of 0.7%.

**4. Kent accounts for 10% of all Inadequate homes nationally**
With 10 out of 100 Inadequate homes concentrated in one county — 
this represents a significant local challenge requiring targeted intervention.

**5. Residential homes outnumber nursing homes 2:1**
9,530 residential-only homes vs 4,035 nursing-only homes — 
yet nursing homes achieve a higher Outstanding rate (6.4% vs 4.4%).

### Business Relevance
These findings directly inform GoldCare Connect's market strategy:
- Target regions with high Requires Improvement rates — these homes 
  need better workforce management most urgently
- West Sussex represents a strong starting market — above average 
  performance suggests professional, quality-focused operators

### Files
- `Project1_CQC_Preparation.ipynb` — Data cleaning and visualisation
- `Project1_CQC_Analysis.sql` — SQL business questions
- `cqc_rated_carehomes.csv` — Cleaned dataset (13,585 rows)
