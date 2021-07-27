CREATE TABLE branch
  (
     branchno NUMBER NOT NULL,
     name     VARCHAR2(15),
     street   VARCHAR2(15),
     city     VARCHAR2(15),
     postcode VARCHAR2(8),
     PRIMARY KEY (branchno)
  );

CREATE TABLE employee
  (
     employeeno NUMBER NOT NULL,
     branchno   NUMBER,
     firstname  VARCHAR2(12),
     lastname   VARCHAR2(12),
     jobtitle   VARCHAR2(15),
     PRIMARY KEY (employeeno),
     FOREIGN KEY (branchno) REFERENCES branch(branchno) ON DELETE CASCADE
  );

CREATE TABLE room
  (
     roomno   NUMBER NOT NULL,
     branchno NUMBER NOT NULL,
     roomsize CHAR(1) DEFAULT 'S' CHECK (roomsize IN ('S', 'L')) NOT NULL,
     PRIMARY KEY (roomno),
     FOREIGN KEY (branchno) REFERENCES branch(branchno) ON DELETE CASCADE
  );

CREATE TABLE customer
  (
     customerno   NUMBER NOT NULL,
     phonenumber  VARCHAR2(10),
     emailaddress VARCHAR2(25),
     PRIMARY KEY (customerno)
  );

CREATE TABLE standardroom
  (
     roomno NUMBER NOT NULL,
     PRIMARY KEY (roomno),
     FOREIGN KEY (roomno) REFERENCES room(roomno) ON DELETE CASCADE
  );

CREATE TABLE executiveroom
  (
     roomno         NUMBER NOT NULL,
     wifiaccesscode VARCHAR2(12),
     PRIMARY KEY (roomno),
     FOREIGN KEY (roomno) REFERENCES room(roomno) ON DELETE CASCADE
  );

CREATE TABLE standardcustomer
  (
     customerno NUMBER NOT NULL,
     firstname  VARCHAR2(12),
     lastname   VARCHAR2(12),
     PRIMARY KEY (customerno),
     FOREIGN KEY (customerno) REFERENCES customer(customerno) ON DELETE CASCADE
  );

CREATE TABLE businesscustomer
  (
     customerno NUMBER NOT NULL,
     name       VARCHAR2(12),
     street     VARCHAR2(15),
     city       VARCHAR2(15),
     postcode   VARCHAR2(8),
     PRIMARY KEY (customerno),
     FOREIGN KEY (customerno) REFERENCES customer(customerno) ON DELETE CASCADE
  );

CREATE TABLE booking
  (
     customerno          NUMBER NOT NULL,
     roomno              NUMBER NOT NULL,
     branchno            NUMBER NOT NULL,
     bookingstartdate    DATE DEFAULT SYSDATE NOT NULL,
     bookingenddate      DATE DEFAULT SYSDATE NOT NULL,
     requiresdecorations CHAR(1) DEFAULT 'N' CHECK (requiresdecorations IN ('Y', 'N')),
     requiresbuffet      CHAR(1) DEFAULT 'N' CHECK (requiresbuffet IN ('Y', 'N')),
     PRIMARY KEY(customerno, roomno, branchno, bookingstartdate),
     FOREIGN KEY (customerno) REFERENCES customer(customerno) ON DELETE CASCADE,
     FOREIGN KEY (roomno) REFERENCES room(roomno),
     FOREIGN KEY (branchno) REFERENCES branch(branchno)
  );

CREATE TABLE supplier
  (
     supplierno NUMBER,
     name       VARCHAR2(12),
     street     VARCHAR2(15),
     city       VARCHAR2(15),
     postcode   VARCHAR2(8),
     PRIMARY KEY (supplierno)
  );
  
CREATE TABLE product
  (
     productno   NUMBER,
     supplierno  NUMBER,
     productname VARCHAR2(12),
     PRIMARY KEY (productno),
     FOREIGN KEY (supplierno) REFERENCES supplier(supplierno) ON DELETE CASCADE
  );
  
INSERT INTO branch VALUES
    (0, 'Oak Rooms', '5 Dune Rd.', 'Worcester', 'WR1289A');
INSERT INTO branch VALUES
    (1, 'Hyde Hall', '30 Mini St.', 'Newcastle', 'ST69JU');

INSERT INTO employee VALUES
    (0, 0, 'John', 'Smith', 'Manager');
INSERT INTO employee VALUES
    (1, 0, 'Tim', 'McDonald', 'Assistant');
INSERT INTO employee VALUES
    (2, 0, 'Heather', 'Ranger', 'HR Head');
INSERT INTO employee VALUES
    (3, 0, 'Hugh', 'Mungus', 'Entertainment');
INSERT INTO employee VALUES
    (4, 0, 'Harriet', 'OBrien', 'Bar Staff');
    
INSERT INTO employee VALUES
    (5, 1, 'Barry', 'Oxing', 'Manager');
INSERT INTO employee VALUES
    (6, 1, 'Benway', 'Jackson', 'Marketing');
INSERT INTO employee VALUES
    (7, 1, 'Clive', 'Robinson', 'HR Head');
INSERT INTO employee VALUES
    (8, 1, 'June', 'Loudon', 'Entertainment');
    
INSERT INTO room VALUES
    (0, 0, 'S');
INSERT INTO standardroom VALUES
    (0);
INSERT INTO room VALUES
    (1, 0, 'S');
INSERT INTO standardroom VALUES
    (1);
INSERT INTO room VALUES
    (2, 0, 'L');
INSERT INTO standardroom VALUES
    (2);
INSERT INTO room VALUES
    (3, 0, 'L');
INSERT INTO standardroom VALUES
    (3);
INSERT INTO room VALUES
    (4, 0, 'L');
INSERT INTO executiveroom VALUES
    (4, 'hufrzu');
INSERT INTO room VALUES
    (5, 1, 'L');
INSERT INTO standardroom VALUES
    (5);
INSERT INTO room VALUES
    (6, 1, 'S');
INSERT INTO executiveroom VALUES
    (6,'zqnpnx');
INSERT INTO room VALUES
    (7, 1, 'S');
INSERT INTO executiveroom VALUES
    (7,'wtrzobhuf');
INSERT INTO room VALUES
    (8, 1, 'L');
INSERT INTO standardroom VALUES
    (8);
INSERT INTO room VALUES
    (9, 1, 'S');
INSERT INTO executiveroom VALUES
    (9,'afdtul');
INSERT INTO room VALUES
    (10, 1, 'S');
INSERT INTO executiveroom VALUES
    (10,'uwlpanm');
INSERT INTO room VALUES
    (11, 1, 'L');
INSERT INTO executiveroom VALUES
    (11,'mkuqzq');
INSERT INTO room VALUES
    (12, 1, 'L');
INSERT INTO standardroom VALUES
    (12);
INSERT INTO room VALUES
    (13, 1, 'L');
INSERT INTO executiveroom VALUES
    (13,'wynlquosx');
INSERT INTO room VALUES
    (14, 1, 'L');
INSERT INTO executiveroom VALUES
    (14,'cygtamxgt');
INSERT INTO room VALUES
    (15, 1, 'S');
INSERT INTO standardroom VALUES
    (15);
INSERT INTO room VALUES
    (16, 1, 'L');
INSERT INTO standardroom VALUES
    (16);
INSERT INTO room VALUES
    (17, 1, 'S');
INSERT INTO executiveroom VALUES
    (17,'tqzbpx');
INSERT INTO room VALUES
    (18, 1, 'L');
INSERT INTO executiveroom VALUES
    (18,'pudbbvosz');
INSERT INTO room VALUES
    (19, 1, 'L');
INSERT INTO standardroom VALUES
    (19);
INSERT INTO room VALUES
    (20, 1, 'S');
INSERT INTO standardroom VALUES
    (20);
INSERT INTO room VALUES
    (21, 1, 'S');
INSERT INTO standardroom VALUES
    (21);
INSERT INTO room VALUES
    (22, 1, 'L');
INSERT INTO executiveroom VALUES
    (22,'actkulkub');
INSERT INTO room VALUES
    (23, 1, 'S');
INSERT INTO executiveroom VALUES
    (23,'tshazqwlgp');
INSERT INTO room VALUES
    (24, 1, 'L');
INSERT INTO standardroom VALUES
    (24);
INSERT INTO room VALUES
    (25, 1, 'L');
INSERT INTO standardroom VALUES
    (25);
INSERT INTO room VALUES
    (26, 1, 'L');
INSERT INTO executiveroom VALUES
    (26,'njdcebnul');
INSERT INTO room VALUES
    (27, 1, 'L');
INSERT INTO standardroom VALUES
    (27);
INSERT INTO room VALUES
    (28, 1, 'L');
INSERT INTO standardroom VALUES
    (28);
INSERT INTO room VALUES
    (29, 1, 'S');
INSERT INTO standardroom VALUES
    (29);
INSERT INTO room VALUES
    (30, 1, 'S');
INSERT INTO standardroom VALUES
    (30);
INSERT INTO room VALUES
    (31, 1, 'S');
INSERT INTO executiveroom VALUES
    (31,'cjuftpp');
INSERT INTO room VALUES
    (32, 1, 'L');
INSERT INTO executiveroom VALUES
    (32,'sscpxrgv');
INSERT INTO room VALUES
    (33, 1, 'L');
INSERT INTO executiveroom VALUES
    (33,'pahxyki');
INSERT INTO room VALUES
    (34, 1, 'S');
INSERT INTO standardroom VALUES
    (34);
INSERT INTO room VALUES
    (35, 1, 'S');
INSERT INTO executiveroom VALUES
    (35,'exewsvpi');
INSERT INTO room VALUES
    (36, 1, 'S');
INSERT INTO standardroom VALUES
    (36);
INSERT INTO room VALUES
    (37, 1, 'L');
INSERT INTO standardroom VALUES
    (37);
INSERT INTO room VALUES
    (38, 1, 'L');
INSERT INTO executiveroom VALUES
    (38,'aezowtm');
INSERT INTO room VALUES
    (39, 1, 'L');
INSERT INTO standardroom VALUES
    (39);

INSERT INTO customer VALUES
    (0, '0123456789', 'jake78@email.com');
INSERT INTO standardcustomer VALUES
    (0, 'Jake', 'Johnston');
INSERT INTO customer VALUES
    (1, '0734562891', 'marshy8@email.com');
INSERT INTO standardcustomer VALUES
    (1, 'Blaine', 'Marsh');
INSERT INTO customer VALUES
    (2, '0734567891', 'support@danceinc.com');
INSERT INTO businesscustomer VALUES
    (2, 'Dance Inc.', '1 Boom St.', 'Manchester', 'M11DB');
INSERT INTO customer VALUES
    (3, '0734567891', 'help@banana.com');
INSERT INTO businesscustomer VALUES
    (3, 'Banana Books', '9 Pole Close.', 'Birmingham', 'B11BD');
     
INSERT INTO booking VALUES
    (2, 22, 1, TO_DATE('01/09/21', 'DD/MM/YY'), TO_DATE('02/09/21', 'DD/MM/YY'), 'N', 'Y');
INSERT INTO booking VALUES
    (0, 1, 0, TO_DATE('20/05/21', 'DD/MM/YY'), TO_DATE('20/05/21', 'DD/MM/YY'), 'Y', 'N');
INSERT INTO booking VALUES
    (1, 30, 1, TO_DATE('15/07/21', 'DD/MM/YY'), TO_DATE('15/07/21', 'DD/MM/YY'), 'N', 'N');
  
INSERT INTO supplier VALUES
	(0, 'Smith Co.', '1 King St.', 'Worcester', 'WR11BM');
INSERT INTO supplier VALUES
	(1, 'Jones Shop', '20 Block St.', 'Newcastle', 'ST53PQ');
INSERT INTO supplier VALUES
	(2, 'Grub n Go', '3 Frame Rd.', 'Newcastle', 'ST57HI');
 
INSERT INTO product VALUES
	(0, 0, 'Apple');
INSERT INTO product VALUES
	(1, 0, 'Banana');
INSERT INTO product VALUES
	(2, 0, 'Pear');
INSERT INTO product VALUES
	(3, 0, 'Pineapple');
INSERT INTO product VALUES
	(4, 0, 'Cherry');
INSERT INTO product VALUES
	(5, 1, 'Balloons');
INSERT INTO product VALUES
	(6, 1, 'Confetti');
INSERT INTO product VALUES
	(7, 1, 'Party Popper');
INSERT INTO product VALUES
	(8, 2, 'Popcorn');
INSERT INTO product VALUES
	(9, 2, 'Coke');
	
CREATE OR REPLACE TRIGGER room_added
	BEFORE INSERT OR DELETE ON room FOR EACH ROW    
DECLARE
	room_count NUMBER;
BEGIN
	SELECT COUNT(roomno)
	INTO   room_count
	FROM   room
	WHERE  branchno = :new.branchno;
	-- Add room cap of 35
	IF INSERTING AND room_count >= 35 THEN
		raise_application_error(-20000, 'Cannot add more than 35 rooms to branch.');
	END IF;
	-- Add min room cap of 5
	IF DELETING AND room_count <= 5 THEN
		raise_application_error(-20000, 'Cannot have less than 5 rooms to branch.');
	END IF;
END;