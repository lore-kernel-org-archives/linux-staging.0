Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A4E2F80
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 07:30:27 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id a20so11513239wrc.0
        for <linux-staging@lists.linux.dev>; Sat, 05 Jun 2021 00:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n7455qEqjOLvwWYAcUSBjsZCGKPtl4PWlRZJDEi+89I=;
        b=DeEcc2R89DHeFfmIJhz3ManxRpjtLVVoWVlCgcO2A50kBGCgBCtuuxPb84c9EGh06d
         AgNmO//isVsRDhmOgk6CYunjXcl84xgqBfAMvGqKNgmh9hOsvG/2bFmzGOK1/GfcUEt4
         LFnyiV5qZ1uxQpHHt/LIpVgMDew1rPOxd1Uiyb2o4+78EveFfEeL65x/5A1kWAzwJGaT
         hZN8nWy2+3ArK9pPaj+dCbLKm8FwqFOxkuu4izSIUGteJObJzkTtnRjAsKzreRhRr1lt
         QauPcO3ZbjibVtej1iRH5xtmvBTCUqF5jCmTDAnaNsNCf9Z8+/1Lg78vGO6PCxI6tEk3
         792Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n7455qEqjOLvwWYAcUSBjsZCGKPtl4PWlRZJDEi+89I=;
        b=KHH1HMjsFYve2B0G5Oybb1ppDEmuTGePnLMfgxbl13pYzNF/qZRV9JYuWBsZ/DQEX4
         QnIGfywa3bom+M/SZh1bvsQo5aHLO1nXYhIP5QfLl6SWoBlCHFiVWSWjPspkhkFVh9Z3
         1SQcPpK8IxCFi0qUnM4VZU+9BqdsPBXXA4H2MgLOkvD3Sdvgu+YKsgaNJcTuGOSqlqVc
         ocCM1bQkK0TJ6nQM+qu/EztBIuMDly+FppvHxdP2IlG0B9G8ZKBPFX3BKYy6SWbkX4q2
         Xwrx6IHiawJTJj5jJQilhsAGuzUynByCDsAp0KBo68Ihg3abTIOiBkzFvutM3IGZhLLu
         Tn+Q==
X-Gm-Message-State: AOAM532pCKXOCfk1SHUgksQtQgIZGT4QXV2OSaYZz5eq7+yXKlbLnCLM
	HG0qenPc0c5AnHjN79s/OjuQ72ssEeRJtQ==
X-Google-Smtp-Source: ABdhPJxtBivY6A9Grfzv7nK1TFmJDvT+VL7uXJr5zLefbOnUhq0vzicfdNQE+ZQbyFY0K2dw/37Y8Q==
X-Received: by 2002:a5d:5903:: with SMTP id v3mr7464555wrd.285.1622878225826;
        Sat, 05 Jun 2021 00:30:25 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id l13sm781419wrz.34.2021.06.05.00.30.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jun 2021 00:30:25 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 1/5] staging: mt7621-pci: make cleaner 'mt7621_pcie_enable_ports'
Date: Sat,  5 Jun 2021 09:30:19 +0200
Message-Id: <20210605073023.21435-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
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
bit. Pci drivers are in charge of set that bit if is is really
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

