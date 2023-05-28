Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9B7211A
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685282570; x=1716818570;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=350Cmgc4YVBwpCeqyLZSZ8GMu5rkS/HADedpO+GTm18=;
  b=H5byMC1Mj6O/ILDpAhXBkoYqIc2vjLsTzscjiJfqRm2/hg5Zthh6EAdW
   o/sPZsvBouDiGcmVRKVJ88iY7yA5J0EIxbwP37SpyVwco5dxqVtzRoA6y
   g4j8pJHBoeR9hLROU43JDTLhrunB+939ey4aaDDvl603GnIuBFrjGy5q6
   nPR7vTOgeJzB8OLUqhxzaAwCdvm24myQBz4Hnte0MseODl7wHiP/2CeA0
   9+jjj36a1SmxHJnhBcwAVqY0wQbpP0e5TuEhMFn9lcqKumQEWhcpTLwqe
   G5/h9EDctQqQ+gkMPIcN2fTnxUAbbepZ1uofOxaFMJ9dm0YuW4TztGpCa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="344019078"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="344019078"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 07:02:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="1035911171"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="1035911171"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 28 May 2023 07:02:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 571E624F; Sun, 28 May 2023 17:02:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] staging: pi433: Remove stray gpiod_unexport() call
Date: Sun, 28 May 2023 17:01:47 +0300
Message-Id: <20230528140147.32427-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no gpiod_export() and gpiod_unexport() looks pretty much stray.
If user space tools somehow belong to that, they should be fixed, the
gpiod_export() and gpiod_unexport() shouldn't be used in a new code,
GPIO sysfs is deprecated. That said, and taking into account staging
state of the driver, simply drop the stray call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/pi433/pi433_if.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index f08fdf06d566..220e157d4a5e 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1019,7 +1019,6 @@ static int setup_gpio(struct pi433_device *device)
 		}
 
 		/* configure the pin */
-		gpiod_unexport(device->gpiod[i]);
 		retval = gpiod_direction_input(device->gpiod[i]);
 		if (retval)
 			return retval;
-- 
2.40.0.1.gaa8946217a0b

