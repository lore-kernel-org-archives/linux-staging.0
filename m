Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC594A262A
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289507; cv=none; b=dlpbq0aoktmMi4e83nPdvbA5tUCQytse5Rs11Qk3O1JuoE8o/UZqbPe1r1c3VwAMQrWTwynU2OdhhPzBGErN0Q8hIlEDLIRxGJN3HfJ4ebSGw8oG/uEohuQCGmQCMop4n1CVjgpPIBiJYjHeCEo4F2/EF11iXtqIcQhxMFiqsb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289507; c=relaxed/simple;
	bh=nDjXt+isRGGooTXCaWuWnqb5pe5EC5+ZCK79Vbzm3eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nk2uvk4pvBQLoHP0BGgv8swtX4Etm/vaF4dCH/RexqI0Qt8MriiPSfZNVVDCKTUp57w/qHOdu3WItAMfuPcNsMmuKHLNa4xvXmq3ZhLn5Nwah41hSvdqBl35PjZ7X+8eIJq5w6iIGHwEX2rv5RLsfCBl8yjo6/UGJCPhu/74t1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6S+22Ao; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6S+22Ao"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48431648f33so1120557f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289501; x=1788894301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYj9gMNKBj9PIheDoD5f1AO5Yajaqc9NTnFS3lh/Ezo=;
        b=b6S+22Ao+0hAHE1fwkp+1SCM2SgQkoHk17c0NKaKui1UQOtn5Y82jH9j7WE47YaKSW
         HbS/Vv02HqD4ANzoXjXEUIWA+DTAwAJZgDzj7w96g7mXU1tJJUZ149J3MAen2mPDmwiZ
         XxalsnEkUojhaoUpQ2dhottl5x/S7dFJpHj50AoqCU8+j3BN9bQSvwh+63nMw6VCfY9z
         i3bFmWejYqgJomUcR85IoO0gvwzQI9uDnTFz1nw4KowDctGM08UryGXfVYJTHuo3+eNe
         YLofOiNWkiLcsvh2bGoao3WLBXrpsPfMZjJ/Fl5kij9yvenCB0/0UnEq+IbxLUwjG9k5
         Lm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289501; x=1788894301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYj9gMNKBj9PIheDoD5f1AO5Yajaqc9NTnFS3lh/Ezo=;
        b=LcFHxmhFesLgLhv43jWIwS/BWn+MJ9rZVDVlpHCDrHFhwxn7uAWMnGXCkxTo416adc
         xLuwJXQvutlW4TEm/fVTrl0rQe4hZ4XkbawGG47W8SpQVyexbLF1iQx6JtLdP06uSywf
         +kZJ3OhGUGBKHmnXn9QII5lU82zrbHkjleYjWWPQhjkl7FnhDdI/aapjP/uh6Is7rezg
         mFCVG6VfmZgwa2aMwvZB4VgqL2ji0JTqFP09uEyJqV8KWbtChyn6blpGFTaD8zS2qoV4
         SU+CG0FAf3yUtyzYZBZ2dojA/Cuzi8hEH8+8NrjczjbeDkR75OM5fX26Q8BX2PG5NzSH
         ok5A==
X-Forwarded-Encrypted: i=1; AHgh+RoKavJxEM1YEvrPySNvYXLssfGh4A9wFJOpJHTL2R0qwBXHL+2qzcf1a1z67+/dVN3Xq1WMeOXiDu2EkBhk@lists.linux.dev
X-Gm-Message-State: AFuF++l6ulItT0rxgcosJxhK95MM4645VnldaO2M5Dy4m2S1m83POHe0
	YXMOJvXKiJsjwp5/SWL+A1RrzfezvW5umpzcCd4M2xkkk/rrm9rIhKdh
X-Gm-Gg: AR+sD11QwdzNziS/00+80g/5ft6WjhUtkHGyUa5wZev+uzClyfPoQD0EJW9ziDkTxsZ
	LVOLKnrFVQ6Zr9/JnEl6Id4BSiEWUIuSH1rgMCCBCzruNDwdYttFOP72I0tOYQ2isATEQtI+S8k
	eIkPDJ/N2gUSrDDa68xf5Vxr7ka1sJpcVZGB3VWkauwxKvVmwQaXybcUD379puqoYTQis7PnJMu
	Op3vN/3VmS56M8S8aKo4OcvQ+dbMVe5zVTWokAqKAqRFUqdYT6aNYsnZwTZyFYH9zhiS5p1pClu
	m1j17ooJTn/ILxhGoy2Iphn400nsftvSIUMUSQEtnPkWTVwctwIpgEeo8C8RxNThHooYHKmqQD8
	KEMwB2BJ28lSAWUy9HtCBrlAhQm5VaK8VOGwNl1i1IFR1xQi+08ZQFFyGehJXMER8A4IkEf6/7P
	1j9iTrAXyq/sw39JbGZtTfGStfo7x3eU3w6IADRm5rpBvtC3kuFlFrUu15jTOnfbKEfCe/qXYq3
	KwaT/wZZXbAK7UeTur3idGrn+qyNVLGnx5BiTqU5SzOrVFghF9j
X-Received: by 2002:a05:600c:468d:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49cdd418c7cmr99313195e9.5.1788289500861;
        Tue, 01 Sep 2026 12:05:00 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:00 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 10/16] media: atomisp: derive CSI-2 timing from sensor link frequency
Date: Tue,  1 Sep 2026 21:04:32 +0200
Message-ID: <11cf61a4fbbed4307800cf8a89632b2efff88ce8.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..5cd285fab742 100644
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
 	enum atomisp_camera_port port;
+	struct v4l2_subdev *sensor;
+	s64 mipi_freq;
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

