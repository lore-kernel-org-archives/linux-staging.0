Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8272
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:40 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id v12so1590669wrq.6
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7WFnX4fOO1ngl80fF/FA4ygv2wsoEDxSsw4eWZQrA2U=;
        b=ctdyYgMo4c0XQG6cW16eaCy5jWWYDTS5P2Q31KNavFjHTacXsHq+5wHHE3jYkOE+oe
         Gm0fN7NxoEsEZHk7Y0R256EYGK3aTLCl8vPkFOySSHpBWNVEs8PEFdgoFNKhN7wz/yZZ
         OyoCw8bK0NA6zfqrCk7MaPeRHHApiASlGQVOTadn9VBvnSc+y+l+cvgK/gmCGN1Au0U/
         KRP7fvYI/pY3P+S3NhMWjOJqBxpEkbTQF6GuFqd55Awamgl3fzzu0hdHMYBMGw5bL9vI
         gNkZBgFP4FDV9vGghsYurFrA//6ZuR5uJA4l8UUG7n7itnaGxOhzIMbaclm2+aRuFLiX
         mKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7WFnX4fOO1ngl80fF/FA4ygv2wsoEDxSsw4eWZQrA2U=;
        b=tt3urpNBblTDiUePUBwmNyJVWWFzrgNpEVimEXfwzbujR5/FhXKJMXgcLZ8+ig++rC
         9PeiQk3BeP1GUDoDmAkYMat7KtBjbD6PzWgODKE7cpGr+Q0YAEJV0gxe0NkQFO6KtD7Q
         j4cE+or2OYiEeoG3HLRgKejw1k/TmKk0vFCQKUAKsanHPd6R07kpOLy9dIy79g/6gHl5
         0MBQbpHnTEOVOZH7dVTAiZnGoiki3Jl9cdTchm/fpOUDaaaeu3rmepVI6MpGjqNBcx3i
         2ZBHhoEP4SYt/shyJA5CA99FSI0xIT3/h/41GFJ9tElQDM/DMmgfyJPyKnLOmiao9xgk
         qRqA==
X-Gm-Message-State: AOAM531RgsN98p1vg8pXLv1NOSunRElFkFnjnOWYYscPqYwpuGb+NUrk
	gXRhN6KHjPOASc72vdjDBWdzM0ktHKeZDw==
X-Google-Smtp-Source: ABdhPJxrgWQiA/367kKGeuhimIXevwbQsf5/X9HMBqgxd2T3uWK4NF8lE4pdqwdwXDYQ932GOc7tkg==
X-Received: by 2002:a5d:4707:: with SMTP id y7mr38311689wrq.137.1620217059144;
        Wed, 05 May 2021 05:17:39 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:38 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 01/10] staging: mt7621-pci: make use of kernel clock apis
Date: Wed,  5 May 2021 14:17:27 +0200
Message-Id: <20210505121736.6459-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
References: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 SoC clock driver has already mainlined in 
'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
Hence, we can make use of kernel clock apis and avoid to
directly set bits in clock gate related registers for pci.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 44 +++++++++++++++----------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 115250115f10..f490c7a1397d 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/iopoll.h>
@@ -43,9 +44,6 @@
 #define PCIE_FTS_NUM_MASK		GENMASK(15, 8)
 #define PCIE_FTS_NUM_L0(x)		(((x) & 0xff) << 8)
 
-/* rt_sysc_membase relative registers */
-#define RALINK_CLKCFG1			0x30
-
 /* Host-PCI bridge registers */
 #define RALINK_PCI_PCICFG_ADDR		0x0000
 #define RALINK_PCI_PCIMSK_ADDR		0x000C
@@ -79,7 +77,6 @@
 #define PCIE_BAR_MAP_MAX		GENMASK(30, 16)
 #define PCIE_BAR_ENABLE			BIT(0)
 #define PCIE_PORT_INT_EN(x)		BIT(20 + (x))
-#define PCIE_PORT_CLK_EN(x)		BIT(24 + (x))
 #define PCIE_PORT_LINKUP		BIT(0)
 
 #define PERST_MODE_MASK			GENMASK(11, 10)
@@ -91,6 +88,7 @@
  * @base: I/O mapped register base
  * @list: port list
  * @pcie: pointer to PCIe host info
+ * @clk: pointer to the port clock gate
  * @phy: pointer to PHY control block
  * @pcie_rst: pointer to port reset control
  * @gpio_rst: gpio reset
@@ -102,6 +100,7 @@ struct mt7621_pcie_port {
 	void __iomem *base;
 	struct list_head list;
 	struct mt7621_pcie *pcie;
+	struct clk *clk;
 	struct phy *phy;
 	struct reset_control *pcie_rst;
 	struct gpio_desc *gpio_rst;
@@ -222,16 +221,6 @@ static inline bool mt7621_pcie_port_is_linkup(struct mt7621_pcie_port *port)
 	return (pcie_port_read(port, RALINK_PCI_STATUS) & PCIE_PORT_LINKUP) != 0;
 }
 
-static inline void mt7621_pcie_port_clk_enable(struct mt7621_pcie_port *port)
-{
-	rt_sysc_m32(0, PCIE_PORT_CLK_EN(port->slot), RALINK_CLKCFG1);
-}
-
-static inline void mt7621_pcie_port_clk_disable(struct mt7621_pcie_port *port)
-{
-	rt_sysc_m32(PCIE_PORT_CLK_EN(port->slot), 0, RALINK_CLKCFG1);
-}
-
 static inline void mt7621_control_assert(struct mt7621_pcie_port *port)
 {
 	struct mt7621_pcie *pcie = port->pcie;
@@ -351,6 +340,13 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
 	if (IS_ERR(port->base))
 		return PTR_ERR(port->base);
 
+	snprintf(name, sizeof(name), "pcie%d", slot);
+	port->clk = devm_clk_get(dev, name);
+	if (IS_ERR(port->clk)) {
+		dev_err(dev, "failed to get pcie%d clock\n", slot);
+		return PTR_ERR(port->clk);
+	}
+
 	snprintf(name, sizeof(name), "pcie%d", slot);
 	port->pcie_rst = devm_reset_control_get_exclusive(dev, name);
 	if (PTR_ERR(port->pcie_rst) == -EPROBE_DEFER) {
@@ -512,7 +508,7 @@ static void mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
 			dev_err(dev, "pcie%d no card, disable it (RST & CLK)\n",
 				slot);
 			mt7621_control_assert(port);
-			mt7621_pcie_port_clk_disable(port);
+			clk_disable_unprepare(port->clk);
 			port->enabled = false;
 
 			if (slot == 0) {
@@ -547,13 +543,14 @@ static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
 		   offset + RALINK_PCI_CLASS);
 }
 
-static void mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
+static int mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	struct mt7621_pcie_port *port;
 	u8 num_slots_enabled = 0;
 	u32 slot;
 	u32 val;
+	int err;
 
 	/* Setup MEMWIN and IOWIN */
 	pcie_write(pcie, 0xffffffff, RALINK_PCI_MEMBASE);
@@ -561,7 +558,12 @@ static void mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
 
 	list_for_each_entry(port, &pcie->ports, list) {
 		if (port->enabled) {
-			mt7621_pcie_port_clk_enable(port);
+			err = clk_prepare_enable(port->clk);
+			if (err) {
+				dev_err(dev, "enabling clk pcie%d\n", slot);
+				return err;
+			}
+
 			mt7621_pcie_enable_port(port);
 			dev_info(dev, "PCIE%d enabled\n", port->slot);
 			num_slots_enabled++;
@@ -578,6 +580,8 @@ static void mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
 		val |= PCIE_FTS_NUM_L0(0x50);
 		write_config(pcie, slot, PCIE_FTS_NUM, val);
 	}
+
+	return 0;
 }
 
 static int mt7621_pcie_init_virtual_bridges(struct mt7621_pcie *pcie)
@@ -694,7 +698,11 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 		return 0;
 	}
 
-	mt7621_pcie_enable_ports(pcie);
+	err = mt7621_pcie_enable_ports(pcie);
+	if (err) {
+		dev_err(dev, "Error enabling pcie ports\n");
+		return err;
+	}
 
 	setup_cm_memory_region(pcie);
 
-- 
2.25.1

