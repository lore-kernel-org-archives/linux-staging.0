Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB1413DDA5
	for <linux-staging@lists.linux.dev>; Tue, 23 Apr 2024 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713893791; cv=none; b=SHQC4WnFScXRVo0o3OLL9XoEEwPbMpHEtr/CaK6zaLRnSHd6Aju+swGVi3HRnXsmN32zNFB+aGMgvkQsXOGulC1Q3pDtoxgkL/lU3TmTi9g1bDgPfa9lpwC9vI1ndaSTtoEmoJBEFDYhAGvoOJBCL2Yavb1o8LpS1QVdgXw+8/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713893791; c=relaxed/simple;
	bh=96a/hF+nh+YvRKYaFLg+hwTfTv2zLQG6m8D8hdW3Yfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a1iirJ6HM5s83zB22xIeUV/ER+pSdjrjnx/yr7A2XR27Tb86VX/P5E+lJmiqcwAE8ABi34eZWlIH9+VyqOzL6GrLxbEbs7nABZh2a++S+kn0qWGJ3IUFPhrXEK99XL8UiG+U+qyKINOgNTK8riW9HXlymBwr1ih6zjtQCAK7Vpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJ/F6wjh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJ/F6wjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713893789; x=1745429789;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=96a/hF+nh+YvRKYaFLg+hwTfTv2zLQG6m8D8hdW3Yfg=;
  b=IJ/F6wjhSvyR2WfVA9NpK1mpb+KqRNG7kXpuDJPK1bjAMgf5pTkZ37Ig
   WQAET8xEhcwIqnc+XETAjMVICS+QWcc87lJRQw8kB+JpomDfK77qipDZ7
   BjcrE8m7uMtBbCpCV2m4RKgwR0fdB3FGhsfORm7SnTJH8rl43EwIwZxDc
   n8F1LB5r6kuVRpW6tv/jBfWOMgKtjPEWVvoa57FyB+9pJw8ZoC5NApH5X
   F7+JB1NgaAdqCfc9ViIDIxXIss6HtQ9eQS5Zj4qY2cDzLZad67qkBw6JK
   Zc6uLquGOuycRUiRL40LP+mxMqo+fRVQnFRD+QT5zYIA7RUqGLkOCl1K+
   w==;
X-CSE-ConnectionGUID: nShNVWrXQWiSCSITB0K5gw==
X-CSE-MsgGUID: a1f96qdJQOK5VZQALhWiaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9658608"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9658608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:36:29 -0700
X-CSE-ConnectionGUID: /8VeUUHTSHibYtTrwOiQ+g==
X-CSE-MsgGUID: kF4oE0xRSe6ufvujCxDwqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="47713735"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 23 Apr 2024 10:36:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7EF5A192; Tue, 23 Apr 2024 20:36:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v1 1/1] fbtft: seps525: Don't use "proxy" headers
Date: Tue, 23 Apr 2024 20:36:23 +0300
Message-ID: <20240423173623.2748621-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/fb_seps525.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fb_seps525.c b/drivers/staging/fbtft/fb_seps525.c
index 05882e2cde7f..46c257308b49 100644
--- a/drivers/staging/fbtft/fb_seps525.c
+++ b/drivers/staging/fbtft/fb_seps525.c
@@ -16,11 +16,10 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/gpio.h>
+#include <linux/bits.h>
 #include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/module.h>
 
 #include "fbtft.h"
 
-- 
2.43.0.rc1.1336.g36b5255a03ac

