--BANK LOAN REPORT--


                                 --KPIs

--Total_Loan_Applications
select COUNT(id) as Total_Loan_Applications from bank_loan_data
--MTD Loan Applications
select COUNT(id) as Total_Loan_Applications from bank_loan_data
where MONTH(issue_date)=12
--PMTD Loan Applications
select COUNT(id) as Total_Loan_Applications from bank_loan_data
where MONTH(issue_date)=11

--Total Funded Amount--
select SUM(loan_amount) as  Total_Funded_Amount from bank_loan_data
--MTD Total Funded Amount--
select SUM(loan_amount) as  MTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date)=12 
--PMTD Total Funded Amount--
select SUM(loan_amount) as  MTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date)=11 



--Total amount Received--
select SUM(total_payment) as MTD_Total_Amount_Received
from bank_loan_data
--MTD Total Amount Received--
select SUM(total_payment) as MTD_Total_Amount_Received
from bank_loan_data
where MONTH(issue_date)=12 
--PMTD Total Amount Received--
select SUM(total_payment) as MTD_Total_Amount_Received
from bank_loan_data
where MONTH(issue_date)=11




--Average Interest Rate
select AVG(int_rate)*100 as Avg_interest_Rate from bank_loan_data 
--MTD Average Interest--
select AVG(int_rate)*100 as MTD_Avg_Rate from bank_loan_data
where MONTH(issue_date)=12
--PMTD Average Interest
select AVG(int_rate)*100 as MTD_Avg_Rate from bank_loan_data
where MONTH(issue_date)=11




--Avg DTI--
select AVG(dti)*100 as Avg_DTI from bank_loan_data
-- MTD Avg DTI--
select AVG(dti)*100 as Avg_DTI from bank_loan_data
Where MONTH(issue_date)=12
--PMTD Avg DTI--
select AVG(dti)*100 as Avg_DTI from bank_loan_data
Where MONTH(issue_date)=11



                          --GOOD LOAN ISSUED--
--Good Loan Percentage--
select
      (count(CASE when loan_status='Fully Paid' OR loan_status='Current' then ID end) * 100.0) /  COUNT(id) AS Good_Loan_Percenatge
							 from bank_loan_data                        
--Good loan Applications--
select COUNT(id) as Good_Loan_Applications from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'
--Good Loan Funded Amount--
select sum(loan_amount) as Good_Loan_FundedAmount from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'
--Good Loan Amount Received--
select SUM(total_payment) as Good_Loan_Received_amount from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'




                           --Bad Loan Issued--
 
--Bad Loan Percentage--
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data
--Bad Loan Applications--
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'
--Bad Loan Funded Amount--
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'
--Bad Loan Amount Received--
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off'





                      --LOAN STATUS--
	SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status

		SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status


                --B.BANK LOAN REPORT--
     --MONTH--
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

          --STATE--
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state

     --TERM--
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term

       --EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

          --PURPOSE--
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose

                --HOME OWNERSHIP--
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership












