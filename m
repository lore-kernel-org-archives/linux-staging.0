Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267988;
	b=u9mWfte/YnWIF43TL8nZqY2AeFJcLkodQggWf02SF4wQcU+NoTcDZPyxwkL+22tjWGjp
	 Wqnnvqj/gQRFt0o2IBHgM6+oGVyRJGbGnh5/0eFjn3oy7ffN7NMiNR9kRp2K5I5RYR80I
	 +fGVE2bvWUERu47k6cnqCYA6z4QFUcR9p1gpegTEnOgeFf9K3boUATkZul8b9mjAQGdrN
	 cdeOxxm9n93ok0l54MPUqYWqgUYreRZGOIBukQJ4CjiaCrVcvDy9W6Tt3ZYi+oIuwDV9X
	 KowsEFDTKLbYM2TOWRkfxO+uuPU1AYWAwOTHkkzHM3C1heTSOYp4P/lyQTvPcclzFWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=COKVH5wZADoiDSOnu/wHJ1WRXeKgTfEOkipgkyGWzIU=;
	b=lLDrje8qIb39nrKm+WTTxHXNlseOT6HH8HOVhnAng4KmM9zFeU519TLQC3Ll2qhbsKdc
	 FLdAuDLPeB3FVBw3dmC71ASvfS2WR+3N91nFsfF2dBoCdKonbDnODDHZZzWdsAL/D3IbG
	 5QbCCh7cwADf81SPTm5vk4aEo4nPCXag4JOWtHs01Xt+8zrh8dQiSu0rIamEQoX0v3dc9
	 oyZAccznTo/8GqkziyfTRx+InEzyggp7ouORQiXrH5+LnS6sUdKuI3PgXHurxh5nx+D+V
	 /09jp+BFwLDroROsjvlF0D72iPNs1ZdiK6cr+APlTBe+sABvmHNbgC2dY2hXqSG0ZQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhKMtQvx;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B16606A337
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B16606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhKMtQvx
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so19541445e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267986; x=1795872786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COKVH5wZADoiDSOnu/wHJ1WRXeKgTfEOkipgkyGWzIU=;
        b=fhKMtQvxLSDOXaTIAuquuc+O9mN96K7BtwooLk8bTP9jr2ifs7Eb9mDMaXx0kZIvUc
         s3Xe6bzEw1/ds4A2OlcdnJOI0kjXEJRkLS1TCGqiYXfShkQgSvVsTzCfuSBva2TGEh74
         NOvCDfr4Ql11Xp8leY9VihmcdfNkOnPiHOYUx08EF87/+ckhYcus/v6OuprHXPfqoxjk
         ekkNUZgIXED1axs9R2NkPj+Hx/Mc54TizYnSbzmbZo6ltAZ0VmsCmoH63UhNGYaLGDJ+
         Nxe9pCrdIBlR6Ql4BzfGzbf6kbkM5+5KczDu4mL21AaFkivLpqvcfuemHgq/YGn37SVe
         iOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267986; x=1795872786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COKVH5wZADoiDSOnu/wHJ1WRXeKgTfEOkipgkyGWzIU=;
        b=v4enTxfbI3cosUv9FBHjkE9mjgxUwjQ66hn9RAhw5x94qYM0nMnNDFuy8KaQx3DEPe
         /1ZiwDjCRVIk2YaxjItH+cg/JB5f1E/TYuaQF1m+fOzPT2jyi6g9OKve8D5e4K+7bdyG
         Tw6/6/5UzJao1QhsiSTte335G4GrfA+2BfKkNMI3w/62UESlucial2hZCeetfF8V7aAr
         AxYiIIXYuc8zEsAIItB7KzZpdhq266EpEmJjgeKW6wNWUkG4zRTJOH49BfOlRi06nHNg
         jmq/Y69hB9OM1zHztDELIP3GD12uBCraz2SpVQeH2cSBvpcNcddsTiS3soPjGMzTHm6z
         +F9Q==
X-Forwarded-Encrypted: i=1; AL+hErElcMEZGZj5vLTnEiosIEdkDitpAySnyqLlRYVIIWeCL8cvFISegOowL5mArtsoMfEanVGtx4ZUnKWH9Dti@lists.linux.dev
X-Gm-Message-State: APuU4Z914hiV1zB6zxWOzKkZnZfYJM2YJiDSjlTkSS56+6qm7TmRN4uH
	P2VcPz2cNTF2eAMZ9Y3FMoOTjUIOgR05W/QZYO/rxywVE3KN6s2Rc+vq
X-Gm-Gg: AZFdTZfN0KZZ4tFmxzFc7X4v/e/MNBX+07I1J+sXJ7DvQUNhNcv0+MvWsMJU4Vfhevw
	8qW79buMhH1BnWjhuI/wiacsXNZxpHzM/V6H1FASCuPIxop9AQkSPQJS2//7jn1SJMpcgSBK9cg
	GwXtL2+7xk71zXHR2lUtje5L8TUkqj6c/OTQ/olE/ka9GOtjSzbyI9qhD8Qw906HqEEVohtUesC
	q2P9lX1B0e7IuYrgoMCQxPN/jOdmWXf2Tf9h6+Zw49MnGUff87uaXlq31PfFFz17ZnJg4R/PQnn
	dYh1AZTm9KcJTfyd20mpgwPkNPH74gFDkqg/CNoTHDsOtBU27f8CMk/uRnehjDARawoU1bYa5kl
	bCeCaVvQK16S+NafMOnYUOu5RkxLcKHZJDE3zmL9Efwmd9eTO7xVW30TC4yMdv9tgRvJGbW2e6k
	Hc+4Yxk7MtABxeXbCmEzx69fr6SEtSHgdXEyLK2E8N9VOva7y7BIS77tkSGgqtR7SA+5Zchbo26
	nNgb3fyotAa/Lqpd1yUaKmrS0P35ne2AAesfSastiZy0dSp/8gJk3+8Xzb79C/jLv3S+CwpzYqZ
	b+HVq0A4Ygl9BINZ8oIv8m3T6il+zB17T9lKT0K7R9NGj3h+xCMj7GoIb3hkpEg4F1/J9QanjkO
	B8x2bfUeLPoAy
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr148396385e9.26.1795267985838;
        Sat, 21 Nov 2026 05:33:05 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:04 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 09/14] media: atomisp: Derive CSI-2 timing from the sensor link frequency
Date: Sat, 21 Nov 2026 14:31:39 +0100
Message-ID: <2070d23e030ce5ddb27402caa3672490e058b84d.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP2401 CSI-2 receiver timing depends on the sensor link frequency.
Query it through v4l2_get_link_freq() instead of reading a 32-bit
control value directly.

Keep the frequency as s64 to avoid an arbitrary S32_MAX limit. Use
div64_s64() so 32-bit builds use the kernel division helper. Fall
back to the default timings when the frequency query or divisor is
invalid.

Sashiko identified the 32-bit division issue. Codex reproduced it
and drafted the division helper change.

Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/X3S2EI4364O5ARJK5JLDHTTXCW6TPSLE/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 71df4ef62..f72fd0c3c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -5,6 +5,9 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  */
 
+#include <linux/math64.h>
+
+#include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mediabus.h>
 #include "atomisp_cmd.h"
@@ -210,7 +213,7 @@ int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
 static const int LIMIT_SHIFT = 6;	/* Limit numeric range into 31 bits */
 
 static int
-atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
+atomisp_csi2_configure_calc(const short int coeffs[2], s64 mipi_freq, int def)
 {
 	/* Delay counter accuracy, 1/0.0625 for ANN/CHT, 1/0.125 for BXT */
 	static const int accinv = 16;		/* 1 / COUNT_ACC */
@@ -220,7 +223,7 @@ atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
 		return def;
 
 	r = accinv * coeffs[1] * (500000000 >> LIMIT_SHIFT);
-	r /= mipi_freq >> LIMIT_SHIFT;
+	r = div64_s64(r, mipi_freq >> LIMIT_SHIFT);
 	r += accinv * coeffs[0];
 
 	return r;
@@ -289,18 +292,18 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
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
@@ -311,6 +314,11 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
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


