Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12B438F8
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647449619; x=1678985619;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+siQ0CJV8sIl5v5e72rj8Q6p8jCbZEt28U8U4nLaIAM=;
  b=FOq98R/0N2lafc4AKeeALHm3Gb29VQgiF4HKZNmf/TXKOVxFLzvcFCki
   Ki4fS1ngl9GjktuTqnmGdxE+JNGk6Yu7iabxKuEVVgDcAtmU8UA8ffDrb
   70B5Mc2Rjt5nP3ovrhc54aM8tNp4gfF9yziJDjVMesIizNfAY0Nr+Nc/t
   UoiOa4Gh8MVI0QXvQ5AThEDCw0QjskESHcSxMGxcBOt0Gs4Bpg0vcnbq1
   BWXE7PwL7UdzGoiqwadEcZ7E29uvI67oc43SgOi6L6sVtsf6tPlu4ipBV
   NjToyPAeVFswbP79qbQnoKA1QcEb8XZo92ya8p6J88pV17CKHWBa0as0V
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="256387717"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="256387717"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 09:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="598790953"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 16 Mar 2022 09:53:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 59E14107; Wed, 16 Mar 2022 18:53:54 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] staging: fbtft: Constify buf parameter in fbtft_dbg_hex()
Date: Wed, 16 Mar 2022 18:53:50 +0200
Message-Id: <20220316165351.58107-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's obvious that we don't and shouldn't modify buffer that
is about to be dumped. Constify parameter in fbtft_dbg_hex()
to make it clear.

Fixes: c296d5f9957c ("staging: fbtft: core support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch to fix a warning (Greg)
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 drivers/staging/fbtft/fbtft.h      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f2684d2d6851..6dc77895a87c 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -49,7 +49,7 @@ int fbtft_write_buf_dc(struct fbtft_par *par, void *buf, size_t len, int dc)
 EXPORT_SYMBOL(fbtft_write_buf_dc);
 
 void fbtft_dbg_hex(const struct device *dev, int groupsize,
-		   void *buf, size_t len, const char *fmt, ...)
+		   const void *buf, size_t len, const char *fmt, ...)
 {
 	va_list args;
 	static char textbuf[512];
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 55677efc0138..c3d8b2aae607 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -240,7 +240,7 @@ struct fbtft_par {
 int fbtft_write_buf_dc(struct fbtft_par *par, void *buf, size_t len, int dc);
 __printf(5, 6)
 void fbtft_dbg_hex(const struct device *dev, int groupsize,
-		   void *buf, size_t len, const char *fmt, ...);
+		   const void *buf, size_t len, const char *fmt, ...);
 struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 					struct device *dev,
 					struct fbtft_platform_data *pdata);
-- 
2.35.1

