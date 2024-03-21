Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4118405F
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026491; cv=none; b=A9cp9p88Vc9ypriLszXhtpdIYdY3Byj7ywEDGWlmVYtc6lz/FzDhl2v8IzPv7tkl4ofjf8wvJjULA6WoB/s0aI9MS1560vZHgSCpt04G1TZH0XNT8Ue15LGaALZatpinrUQujJcwcUK1YDEptNjIrRso26Fh6IiYFFX8J3z9uIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026491; c=relaxed/simple;
	bh=3RQqx8TTbZn4ocJGXmWzX3AEckBOQqV6iuezwlDgHyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5CYSFFKnmUh86REND5gNYkQ7dcYXxz2N6LsHqHdQdWg6Flssvs1mCjy03n+xvDfD9sl+XXOF8AcCrLCSTWopiXZN8KT6dE04xVtd7p772RWSIBWqFhhWKsxerzzyjjgs8rTBkWJPiN4Ffz5+ucpS/QTQEOa9j06RqBxckn7+iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZMotlHDq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZMotlHDq"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E12532B3;
	Thu, 21 Mar 2024 14:07:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711026460;
	bh=3RQqx8TTbZn4ocJGXmWzX3AEckBOQqV6iuezwlDgHyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZMotlHDq+0/bMx67aHwnX6U/2F7Xt1BYHpruYvf77AUM8DUaCDWl+vKbep/MnH1kJ
	 EmjOPbWrzbpw4hAxOVFOeI/cZADyFrcC2C/HoCwvMww812T27GhCs9zTRrJqJNBZIk
	 mRHox0fXXJkMeGKsFjyQ014qd8oQRALDaBeuAWms=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 4/5] staging: vc04_services: Implement vchiq_bus .remove
Date: Thu, 21 Mar 2024 18:37:36 +0530
Message-ID: <20240321130737.898154-5-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321130737.898154-1-umang.jain@ideasonboard.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the struct vchiq_bus .remove() so that cleanup
paths can be executed by the devices registered to this
bus, when being removed.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_bus.c      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
index 68f830d75531..93609716df84 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
@@ -37,11 +37,21 @@ static int vchiq_bus_probe(struct device *dev)
 	return driver->probe(device);
 }
 
+static void vchiq_bus_remove(struct device *dev)
+{
+	struct vchiq_device *device = to_vchiq_device(dev);
+	struct vchiq_driver *driver = to_vchiq_driver(dev->driver);
+
+	if (driver->remove)
+		driver->remove(device);
+}
+
 const struct bus_type vchiq_bus_type = {
 	.name   = "vchiq-bus",
 	.match  = vchiq_bus_type_match,
 	.uevent = vchiq_bus_uevent,
 	.probe  = vchiq_bus_probe,
+	.remove = vchiq_bus_remove,
 };
 
 static void vchiq_device_release(struct device *dev)
-- 
2.43.0

