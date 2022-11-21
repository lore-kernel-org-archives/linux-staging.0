Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A9DEC1D
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 21:48:37 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 084E5E61;
	Mon, 21 Nov 2022 22:48:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1669067316;
	bh=O8PGqwvk0qKv2naaAUYDVsypILKqSXQmDZKmiivH3eY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wV+c4UQeUMeEEfsRPLPFRdMUDyiw/dpuBsFBEg2OW5RUqoDsimavQb7QGebb7PrM8
	 MQ8fo7hzhUCEhimJ4gkkJa2Q7abPuItXm+FkMwuwYfm1xcvZrFZZhOSnTOAm8ZcqeN
	 TwyYfUe1McWOChBYqmSKJXTXoenAEynSIzY3FuVQ=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org,
	kernel-list@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 02/14] staging: vchiq_arm: Register vcsm-cma as a platform driver
Date: Tue, 22 Nov 2022 03:17:10 +0530
Message-Id: <20221121214722.22563-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221121214722.22563-1-umang.jain@ideasonboard.com>
References: <20221121214722.22563-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Following the same pattern as bcm2835-camera and bcm2835-audio,
register the vcsm-cma driver as a platform driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index dc33490ba7fb..642fdbc0d654 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -67,6 +67,7 @@ struct vchiq_state g_state;
 
 static struct platform_device *bcm2835_camera;
 static struct platform_device *bcm2835_audio;
+static struct platform_device *vcsm_cma;
 
 struct vchiq_drvdata {
 	const unsigned int cache_line_size;
@@ -1832,6 +1833,7 @@ static int vchiq_probe(struct platform_device *pdev)
 		goto error_exit;
 	}
 
+	vcsm_cma = vchiq_register_child(pdev, "vcsm-cma");
 	bcm2835_camera = vchiq_register_child(pdev, "bcm2835-camera");
 	bcm2835_audio = vchiq_register_child(pdev, "bcm2835_audio");
 
@@ -1847,6 +1849,7 @@ static int vchiq_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(bcm2835_audio);
 	platform_device_unregister(bcm2835_camera);
+	platform_device_unregister(vcsm_cma);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
 
-- 
2.37.3

