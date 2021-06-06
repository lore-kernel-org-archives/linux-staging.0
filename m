Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23CD2FAE
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 16:14:03 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c9so5901920wrt.5
        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 09:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wCKzdTUBcEckPFJ6tCyq+0WMKdSLXvUClxpGrOdPjoI=;
        b=NiFfO9XHUYv6VwU6Q5NbR5mNSJUP/LSq2BfVmrSmX6v3WRq5ik+4iPseOEszLFDKcH
         ya0xDAY/HWiGbNqMcm1VzFiqKTZQd10lMP/mttHix4IUkmr5Uga6EH8RMi+Igr+djzdb
         NGs7xWyXV4WZupLHQkW2bznJaAB2oku5+Sv4WDQRx6YkR4IQifrC8uw/9rganrLfvbqa
         X9LDYfjYBUIpIKkBVAzVHxrvUYhZ0oKw8a+q330eD+p6KQw3NFun/yMbNmni/8W+mtEC
         rYwXxSPgydUCKqZpkOF62zpo3rOl62MTqxCqcoyLNEPKP8atBaAkzCKzeXGP+g3n53ya
         XA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wCKzdTUBcEckPFJ6tCyq+0WMKdSLXvUClxpGrOdPjoI=;
        b=X12+BGxPNAqugbYwyBcDKzEt2r2S7pQT18kgFNl+GU1qvSZlq10wiw9NdPQ7nX8h8A
         m2N40+g3yirCESbDmTgTYx9hAgXsi4SNo3bfVUoeYDFO5zI8Ko8Hg8V42F4bkgsrQFN3
         JnGfkGYUlU1iBjeEuipjGzVKzGE8Gh+ta53F4pZcqnJzaJ8iP/4/+wTiPb03CZ2sACMo
         NOPd4eLZPWGgqiwwyARwOoRf9D4YWF4GTftyGRWer9EJHU2hnNERPVsy8s4ui8lToAQC
         QLwyxP5nwUaar7EjgMtEhuKzV+xktcYDf0KGaXij8zqj4d40nIaBvZWZzD6BARw6jFpy
         KpdQ==
X-Gm-Message-State: AOAM531bOULXZu8JGqYpvzA+VMFsQCA/uiosoDCBcIHwpQw6J1n0COsx
	pithNEGOCkf1Qb62BMhPib/k29woio2+wA==
X-Google-Smtp-Source: ABdhPJz7X3euApxEMj8lAk1v1kTD2rTNyM768AXvjwNwKjR+g+9v8Yr0srIl867c6O5ADbpG6Gcjyw==
X-Received: by 2002:adf:8b91:: with SMTP id o17mr13060062wra.385.1622996042051;
        Sun, 06 Jun 2021 09:14:02 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id n9sm11724427wmc.20.2021.06.06.09.14.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Jun 2021 09:14:01 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH v2 1/6] staging: mt7621-pci: make cleaner 'mt7621_pcie_enable_ports'
Date: Sun,  6 Jun 2021 18:13:53 +0200
Message-Id: <20210606161358.7114-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
References: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function 'mt7621_pcie_enable_ports' call 'mt7621_pcie_enable_port'
for each available pcie port. Instead of having two for loops
there just move needed initialization. There is one setting
that can be removed which is the set for 'PCI_COMMAND_MASTER'
bit. Pci drivers are in charge of set that bit if it is really
needed and should be not a mission of the controller to do that.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index fe1945819d25..c14fc48e74fc 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -499,15 +499,18 @@ static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
 	/* configure class code and revision ID */
 	pcie_write(pcie, PCIE_CLASS_CODE | PCIE_REVISION_ID,
 		   offset + RALINK_PCI_CLASS);
+
+	/* configure RC FTS number to 250 when it leaves L0s */
+	val = read_config(pcie, slot, PCIE_FTS_NUM);
+	val &= ~PCIE_FTS_NUM_MASK;
+	val |= PCIE_FTS_NUM_L0(0x50);
+	write_config(pcie, slot, PCIE_FTS_NUM, val);
 }
 
 static int mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	struct mt7621_pcie_port *port;
-	u8 num_slots_enabled = 0;
-	u32 slot;
-	u32 val;
 	int err;
 
 	/* Setup MEMWIN and IOWIN */
@@ -518,27 +521,16 @@ static int mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
 		if (port->enabled) {
 			err = clk_prepare_enable(port->clk);
 			if (err) {
-				dev_err(dev, "enabling clk pcie%d\n", slot);
+				dev_err(dev, "enabling clk pcie%d\n",
+					port->slot);
 				return err;
 			}
 
 			mt7621_pcie_enable_port(port);
 			dev_info(dev, "PCIE%d enabled\n", port->slot);
-			num_slots_enabled++;
 		}
 	}
 
-	for (slot = 0; slot < num_slots_enabled; slot++) {
-		val = read_config(pcie, slot, PCI_COMMAND);
-		val |= PCI_COMMAND_MASTER;
-		write_config(pcie, slot, PCI_COMMAND, val);
-		/* configure RC FTS number to 250 when it leaves L0s */
-		val = read_config(pcie, slot, PCIE_FTS_NUM);
-		val &= ~PCIE_FTS_NUM_MASK;
-		val |= PCIE_FTS_NUM_L0(0x50);
-		write_config(pcie, slot, PCIE_FTS_NUM, val);
-	}
-
 	return 0;
 }
 
-- 
2.25.1

