Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C24374EF
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 18:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711649506; cv=none; b=Z0fvqF1jINHLZUuZIIucfKaNnTLuId8De3fLMv1u0z3yxANjAe+xnkfk+QUniN9yfFSCMJq+Q6aARNjrFBGwtl7VSyQpBPEB+bGs6AQuMZkvqXn/JP4UQ4txEy2hY8dmv7tRl2IvanpYCZfy543eOzD5Kcf395EOtNDHkNXmWvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711649506; c=relaxed/simple;
	bh=ISJIFn7wqHNxPwphJDtRw7aHMiIeFq5so/1OtmYaHYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WZa0ludC+JOKm5iJapPgsZheRmJKAXFvqkomOu7sHVKv04lqGKHBn84Xq0B3cNFgEK03aRAx3lTQO+7l/mbb6b9BCHNiOVrcjb9P2eporKAJJEoK2O/q802BgK2Mt74X8cZ+SfKD3KmFjQsho7jZuVkqhjNjDI9QLbrp83CEYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PDlhanyF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PDlhanyF"
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7BB2D20;
	Thu, 28 Mar 2024 19:11:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711649469;
	bh=ISJIFn7wqHNxPwphJDtRw7aHMiIeFq5so/1OtmYaHYo=;
	h=From:To:Cc:Subject:Date:From;
	b=PDlhanyFEfnVGXGQAjrs/yFIAbRx9LrQMmY+dCVaw+Icyo1STX/om1Xqlgs56S01q
	 aBKePg6C5hux1nIDfT42DHCiwr4WD/FNENBpF3hbmv2AkPEaJRw07GTTOmdBIFrc3a
	 dCQRukKWtNVOFEynWEW5rcL91wCJOZkIe5YPqDj0=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v4 00/11] staging: vc04_services: Drop non-essential global members
Date: Thu, 28 Mar 2024 23:41:22 +0530
Message-ID: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to drop the remaining (non-essential) global members
to address the following TODO item:
```
* Get rid of all non essential global structures and create a proper per
device structure
```

Mainly the global members are moved to be contained inside platform
driver data. They can be access via platform_get_drvdata().

More re-fractoring has gone into this version now. Please look
for individual commit for details.

---
NOTE: Series has been developed on top of [1]
"[PATCH] staging: vc04_services: Stop kthreads on .remove"

The fate of that patch is still undecided, so we need to take into
account on the direction the discussions take. That will only affect
Patch 10/11 of this series, rest is fairly independent in that regard.
---

Changes in v4:
- New patch to drop vchiq_connected.[ch] files and move the functions
  to vchiq_arm.c (5/11)
- De-globalise remapped memory region pointer (7/11)
- De-globalise global spinlocks too (8/11)
- De-globalise global vchiq_pointer g_state (10/11)
- commit message updates and trivial variable renaming

Changes in v3:
- Rework 2/6 to 5/6 as per Laurent's review in v2 [2].
- Add a comment for g_regs global __iomem ptr.

[1]: https://lore.kernel.org/linux-staging/4ba0d745-fc8d-4886-b71a-1f19962e9103@moroto.mountain/T/#m440ee992442cc82ea43092b7c895823c918d105f

Changes in v2:
- Found even more g_* global variables than v1, so new patches to drop
  them
- Introduce 1/6 as suggested during v1 review
- Introuce 6/6 to cleanup the TODO list

[1]: https://lore.kernel.org/linux-staging/171161507013.3072637.12125782507523919379@ping.linuxembedded.co.uk/T/#m1d3de7d2fa73b2447274858353bbd4a0c3a8ba14



Umang Jain (11):
  staging: vc04_services: Drop g_once_init global variable
  staging: vc04_services: vchiq_arm: Split driver static and runtime
    data
  staging: vc04_services: vchiq_arm: Drop g_cache_line_size
  staging: vc04_services: Move variables for tracking connections
  staging: vc04_services: Drop vchiq_connected.[ch] files
  staging: vc04_services: Move global variables tracking allocated pages
  staging: vc04_services: Move global memory mapped pointer
  staging: vc04_services: Move spinlocks to vchiq_state
  staging: vc04_services: vchiq_mmal: Rename service_callback()
  staging: vc04_services: Move global g_state vchiq_state pointer
  staging: vc04_services: Drop completed TODO item

 drivers/staging/vc04_services/Makefile        |   1 -
 .../bcm2835-camera/bcm2835-camera.c           |   4 +-
 .../include/linux/raspberrypi/vchiq.h         |   4 +-
 drivers/staging/vc04_services/interface/TODO  |  15 --
 .../interface/vchiq_arm/vchiq_arm.c           | 253 ++++++++++--------
 .../interface/vchiq_arm/vchiq_arm.h           |  56 +++-
 .../interface/vchiq_arm/vchiq_bus.c           |   3 +
 .../interface/vchiq_arm/vchiq_bus.h           |   3 +
 .../interface/vchiq_arm/vchiq_connected.c     |  74 -----
 .../interface/vchiq_arm/vchiq_connected.h     |  12 -
 .../interface/vchiq_arm/vchiq_core.c          |  51 ++--
 .../interface/vchiq_arm/vchiq_core.h          |  10 +-
 .../interface/vchiq_arm/vchiq_debugfs.c       |   5 +-
 .../interface/vchiq_arm/vchiq_dev.c           |  34 +--
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  14 +-
 .../vc04_services/vchiq-mmal/mmal-vchiq.h     |   3 +-
 16 files changed, 265 insertions(+), 277 deletions(-)
 delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
 delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h

-- 
2.43.0

