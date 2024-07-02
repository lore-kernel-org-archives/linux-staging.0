Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B9514293
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 16:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719938604; cv=none; b=CZtqqcMxlwdZ/Rw8yWXOyEzzXMZrXkcWLeOlibPjof9VQQPdqhd88j4e0rWGbkZZc+wh5/tKr5A7BRS48OE0Jo8rZI2WkC2VA+ICvx3y219/JfphPsyoPLOPYuS05WFRa7b6W+Fib7V3e9OwXZ6McTzvz0x6QxM79stOiBNdlOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719938604; c=relaxed/simple;
	bh=TubnqQq0hJZYxj6aH3ouMGbG7xuMGbDotIHJpnCpLD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CKGcd/h/TvCvpJk7SeBq21GV6og6U6ocjHWr5uM85tO8I/Gi3IU8u+feU+J6Qg0Sc8A91ZVveoCm4Lh8za+0a1KFg5dpBfId3BW50pg1TKlubC6zS5urbN5iUiRbN+GSbsQE806pPYfegR2K6JmQZgO3fUWftkQuhcGQGAnqFZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B5b5CKeO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B5b5CKeO"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C31C3836;
	Tue,  2 Jul 2024 18:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719938567;
	bh=TubnqQq0hJZYxj6aH3ouMGbG7xuMGbDotIHJpnCpLD8=;
	h=From:To:Cc:Subject:Date:From;
	b=B5b5CKeO+JQo/BM8O2QDuMoy1XRPUHioCYU0Ga1P9ZTMiL7ohf9xHV/z82StbF0tk
	 1xXtPdpXnpw8w4zZ7HQ6AQfp1gaXqv/MsOP2lY4ICJ4lFlwHe2OhbUAl0UY81BAD7O
	 mvLp5GY1qUBBOmDf/CaM4hKOWeb/BdOMjQ0uLgTw=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/2] staging: vchiq_core: Stop kthreads on module unload
Date: Tue,  2 Jul 2024 22:12:54 +0530
Message-ID: <20240702164256.754391-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a re-attempt of [1] where we noticed corruption of vc04 firmware
on stopping the kthread.

After investigation, I found that the case where
wait_event_interruptible() can return early(wait failed) with
-ERESTARTSYS, is something not handling in remote_event_wait(). Once we
bubble up the that return/err code and handle it - the issue is resolved
correctly and kthreads are stopped as expected.

Patch 1/2 handles the returning of the return value from
wait_event_interruptible()

Patch 2/2 handles stopping of kthreads.

---
Testing with
+CONFIG_BCM_VIDEOCORE=y
+CONFIG_BCM2835_VCHIQ=m
+CONFIG_VCHIQ_CDEV=y
+CONFIG_BCM2835_VCHIQ_MMAL=m

and as per
drivers/staging/vc04_services/interface/TESTING

Entire test sequence: 
https://paste.debian.net/plain/1322107
---

Umang Jain (2):
  staging: vchiq_core: Bubble up wait_event_interruptible() return value
  staging: vc04_services: vchiq_core: Stop kthreads on shutdown

 drivers/staging/vc04_services/interface/TODO  |  7 ----
 .../interface/vchiq_arm/vchiq_arm.c           | 10 +++++-
 .../interface/vchiq_arm/vchiq_core.c          | 33 ++++++++++++++-----
 3 files changed, 33 insertions(+), 17 deletions(-)

-- 
2.43.0

