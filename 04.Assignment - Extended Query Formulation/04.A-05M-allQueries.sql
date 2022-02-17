-- 1
SELECT EventNo, DateHeld, CUSTOMER.CustNo, CustName,
               FACILITY.FacNo, FacName
  FROM EVENTREQUEST INNER JOIN CUSTOMER
        ON EVENTREQUEST.CustNo = CUSTOMER.CustNo 
              INNER JOIN FACILITY ON EVENTREQUEST.FacNo = FACILITY.FacNo
  WHERE City = 'Boulder' 
        AND DateHeld BETWEEN '2018-01-01' AND '2018-12-31';
        
        
-- 2
SELECT CUSTOMER.CustNo, CustName, EventNo, 
               DateHeld, FACILITY.FacNo, FacName, EstCost/EstAudience AS AudCost
  FROM EVENTREQUEST, CUSTOMER, FACILITY
  WHERE DateHeld BETWEEN '2018-01-01' AND '2018-12-31' 
        AND EstCost/EstAudience < 0.2
        AND EVENTREQUEST.CustNo = CUSTOMER.CustNo 
        AND EVENTREQUEST.FacNo = FACILITY.FacNo;

-- 3
SELECT CUSTOMER.CustNo, CustName, SUM(EstCost) AS TotEstCost
  FROM EVENTREQUEST, CUSTOMER
  WHERE Status = 'Approved'
        AND EVENTREQUEST.CustNo = CUSTOMER.CustNo
  GROUP BY CUSTOMER.CustNo, CustName;

-- 4
INSERT INTO CUSTOMER
  (CustNo, CustName, Address, Internal, Contact, Phone, City, State, Zip)
VALUES ('C1234567', 'Murali Krishna', '18 18 VK STREET', 'Y', 'Self', '987654321',
               'Dallas', 'TX', '80805');
			
-- 5
SET SQL_SAFE_UPDATES = 0;

UPDATE RESOURCETBL
  SET Rate = Rate * 1.1 
  WHERE ResName = 'nurse';
  
SET SQL_SAFE_UPDATES = 1;

-- 6
DELETE FROM CUSTOMER
  WHERE CustNo = 'C1234567';