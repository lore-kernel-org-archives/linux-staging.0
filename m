Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217D19474
	for <linux-staging@lists.linux.dev>; Fri, 15 Mar 2024 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710500242; cv=none; b=EWdjyeJuBhioqr5jcQuaoV9XoyUm9jXyRsf5BgdLhRvWXMi3OqY5acgHjZhWnUnA26F1X4joFAd3zaEV5YB5AfPx4MkmI4bf0b4Ag2W1VTnJk3zZY7oU0WUWdfrLcKyGq5z8+IeIbm1tx39DJmQzL5CWpNv4y2tUmiNUhk4dKrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710500242; c=relaxed/simple;
	bh=PbDCvCTdwclKKc9rO+xnNEbkvwht2Z8+0AoiwawwS4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFUF6uBCo3UYrH5CdM/34VI42YQZNIQjS8G/FcHJgXvTVT/FBC3c6J1ySHJNubZHyqyLe3yLAHQALWZSyD8Dak+nWixddEAsxCnItOnBVXB01DAvz/gSsIipbZLGZTPT+lenEveZPJ6uj+RyQ8Xx/xqtM71g82xWDslEeavI8Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qSFCHRnV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qSFCHRnV"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73B13E4;
	Fri, 15 Mar 2024 11:56:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710500216;
	bh=PbDCvCTdwclKKc9rO+xnNEbkvwht2Z8+0AoiwawwS4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qSFCHRnVGJw2kS4uxMOwxn8Rb2Pfus36pZxwIlk2bq3EYuf4Q745iTc3lf6gLDl4G
	 64VdAVUCO3IhN19XB5Lwchb5cqyZtmkaM6egF17fhigVCWC6thZ2qTKJXb2h/C1kTh
	 B8SKPrDzGQSGMleH3KKjF4y71INpS/tp789IPY+g=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 4/5] staging: vc04_services: Implement vchiq_bus .remove
Date: Fri, 15 Mar 2024 16:26:58 +0530
Message-ID: <20240315105659.111544-5-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240315105659.111544-1-umang.jain@ideasonboard.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com>
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
 .../vc04_services/interface/vchiq_arm/vchiq_bus.c        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
index 68f830d75531..d9aa2f41ce13 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
@@ -37,11 +37,20 @@ static int vchiq_bus_probe(struct device *dev)
 	return driver->probe(device);
 }
 
+static void vchiq_bus_remove(struct device *dev)
+{
+	struct vchiq_device *device = to_vchiq_device(dev);
+	struct vchiq_driver *driver = to_vchiq_driver(dev->driver);
+
+	driver->remove(device);
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

