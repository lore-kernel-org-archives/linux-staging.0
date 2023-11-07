Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A8D12E40
	for <linux-staging@lists.linux.dev>; Tue,  7 Nov 2023 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hEbFaEIh"
Received: from umang.jain (unknown [103.251.226.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CD559CC;
	Tue,  7 Nov 2023 10:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699350709;
	bh=XcQcBwrrItguHb39ejr0MBXHrExUnC6HOo/l8SOH7Lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hEbFaEIha4d3W0T1gYuX+yETR3FW0eTsMe98KolaO8pHDCmAoSkljtw9uvLW3XWR1
	 Me5AyVgYOBqnM2I/Ej70mMLsDzCGoj+9PDG+Dq5WE7niD3eaewn03hnQzM0nkw+ruK
	 vZSJcSc31fXlevATWXCFTfyU8G3hnyCgOFfqhUf4=
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
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Subject: [PATCH 1/9] staging: vc04_services: vchiq_core: Log through struct vchiq_instance
Date: Tue,  7 Nov 2023 04:51:48 -0500
Message-ID: <20231107095156.365492-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107095156.365492-1-umang.jain@ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The handle_to_service() helper can return NULL, so `service` pointer
can indeed be set to NULL. So, do not log through service pointer
(which will cause NULL-deference), instead, use the vchiq_instance
function argument to get access to the struct device.

Fixes: f67af5940d6d("staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic debug")
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 39b857da2d42..8a9eb0101c2e 100644
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

