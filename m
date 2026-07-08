Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7CA3C3453
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783537597; cv=none; b=tXjSbO9djX7BpBqRpP/ezTSjL9lQnS/Ml9LNRKaZT3XlDACaHdmlSlKDGvCs73mfig4e0wWBYOFg43RHiOOvCwODPL6UOIPeG8RO1d+lRrbU11IIRdKvHWkEjzcuZo59pwuF/IV/kxOT2pX1VRgysmrFlzBYj4/7+AtX9kAjmuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783537597; c=relaxed/simple;
	bh=8sJoYoDXnFcLvC+k9jj5ONuDpuNtpd6j34VDJBRB1sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TnZ6fjJSdGghNqQkOPUrxJrBu9rU9320rBm5fVfC7Tqv5OE16WKmrKdK8jTb24z90ElbettXJvmznRaY/k9IXNY3GmC6snifZu3jUovkHDUP0zFTHOWIgV2iFwoftE83bSmGRbsG4JdW1tbqBg8Ev8ZO+DKVTK05laVIkgM4sWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpYYMji5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpYYMji5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783537596; x=1815073596;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8sJoYoDXnFcLvC+k9jj5ONuDpuNtpd6j34VDJBRB1sk=;
  b=hpYYMji5RaRDqi8fzgN8A5vOuFUip5Rj52mWKGyiy3fpe/btVVXYz0Dt
   tWNJs1V3KE8BIiKZbj3wVuU9gWDuotKw5rIPgnAXwl2cNftjrt6FIspzn
   Uwkv+jMVXOxiXNhhc2/iYM83ycZ+1y6nIw0GKu75NcJ9tVQevAnrkHMx5
   1YODF5RP/YHKD/S3WN1wWZsnv2t04Zx1Hpw/Pp7gxblJ4bfdSPu9T4DRI
   DCCzoTYOjRvMHOHESMTQi5KvBIRDfESnijLenR8gQNvirlVkCBuE2dQ1G
   0wVlXueAWa+m2dzZdPY8qNxmzNAh5rxxjESd2J+7LNWyJY21Kov4aTx3C
   g==;
X-CSE-ConnectionGUID: vSyVGkfDRcKb/mYY4/B52Q==
X-CSE-MsgGUID: Trposv/ySiGm5s3GeLWNlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84329108"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84329108"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:06:35 -0700
X-CSE-ConnectionGUID: Pc54uQg6RseT09XFzr8nRg==
X-CSE-MsgGUID: TTbKTADQTCKgZ61l8Nx97g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="257965295"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:06:32 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 238EF120FA7;
	Wed, 08 Jul 2026 22:06:31 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1whXbG-00000001Ygf-0S3S;
	Wed, 08 Jul 2026 22:06:26 +0300
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
	Richard Acayan <mailingradian@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Frank Li <Frank.li@nxp.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v3 1/1] MAINTAINERS: Camera sensor and Intel IPU driver changes
Date: Wed,  8 Jul 2026 22:06:26 +0300
Message-ID: <20260708190626.371657-1-sakari.ailus@linux.intel.com>
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
specific drivers and remove Tian Shu as maintainer. Also add Dave
Stevenson as a maintainer and David Heidelberg as a reviewer for the
imx355 driver.

Also add Bingbu and Tian Shu to CREDITS.

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
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: David Heidelberg <david@ixit.cz>
---
since v2:

- Add Tian Shu and Bingbu to CREDITS.

- Fix line ordering in some entries.

 CREDITS     |  7 +++++++
 MAINTAINERS | 29 ++++++++++++-----------------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/CREDITS b/CREDITS
index 84793a967a0b..7456c8bbffc2 100644
--- a/CREDITS
+++ b/CREDITS
@@ -640,6 +640,10 @@ S: 25-29 St Giles
 S: Oxford
 S: United Kingdom
 
+N: Bingbu Cao
+E: bingbu.cao@amd.com
+D: Ipu6, ipu7 and camera sensor drivers
+
 N: Luiz Fernando N. Capitulino
 E: lcapitulino@mandriva.com.br
 E: lcapitulino@gmail.com
@@ -3334,6 +3338,9 @@ E: rpurdie@rpsys.net
 D: Backlight subsystem maintainer
 S: United Kingdom
 
+N: Tian Shu Qiu
+D: Ipu6, ipu7 and camera sensor drivers
+
 N: Daniel Quinlan
 E: quinlan@pathname.com
 W: https://www.pathname.com/~quinlan/
diff --git a/MAINTAINERS b/MAINTAINERS
index 2aec6afa8108..d794223144cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3946,7 +3946,7 @@ F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
 F:	drivers/leds/leds-as3668.c
 
 ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13135,9 +13135,7 @@ F:	drivers/iommu/intel/
 INTEL IPU3 CSI-2 CIO2 DRIVER
 M:	Yong Zhi <yong.zhi@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-M:	Bingbu Cao <bingbu.cao@intel.com>
 M:	Dan Scally <dan.scally@ideasonboard.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13146,8 +13144,6 @@ F:	drivers/media/pci/intel/ipu3/
 
 INTEL IPU3 CSI-2 IMGU DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/ipu3.rst
@@ -13157,8 +13153,6 @@ F:	drivers/staging/media/ipu3/
 
 INTEL IPU6 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-M:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13167,7 +13161,6 @@ F:	drivers/media/pci/intel/ipu6/
 
 INTEL IPU7 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13469,7 +13462,6 @@ F:	drivers/net/wireless/intel/iwlwifi/
 
 INTEL VISION SENSING CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 R:	Lixu Zhang <lixu.zhang@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -19902,7 +19894,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 F:	drivers/media/i2c/os05b10.c
 
 OMNIVISION OV01A10 SENSOR DRIVER
-M:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Bingbu Cao <bingbu.cao@amd.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -19995,9 +19988,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
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
@@ -20139,8 +20131,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
 F:	drivers/media/i2c/ov9650.c
 
 OMNIVISION OV9734 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bingbu Cao <bingbu.cao@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -25217,7 +25209,8 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
 F:	drivers/media/i2c/imx296.c
 
 SONY IMX319 SENSOR DRIVER
-M:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Bingbu Cao <bingbu.cao@amd.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -25239,7 +25232,9 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
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

