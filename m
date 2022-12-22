Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9D7489
	for <linux-staging@lists.linux.dev>; Thu, 22 Dec 2022 19:15:26 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [IPv6:2401:4900:1f3f:d076:4da6:b729:f032:ed0a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49B6E89F;
	Thu, 22 Dec 2022 20:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1671736524;
	bh=ZVkLGUNPuXKW9TCCk2CvFJa796G8cO0C9Y1XT9ye/iw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e4std9e1LWG4Z+fh4/ZeD7HFUx10A7JSRR2HuymdcZYROvVfrwjbticYFHytoJJnp
	 vNfowK277ndSn0PNfBxt3BOKF4jjGA0NIPpvfXar9wSqXQpowknm4mdOB1HwIqU7n/
	 8Bn5vQv1ia7ly4RIZLI2fiu0hwoHCIO/Q+CsRF3w=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Adrien Thierry <athierry@redhat.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 2/4] staging: vchiq: Do not assign default dma_mask explicitly
Date: Fri, 23 Dec 2022 00:44:58 +0530
Message-Id: <20221222191500.515795-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222191500.515795-1-umang.jain@ideasonboard.com>
References: <20221222191500.515795-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vchiq driver assigns DMA_BIT_MASK(32) to the child platform devices
it registers. By default, platform_device_register_* helpers assign
DMA_BIT_MASK(32) dma_mask to the platform devices it registers. It is
unnecessary to define it explicitly in struct platform_device_info
hence, drop this explicit dma_mask assignment.

This will help simplying the vchiq_register_child() going forwards.
No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index fc7ea7ba97b2..3c4766375daa 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1774,7 +1774,6 @@ vchiq_register_child(struct platform_device *pdev, const char *name)
 	pdevinfo.parent = &pdev->dev;
 	pdevinfo.name = name;
 	pdevinfo.id = PLATFORM_DEVID_NONE;
-	pdevinfo.dma_mask = DMA_BIT_MASK(32);
 
 	child = platform_device_register_full(&pdevinfo);
 	if (IS_ERR(child)) {
-- 
2.38.1

