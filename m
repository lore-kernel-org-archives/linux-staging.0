Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972182F82
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 13:04:14 +0000 (UTC)
IronPort-SDR: ce44jk8FbyDZwDqd5VYRKqO4j2a2Z8klAtPx5kxvYttPPZJsN/kNzX4DONDZ9sGB532GzzZQ5F
 zZ9vJViMKoug==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="217452102"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="217452102"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 06:04:10 -0700
IronPort-SDR: 3QGh9xcon7o8Mp/hrhfZkbayi1BOBXSAL7vus/SsVtZ6XM3u9KH4XiYSHzy6btL+rwkJAgkd40
 DGI50JdUwa4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="536952502"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 28 Apr 2021 06:04:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B29843C8; Wed, 28 Apr 2021 16:04:22 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Phil Reid <preid@electromag.com.au>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 0/4] staging: fbtft: Fixing GPIO handling issues
Date: Wed, 28 Apr 2021 16:04:11 +0300
Message-Id: <20210428130415.55406-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes a number of GPIO handling issues after converting this driver
to use descriptors.

The series has been tested on HX8347d display with parallel interface. Without
first patch it's not working.

In v3:
 - added staging prefix (Fabio)
 - slightly amended commit message in the patch 1
 - added Rb tag (Phil)
 - dropped Fixes tag from the patch 2 (Greg)

Andy Shevchenko (4):
  staging: fbtft: Rectify GPIO handling
  staging: fbtft: Replace custom ->reset() with generic one
  staging: fbtft: Don't spam logs when probe is deferred
  staging: fbtft: Update TODO

 drivers/staging/fbtft/TODO             |  5 -----
 drivers/staging/fbtft/fb_agm1264k-fl.c | 30 +++++++-------------------
 drivers/staging/fbtft/fb_bd663474.c    |  4 ----
 drivers/staging/fbtft/fb_ili9163.c     |  4 ----
 drivers/staging/fbtft/fb_ili9320.c     |  1 -
 drivers/staging/fbtft/fb_ili9325.c     |  4 ----
 drivers/staging/fbtft/fb_ili9340.c     |  1 -
 drivers/staging/fbtft/fb_s6d1121.c     |  4 ----
 drivers/staging/fbtft/fb_sh1106.c      |  1 -
 drivers/staging/fbtft/fb_ssd1289.c     |  4 ----
 drivers/staging/fbtft/fb_ssd1325.c     |  2 --
 drivers/staging/fbtft/fb_ssd1331.c     |  6 ++----
 drivers/staging/fbtft/fb_ssd1351.c     |  1 -
 drivers/staging/fbtft/fb_upd161704.c   |  4 ----
 drivers/staging/fbtft/fb_watterott.c   |  1 -
 drivers/staging/fbtft/fbtft-bus.c      |  3 +--
 drivers/staging/fbtft/fbtft-core.c     | 25 +++++++++------------
 drivers/staging/fbtft/fbtft-io.c       | 12 +++++------
 18 files changed, 27 insertions(+), 85 deletions(-)

-- 
2.30.2

