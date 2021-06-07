Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FBB2FB1
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 12:01:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so12515322wmk.1
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 05:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wcPbqT2JQcWMMDG+Odz+QUacDJkCyvmivRYja3vroqE=;
        b=VAv6nOF7tC2neJV07DwaTCjhB5J0glVLZQzdbIBQ920TihZlz2Eu/e+3ZfsT8WBsXI
         s4hxQJn9ws2nD8IcQAsuav/g4NHU6AnvUfGblaijZWCuR0oQCKjO5GB50IFJmEr+oH3C
         GxSAW1pO3ntl3dfEbx6MGdDikjr+RRzI+QAaV3PLmUE87TYE5jPrECAXWBt2ZTaKTAeA
         M96IOYe+6k2lUcnT9wCwevq+fQcV8C6idWi3/vCwwYx5kfXgbRIeeS6BZeEwzRuKZGId
         fvjR88bCxyBsp49tpS1XASdMMLH3bhsOeQ7XzRnKuGzU0yjua351GUTsaQmqI/p+iFDa
         8KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wcPbqT2JQcWMMDG+Odz+QUacDJkCyvmivRYja3vroqE=;
        b=qK8Ffo/xqMp2Cn4H9dsSFaG6JlVb5zkshOLZdQY2O3J1LIWrNjyyWcho0VDi555b6R
         pL0D4H5d8/1w+tH+6EHPH8uJXmoJO2jCFhY8Im9ovTK+aiJDMfNJPBnByNWYeLzXy3kS
         a5TAw6rwbJPEVvLMB65m+kpfyj6BmW+zfTISWvUkbdrpFkCE8/afugc6hsbfOtobR0Pe
         i2M/3ZI3l+MJc8sFLfIxOZPjYr/zQOYDu3+FkbNjNaSGgRStyW1Wf1kYc6yMVgEDjLZB
         aKBcJoptKaCwEvMlXYBWYiavxjYfGJwUQzy+arb2cQdSAoTTdqThAf9RrT2vCa1l4lXX
         YOJw==
X-Gm-Message-State: AOAM5331KrW1FPC4x7B7kSGp6fVdQpbuW9urLgBtpWPlh4eceVQcIIBb
	fEmP+M2hwkz0mtmuIbb0lvQmig6YMRHBQw==
X-Google-Smtp-Source: ABdhPJx/dXRiVRZ5E6WIfT5tpyWMxqaM6YCJsvT0iFtTuqwoLEFToihdPUqeL0JQa2Wp+Vo6dNPEog==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr16715319wmh.100.1623067317823;
        Mon, 07 Jun 2021 05:01:57 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id r4sm7595408wmq.37.2021.06.07.05.01.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 05:01:57 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	dan.carpenter@oracle.com
Subject: [PATCH v3 3/6] staging: mt7621-pci: use {readl|writel}_relaxed instead of readl/writel
Date: Mon,  7 Jun 2021 14:01:50 +0200
Message-Id: <20210607120153.24989-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
References: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
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

