# Project 3 — Agency vs Platform: The Cost Analysis
## Quantifying the Financial Case for GoldCare Connect

### Overview
This project analyses the financial cost of agency staffing dependency in UK care homes 
using real workforce data from Skills for Care (2024/25). The analysis builds a 
cost comparison model showing how much care homes could save by switching from 
traditional agency staffing to a platform model like GoldCare Connect.

### Tools Used
- Python (Pandas, NumPy) — Data modelling and analysis
- Matplotlib — Data visualisation

### Data Source
Skills for Care — State of the Adult Social Care Sector and Workforce in England 2024/25
Statistical Appendix (MS Excel)
skillsforcare.org.uk

### Key Assumptions
| Assumption | Value | Source |
|---|---|---|
| Agency staff premium | 30% above direct rate | Industry standard |
| Average care home staff | 35 | Skills for Care |
| Care worker turnover rate | 29.7% | Skills for Care 2024/25 |
| Shifts needed per leaver | 8 | Industry estimate |
| Shift length | 8 hours | Standard shift |
| GoldCare Connect monthly fee | £199 | GoldCare Connect pricing |
| GoldCare Connect shift fee | £2.50 per booking | GoldCare Connect pricing |
| Total rated care homes | 13,585 | CQC August 2026 (Project 1) |
**Note on regional data:** Regional turnover and vacancy rates use 
'Direct Care' category figures as care worker-specific regional 
breakdowns are not published in the Skills for Care statistical 
appendix. Direct Care includes care workers, senior care workers 
and community support staff. National care worker turnover (29.7%) 
is used for the per care home calculation. Regional filled post 
figures use care worker specific data from Sheet 6.2.

### Key Findings

**1. Care homes are haemorrhaging staff — 29.7% of care workers leave annually**
With nearly 1 in 3 care workers leaving every year — care homes face a constant 
cycle of recruitment and temporary cover. This drives direct dependency on expensive 
agency staffing to fill gaps.

**2. The average care home spends £10,144 per year on agency cover**
Based on 35 staff, 29.7% turnover and 30% agency premium above direct pay rates — 
a typical care home spends over £10,000 annually just covering staff who have left.

**3. GoldCare Connect reduces that cost to £2,588 — a 74.5% saving**
By replacing agency bookings with direct platform-matched shifts — the same care 
home pays just £2,588 annually — saving £7,556 per year.

**4. Nationally — the potential saving is over £102 million per year**
If all 13,585 rated care homes in England switched to GoldCare Connect — the sector 
would save £102,648,260 annually — equivalent to £281,228 every single day.

**5. South East faces the highest agency burden**
With 131,000 care workers and a 27.2% turnover rate — the South East has the 
highest estimated agency spend of any region at £36.5 million annually.

### Business Relevance
This analysis directly validates GoldCare Connect's market opportunity:
- The problem is real — £137.8 million in annual agency spend nationally ✅
- The saving is significant — 74.5% per care home ✅
- The market is large — 13,585 care homes nationally ✅
- The case is data-driven — based on official Skills for Care figures ✅

### Important Note
Agency cost estimates are modelled using published turnover rates and industry-standard 
agency premiums. Actual agency spend will vary by care home size, location and 
staffing model. This analysis represents a conservative estimate based on direct 
care worker roles only.

### Connection To Portfolio
This project uses CQC care home count data (13,585) from Project 1 — demonstrating 
how data from multiple sources can be combined to build a business case.

### Files
- `Project3_Cost_Analysis.ipynb` — Full analysis notebook
- Charts saved as PNG files
