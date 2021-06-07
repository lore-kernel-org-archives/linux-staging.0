Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC4F2F80
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 12:02:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h8so17288954wrz.8
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 05:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DbEQ0XPU7kCSJdpXHC1MGY7xfJWRFY3DvmzdwEg0ayU=;
        b=XgI7r0kxLcLpXFtamWbLxJ8+Lx3qPjK6LN2QTBsNy5RNTdqPq/J/1v5u/DIS7yoW9t
         SPXCzlW9qGDuNJGgt2y+nV06U+k7z1ppS3g0VuJZp7h8VJzb7V3Vk81toGhTlU1rGKMR
         pq12ENexIoqsA6nkwreaGD3/O6uERjiEgj1KTlpuTwrax5ZV7AZjXEJqkhkHh9e09Bqd
         JXAcjP0t51Ap3VBqAjl8lMWkwf3ecGKGwXao7ZOHLh/wxSLu1H8A5qqdXLb2MevBrLSz
         SJYyZBqFhNg9r4+VWF8yzzmosPOywiaJ/tGbPeCkJ0GQwTal0Si0XAJvfMc65X+iUW7C
         REHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DbEQ0XPU7kCSJdpXHC1MGY7xfJWRFY3DvmzdwEg0ayU=;
        b=qi9DhZ2uMko1Pt9Ot8cKRtRsaDgzEId4Je+ehGOfWHJ7UY5G7VBHuA1kNNAq+aDy5a
         7WscPh/g9Sg6mYoM3ZajvGZ3wwCrx2QtqoYigkYddvlc/jlkye3C58wqREw2XdOPQx2f
         07eY9NXiRkTg/GD8BDA1J3WbhvNdWdKYx9nhdKsJ71x36CUA6085zwzex+H90e865ha4
         kF5A0zgOT59+jAPDZzpA+8ve/9PvHSZc6JfzWsaqmDESn0dRXwhIlk28k9WCJRnxLCnA
         m0bnkhCLBEj2snq3nlzwMxI9Tfn0rTyB3hNLYoYaBFrsnlpY7WgFyCugPFWzRBCxWujr
         ZUrw==
X-Gm-Message-State: AOAM531H1qvpJwIkp0D9y3RGkbcMF3AZ8gNKabAKc13XzIsVolXysiLA
	7+UhApqVbbSUhk2q7bJ25j40D/2Z6Oohgg==
X-Google-Smtp-Source: ABdhPJyQ9MxXCPZ7q/WSqvKdOHZ2Ryl6HaPnD2699oheZmvc6PisAukVYNsE77qCVc8zPfWxqQSpYw==
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr17124697wrs.307.1623067319866;
        Mon, 07 Jun 2021 05:01:59 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id r4sm7595408wmq.37.2021.06.07.05.01.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 05:01:59 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	dan.carpenter@oracle.com
Subject: [PATCH v3 5/6] staging: mt7621-pci: parse some dt properties from root port child nodes
Date: Mon,  7 Jun 2021 14:01:52 +0200
Message-Id: <20210607120153.24989-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
References: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
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
Note that we moved from using 'devm_reset_control_get_exclusive() to
'of_reset_control_get_exclusive()' so we need to properly call the
'reset_control_put()' function manually in error and remove paths.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 49 +++++++++++++++++++------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 8d14d0f9f769..fe9a5bb95d5b 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -290,12 +290,14 @@ static int mt7621_pci_parse_request_of_pci_ranges(struct pci_host_bridge *host)
 }
 
 static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
+				  struct device_node *node,
 				  int slot)
 {
 	struct mt7621_pcie_port *port;
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	char name[10];
+	int err;
 
 	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
@@ -305,30 +307,32 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
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
-		return PTR_ERR(port->phy);
+	port->phy = devm_of_phy_get(dev, node, name);
+	if (IS_ERR(port->phy)) {
+		dev_err(dev, "failed to get pcie-phy%d\n", slot);
+		err = PTR_ERR(port->phy);
+		goto remove_reset;
+	}
 
 	port->gpio_rst = devm_gpiod_get_index_optional(dev, "reset", slot,
 						       GPIOD_OUT_LOW);
 	if (IS_ERR(port->gpio_rst)) {
 		dev_err(dev, "Failed to get GPIO for PCIe%d\n", slot);
-		return PTR_ERR(port->gpio_rst);
+		err = PTR_ERR(port->gpio_rst);
+		goto remove_reset;
 	}
 
 	port->slot = slot;
@@ -338,6 +342,10 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
 	list_add_tail(&port->list, &pcie->ports);
 
 	return 0;
+
+remove_reset:
+	reset_control_put(port->pcie_rst);
+	return err;
 }
 
 static int mt7621_pcie_parse_dt(struct mt7621_pcie *pcie)
@@ -363,7 +371,7 @@ static int mt7621_pcie_parse_dt(struct mt7621_pcie *pcie)
 
 		slot = PCI_SLOT(err);
 
-		err = mt7621_pcie_parse_port(pcie, slot);
+		err = mt7621_pcie_parse_port(pcie, child, slot);
 		if (err) {
 			of_node_put(child);
 			return err;
@@ -550,6 +558,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct soc_device_attribute *attr;
+	struct mt7621_pcie_port *port;
 	struct mt7621_pcie *pcie;
 	struct pci_host_bridge *bridge;
 	int err;
@@ -579,7 +588,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 	err = mt7621_pci_parse_request_of_pci_ranges(bridge);
 	if (err) {
 		dev_err(dev, "Error requesting pci resources from ranges");
-		return err;
+		goto remove_resets;
 	}
 
 	/* set resources limits */
@@ -591,12 +600,29 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 	err = mt7621_pcie_enable_ports(pcie);
 	if (err) {
 		dev_err(dev, "Error enabling pcie ports\n");
-		return err;
+		goto remove_resets;
 	}
 
 	setup_cm_memory_region(pcie);
 
 	return mt7621_pcie_register_host(bridge);
+
+remove_resets:
+	list_for_each_entry(port, &pcie->ports, list)
+		reset_control_put(port->pcie_rst);
+
+	return err;
+}
+
+static int mt7621_pci_remove(struct platform_device *pdev)
+{
+	struct mt7621_pcie *pcie = platform_get_drvdata(pdev);
+	struct mt7621_pcie_port *port;
+
+	list_for_each_entry(port, &pcie->ports, list)
+		reset_control_put(port->pcie_rst);
+
+	return 0;
 }
 
 static const struct of_device_id mt7621_pci_ids[] = {
@@ -607,6 +633,7 @@ MODULE_DEVICE_TABLE(of, mt7621_pci_ids);
 
 static struct platform_driver mt7621_pci_driver = {
 	.probe = mt7621_pci_probe,
+	.remove = mt7621_pci_remove,
 	.driver = {
 		.name = "mt7621-pci",
 		.of_match_table = of_match_ptr(mt7621_pci_ids),
-- 
2.25.1

