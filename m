Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965051E506
	for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 19:54:33 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [103.86.18.170])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CB8D755;
	Wed, 13 Sep 2023 21:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1694634779;
	bh=FCHVNEv/n2Q1J9B1s0VB82C7wBBOUPiKQ1IHpgUhfXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QXAk6thMUafYWMBT5aM0HeH5o7yc3xG/zrdSiGs/NxhFjunwUG/KrBqVMxaN4wKo7
	 auGWunZGl1pViUh/GQYj3Kke9ixvqvNJq70tbrrgvSYlPUygzWV8TlrcudEKDe3EyH
	 GvaBzwbiN6Wt6eXBJQVKtt28lUk+VtSkmDPB7bxo=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v11 5/5] staging: vc04_services: vchiq_arm: Remove vchiq_register_child()
Date: Thu, 14 Sep 2023 01:23:54 +0530
Message-Id: <20230913195354.835884-6-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230913195354.835884-1-umang.jain@ideasonboard.com>
References: <20230913195354.835884-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vchiq_register_child() is used to registered child devices as platform
devices. Now that the child devices are migrated to use the
vchiq_bus_type instead, they will be registered to that. Hence, drop
vchiq_register_child() as it is no more required.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 2da470740cda..5eccf5b277e5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1776,28 +1776,6 @@ static const struct of_device_id vchiq_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, vchiq_of_match);
 
-static struct platform_device *
-vchiq_register_child(struct platform_device *pdev, const char *name)
-{
-	struct platform_device_info pdevinfo;
-	struct platform_device *child;
-
-	memset(&pdevinfo, 0, sizeof(pdevinfo));
-
-	pdevinfo.parent = &pdev->dev;
-	pdevinfo.name = name;
-	pdevinfo.id = PLATFORM_DEVID_NONE;
-	pdevinfo.dma_mask = DMA_BIT_MASK(32);
-
-	child = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(child)) {
-		dev_warn(&pdev->dev, "%s not registered\n", name);
-		child = NULL;
-	}
-
-	return child;
-}
-
 static int vchiq_probe(struct platform_device *pdev)
 {
 	struct device_node *fw_node;
-- 
2.40.1

