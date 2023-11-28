Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA96640BFF
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s1cbKcHM"
Received: from umang.jain (unknown [103.238.109.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1D0FBEB;
	Tue, 28 Nov 2023 21:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701202715;
	bh=Aw14YJcNorrt7GqxRG70LVe8RNenb1dxIcHiuL2EocE=;
	h=From:To:Cc:Subject:Date:From;
	b=s1cbKcHMuETH8tjDHfd10XsNBn6OKRta+xKL8AuMd80BmoFSffl7k/dAM1IZiyWXT
	 fNnBs3BXM6nM/NoGU4NAJpvogwjWVpyubC94bBCVwrBkj7LPxErKz2TKfw0PXnDNqt
	 eAWabhnJxC9cciN0d+HogOCrpYyl/TqBwXBFHXgU=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2] staging: vc04_services: vchiq_core: Log through struct vchiq_instance
Date: Wed, 29 Nov 2023 01:48:45 +0530
Message-ID: <20231128201845.489237-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The handle_to_service() helper can return NULL, so `service` pointer
can indeed be set to NULL. So, do not log through service pointer
(which can cause NULL-deference), instead, use the vchiq_instance
function argument to get access to the struct device.

Fixes: f67af5940d6d ("staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic debug")
Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
Changes in v2:
- Separate out from patch series:
  [PATCH 1/9] staging: vc04_services: vchiq_core: Log through struct vchiq_instance
- Add missing space in FixeS: tag
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 0468689a6325..e0022acb4c58 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -245,7 +245,7 @@ find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_debug(service->state->dev, VCHIQ_CORE,
+	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
 			"Invalid service handle 0x%x", handle);
 	return NULL;
 }
@@ -287,7 +287,7 @@ find_service_for_instance(struct vchiq_instance *instance, unsigned int handle)
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_debug(service->state->dev, VCHIQ_CORE,
+	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
 			"Invalid service handle 0x%x", handle);
 	return NULL;
 }
@@ -310,7 +310,7 @@ find_closed_service_for_instance(struct vchiq_instance *instance, unsigned int h
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_debug(service->state->dev, VCHIQ_CORE,
+	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
 			"Invalid service handle 0x%x", handle);
 	return service;
 }
-- 
2.41.0

