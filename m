Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8640072
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:47 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id h4so1583271wrt.12
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DhB0/xs9mSMQareoKeMKyBC4mGKtRpCORFuH09ahNJc=;
        b=UrteyugZ6c3fsz9/batvYSrn/irO/mhD4waBGjXNbwU4qvrYUIYo3AwwlbGUsn8xTU
         rOmEe9AK5f9xeQ7H/7dnFJYWQrtf+Zs6lUgaWO0xMDpPutqY+2XxcqW+p9QXfzYjRg/k
         Q2Xj0nXfAKMPXhFO7cH142g/N7dF0HBxH4mlTkyDqiNUBY2RDCJFsDmcldePqlrx5ZIc
         GBn/F7uzGGqNSSFNxTQSqxnPmxqgqcR6h1nOQfUDhGZLiXi0X/MCWa/tiY9P0lHwem0N
         MjSz0CRbeQZf98a8gW1ejguvhHU5TtoBykdfAhL1qKCXRvoClUik6kBFkq2hcFf3z9N/
         eLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DhB0/xs9mSMQareoKeMKyBC4mGKtRpCORFuH09ahNJc=;
        b=FZeJDqZVSBcG1HH/VwZkRhFJE6WsZ8A+t3kz4sImYghWk152WRJ91c7V3atwt1687o
         FGg8LCFg5CDftTst7rqSQCEcDEI/t/3rY44GFYKifJJm/eIvl5c5YN2aEOiQecFimY3t
         7R6u09FBjfbAJMYxS3FGFm0wDSPQdhFfFxLjX0lLLXqFse+5e+ftx8vY1Dp14R4gQWSs
         Q4lh+GFzMiUnK8o6ftH0Y9PNlc+KEbfKI9cwetEJr54IEitmX9DFN6vlMLQuWkslJdOT
         ylKdj/2b429xD+yBRr8Yg3YQQQ4ENYjp5WHQsEtqN7N3Ateur1UQEih/X1Uzf4sDXFn8
         rtww==
X-Gm-Message-State: AOAM530Gj4u+fNOKU0EdsAC6pAS1nUQxhgxdUToMlWXplsUZqBNXnFfx
	x4Gc5HqvSt3KiZ7L7GOYUQICSVg8jhBcQg==
X-Google-Smtp-Source: ABdhPJxx9iWTGMUkwIUqLw2ScGAHdlzVpjcrLAkITtnEFGizwT5rZXP5qSIA5QBmfuc4ZiQe2lLUow==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr38979979wrt.14.1620217065789;
        Wed, 05 May 2021 05:17:45 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:45 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 07/10] staging: mt7621-pci: avoid custom 'map_irq' function
Date: Wed,  5 May 2021 14:17:33 +0200
Message-Id: <20210505121736.6459-8-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
References: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Custom function for 'map_irq' was introduced in
commit fab6710e4c51 ("staging: mt7621-pci: fix PCIe interrupt mapping")

After some testing in an adquired device with a similar
pci layout that those that was having problems, I got
into a better way to solve the issue just using device tree
'interrupt-map' and 'interrupt-map-mask' properties. For
this to be possible we must avoid custom configuration of
the virtual bridges registers from driver code. Doing in
this way buses are not reconfigured so we can properly
use bus related bits and mask in device tree to map
correctly the interrupts. Hence remove custom configuration
of the bridges as well as custom 'map_irq' related stuff.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 88 -------------------------
 1 file changed, 88 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 331bd8b47d99..c675e74ce507 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -22,7 +22,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
 #include <linux/pci.h>
@@ -44,15 +43,6 @@
 #define RALINK_PCI_MEMBASE		0x0028
 #define RALINK_PCI_IOBASE		0x002C
 
-/* PCICFG virtual bridges */
-#define PCIE_P2P_CNT			3
-#define PCIE_P2P_BR_DEVNUM_SHIFT(p)	(16 + (p) * 4)
-#define PCIE_P2P_BR_DEVNUM0_SHIFT	PCIE_P2P_BR_DEVNUM_SHIFT(0)
-#define PCIE_P2P_BR_DEVNUM1_SHIFT	PCIE_P2P_BR_DEVNUM_SHIFT(1)
-#define PCIE_P2P_BR_DEVNUM2_SHIFT	PCIE_P2P_BR_DEVNUM_SHIFT(2)
-#define PCIE_P2P_BR_DEVNUM_MASK		0xf
-#define PCIE_P2P_BR_DEVNUM_MASK_FULL	(0xfff << PCIE_P2P_BR_DEVNUM0_SHIFT)
-
 /* PCIe RC control registers */
 #define MT7621_PCIE_OFFSET		0x2000
 #define MT7621_NEXT_PORT		0x1000
@@ -83,7 +73,6 @@
  * @pcie_rst: pointer to port reset control
  * @gpio_rst: gpio reset
  * @slot: port slot
- * @irq: GIC irq
  * @enabled: indicates if port is enabled
  */
 struct mt7621_pcie_port {
@@ -95,7 +84,6 @@ struct mt7621_pcie_port {
 	struct reset_control *pcie_rst;
 	struct gpio_desc *gpio_rst;
 	u32 slot;
-	int irq;
 	bool enabled;
 };
 
@@ -107,7 +95,6 @@ struct mt7621_pcie_port {
  * @dev: Pointer to PCIe device
  * @io_map_base: virtual memory base address for io
  * @ports: pointer to PCIe port information
- * @irq_map: irq mapping info according pcie link status
  * @resets_inverted: depends on chip revision
  * reset lines are inverted.
  */
@@ -118,7 +105,6 @@ struct mt7621_pcie {
 	struct resource *mem;
 	unsigned long io_map_base;
 	struct list_head ports;
-	int irq_map[PCIE_P2P_CNT];
 	bool resets_inverted;
 };
 
@@ -253,16 +239,6 @@ static void setup_cm_memory_region(struct mt7621_pcie *pcie)
 	}
 }
 
-static int mt7621_map_irq(const struct pci_dev *pdev, u8 slot, u8 pin)
-{
-	struct mt7621_pcie *pcie = pdev->bus->sysdata;
-	struct device *dev = pcie->dev;
-	int irq = pcie->irq_map[slot];
-
-	dev_info(dev, "bus=%d slot=%d irq=%d\n", pdev->bus->number, slot, irq);
-	return irq;
-}
-
 static int mt7621_pci_parse_request_of_pci_ranges(struct pci_host_bridge *host)
 {
 	struct mt7621_pcie *pcie = pci_host_bridge_priv(host);
@@ -359,12 +335,6 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
 	port->slot = slot;
 	port->pcie = pcie;
 
-	port->irq = platform_get_irq(pdev, slot);
-	if (port->irq < 0) {
-		dev_err(dev, "Failed to get IRQ for PCIe%d\n", slot);
-		return -ENXIO;
-	}
-
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);
 
@@ -572,63 +542,11 @@ static int mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
 	return 0;
 }
 
-static int mt7621_pcie_init_virtual_bridges(struct mt7621_pcie *pcie)
-{
-	u32 pcie_link_status = 0;
-	u32 n = 0;
-	int i = 0;
-	u32 p2p_br_devnum[PCIE_P2P_CNT];
-	int irqs[PCIE_P2P_CNT];
-	struct mt7621_pcie_port *port;
-
-	list_for_each_entry(port, &pcie->ports, list) {
-		u32 slot = port->slot;
-
-		irqs[i++] = port->irq;
-		if (port->enabled)
-			pcie_link_status |= BIT(slot);
-	}
-
-	if (pcie_link_status == 0)
-		return -1;
-
-	/*
-	 * Assign device numbers from zero to the enabled ports,
-	 * then assigning remaining device numbers to any disabled
-	 * ports.
-	 */
-	for (i = 0; i < PCIE_P2P_CNT; i++)
-		if (pcie_link_status & BIT(i))
-			p2p_br_devnum[i] = n++;
-
-	for (i = 0; i < PCIE_P2P_CNT; i++)
-		if ((pcie_link_status & BIT(i)) == 0)
-			p2p_br_devnum[i] = n++;
-
-	pcie_rmw(pcie, RALINK_PCI_PCICFG_ADDR,
-		 PCIE_P2P_BR_DEVNUM_MASK_FULL,
-		 (p2p_br_devnum[0] << PCIE_P2P_BR_DEVNUM0_SHIFT) |
-		 (p2p_br_devnum[1] << PCIE_P2P_BR_DEVNUM1_SHIFT) |
-		 (p2p_br_devnum[2] << PCIE_P2P_BR_DEVNUM2_SHIFT));
-
-	/* Assign IRQs */
-	n = 0;
-	for (i = 0; i < PCIE_P2P_CNT; i++)
-		if (pcie_link_status & BIT(i))
-			pcie->irq_map[n++] = irqs[i];
-
-	for (i = n; i < PCIE_P2P_CNT; i++)
-		pcie->irq_map[i] = -1;
-
-	return 0;
-}
-
 static int mt7621_pcie_register_host(struct pci_host_bridge *host)
 {
 	struct mt7621_pcie *pcie = pci_host_bridge_priv(host);
 
 	host->ops = &mt7621_pci_ops;
-	host->map_irq = mt7621_map_irq;
 	host->sysdata = pcie;
 
 	return pci_host_probe(host);
@@ -680,12 +598,6 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 
 	mt7621_pcie_init_ports(pcie);
 
-	err = mt7621_pcie_init_virtual_bridges(pcie);
-	if (err) {
-		dev_err(dev, "Nothing is connected in virtual bridges. Exiting...");
-		return 0;
-	}
-
 	err = mt7621_pcie_enable_ports(pcie);
 	if (err) {
 		dev_err(dev, "Error enabling pcie ports\n");
-- 
2.25.1

