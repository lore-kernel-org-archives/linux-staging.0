Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AE32FAE
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 16:14:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id b145-20020a1c80970000b029019c8c824054so10967086wmd.5
        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jb4Bhex5gUom5fja00/hW5UOJa1qIcG3fPQMFzdsrZ8=;
        b=MAzxu/5REeRwHzqnagejpP/uLb1Wmrq1dsloav5TaUrcZO53GonHITeZsSjgS9QuKz
         slSuoLNnQVn3xDV7yN33xVUFabCWEg3Enm6iSHDp8K97A0sqMWilImwAcpaMl0D8DyPo
         cmAbMuTEjwhpBK+AcEU8BI2Qdit+1tYp+/SSyso+XJR5OwrDkBdBHnCt3L5FCfmFH9mw
         jLjAWOuLDcbMg1gjUM0Yb6zsujTn2dPU0sJ2jb48ucg0C4fLSrDRzrHgQfDNEK1M1UFW
         f+Pj3wtT3KERO4rsMnjSpfY5K5Yo3im56E5RDZiaSARi8wqeGgwFdofX0XwsHj1pxIlx
         A6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jb4Bhex5gUom5fja00/hW5UOJa1qIcG3fPQMFzdsrZ8=;
        b=FuHDgGe2iAEEmFM70daQ7e3HjcKU4qPYdMPar4uT2W4tngVloPxom/II3Jx+EnJt6P
         qy3dYxUoa5BsAGDN5P3x9JMDVByun2mPXRzQ1XgQYW1fLVrT5pTDpPoW0ubbwT6maPlV
         QROQof4qf4VURJpuceE6fNnkPE1V0V+1Bqt/wD+7FPZ19Sw5xwkKSgpwMZnMa09f+FXo
         ommEfDLkjcZUlBXbLum8XCF3oSfbBIvPYdkuAIsFglffdNpoWUVTiH/7BYkFpe+0KcwZ
         NN9+nCsy3xHXWTCvzDJX3D831IjGtnaKQ1EwMGcAohAiHyQ43KPzYgUA1m1TGLH3hyR0
         1ryg==
X-Gm-Message-State: AOAM532KowlPnM+ylDD/RR4N5R2vItimLz/t0FOwAeTbyPYu06tdTDLt
	6cAPitml/j8tZ1xY93iOhTCTE1is2Z85BA==
X-Google-Smtp-Source: ABdhPJxwehtYTCpFn049/K+TxDLOFV/tczK0mDVMu6e+QLzn7ZkrrvzaYAFwhUS3wwlOXjlMVIxVNA==
X-Received: by 2002:a1c:731a:: with SMTP id d26mr12637373wmb.108.1622996045346;
        Sun, 06 Jun 2021 09:14:05 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id n9sm11724427wmc.20.2021.06.06.09.14.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Jun 2021 09:14:05 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH v2 5/6] staging: mt7621-pci: parse some dt properties from root port child nodes
Date: Sun,  6 Jun 2021 18:13:57 +0200
Message-Id: <20210606161358.7114-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
References: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties 'clocks', 'resets' and 'phys' have been moved from parent
node to the root port children. Hence we have to adapt the way device
tree is parsed in driver code to properly align things and make all
the stuff work.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 8d14d0f9f769..a88ca98aeb9a 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -290,6 +290,7 @@ static int mt7621_pci_parse_request_of_pci_ranges(struct pci_host_bridge *host)
 }
 
 static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
+				  struct device_node *node,
 				  int slot)
 {
 	struct mt7621_pcie_port *port;
@@ -305,24 +306,24 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
 	if (IS_ERR(port->base))
 		return PTR_ERR(port->base);
 
-	snprintf(name, sizeof(name), "pcie%d", slot);
-	port->clk = devm_clk_get(dev, name);
+	port->clk = devm_get_clk_from_child(dev, node, NULL);
 	if (IS_ERR(port->clk)) {
 		dev_err(dev, "failed to get pcie%d clock\n", slot);
 		return PTR_ERR(port->clk);
 	}
 
-	snprintf(name, sizeof(name), "pcie%d", slot);
-	port->pcie_rst = devm_reset_control_get_exclusive(dev, name);
+	port->pcie_rst = of_reset_control_get_exclusive(node, NULL);
 	if (PTR_ERR(port->pcie_rst) == -EPROBE_DEFER) {
 		dev_err(dev, "failed to get pcie%d reset control\n", slot);
 		return PTR_ERR(port->pcie_rst);
 	}
 
 	snprintf(name, sizeof(name), "pcie-phy%d", slot);
-	port->phy = devm_phy_get(dev, name);
-	if (IS_ERR(port->phy) && slot != 1)
+	port->phy = devm_of_phy_get(dev, node, name);
+	if (IS_ERR(port->phy)) {
+		dev_err(dev, "failed to get pcie-phy%d\n", slot);
 		return PTR_ERR(port->phy);
+	}
 
 	port->gpio_rst = devm_gpiod_get_index_optional(dev, "reset", slot,
 						       GPIOD_OUT_LOW);
@@ -363,7 +364,7 @@ static int mt7621_pcie_parse_dt(struct mt7621_pcie *pcie)
 
 		slot = PCI_SLOT(err);
 
-		err = mt7621_pcie_parse_port(pcie, slot);
+		err = mt7621_pcie_parse_port(pcie, child, slot);
 		if (err) {
 			of_node_put(child);
 			return err;
-- 
2.25.1

