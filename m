Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E62FB1
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 12:01:57 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c9so8614484wrt.5
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 05:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OC7UlfSDJ/a0rC2fUg3QgAa5mvI6HdBC1Wr4QlHPZ7k=;
        b=twcRtACRI1TT+fEqoYSmrb5ohIz6gfPy/BdK0nn24ZuHb4Wl2FB2axmNgBJ0YvA1RU
         0IF1eQWVH8ivxp36w/LCsEb+POBxBFVsfyW4lG29jnSq9sVy01l7IMPQncC5GsXTWmtJ
         V53UA3HkNX9CbCwPb/lfddr4lrSNlVzmKeSGTg9cbTCcVar3ZieUbL9STNI4AO3aczld
         Y2YLxt8uMTti00Ch5nfCk1x3+CDgyH0NemlIl7NtLEiL5Ku7MGhihNSwEMhYOtKnTBmV
         y0HXBQTi8DN2oTCX9DvMr8EIzgVN0vlWp/3Sw+lTF3BNhVWATeW8tBhRmYWyDNGR20wA
         0+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OC7UlfSDJ/a0rC2fUg3QgAa5mvI6HdBC1Wr4QlHPZ7k=;
        b=EVtnyx5cSggINg+w2XLNVW2q7vTydSS3yqHacJF4t+suzU42E4ZJpncIlDnJp0iLuQ
         4UT6Wn5PM73W7Jlc9l/NzxTTqovUxT6881yb2f4P3x8PoSzLfSStRMcEEIw8/qr045U9
         wfKzUeV7zDbosi6E++BjLQTJl77MhDZaEMrEYWUgqPXZfMOz23T1BShWeiVqFX6BHE4x
         wXwnkZrMrSHq4gQLwVbQS7Nte1BCXeh/t67HGNNur4MZYCWoEwBx0sruQoNChpuPt6di
         0YEb9s3QtkiboMQux74kalRHokbAbSVThDkD1ngygXwfeAaMoq587a0oi310MFdCbE9c
         2N/g==
X-Gm-Message-State: AOAM532t/kz43tFKxuVhU5M++2t0g/YzilC3NWyTqMYNbFGUHytaF0ps
	a0ydAet/6WW3RREgr7ds+KMIgT2wvTybJg==
X-Google-Smtp-Source: ABdhPJxuf5q3Ck42N+2FjSGvS4QRTccttLUv6qksMdPhseb7o7ba9rK/gLvjyGLgrUzPeNZZgeatAw==
X-Received: by 2002:adf:a193:: with SMTP id u19mr16993067wru.9.1623067316126;
        Mon, 07 Jun 2021 05:01:56 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id r4sm7595408wmq.37.2021.06.07.05.01.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 05:01:55 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	dan.carpenter@oracle.com
Subject: [PATCH v3 1/6] staging: mt7621-pci: make cleaner 'mt7621_pcie_enable_ports'
Date: Mon,  7 Jun 2021 14:01:48 +0200
Message-Id: <20210607120153.24989-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
References: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
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
bit. Pci drivers are in charge of set that bit if is really
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

