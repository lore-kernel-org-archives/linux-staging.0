Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2B15CB0
	for <linux-staging@lists.linux.dev>; Mon,  9 Oct 2023 06:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C7Y11jmi"
Received: from umang.jainideasonboard.com (unknown [IPv6:2405:201:2033:3002:3848:5d20:59c9:c87c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F4C97E1;
	Mon,  9 Oct 2023 08:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1696831756;
	bh=A7900hRoNjHIzc5sH159mzKXlqgTRZCR0gjaerNuZFo=;
	h=From:To:Cc:Subject:Date:From;
	b=C7Y11jmiULGpsDObBY5alcmikwSHa5p0aqULxzJqm0yova8imKTLa+WEYKV717FxH
	 8CouggJ6EK0Cps4YlB6LwRihD10gV54iBNiye7qtuS/OLx/oFQP+Npx+bYpYLnj1kX
	 W/27bwk9ILY8ed17QxeJedNH7wAUe7xr7XIyWsL0=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] staging: vc04_services: vchiq_bus: Do not kfree device
Date: Mon,  9 Oct 2023 11:39:06 +0530
Message-Id: <20231009060906.33407-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per device_register() documentation, this kfree() on error path will
crash. The call to put_device() is all that is needed here to free the
memory.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
index 4ac3491efe45..0076d091b9b2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
@@ -73,7 +73,6 @@ vchiq_device_register(struct device *parent, const char *name)
 	if (ret) {
 		dev_err(parent, "Cannot register %s: %d\n", name, ret);
 		put_device(&device->dev);
-		kfree(device);
 		return NULL;
 	}
 
-- 
2.40.1

