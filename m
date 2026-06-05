Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9147DF9B
	for <linux-staging@lists.linux.dev>; Fri,  5 Jun 2026 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645796; cv=none; b=ivFk3CW4qIrvm06ljgW7e/z7GV7FMG87kn63FbAH4ZB+6PuDXgL0gISUFH5ZO9Dtnx3qP9e28guVedoSYocYK3zkn5GYBCJ95zVzHgJt0E573FpP0nkn9N1kes2O2puNp/9w/i5lUGG73Qrjy535HDgKFA7mcMmQ/uo7iksLjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645796; c=relaxed/simple;
	bh=DGH4qjhdcd3GcR/Sw8vHJjva5svTd96eyApebNsNzJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+2YJ8dilkTsN9luirTJrdzplz1/cIwo9recsOGDIrtksp7DxxrXqTM7xYphnZkWQWdw6HwOwd3QquB1uIwtmNxQ9M7bC2yiE63aI4+LmebE4fK8iHjr+MsE7NLNa/sC3UE0y9unR8h8k9PNt7L9LuQWCOiJeCr0uo2TdkBpHl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+diVJ2Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+diVJ2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780645793; x=1812181793;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DGH4qjhdcd3GcR/Sw8vHJjva5svTd96eyApebNsNzJI=;
  b=Y+diVJ2QynGt0Q3juwfu72f1L5hdfwnNnb377F0DqGa0PwrLORlPMdtS
   LN3XMlfvG9bVR3SB1kxKLJwHhy5PkYT/t4DjXNxriSZhk+/ENE9LyDyNP
   nmjKy0OS/hJoiU+hOyPV6npQDO9S06ijxNBbS2PRJG3LzSQ7Rv3rR9bHz
   QQrqKq+Fi5DZvtTUyMPFT2nSbx9bYaf4rZMoUQDy7URMUX56cwA3iMvwM
   nN01jK4tsXsHUUuDS98nDn7a9gAuaSgDjXKEVp+GQipB4KLdXMPCFMuwP
   M1tj6xV5mimoq0f+BDXRD46diEHXLNp/z2YP0iTPoq08rk0qW2Q4pB3a+
   Q==;
X-CSE-ConnectionGUID: LIfbCDLETMGu6ULlPiKwVg==
X-CSE-MsgGUID: U8sa9vyMSYmqsnLL5YZQnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81386368"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81386368"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:49:52 -0700
X-CSE-ConnectionGUID: xcKzr1ukRoiqVfWBjeJSSw==
X-CSE-MsgGUID: tEu80rAORkmR+OfQz2gcOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="243691314"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.207])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:49:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D856F1206D5;
	Fri, 05 Jun 2026 10:49:47 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wVPJI-00000002nQg-1LUk;
	Fri, 05 Jun 2026 10:49:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Yong Zhi <yong.zhi@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Heidelberg <david@ixit.cz>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/1] MAINTAINERS: Camera sensor and Intel IPU driver changes
Date: Fri,  5 Jun 2026 10:49:44 +0300
Message-ID: <20260605074944.666654-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Hansen <dave.hansen@linux.intel.com>

Tian Shu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
media drivers (7 and 9 respectively). Bingbu's e-mail address has changed
and Tian Shu's is bouncing.

Update Bingbu's e-mail address, remove Bingbu as a maintainer from Intel
specific drivers and and remove Tian Shu as maintainer. Also add Dave
Stevenson as a maintainer and David Heidelberg as a reviewer for the
imx355 driver.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Yong Zhi <yong.zhi@intel.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index efbf808063e5..64478875cd78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3882,8 +3882,8 @@ F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
 F:	drivers/leds/leds-as3668.c
 
 ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
@@ -13042,9 +13042,7 @@ F:	drivers/iommu/intel/
 INTEL IPU3 CSI-2 CIO2 DRIVER
 M:	Yong Zhi <yong.zhi@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-M:	Bingbu Cao <bingbu.cao@intel.com>
 M:	Dan Scally <dan.scally@ideasonboard.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13053,8 +13051,6 @@ F:	drivers/media/pci/intel/ipu3/
 
 INTEL IPU3 CSI-2 IMGU DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/ipu3.rst
@@ -13064,8 +13060,6 @@ F:	drivers/staging/media/ipu3/
 
 INTEL IPU6 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-M:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13074,7 +13068,6 @@ F:	drivers/media/pci/intel/ipu6/
 
 INTEL IPU7 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13376,7 +13369,6 @@ F:	drivers/net/wireless/intel/iwlwifi/
 
 INTEL VISION SENSING CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 R:	Lixu Zhang <lixu.zhang@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -19657,7 +19649,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 F:	drivers/media/i2c/os05b10.c
 
 OMNIVISION OV01A10 SENSOR DRIVER
-M:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Bingbu Cao <bingbu.cao@amd.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -19750,9 +19743,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 F:	drivers/media/i2c/ov2735.c
 
 OMNIVISION OV2740 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
-R:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bingbu Cao <bingbu.cao@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -19894,9 +19886,9 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
 F:	drivers/media/i2c/ov9650.c
 
 OMNIVISION OV9734 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bingbu Cao <bingbu.cao@amd.com>
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov9734.c
@@ -24912,7 +24904,8 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
 F:	drivers/media/i2c/imx296.c
 
 SONY IMX319 SENSOR DRIVER
-M:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Bingbu Cao <bingbu.cao@amd.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -24934,7 +24927,9 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
 F:	drivers/media/i2c/imx335.c
 
 SONY IMX355 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
+R:	David Heidelberg <david@ixit.cz>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-- 
2.47.3

