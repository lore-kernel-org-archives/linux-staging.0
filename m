Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E787C2F80
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 07:30:28 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z8so11435257wrp.12
        for <linux-staging@lists.linux.dev>; Sat, 05 Jun 2021 00:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wcPbqT2JQcWMMDG+Odz+QUacDJkCyvmivRYja3vroqE=;
        b=jNQNcgePaGqxZbKmuWfJfzX22Zf1dVN+hcqgeK4myxq6jzCJrCe1a2DYtJokXGacEQ
         PT2RcNGsHf8lys01wAeMTaHB1tOKZ/GR8Ts2gCQlSmCOKCVHxSXOwtFHbbNg6kCulJwC
         tpzu2H8IBD+8fjh9WT0Rcn80hKDvJ0qE5CrZL1yCifw0ql4NsTf9pbi/kGUIkWyenoL/
         D/u8Ck57alXfRk2jFKUENDQdrZs6xlErfnFsHNm/sNlW73gCLtDSok6VJqaXhWf2XzLW
         vMsjk8VINGge4rfLJfKIcXNiD8xGsgWahZ8u5ijW15PBDNaHegT7poXrxmuDN00q98lE
         9obA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wcPbqT2JQcWMMDG+Odz+QUacDJkCyvmivRYja3vroqE=;
        b=JLmOzcGk+2bLVyHpP7sv7Xg2MTfOq/EN0ZNAGpy8HyfZRUSZobrIKGz0oB1oqTTVHR
         8A2/zeLYy5X7cOhMpXQzlXT6dTi0WiSoAGKPNqlXpNHesT1T6E7dsl89rFWH9ajcRAhD
         aNeIZpNSC24x4T5Si51oMUtGqq2pYQ0u7QCUxPqFf6UUpZLO1qknA2jHDgLR4BUkygBl
         ckfUircPyKk2nyTYG3w6r7CDoZFs5k1NvgwjF/4lP2r6BHrIsbUy1Kk+iQ6UxS4v9hij
         okjWH1UH3OUnv0VLfyDy3bjdEqDDE0oC0mp7ARgcXYR1mBI4op8SFMuSIqtWCKnSW9tI
         roQg==
X-Gm-Message-State: AOAM530DUFtUEW0COAfGxI+GcoednR/de1Yezj8Iom/H28KbBAx5aSuK
	dKvP1ZYDMNKHcxNEZNcPQbPYiTFcbnG+eQ==
X-Google-Smtp-Source: ABdhPJzAVyNodQShYko+OXi82RdzfJaakX288MWrHlGDKck9exuhvu60P1vMBQs8o0xKQNJAyjggWQ==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr7334034wrw.88.1622878227370;
        Sat, 05 Jun 2021 00:30:27 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id l13sm781419wrz.34.2021.06.05.00.30.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jun 2021 00:30:27 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 3/5] staging: mt7621-pci: use {readl|writel}_relaxed instead of readl/writel
Date: Sat,  5 Jun 2021 09:30:21 +0200
Message-Id: <20210605073023.21435-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not perform DMA, so it's safe to use the relaxed version
for both readl and writel operations.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index b83c338a2e3d..8d14d0f9f769 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -109,32 +109,32 @@ struct mt7621_pcie {
 
 static inline u32 pcie_read(struct mt7621_pcie *pcie, u32 reg)
 {
-	return readl(pcie->base + reg);
+	return readl_relaxed(pcie->base + reg);
 }
 
 static inline void pcie_write(struct mt7621_pcie *pcie, u32 val, u32 reg)
 {
-	writel(val, pcie->base + reg);
+	writel_relaxed(val, pcie->base + reg);
 }
 
 static inline void pcie_rmw(struct mt7621_pcie *pcie, u32 reg, u32 clr, u32 set)
 {
-	u32 val = readl(pcie->base + reg);
+	u32 val = readl_relaxed(pcie->base + reg);
 
 	val &= ~clr;
 	val |= set;
-	writel(val, pcie->base + reg);
+	writel_relaxed(val, pcie->base + reg);
 }
 
 static inline u32 pcie_port_read(struct mt7621_pcie_port *port, u32 reg)
 {
-	return readl(port->base + reg);
+	return readl_relaxed(port->base + reg);
 }
 
 static inline void pcie_port_write(struct mt7621_pcie_port *port,
 				   u32 val, u32 reg)
 {
-	writel(val, port->base + reg);
+	writel_relaxed(val, port->base + reg);
 }
 
 static inline u32 mt7621_pci_get_cfgaddr(unsigned int bus, unsigned int slot,
@@ -151,7 +151,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
 	u32 address = mt7621_pci_get_cfgaddr(bus->number, PCI_SLOT(devfn),
 					     PCI_FUNC(devfn), where);
 
-	writel(address, pcie->base + RALINK_PCI_CONFIG_ADDR);
+	writel_relaxed(address, pcie->base + RALINK_PCI_CONFIG_ADDR);
 
 	return pcie->base + RALINK_PCI_CONFIG_DATA + (where & 3);
 }
-- 
2.25.1

