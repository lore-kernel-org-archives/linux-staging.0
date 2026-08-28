Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25795411F8B
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933727; cv=none; b=SZQItWMZTDhOT+W0ETnIgVP5X0bW9xvMdGRi3mJ2+1VoUZfhMQp/nHelXp67tNnqWishPBm4rFPMfv88GC0grEMLFgX2lS8QTUzRv6QRIvse4TAwTZaSyW50108Hn8XuhC3mOKe4vgETLTyBPkkb3o6+j1XqmRGhtBy2+3EGMFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933727; c=relaxed/simple;
	bh=C+ZAgqnl2tYmvrqVSgafzVk+7+RkB37GOiNqep4MzBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crcdY22I9e4Lxj/fEoHyH5m4itoYyLcppSfIMG/iQP3qzPTkjlAyRNf1skIHiB1BHpg7nlxR8Hhj/HqvZxgTYsauA3iatkOYDAHwmpol4jEGICbzD4XoefX6fqxUTnRBCXzUqlqMHo/3R+K/gT65fVxSEcV+YKslY6++2PSQ3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRbH7vfS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRbH7vfS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so494686f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933724; x=1788538524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9MrXzKpC71U/GHMh7M3eLoSDCO6PB2t5OzTKrblmzs=;
        b=GRbH7vfS3/x4cLwZwt3Ka6CYJT2IOHtwuHV6PXE9qSuK8nnV0rAagvp2xJqIU1QiUO
         BNwwoxmqEzdUlKOalBUVRwvA2Se6d/G7xR7Un9VEJKs0pJfDoD2G8uhUr8MI830JPT53
         3V47eqBN9Yxp5Wh7O4mWPNdG7xM3DunWrDv2Gjg9JmJKWq6FsY1P7TAWF5mNOJ781Rw6
         LLTcCgYGLROBL/9D1g2/0cgkPTNfA6CZs1a9rSb7EHAeaKinGJUn7gdyybVbFnnE06Ak
         zgc3kFeTVWd1IgFG0R1qod6FW4c+BxXgqN2tdwoFuf6/rD11XifEbZ2pvw4mMRm95ffp
         W7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933724; x=1788538524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9MrXzKpC71U/GHMh7M3eLoSDCO6PB2t5OzTKrblmzs=;
        b=VsfQRWl0/wPe9ahxJwmGIDRSvMhLJIDNPs4hIQDGPpXzCQgU5ydiFXVlsaoDHRmHhJ
         FsacQ489SEXtTqHLEP3VE4/PKEo5nkGokVRo+lDYnl3GQHITJMqi4b+9Z3syXO6VGbo+
         Hjl6gCWL5Ls/SMZfOESKG/HCrOKml/+bjY3HrOCZ0ytialIsoqx/YaIknzaJtNDChZKB
         Husjzy3hUF/IPKqdRocK8H9Nv0Ouq+WNALBdOHdsJVu6zJLME/ZGpSxqk2dpceVjkqRC
         SCebeZuH9GjZZEjCZsYMYIYZhp9etJ/A/wZpLSO9iPSUaCAjkqlAK+UbT+UysUQjjbMh
         Iw2w==
X-Forwarded-Encrypted: i=1; AHgh+RohNB3lJdfYIEFukqSPvoi1dV9Ucji4IleJbnwRC0a5o0ceyAdGhCNQQHNqvCe4XjuZOuuJUWo1t9vh+LIc@lists.linux.dev
X-Gm-Message-State: AFuF++k/6LanldtonKfMSzKdxqv+jA7vA2f2pCC9HhrVcB4SpVQ5AAzl
	qsATzkWjZYGdxi2m+wz9EOjABfAeHWk+Yi5TdlpYu01h5exYSYB0XNMi
X-Gm-Gg: AR+sD13B/uaP5zo2zotqgFXIB9qSvt5DYHvoEg91fxJTbUJW/K3urJkC4GQJLBbc77V
	amZpH7Qy/B9fa+HSeNjoykFdmAbz8m1nBc9GIc28yAh5JMe+dT8CMrbYP+IvhT9nPtUJ87OOYr5
	3YZl9RC+WRAfyNEIFv6AY3euq0/JuTE5nbjdw4DMQDjwtuEabl27KT2maIwM5Vyp5tGBjorkHAU
	urVitDKeFVcErFNM9S4VF2Qy1Yc+G/LQziGalCc+W9CK8aecc4wy+qe3xHDKgtARRbfJEDtwls6
	BWznrp4KQuzXgJ6/XMEjCT/VrvcsvOG3jHgxgAXCsv1hQqWSl2/c4gDb2lsjtODchxof39ZAUXn
	juJk2rn81AtmR/i4RX319SWM/aET3nKHNySp3Mk7SL9dzGHBm3wh2BLam1bCWrfgXY4t5sJ6k1P
	4ms9hAV39gQy9FjyYF6kNmpwrxzP++CAPmfEWKzy3PT7uRvtNWGZdpe4UtHozDAjz5OhqVyDvdW
	n9/tMd2FLfB8EII4Y6xtQOC1ccD4l2HAq8vVQwkyA==
X-Received: by 2002:a05:6000:18af:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-482f798ba02mr14832982f8f.1.1787933724077;
        Fri, 28 Aug 2026 09:15:24 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:23 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 10/15] media: atomisp: derive CSI-2 timing from sensor link frequency
Date: Fri, 28 Aug 2026 18:14:52 +0200
Message-ID: <bc2f1613db42a53f7c53c97dd98ae86482c9c1f2.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP2401 CSI-2 receiver timing depends on the sensor link frequency.
Query it through v4l2_get_link_freq() instead of reading a 32-bit
control value directly.

Keep the frequency as s64 throughout the calculation so valid link
frequencies do not require an arbitrary S32_MAX limit. Fall back to the
existing default timings when the frequency query fails.

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..6c17b37350f6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  */
 
+#include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mediabus.h>
 #include "atomisp_cmd.h"
@@ -209,7 +210,7 @@ int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
 static const int LIMIT_SHIFT = 6;	/* Limit numeric range into 31 bits */
 
 static int
-atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
+atomisp_csi2_configure_calc(const short int coeffs[2], s64 mipi_freq, int def)
 {
 	/* Delay counter accuracy, 1/0.0625 for ANN/CHT, 1/0.125 for BXT */
 	static const int accinv = 16;		/* 1 / COUNT_ACC */
@@ -288,18 +289,18 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	int dat_termen;
 	int dat_settle;
 
-	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-	int mipi_freq = 0;
+	struct v4l2_subdev *sensor;
+	s64 mipi_freq;
 	enum atomisp_camera_port port;
 	int n;
 
 	port = isp->inputs[asd->input_curr].port;
 
-	ctrl.id = V4L2_CID_LINK_FREQ;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].sensor->ctrl_handler, &ctrl) == 0)
-		mipi_freq = ctrl.value;
+	sensor = isp->inputs[asd->input_curr].sensor;
+	mipi_freq = v4l2_get_link_freq(&sensor->entity.pads[0], 0, 0);
+	if (mipi_freq < 0)
+		mipi_freq = 0;
 
 	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen, mipi_freq,
 						 TERMEN_DEFAULT);
@@ -310,6 +311,11 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	dat_settle = atomisp_csi2_configure_calc(coeff_dat_settle, mipi_freq,
 						 SETTLE_DEFAULT);
 
+	dev_dbg(isp->dev,
+		"CSI port %u link frequency %lld Hz, clk timing %d/%d, data timing %d/%d\n",
+		port, mipi_freq, clk_termen, clk_settle,
+		dat_termen, dat_settle);
+
 	for (n = 0; n < csi2_port_lanes[port] + 1; n++) {
 		hrt_address base = csi2_port_base[port] + csi2_lane_base[n];
 
-- 
2.53.0

