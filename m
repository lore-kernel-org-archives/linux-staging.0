Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3973FB2C
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711017480; cv=none; b=Js+UrRCOE8YDho7ZK3EgbQLaTZrAoUjT106SVYSYW9CVrZPzZa8fnlFoSTqnfFZpMMMCbrOtJdjbOLrtCEl5lwS7Mra/sL7sac6j26un09qiqXW3A3tBUGDlGDPaTS82ih8qjr+M7Oqd7WKCgiHl2cfzzdGBYdml0FbI9LgKzd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711017480; c=relaxed/simple;
	bh=Nix7wT5xKqC1HhipqWwpGF8NKC+lm0ccQw2j0cNI49Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K/VeEMMBmWmxUFnfMMTTi/58WWEFcpnsdHQ1rRRGp8Qo6gtRwc3HsAxIHWCqV9IH4Lwa+XmVtBg24a2lxEOxlfUYbnP4PYUWW6tgnCmxOhdUvjEtZWJrmcfqVTH4tMFCtZe7UKjbxE9mkSh4mJXONAL9SvznIl/Zx50n/avRx4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vmSTMZfG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vmSTMZfG"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 618E62B3;
	Thu, 21 Mar 2024 11:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711017445;
	bh=Nix7wT5xKqC1HhipqWwpGF8NKC+lm0ccQw2j0cNI49Y=;
	h=From:To:Cc:Subject:Date:From;
	b=vmSTMZfGxy1LGQRqWcYJcGtauHS03F/jEDmlK9kyrytO+m30tXNo1QXItko4fEh0B
	 NWcsBysZuAhB6tG184PM2BYzYhaQA3EZ3AEFKB3+goQhWtsIRppSzcWtv59UPK4U0o
	 wl+H6bVS952El77rhmog7vj/5UErU63oIRn7Wl8w=
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
Subject: [PATCH v3 0/6] staging: vc04_services: Drop non-essential global members
Date: Thu, 21 Mar 2024 16:07:34 +0530
Message-ID: <20240321103740.808561-1-umang.jain@ideasonboard.com>
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

Patch 2/6 is a splits static platform data and runtime data.
This is prep-up patch for removing global variables

Patch 3/6 drops g_cache_line_size and use direct value from
vchiq_platform_info

Patch 4/6 drops global variables tracking connections to vchiq driver
through vchiq_connected[.ch].

Patch 5/6 drops global variables pertaining to track memory pages

Patch 6/6 is already a completed item - so just a TODO cleanup

The user of vchiq_connected.[ch] is not present currently, but the user
will be present when we will upstream bcm2835-isp via the vc-sm-cma
driver. Posting a branch for reference [1] to provide and test the idea
behind this series.

[1]: https://git.uk.ideasonboard.com/uajain/linux/commits/branch/uajain/remove-global

Changes in v3:
- Rework 2/6 to 5/6 as per Laurent's review in v2 [2].
- Add a comment for g_regs global __iomem ptr.
[2]: https://lore.kernel.org/linux-staging/4ba0d745-fc8d-4886-b71a-1f19962e9103@moroto.mountain/T/#m440ee992442cc82ea43092b7c895823c918d105f

Changes in v2:
- Found even more g_* global variables than v1, so new patches to drop
  them
- Introduce 1/6 as suggested during v1 review
- Introuce 6/6 to cleanup the TODO list

Umang Jain (6):
  staging: vc04_services: Drop g_once_init global variable
  staging: vc04_services: vchiq_arm: Split driver static and runtime
    data
  staging: vc04_services: vchiq_arm: Drop g_cache_line_size
  staging: vc04_services: Drop global members for tracking connections
  staging: vc04_services: Drop global variables tracking allocated pages
  staging: vc04_services: Drop completed TODO item

 drivers/staging/vc04_services/interface/TODO  |  15 --
 .../interface/vchiq_arm/vchiq_arm.c           | 142 +++++++++---------
 .../interface/vchiq_arm/vchiq_arm.h           |  24 +++
 .../interface/vchiq_arm/vchiq_bus.c           |   4 +
 .../interface/vchiq_arm/vchiq_bus.h           |   3 +
 .../interface/vchiq_arm/vchiq_connected.c     |  35 ++---
 .../interface/vchiq_arm/vchiq_connected.h     |   3 +-
 7 files changed, 119 insertions(+), 107 deletions(-)


base-commit: 68bb540b1aefded1d58a9f956568d5316643d291
-- 
2.43.0

