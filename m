Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CCE2F5B
	for <linux-staging@lists.linux.dev>; Tue, 20 Jun 2023 13:42:26 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [103.86.18.208])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 115812907;
	Tue, 20 Jun 2023 15:41:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1687268510;
	bh=aTEauMEul+vJmNEkdf5DceHvA7fGrWLQch/ls0rhujQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WuHNcBPiGQiLfIWnbBgjQGSSYBkNmwFtl7mlbopXNlIqdBvV5FJFlYj9rfaeF52Qr
	 rb18jihoh9yOMgGQRcrN5AzPAW1O+VYtQEBxHXDTpy1Ln2hg8ttvNNzNBwGwd84Lo/
	 TqGJtFHr6NYYsKf7ULY5JLw83b2iDBQ8aogyCvYk=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stefan.wahren@i2se.com,
	gregkh@linuxfoundation.org,
	f.fainelli@gmail.com,
	athierry@redhat.com,
	error27@gmail.com,
	dave.stevenson@raspberrypi.com,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v7 5/5] staging: vc04_services: vchiq_arm: Remove vchiq_register_child()
Date: Tue, 20 Jun 2023 19:11:52 +0530
Message-Id: <20230620134152.383569-6-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230620134152.383569-1-umang.jain@ideasonboard.com>
References: <20230620134152.383569-1-umang.jain@ideasonboard.com>
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
---
 .../interface/vchiq_arm/vchiq_arm.c           | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 75da37fa6372..3c52b09c49ea 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1778,28 +1778,6 @@ static const struct of_device_id vchiq_of_match[] = {
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
2.39.1

