# Banking Loan Portfolio Analytics

### Business Analysis | Data Analysis | Process Improvement | Power BI

An independent portfolio simulation exploring how a fictional bank could reduce avoidable waiting between personal loan submission and decision while preserving underwriting controls and visibility into unfinished work.

**Tools:** Excel, SQLite / SQL, Python (VS Code), Power BI, business process mapping, requirements analysis, and user acceptance test design.

> **Project disclosure:** This is a fictional banking scenario using synthetically generated data. It is not an employer engagement. All business improvements are recommendations for future testing, not changes implemented or benefits achieved.

## 1. Business Problem

Loan processing teams need to understand where time accumulates, which applications are waiting, how channels and branches compare, and whether missing documents correlate with longer decision times.

**Business question:** How could a bank reduce avoidable loan processing delays while maintaining accurate reviews and oversight of open cases?

## 2. Scope and Dataset

The analysis covers 600 fictional unsecured personal loan applications submitted from **January 1 through March 31, 2026**, with a reporting snapshot dated **March 31, 2026**.

A deterministic Python generator (seed `20261016`) produced the underlying sample. The export contained 612 rows; data cleaning removed **12 exact duplicate rows**, standardized **18 inconsistent channel labels**, and confirmed 600 unique application IDs.

**Important:** The **7 calendar day** decision target is a project assumption, not a regulatory or real bank service level agreement.

## 3. Power BI Executive Dashboard

The interactive dashboard includes four headline KPIs, a loan status distribution, application volume by month, decision time by channel, queue time by branch, and can be extended with separate channel and status slicers.

| Dashboard KPI | Result |
| --- | ---: |
| Loan applications | **600** |
| Total requested amount | **$16.12M** |
| Applications with a decision | **505** |
| Approved | **366** |
| Declined | **139** |
| Open | **61** |
| Withdrawn | **34** |
| Approval rate among decided cases | **72.48%** |
| Average decision time among decided cases | **8.54 days** |

**Approval rate definition:** `Approved / (Approved + Declined) = 366 / 505 = 72.48%`. Open and withdrawn applications are excluded from the approval rate denominator.

**Screenshot:** Add an exported full page image of the finished Power BI report here when publishing the repository.

## 4. Additional Process Metrics

| Metric | Result |
| --- | ---: |
| Median decision time | 8.00 days |
| 90th percentile decision time | 14.00 days |
| Decisions completed within 7 calendar days | 43.0% |
| Missing documents at intake | 34.8% |
| Open applications older than 7 days | 8 |

Decision days are calculated only for applications with an Approved or Declined outcome. Open case aging is calculated separately as of the March 31, 2026 snapshot.

## 5. Findings

### Review queue is the longest stage

Among completed applications, the average time spent in each stage was:

| Process stage | Average calendar days |
| --- | ---: |
| Document collection | 2.61 |
| Waiting in review queue | **3.92** |
| Review start to decision | 2.02 |
| **Total decision time** | **8.54** |

The review queue accounts for the largest share of elapsed decision time. This suggests an area to investigate for work ownership, routing, and capacity, but does not identify a proven root cause.

### Incomplete intake is associated with longer decisions

Applications missing documents at intake averaged **12.20 days** to a decision, compared with **6.97 days** for complete applications. The gap is approximately **5.24 days**.

This is an association within synthetic data, not evidence that document incompleteness caused the difference in any real institution.

### Branch and channel differences merit follow up

Branch applications averaged **9.14 decision days**, compared with **7.80** for online applications. In the dashboard, fictional branch **B03** had the highest average queue time, about **5.68 days**. These patterns suggest where to focus deeper operational analysis.

### Backlog should not be ignored

The snapshot has **61 open applications** and **8** open cases older than 7 days. Monitoring only completed decisions can hide delayed unfinished cases.

## 6. Business Analysis Deliverables

The proposed future state includes:

1. A versioned document checklist at intake to reduce avoidable resubmissions.
2. An explicit document readiness milestone before queue entry.
3. A designated review queue owner and an aging escalation process.
4. Underwriting decisions recorded only by authorized users.
5. KPI monitoring for mean, median, p90, on time decisions, open aging, withdrawals, and control exceptions.

Requirements were organized with MoSCoW prioritization and linked to suggested acceptance criteria and UAT scenarios. One example tests whether an open case aged 8 days is flagged when the aging threshold is 7 days, while a 7 day old open case and a withdrawn case are not flagged.

These are **proposed designs**, not implemented production changes, approved requirements, or completed stakeholder UAT.

## 7. Proposed Pilot and Success Criteria

A possible **8 week pilot** would evaluate the intake and queue changes using comparable application cohorts, ideally including a concurrent comparison group.

| Planning metric | Synthetic baseline | Proposed target |
| --- | ---: | ---: |
| Mean decision time | 8.54 days | About **7.26 days** (15% lower) |
| Missing document intake rate | 34.8% | **25% or less** |

Targets are hypotheses for a future pilot, not observed outcomes. Before attributing changes, the pilot should consider application complexity, channel mix, staffing, and seasonality. Faster decisions should not be accompanied by increasing open backlog, customer complaints, security issues, or audit exceptions.

## 8. Analytical Workflow

1. **Python:** Generate a reproducible synthetic dataset and supporting analysis inputs.
2. **SQL / SQLite:** Deduplicate export rows, normalize channel values, validate IDs and dates, calculate metrics, and compare cohorts.
3. **Excel:** Build an analysis workbook with application level calculations and summary tables.
4. **Business Analysis:** Draft current and future process flows, stakeholder considerations, requirements, user stories, and UAT cases.
5. **Power BI:** Build an interactive report with four headline KPI cards, four visual comparisons, and optional channel and status slicers.

## 9. Portfolio Materials

The broader project work includes a banking case study, Excel analysis workbook, SQL and data preparation work, and proposed future process mapping. For a public GitHub repository, upload only the artifacts you want to share and verify that the paths and screenshots match the files you upload.

Suggested folders if you organize the repository:

```text
banking-loan-portfolio-analytics/
    README.md
    data/
    sql/
    python/
    excel/
    business-analysis/
    power-bi/
    screenshots/
```

The folders above are a suggested organization, not a claim that they already exist.

## 10. Limitations

The data are fictional and the generator encodes some relationships, including longer document delays for incomplete intake and additional queue waiting for one branch. Outcome statuses were randomly assigned. The dataset does not measure staff labor, customer experience, underwriting complexity, business calendar timing, or actual institutional outcomes.

Consequently, findings are demonstrations of analysis and prioritization, not industry benchmarks or proof of causation. No cost savings, time savings, or process improvement has been achieved or validated in a live system.

## 11. Project Takeaway

This project combines **data cleaning, SQL analysis, dashboard development, process evaluation, requirements design, and KPI definition** into a single banking operations case study. Its value is the ability to explain a business problem, calculate consistent metrics, identify investigative priorities, design testable requirements, and propose a way to evaluate potential changes responsibly.
