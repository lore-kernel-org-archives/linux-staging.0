Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A54D2FAE
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 16:14:05 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so3543212wmq.5
        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wcPbqT2JQcWMMDG+Odz+QUacDJkCyvmivRYja3vroqE=;
        b=bxZl4B8Jo13qKF5Dy8aC74W+hoy1d7S3qgw03gcMw2v+0aybPAmoca1VY7eR8ZZt7+
         UVNBrDQFbjtJCcTf3pJTYBGOrdj+P+P8ddYtWyX0n7HRI688w5xbsPSMog+upLPUwJEv
         NlRa8wWWb44oQcHSPTvHzR2W85pLroezyMJZDvOCKN5/5ACX0CLVF/RY6OgUelKjnd0l
         gpkcxSnlPYyFeyAFeL1/QmbQ8sG7LETpUrUB6Y2gM2AlOliq7UfpZFPj92r19tcFVeTQ
         W6UTQ3faacyxiMm89t6FOGclt6DmUcVzeeR3gpO5VaHQCT1NS7pK9YIC4REaPaI054xC
         BEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wcPbqT2JQcWMMDG+Odz+QUacDJkCyvmivRYja3vroqE=;
        b=D4HIsbPb191R/X6ICOm8anV50VI6lzxGM1/8YLDah7vA8CDzCgXBeP5eowMvZEGZXb
         XI1kW+Q8h7RF6ucbq7ScDppF+mG3MxqFhHryB7TwJCkGHo3bh789pRQp2p9ogbJM2IF6
         EeZ4hKHREtFWN2GUpjN8qh1gqTzwc5WBRVqqioE7X6hoDCq6WjR/7c8JiYE6Rlx2DBAJ
         TSUYJtk014jHfw+oQumCuPpMc3EXFwMqkgNz/VicL1BGfka2KHBpsyHQC9cjDIbmpQXl
         mCGXiZo8gvesNvG1mF2iE+62dNGmwEPPy1cH1lljBL57/lCkhPgaKEhpeOCY5bq0nwkK
         r57Q==
X-Gm-Message-State: AOAM530OxkIhIJs5dryVql25MA6wGkJm8ak3bewBGcEi1/66wax/5Uf8
	apHfCwKs4Qw/o2fquJw3sYvq9lEkpNVR6w==
X-Google-Smtp-Source: ABdhPJz0Om3/q1wJFebXGTvibqyTmspg5Hr23y+ccw3ki7N/GL23xkrdGeHnwgrNYORPAQeH2sc72w==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr13158127wmj.184.1622996043648;
        Sun, 06 Jun 2021 09:14:03 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id n9sm11724427wmc.20.2021.06.06.09.14.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Jun 2021 09:14:03 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH v2 3/6] staging: mt7621-pci: use {readl|writel}_relaxed instead of readl/writel
Date: Sun,  6 Jun 2021 18:13:55 +0200
Message-Id: <20210606161358.7114-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
References: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
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

