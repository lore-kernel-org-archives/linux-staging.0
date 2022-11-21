Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F6410786
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 21:50:24 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86E2774C;
	Mon, 21 Nov 2022 22:50:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1669067422;
	bh=ab/M/OIelsZJVM+cOrB1iuAvkOA5/zw0fpy5r81fmTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ONnGRiFazzcorUmfvsOxWLnHizKIjiis8UEo/8G7e5n0+w+65WQjdKzR6yvUifnkK
	 BGHYlId7R51m216htZxItp5XlDdK3dkMMUaZc3GhvsBa6DCo2PqmlTN5/ivh9Y64ha
	 7LjXIZwAiSj2yjCUl+JZQYnmw9VVyhP/wSI/LPuw=
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
Subject: [PATCH 14/14] staging: vc04_services: vchiq: Load bcm2835_isp driver from vchiq
Date: Tue, 22 Nov 2022 03:17:22 +0530
Message-Id: <20221121214722.22563-15-umang.jain@ideasonboard.com>
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

From: Naushir Patuck <naush@raspberrypi.com>

bcmn2835_isp is a platform driver dependent on vchiq,
therefore add the load/unload functions for it to vchiq.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 642fdbc0d654..2d070f80a170 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -67,6 +67,7 @@ struct vchiq_state g_state;
 
 static struct platform_device *bcm2835_camera;
 static struct platform_device *bcm2835_audio;
+static struct platform_device *bcm2835_isp;
 static struct platform_device *vcsm_cma;
 
 struct vchiq_drvdata {
@@ -1836,6 +1837,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	vcsm_cma = vchiq_register_child(pdev, "vcsm-cma");
 	bcm2835_camera = vchiq_register_child(pdev, "bcm2835-camera");
 	bcm2835_audio = vchiq_register_child(pdev, "bcm2835_audio");
+	bcm2835_isp = vchiq_register_child(pdev, "bcm2835-isp");
 
 	return 0;
 
@@ -1847,6 +1849,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 static int vchiq_remove(struct platform_device *pdev)
 {
+	platform_device_unregister(bcm2835_isp);
 	platform_device_unregister(bcm2835_audio);
 	platform_device_unregister(bcm2835_camera);
 	platform_device_unregister(vcsm_cma);
-- 
2.37.3

