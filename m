Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6593F2FB2
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 07:30:30 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id c5so11425685wrq.9
        for <linux-staging@lists.linux.dev>; Sat, 05 Jun 2021 00:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Xhf9nxDAEspw2vxSXFfUZONZQ7Fg0/epatbR9CTVx8=;
        b=W4x4tIaorMRGcNEKatZmVUZ0HmO/0NojGnoPJN6V+2vmeGDbblI3sUDnIsYsf/egGf
         5/1K+l9089PskEUojgSy/IEQpz77zcYjAXMi9Ij6Ub57eJk+1qf/0Ma9uB6q61y0ehU2
         dbKo4d2SmQOoF3EstsJBSiQlqQQY01lLogzSm0TmQhtg9Xj11CAJUqHEcNN11emV7KUo
         h0oMxCCZ0HQm4t6vme9744IUxcVx0FuhcB5O5de3wuZhDlTf8HiVNtFgdllrClmdF/LK
         UMoE2tDB41ZgDnTpApORiFem3H7FAo7B6DZ4aZlpelKIxSACVPq+o+IWvFeG73IjhqhF
         sEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Xhf9nxDAEspw2vxSXFfUZONZQ7Fg0/epatbR9CTVx8=;
        b=FM7uhuDu9061XaxNfdVImJypZiRkdF6ahFMke+S2hMrZ9Dr14+LCDjV4SbC++96/Wm
         MMQ1z2kuq1Re7qg42kcGnCr5jC22VQR3/D+ozaJPpYgVOS1kzWHDKWn7smG+X8GdU0FV
         ERzq5+AKtXDz/OOK+3KXDTVuBKnmbjLBJqei/VX1A1D9oCI9lfKcwxnhtcZHO4kwDInH
         YYltV/VFoThnsgMP9jSpOwoiYx2x1SVEi58F4w13Ntkvg24HZlnsJ0CphN52gMjyKu55
         O+Uz8tXiIMV8U2rO9eyM2CgavAkff8liCKP70qkpLMsjwLP2lK59fTE+92KK9dYh3wfV
         a5ig==
X-Gm-Message-State: AOAM533Dls+Z+8Kosj3+Z9aDLtx/hVvPd4sP+zrhOFYznwSMop0SFevV
	GjF9QMgRgRh72nJDWtx9Hu7lf07sdkcpRQ==
X-Google-Smtp-Source: ABdhPJzO9U6g8uTs1uy31My98COsg5IWcINqceFp1DEXPyRjsJbsifNZYWt7wbJXdCOzfETLQW6ndA==
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr7413471wrq.344.1622878228862;
        Sat, 05 Jun 2021 00:30:28 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id l13sm781419wrz.34.2021.06.05.00.30.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jun 2021 00:30:28 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 5/5] staging: mt7621-pci: parse some dt properties from root port child nodes
Date: Sat,  5 Jun 2021 09:30:23 +0200
Message-Id: <20210605073023.21435-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties 'clocks', 'resets' and 'phys' have been moved from parent
node to the root port childs. Hence we have to adapt the way device
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

