Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09B437E5DC
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199289; cv=none; b=goMFafVwU/eLGkY1jCp68ugILkMX6Gol/6AP2lNzfhAoRSYecKQUVHumpOYOeikv8RbFoY6WUjrrTu/w1yCYsYMnuwiXCXJ3fcJ2IYF0hipEG/26m33Nbg92bMO0DWo6lAqt/xW+guckvqzNHcrBWtFJJYB62hbrwKml4ZqOiRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199289; c=relaxed/simple;
	bh=h2djYmdDBd/cXc4zcDpBPE6FucNuXDVdHsk049Ec1gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5jqwUx0LNa0fDAZSAG0OdHcpmklOONrPHBuqYQrl2PdZOAFVyFPulhXyDfDVseWcYOnfF2ZtKk+PzqOipO4+mn1QyPMAcBokuBpFb4JEs6c4uSSZ59EVAnUXPpHpje26q/MhpH68QBrjNWLadvuDNINy8bM3WYbtSjhlKE8TAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qiVMggLU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qiVMggLU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48433f36a21so98150f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199286; x=1788804086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knnQOguAzItYyCz3/I9QK04AlsKpIBVpLAZp0UuJLCg=;
        b=qiVMggLUgheMU7oZfK6LwtnqlV/usBuMz/RzqmWUKKVvs4lOZSTb3/LwVwGIe+Ljpy
         pwvcVPNmX/f7457xvJeUFzEMd9fhlFOx4HbuSXQ9sdiq5879JXhNkpOKWbdUjlA7i15z
         jSR680TRxFhb9eeU2+EJ+4SALG/aE51srYdquLoYX0/qmbnmpPmbPOM68pcwSNSSZecx
         s9+fpMn10hD4iP6O5IxpBDbdlwvdka41Gcs/zwCOoJ9FunyBz8XasjjZk9ts0dJzWMhv
         4QQSiNFfOfajLzmr29E4AML1ZB+5en1J/8gYHHwdR3uIgFMg+MQMXlBIUue2CsvYPsA7
         mbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199286; x=1788804086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knnQOguAzItYyCz3/I9QK04AlsKpIBVpLAZp0UuJLCg=;
        b=EbXzufZVyPF3/wld25Qk7YW/rZAd4zH/d3Ah8o1R6inzBtP+ZuqbCAanYpeTbZYc6J
         YM06zeT/5wVNnJZ+uQTXq5iX85TXGJqvBEBXon396m1Tb9dwgszYqgJ/LPO0kgtDUHQx
         xwgeBhK/nic6Axf2lx79DOPrRegoUHHughqYyQ2GvNL0Ac6OnnBrgCXisE7/DRXLab2Z
         80q9lT4z9e5cIowxtGqZaYei0OYU7s2NUtFHC3/MYKq4V4WVnDzwwtxYwHwmzfBEevu2
         AX2DzKZ3EulxOXGD+uxzJakdoFVXP5LCVfdFD5BySAx+gtS2aUkRF/aPQrBAoTA6qmIW
         P47A==
X-Forwarded-Encrypted: i=1; AKwUvBycKVo661aQgtEwGQtebZ+oYSUyH+BXIMnwSNCS8ZXrBh0xIiL4lssjITy5D4o6DaQXKKQIyLmIXmojgQgt@lists.linux.dev
X-Gm-Message-State: AFuF++lYVpHZVdLjdjSYdoTaUM6l+FpUe0uJeGnv257I2IEC9K0/OqjF
	hPdLIbs1jbCc4EQI8qaPle0WnPFfl9dEPdbC8LLtEodTIVV/QZqSlAYZ
X-Gm-Gg: AYBFou0Lxx0Sky1SWc9bTIuxabMEKehOJLffW74Cg5hdkOPkSqIcSAbarK5jjy9eqzS
	A9bA08pougpVbY/a8CLAbkiZ3IuibE62PA8PYsBs8EhkoNfH+s0r7kR6lKRe968TiVSsPyjL4Q1
	kx3SI75oo0UAYzaVMQQCdGDPhrzosEq+yx0n2Mt2NLH0uXS58ODZA8a+JeSed+yc4B6qo9OOOXs
	034WQ2sHtd42l8zMBcTxGkefbGiLEMSPr9fiUxZrbI8AMd9K5Vo/Q2w5g9mXwFmPK9z+dYA2IlF
	5qzFzIDWUXbt0EcnCuxtINW4cAWPbpElh3J9Sqb23RBZzCkiC2VJP0mxsWj9mdEsbW3iHjrGdJB
	Hm+fKYUFw6k++JdG/73KNX7g55xzuVZOti9hsSbJuXJZnOLbczKm0Whk3U5cd3LybnMlykGQAs5
	D/vEb+BTQfRl+b1Hz52J0NZRpbo/fMVEgc/tLltZFmQpNR8ssGdyv/0Z1GBn4fjVKNRQISQKf2C
	YmRsroNrEROKet46IVKPANfmX1NRxWSuQL5ndz6Cj8=
X-Received: by 2002:a05:6000:4812:b0:484:3600:35a9 with SMTP id ffacd0b85a97d-48441fc0e81mr141904f8f.3.1788199285576;
        Mon, 31 Aug 2026 11:01:25 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:25 -0700 (PDT)
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
Subject: [PATCH v5 10/16] media: atomisp: derive CSI-2 timing from sensor link frequency
Date: Mon, 31 Aug 2026 20:00:55 +0200
Message-ID: <20260831180101.3109854-11-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

