Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9262F82
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 13:04:08 +0000 (UTC)
IronPort-SDR: s3w1CWTTS4jjdcoCvrQGILaw/ffli49gQlkYPQ5TaST/hSqxDxJhx+kk626sQjJVP0wl9w7jmV
 fZpCz4MAHcoA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="258033713"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="258033713"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 06:04:07 -0700
IronPort-SDR: LCb8ytZ5DpUUp6TqZ49kybIvrXvBLwhl5TPK//VQtD7kncGDp8hBVtff6CyvaO3R9ZAomrD/1i
 jjYn9d59PM+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423528754"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 28 Apr 2021 06:04:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C75AC425; Wed, 28 Apr 2021 16:04:22 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Phil Reid <preid@electromag.com.au>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 2/4] staging: fbtft: Replace custom ->reset() with generic one
Date: Wed, 28 Apr 2021 16:04:13 +0300
Message-Id: <20210428130415.55406-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428130415.55406-1-andriy.shevchenko@linux.intel.com>
References: <20210428130415.55406-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The custom ->reset() repeats the generic one, replace it.

Note, in newer kernels the context of the function is a sleeping one,
it's fine to switch over to the sleeping functions. Keeping the reset
line asserted longer than 20 microseconds is also okay, it's an idling
state of the hardware.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/fb_agm1264k-fl.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
index b545c2ca80a4..207d578547cd 100644
--- a/drivers/staging/fbtft/fb_agm1264k-fl.c
+++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
@@ -77,19 +77,6 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
 
-static void reset(struct fbtft_par *par)
-{
-	if (!par->gpio.reset)
-		return;
-
-	dev_dbg(par->info->device, "%s()\n", __func__);
-
-	gpiod_set_value(par->gpio.reset, 1);
-	udelay(20);
-	gpiod_set_value(par->gpio.reset, 0);
-	mdelay(120);
-}
-
 /* Check if all necessary GPIOS defined */
 static int verify_gpios(struct fbtft_par *par)
 {
@@ -439,7 +426,6 @@ static struct fbtft_display display = {
 		.set_addr_win = set_addr_win,
 		.verify_gpios = verify_gpios,
 		.request_gpios_match = request_gpios_match,
-		.reset = reset,
 		.write = write,
 		.write_register = write_reg8_bus8,
 		.write_vmem = write_vmem,
-- 
2.30.2

