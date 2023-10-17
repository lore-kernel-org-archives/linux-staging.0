Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A163430E8
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bBLgXnRi"
Received: from umang.jainideasonboard.com (unknown [103.251.226.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6391735;
	Tue, 17 Oct 2023 22:05:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697573124;
	bh=xzrYWoOvVrM0rZ9vBAEGglUHYsnMRSjF5q/pboHaYGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBLgXnRiLBVc04k5NahYb5Lmlc9qZqRCbp9cb+oV/Y4tI0W8yEoBYaBmVFlLkefjP
	 Zfs1uLdTYvE+k+5cdEyoznC9AcVlTYNi41Hc7o6D/c9u3OGVr6yg0e348QzQR0Nt/C
	 b9bDAQ8FW3hz6Nyw/Ca4cQ1WywKNnqxVrLwclyFs=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 2/3] staging: vc04_services: bcm2835-audio: Drop MODULE_ALIAS
Date: Wed, 18 Oct 2023 01:35:10 +0530
Message-Id: <20231017200511.678223-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017200511.678223-1-umang.jain@ideasonboard.com>
References: <20231017200511.678223-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop MODULE_ALIAS in favour of MODULE_DEVICE_TABLE as the module
alias should be dropped from there.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
index 06bdc7673d4b..bb4ac7f5ad8f 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
@@ -311,12 +311,18 @@ static int snd_bcm2835_alsa_resume(struct vchiq_device *device)
 
 #endif
 
+static struct vchiq_bus_device_id device_id_table[] = {
+        { .name = "bcm2835-audio" }
+};
+MODULE_DEVICE_TABLE(vchiq_bus, device_id_table);
+
 static struct vchiq_driver bcm2835_alsa_driver = {
 	.probe = snd_bcm2835_alsa_probe,
 #ifdef CONFIG_PM
 	.suspend = snd_bcm2835_alsa_suspend,
 	.resume = snd_bcm2835_alsa_resume,
 #endif
+	.id_table = device_id_table,
 	.driver = {
 		.name = "bcm2835-audio",
 	},
@@ -326,4 +332,3 @@ module_vchiq_driver(bcm2835_alsa_driver);
 MODULE_AUTHOR("Dom Cobley");
 MODULE_DESCRIPTION("Alsa driver for BCM2835 chip");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("bcm2835-audio");
-- 
2.40.1

