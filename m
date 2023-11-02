Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C0E208D2
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 21:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rybdSYwf"
Received: from umang.jain (unknown [103.86.18.252])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEA878C2;
	Thu,  2 Nov 2023 22:05:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698959157;
	bh=Xf7dJFzb0qM5K2nV1aafE0Mnl/RJXFGyi+hAmDPmjjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rybdSYwf6MSzyhGZuKydECbcz9x2JFOKCYEQtrVKdJP5EIJv86OHsbi7fv+Her/Aq
	 Ckor+z8DEYls606w8rwbOFaUvm0Jc0yjg1Jpb1ZjHMMKOsgg+n5LhffBfS5PMr4YYx
	 VrmG17sDBmO5yWSL2jLhwFOKPX5U0trHAz6AtXbw=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/3] staging: vc04_services: vchiq_core: Log through struct vchiq_instance
Date: Thu,  2 Nov 2023 17:06:01 -0400
Message-ID: <20231102210603.1201311-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102210603.1201311-1-umang.jain@ideasonboard.com>
References: <20231102210603.1201311-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The handle_to_service() helper can return NULL, so service pointer
can indeed be set to NULL. Hence, do not log through service pointer,
use the vchiq_instance function argument to get access to the
struct device.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
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

