Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B556D1BA
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710410781; cv=none; b=Hum8IaZuIcVJBDAYmH5FMDaLOX07PsodFH/G8CT/4VZ7ludgAuRAtDtbGOdHRC6gTFifKgIakgDwIeSIML0sFnZYXAKnKQOi8CeCwMLUuVFl4wjba0FyzgAUFg4BrFzSxbT6i8FgK42dvPmJGinT8qQh0oCN+y0+IeDa3lQvG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710410781; c=relaxed/simple;
	bh=0E+Ng4fhokA1iaX8AX0fqCHRQbVcban90tQHKnJ6EoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jIexikf79awdp5rJ/ZlXsTn6IwbCU8K/EMM+WyH4Y8+Zfo4LsfWdTEh44mpcjUCsk13/r/xKrErtbmOEfhIQRr6hNhhnwwTVQCKVD4xDmtK1brsj7sUK78qZYnhT253yAxoPV8SBW8HhUuWxURuWzgd21VyQo0bBnmw+aBdDSCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OloZJOwm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OloZJOwm"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A47906BE;
	Thu, 14 Mar 2024 11:05:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710410754;
	bh=0E+Ng4fhokA1iaX8AX0fqCHRQbVcban90tQHKnJ6EoY=;
	h=From:To:Cc:Subject:Date:From;
	b=OloZJOwmBcI0569sR+4GP3NEopaNsgzHudF5dA1oQhvmfwU+t500A+95+f50eoYP7
	 Gj5zYDjf5K0Bzs50DKEa0liNn6xcbZF/d3kBdsdjNin7R8bmFWd+y0Z/3gpHlRwRUi
	 gZkwCYQpyNxqhmayW2GyhrftlABUufYjLViCmQgI=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/6] staging: vc04_services: Drop non-essential global members
Date: Thu, 14 Mar 2024 15:36:01 +0530
Message-ID: <20240314100607.336009-1-umang.jain@ideasonboard.com>
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

Patch 1/6 drops the g_once_init variable as it is not used meaningfully.

Patch 2/6 is a prep-up patch for subsequent patches.

Patch 3/6 drops global variables tracking connections to vchiq driver
through vchiq_connected[.ch]. New struct vchiq_connected is introduced
and added to vchiq_drvdata.

Patch 4/6 drops g_cache_line_size and use direct value from
vchiq_drvdata

Patch 5/6 drops global variables pertaining to track memory pages

Patch 6/6 is already a completed item - so just a TODO cleanup

The user of vchiq_connected.[ch] is not present currently, but the user
will be present when we will upstream bcm2835-isp via the vc-sm-cma
driver. Posting a branch for reference [1] to provide and test the idea
behind this series.

[1]: https://git.uk.ideasonboard.com/uajain/linux/commits/branch/uajain/remove-global

Changes in v2:
- Found even more g_* global variables than v1, so new patches to drop
  them
- Introduce 1/6 as suggested during v1 review
- Introuce 6/6 to cleanup the TODO list

Umang Jain (6):
  staging: vc04_services: Drop g_once_init global variable
  staging: vc04_services: vchiq_arm: Move struct vchiq_drvdata to header
  staging: vc04_services: Drop global members for tracking connections
  staging: vc04_services: vchiq_arm: Drop g_cache_line_size
  staging: vc04_services: Drop global variables tracking allocated pages
  staging: vc04_services: Drop completed TODO item

 drivers/staging/vc04_services/interface/TODO  |  15 ---
 .../interface/vchiq_arm/vchiq_arm.c           | 109 +++++++++---------
 .../interface/vchiq_arm/vchiq_arm.h           |  17 +++
 .../interface/vchiq_arm/vchiq_connected.c     |  43 +++----
 .../interface/vchiq_arm/vchiq_connected.h     |  15 ++-
 5 files changed, 99 insertions(+), 100 deletions(-)


base-commit: 68bb540b1aefded1d58a9f956568d5316643d291
-- 
2.43.0

