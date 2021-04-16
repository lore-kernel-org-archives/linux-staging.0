Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2476D3D
	for <linux-staging@lists.linux.dev>; Fri, 16 Apr 2021 12:31:17 +0000 (UTC)
IronPort-SDR: hM1Q9T8a7UhnVZoMph9gQehQfNrVDtDejrxWGdMyM/o7N7SAuaM8UcNvi4t5Q3Lk34bQe3RRNJ
 7tt+xf/GLlXA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="182528262"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="182528262"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 05:31:16 -0700
IronPort-SDR: IxumiiRIJwpJIuwk28rwAKWbEPw6iGRwlTfxtJIvWbuclrEnn3yybu9rpcJwu3q4mtazbBUoOp
 RDfvU03krWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="522699204"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2021 05:31:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C093D142; Fri, 16 Apr 2021 15:31:31 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 2/2] fbtft: Don't spam logs when probe is deferred
Date: Fri, 16 Apr 2021 15:31:17 +0300
Message-Id: <20210416123117.4993-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210416123117.4993-1-andriy.shevchenko@linux.intel.com>
References: <20210416123117.4993-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When requesting GPIO line the probe can be deferred.
In such case don't spam logs with an error message.
This can be achieved by switching to dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/fbtft-core.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 67c3b1975a4d..a564907c4fa1 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -75,20 +75,16 @@ static int fbtft_request_one_gpio(struct fbtft_par *par,
 				  struct gpio_desc **gpiop)
 {
 	struct device *dev = par->info->device;
-	int ret = 0;
 
 	*gpiop = devm_gpiod_get_index_optional(dev, name, index,
 					       GPIOD_OUT_LOW);
-	if (IS_ERR(*gpiop)) {
-		ret = PTR_ERR(*gpiop);
-		dev_err(dev,
-			"Failed to request %s GPIO: %d\n", name, ret);
-		return ret;
-	}
+	if (IS_ERR(*gpiop))
+		dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);
+
 	fbtft_par_dbg(DEBUG_REQUEST_GPIOS, par, "%s: '%s' GPIO\n",
 		      __func__, name);
 
-	return ret;
+	return 0;
 }
 
 static int fbtft_request_gpios(struct fbtft_par *par)
-- 
2.30.2

