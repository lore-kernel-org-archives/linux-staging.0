Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A2736AE6
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nNTZadJd"
Received: from umang.jain (unknown [103.251.226.64])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9636124F;
	Thu,  9 Nov 2023 22:02:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699563780;
	bh=UfJyIu1xY2d99szk35sdQMZkI8dWjEPq/02vKPTcI8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nNTZadJd3eph/vo7bCIAOBm+gng2BsXYpV9Vng2WzMaNV6PhMAMd5rwEAWxc+ENsh
	 bkyBGV0MzjDqulVEMYo+2l/o9rO4IIVoO3BQoZUVFTvuLaG/t+cqcfZEKTvKs2GcDS
	 mvQ7EFOLzELG1ijsIshitJa+h/o+rk3DHyjFkvPk=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org,
	kernel-list@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Dan Carpenter <error27@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 02/15] staging: vc04_services: vchiq_arm: Register vcsm-cma driver
Date: Thu,  9 Nov 2023 16:02:54 -0500
Message-ID: <20231109210309.638594-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109210309.638594-1-umang.jain@ideasonboard.com>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the vcsm-cma driver with the vchiq_bus_type.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9fb8f657cc78..5a9073480dd3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -70,6 +70,7 @@ struct vchiq_state g_state;
  */
 static struct vchiq_device *bcm2835_audio;
 static struct vchiq_device *bcm2835_camera;
+static struct vchiq_device *vcsm_cma;
 
 struct vchiq_drvdata {
 	const unsigned int cache_line_size;
@@ -1840,6 +1841,7 @@ static int vchiq_probe(struct platform_device *pdev)
 		goto error_exit;
 	}
 
+	vcsm_cma = vchiq_device_register(&pdev->dev, "vcsm-cma");
 	bcm2835_audio = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 	bcm2835_camera = vchiq_device_register(&pdev->dev, "bcm2835-camera");
 
@@ -1855,6 +1857,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	vchiq_device_unregister(bcm2835_audio);
 	vchiq_device_unregister(bcm2835_camera);
+	vchiq_device_unregister(vcsm_cma);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
 }
-- 
2.41.0

