Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAFC3C26
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659196739; x=1690732739;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9cKOU+81t6KkSi6zCm5L/gkHl9usaGGFPm85VfGl91U=;
  b=SCyDkmu0Etx/Dp1vc1tbrvIij1lf8y6VZFvzq8QFd8LsdX0OCENjhjjv
   KB54vSgnAXPZh+ruaYP6RWW17uVZDf0gLD6iUexdg3Ynuxk/Q48OkZoeU
   YwPlAQwNtGAVhnr55sFO6mOh5CP0i5NdCWc14naQyT1xGXOZ7XHLOsaY7
   Qt5asU9pY6PTyb0spKQ1fU4d2AI1EEFKsaf/9oS14SveZrLuNbGtmEsyF
   t2oWna8QnemXIvunGTVgcX99ycsPtnYXH3CmGddzlUPdRYn9MpJEqgdSj
   /VjjWqU5hWofZeEO4yOvqn1Ylobktq4zzYNT+YeoG1DzFfIBVfTSZ1W+A
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="288939831"
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="288939831"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 08:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="728024568"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 30 Jul 2022 08:58:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9A9CAF1; Sat, 30 Jul 2022 18:59:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] media: atomisp_gmin_platform: Switch to use acpi_evaluate_dsm_typed()
Date: Sat, 30 Jul 2022 18:59:04 +0300
Message-Id: <20220730155905.90091-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The acpi_evaluate_dsm_typed() provides a way to check the type of the
object evaluated by _DSM call. Use it instead of open coded variant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fixed 80 character overgo (Sakari)
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index bf527b366ab3..f7fc5137199c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1207,16 +1207,14 @@ static int gmin_get_config_dsm_var(struct device *dev,
 	if (!strcmp(var, "CamClk"))
 		return -EINVAL;
 
-	obj = acpi_evaluate_dsm(handle, &atomisp_dsm_guid, 0, 0, NULL);
+	/* Return on unexpected object type */
+	obj = acpi_evaluate_dsm_typed(handle, &atomisp_dsm_guid, 0, 0, NULL,
+				      ACPI_TYPE_PACKAGE);
 	if (!obj) {
 		dev_info_once(dev, "Didn't find ACPI _DSM table.\n");
 		return -EINVAL;
 	}
 
-	/* Return on unexpected object type */
-	if (obj->type != ACPI_TYPE_PACKAGE)
-		return -EINVAL;
-
 #if 0 /* Just for debugging purposes */
 	for (i = 0; i < obj->package.count; i++) {
 		union acpi_object *cur = &obj->package.elements[i];
-- 
2.35.1

