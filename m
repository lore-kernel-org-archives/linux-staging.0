Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25AA70
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 16:14:07 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c5so14557313wrq.9
        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mviOXDpkO0uZr06Bf+azqSnPzPm3JsohKEvTxt2iPP0=;
        b=hus3xlMzyk1O10uQF2MDFuHBzfzE3TyPHKro4uskYisPjDf4UNKw+Xvujc8yHtK7xo
         L/G9X+4R2t5QflL2h5O0kga99wxlWS7oyfnQv5SkG8le1wSVCLai9j1Pi/4L/9th8a00
         1i30Rf32UnztG0/W1OoKq9CA35v7S+pu7c3UH9MD5r068V7sb0NZfkxOcF4j01f2ELSW
         rwd8UJFyC4/2vcj7ZEzLCl3qeIzT/2A/bwFOd/F8pWLAjyagSsP985klPj+05lseP2l+
         m3hW+9S2GavX79luZpaduCpm4Qf5oihXfxZN/A8bZd6ZUpUz7KDtUjc4Yoc20zX4LP89
         4esA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mviOXDpkO0uZr06Bf+azqSnPzPm3JsohKEvTxt2iPP0=;
        b=q77SRXIrTA0L29ZTXY+u14g3Ii4W8JKk0CbIADs8A132IX8VhUmTMdy5I8YPvk0Z7j
         jPQ2eSXs36pnzxW1UCa3q3/mdej7IR+1cQS+8R/XJahdYEvsSMx75R6+yrByc3xoXu+H
         EDhetOZFu54qa0KPoFUbxCrVsltkaXA7BS5rnuKwLH4uruga8ev7sPz/2Ol06UOLWSh8
         V+l+bNfTDZpV/UdbvPRWJJ0aRs32ky9icWP5Ac9G5jdUZkYZLV8fyyuqQOWKDewdvD/J
         TeOOQNZrvX2wzyF4QSc8LuO/TfB1TF317bY9AwuGDL8X5nIhFkvub6rwLx/SRLeYJVKr
         FeDQ==
X-Gm-Message-State: AOAM533VGmeNLUeuL89yIzIcsAIswQ2+zdi3sDKdNVMMrj/1Z9YpUHdO
	aH+cFep3YzuRtdEd1QXEZ//D6oZmAzIiUg==
X-Google-Smtp-Source: ABdhPJwvKc3B5DuMhPklM8vep1LhQdhktvgGdDMNtmgRVW78bd7UiE9EunGfvcNEoQdnP1+6jxDCZA==
X-Received: by 2002:adf:d204:: with SMTP id j4mr13296283wrh.3.1622996046084;
        Sun, 06 Jun 2021 09:14:06 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id n9sm11724427wmc.20.2021.06.06.09.14.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Jun 2021 09:14:05 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH v2 6/6] staging: mt7621-pci: make use of 'pcie_port_write'
Date: Sun,  6 Jun 2021 18:13:58 +0200
Message-Id: <20210606161358.7114-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
References: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function 'mt7621_pcie_enable_port' is calculating an offset
to write some port related registers. Instead of doing that
just make use of already existent 'pcie_write_port' function
and use virtualy mapped base address with registers. This
increase readability and allow us to remove also two defitions
not used else where.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index a88ca98aeb9a..2e1cd5cc1eec 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -44,9 +44,6 @@
 #define RALINK_PCI_IOBASE		0x002C
 
 /* PCIe RC control registers */
-#define MT7621_PCIE_OFFSET		0x2000
-#define MT7621_NEXT_PORT		0x1000
-
 #define RALINK_PCI_ID			0x0030
 #define RALINK_PCI_CLASS		0x0034
 #define RALINK_PCI_SUBID		0x0038
@@ -484,7 +481,6 @@ static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
 {
 	struct mt7621_pcie *pcie = port->pcie;
 	u32 slot = port->slot;
-	u32 offset = MT7621_PCIE_OFFSET + (slot * MT7621_NEXT_PORT);
 	u32 val;
 
 	/* enable pcie interrupt */
@@ -493,12 +489,12 @@ static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
 	pcie_write(pcie, val, RALINK_PCI_PCIMSK_ADDR);
 
 	/* map 2G DDR region */
-	pcie_write(pcie, PCIE_BAR_MAP_MAX | PCIE_BAR_ENABLE,
-		   offset + PCI_BASE_ADDRESS_0);
+	pcie_port_write(port, PCIE_BAR_MAP_MAX | PCIE_BAR_ENABLE,
+			PCI_BASE_ADDRESS_0);
 
 	/* configure class code and revision ID */
-	pcie_write(pcie, PCIE_CLASS_CODE | PCIE_REVISION_ID,
-		   offset + RALINK_PCI_CLASS);
+	pcie_port_write(port, PCIE_CLASS_CODE | PCIE_REVISION_ID,
+			RALINK_PCI_CLASS);
 
 	/* configure RC FTS number to 250 when it leaves L0s */
 	val = read_config(pcie, slot, PCIE_FTS_NUM);
-- 
2.25.1

