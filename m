Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB12FB1
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 12:02:02 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o127so9858234wmo.4
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aMxwrmrkH8Xq4NdD9ZOGWrDxZu9cdANKigtToy1X5M4=;
        b=ffneU9l45WNrXiJTJN6aaLtxLXa+hvT9x6z12yUd7ZCt422xsZXPYyiQ0UisX0ICqU
         NID34qwFRR7plWz9TSJo3JPiiPH+6k7lWTjHoPLmU+6RHRbsBRC+GrkNtptZ62g4t5fl
         RgXE5CpE+nQrQ2O8FPEtcc8kEchJSN+C0WwAvvdCoetRYpcILSzCUFygqskUnIStlwCr
         VWaHFTY6g+O2yv4fB2ff3/WdyCEpoPvbIdepWp1PPtRPo8R9tehnjWa27RSc4P/N3mY3
         3UqgFVnmqXPojCwpl3ts31ynHUZXpJexrffDe14vJ+P8pYf9P6R1Z2AEEYJ0H76k8XzS
         W++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aMxwrmrkH8Xq4NdD9ZOGWrDxZu9cdANKigtToy1X5M4=;
        b=b+c0tAyYprxNObQpuGg42cwpDyC5L9Inxz3/xFYwmjoiHK7kOpQ8Ue+kyYWMiFoDL1
         lpZVECgLwxmRn6vpy15zJOOnQvutwj1JdbeFiFo4YN9Y8OiwBSFu6HwGQ2nb2TwTvZFm
         opx8s5AEIccN1rDh9J9qqv8YzAOVN1l9a8+vWF9tOppwgtDLrL6xrpyGrh4hnxEUGvo4
         W3HzqqfXRTY546+vcyyPlUlLUsm+xOR53kyACy5ZftgaYlyeu11yriFkjHfxhLEjzzac
         Ct49vR4+PyufJAHnJO6AInDLcYaycceWtb5C9gYfuQ2fbIzn38iGVAS+oiZr1rE88glB
         gOWQ==
X-Gm-Message-State: AOAM532WjvyWAByYXHlnfZZnknNsCgPkzzGP67mLD8l04GUtJhtlyCTp
	2MNBVnXjrUSf33cPu0oEIrSrNcro+LRbMQ==
X-Google-Smtp-Source: ABdhPJwsvHFiZJHETzkwNm54BdxKRyMicnIrVyp/AiZ5vhtYWbTKKyk9Uusd+3PoBpUTRjjEK4TlGg==
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr16012717wmb.80.1623067320735;
        Mon, 07 Jun 2021 05:02:00 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id r4sm7595408wmq.37.2021.06.07.05.01.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 05:02:00 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	dan.carpenter@oracle.com
Subject: [PATCH v3 6/6] staging: mt7621-pci: make use of 'pcie_port_write'
Date: Mon,  7 Jun 2021 14:01:53 +0200
Message-Id: <20210607120153.24989-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
References: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
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
index fe9a5bb95d5b..b0b5700cbfec 100644
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
@@ -491,7 +488,6 @@ static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
 {
 	struct mt7621_pcie *pcie = port->pcie;
 	u32 slot = port->slot;
-	u32 offset = MT7621_PCIE_OFFSET + (slot * MT7621_NEXT_PORT);
 	u32 val;
 
 	/* enable pcie interrupt */
@@ -500,12 +496,12 @@ static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
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

