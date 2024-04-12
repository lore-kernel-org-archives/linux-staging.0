Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A768A3218B
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908678; cv=none; b=OXdfPqSgAqBbW9fSgxvMTcx4ItHWdBgfOsukfE501svSTGCMC+sshp7iPByS9ifjfst2UAa0krwFXvXtOjBERQcLMoBtSrvrAOWb8nWtSxzLpQgCvNoAKBicQvnbuXjryU8USf8Jc46k8Unx+EKzPPcDEMkloLyVE5HJlx8rrMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908678; c=relaxed/simple;
	bh=RAsYLbEBxilXh2KIWfeJtVTz+7im1zugUnOXKwu/CxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FSOi/zmDSgIXSk9vdtEni4Q2M22cWBWIXjKQvulIy2kQYJK8+6KxpfKPFwk5UmLiYn+9JnAFIt8Lba5Q+4ViAZJTLvKZeHoTZPDjHIf9TSqpLQAeW21NPpfRlyNuSKzwqkyzcqYwVVAA85c5bAppgZCKDSjR2w+ZvixJ2sUW5To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z3e9njP7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z3e9njP7"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E02C8E1;
	Fri, 12 Apr 2024 09:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908629;
	bh=RAsYLbEBxilXh2KIWfeJtVTz+7im1zugUnOXKwu/CxY=;
	h=From:To:Cc:Subject:Date:From;
	b=Z3e9njP7oHKB9sBMltBKm7iMnuJ7AUV8KDv3kzzcJlMn7G32qb+ruuUfW5A/05u6B
	 vaoYz73crgoYqk1GEZ6JCculsBb5fNRRvEnEb29viwqfEcusyN/dZc60GBp0cAKtGt
	 PP19PS4z88RuuCMUClMkWcW9spRdb4PHZrLhNx/0=
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
Subject: [PATCH v5 00/11] staging: vc04_services: Drop non-essential global members
Date: Fri, 12 Apr 2024 13:27:32 +0530
Message-ID: <20240412075743.60712-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
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

Testing on top of RPi 3 with staging next.

Changes in v5:
- Rebase over latest staging-testing that contains kthreads revert [2]
- commit messages fixup
- Add suggested-by in 5/11
- Use spinlock_t(typedef) instead of 'struct spinlock_t' in 8/11

Changes in v4:
- New patch to drop vchiq_connected.[ch] files and move the functions
  to vchiq_arm.c (5/11)
- De-globalise remapped memory region pointer (7/11)
- De-globalise global spinlocks too (8/11)
- De-globalise global vchiq_pointer g_state (10/11)
- commit message updates and trivial variable renaming

Changes in v3:
- Rework 2/6 to 5/6 as per Laurent's review in v2 [1].
- Add a comment for g_regs global __iomem ptr.

Changes in v2:
- Found even more g_* global variables than v1, so new patches to drop
  them
- Introduce 1/6 as suggested during v1 review
- Introuce 6/6 to cleanup the TODO list

[1]: https://lore.kernel.org/linux-staging/4ba0d745-fc8d-4886-b71a-1f19962e9103@moroto.mountain/T/#m440ee992442cc82ea43092b7c895823c918d105f

[2]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-testing&id=ebee9ca2f59e35a60a6704a79df6477b3c84ac96

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
  staging: vc04_services: Move global g_state to vchiq_state
  staging: vc04_services: Drop completed TODO item

 drivers/staging/vc04_services/Makefile        |   1 -
 .../bcm2835-audio/bcm2835-vchiq.c             |   5 +-
 .../bcm2835-camera/bcm2835-camera.c           |   4 +-
 .../include/linux/raspberrypi/vchiq.h         |   4 +-
 drivers/staging/vc04_services/interface/TODO  |  15 --
 .../interface/vchiq_arm/vchiq_arm.c           | 252 ++++++++++--------
 .../interface/vchiq_arm/vchiq_arm.h           |  41 ++-
 .../interface/vchiq_arm/vchiq_bus.c           |   3 +
 .../interface/vchiq_arm/vchiq_bus.h           |   3 +
 .../interface/vchiq_arm/vchiq_connected.c     |  74 -----
 .../interface/vchiq_arm/vchiq_connected.h     |  12 -
 .../interface/vchiq_arm/vchiq_core.c          |  51 ++--
 .../interface/vchiq_arm/vchiq_core.h          |  11 +-
 .../interface/vchiq_arm/vchiq_debugfs.c       |   5 +-
 .../interface/vchiq_arm/vchiq_dev.c           |  34 +--
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  14 +-
 .../vc04_services/vchiq-mmal/mmal-vchiq.h     |   3 +-
 17 files changed, 255 insertions(+), 277 deletions(-)
 delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
 delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h


base-commit: e4d5e3a9ae68250f7cc7e930ffeecba2c9f32832
-- 
2.44.0

