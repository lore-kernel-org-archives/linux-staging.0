Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D772
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:08:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id n5so14909437wro.12
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 10:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J21B9OPLtJ1ILQmtNKigersbschXAB2jKUrB0yMIlxk=;
        b=BWFBa9P+ChjMRLUGV5XDJPsXpr+G49qPUG1mouCmY8F47Jykufwnq7w0GpSG+IObWk
         e0BLrq4kX1JIO4cfPTYL9qFXkIxey/ApuBUZFY9LAadmrs/ks//c6NODMwNUahuT0WIg
         Yk48Xo7xkzAsXl8XJ6+LuhWDwaY6XOpGzmeCiHmroWEfR3svpVF58JR5RIlzVDaw3LKq
         o6+pEauzGqHMyjZZEkYwtOehuBnJ+7URQxe1bE67fyscQLFiC4lucvbcI4gKUcMztdem
         fNhPSRLbWZbGSbkGNsywcq9jGDgBfLKF+VuYAUXv0wBUoCoX9J6V6xq9ydxXqM9s5f9h
         2Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J21B9OPLtJ1ILQmtNKigersbschXAB2jKUrB0yMIlxk=;
        b=pUp5JMvcBYu6EhR2OXxUaot8WZR75Q9vP0MN49vSZwOzTwIwIViVTXWT6kREdOYtcc
         zGdGI2KGwxpEFxRTCIg5uMmhIYjY31HjB7Qr9BgM7sy82vo6wpk12phXoTgolzhoV5wh
         ntsV7bkGsDYSi3dO5WOBitW5o4h13utNuxL9u98PK8YbpAofa7ia+/4zLo3MfjvzRmyq
         ltjI3B96DzjtvB1AGWQibqshjrlAWo7B1R2aH/wK+wNra9ZIP/GnBMGd29E6jThv3agY
         0tNp+EGs11gXY+8JpbF3WGptX7bqPEez3tzPvRVZwrx/oCv9Dm9knpNZWHpDZrLf26/S
         Zl/A==
X-Gm-Message-State: AOAM532444GQ7EETewDKAp1Oec9+a97nYzVnhEQPxhoKSus57G8FOcuB
	MPeP3esl0YJu6DnykZbNwDgyT0bp8C9MQA==
X-Google-Smtp-Source: ABdhPJzKy/X3vbLvxtOMRPW9xeOohWFPFOu84C0bhl2V2/Ab/bVXhvyJ47cD4KBHSoPV/puQGp+L2Q==
X-Received: by 2002:a5d:5712:: with SMTP id a18mr8021858wrv.367.1629738485857;
        Mon, 23 Aug 2021 10:08:05 -0700 (PDT)
Received: from localhost.localdomain (10.red-83-57-27.dynamicip.rima-tde.net. [83.57.27.10])
        by smtp.gmail.com with ESMTPSA id i21sm15644391wrb.62.2021.08.23.10.08.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Aug 2021 10:08:05 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	DENG Qingfang <dqfext@gmail.com>
Subject: [PATCH] staging: mt7621-pci: fix hang when nothing is connected to pcie ports
Date: Mon, 23 Aug 2021 19:08:03 +0200
Message-Id: <20210823170803.2108-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When nothing is connected to pcie ports, each port is set to reset state.
When this occurs, next access result in a hang on boot as follows:

mt7621-pci 1e140000.pcie: pcie0 no card, disable it (RST & CLK)
mt7621-pci 1e140000.pcie: pcie1 no card, disable it (RST & CLK)
mt7621-pci 1e140000.pcie: pcie2 no card, disable it (RST & CLK)
[ HANGS HERE ]

Fix this just detecting 'nothing is connected state' to avoid next accesses
to pcie port related configuration registers.

Fixes: b99cc3a2b6b6 ("staging: mt7621-pci: avoid custom 'map_irq' function")
Reported-by: DENG Qingfang <dqfext@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 691030e1a5ed..67416cff96d2 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -56,6 +56,7 @@
 #define PCIE_BAR_ENABLE			BIT(0)
 #define PCIE_PORT_INT_EN(x)		BIT(20 + (x))
 #define PCIE_PORT_LINKUP		BIT(0)
+#define PCIE_PORT_CNT			3
 
 #define PERST_DELAY_MS			100
 
@@ -388,10 +389,11 @@ static void mt7621_pcie_reset_ep_deassert(struct mt7621_pcie *pcie)
 	msleep(PERST_DELAY_MS);
 }
 
-static void mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
+static int mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	struct mt7621_pcie_port *port, *tmp;
+	u8 num_disabled = 0;
 	int err;
 
 	mt7621_pcie_reset_assert(pcie);
@@ -424,6 +426,7 @@ static void mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
 			mt7621_control_assert(port);
 			clk_disable_unprepare(port->clk);
 			port->enabled = false;
+			num_disabled++;
 
 			if (slot == 0) {
 				tmp = port;
@@ -434,6 +437,8 @@ static void mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
 				phy_power_off(tmp->phy);
 		}
 	}
+
+	return (num_disabled != PCIE_PORT_CNT) ? 0 : -ENODEV;
 }
 
 static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
@@ -541,7 +546,11 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	mt7621_pcie_init_ports(pcie);
+	err = mt7621_pcie_init_ports(pcie);
+	if (err) {
+		dev_err(dev, "Nothing connected in virtual bridges\n");
+		return 0;
+	}
 
 	err = mt7621_pcie_enable_ports(bridge);
 	if (err) {
-- 
2.25.1

