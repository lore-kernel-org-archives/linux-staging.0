Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D18414413
	for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270397; cv=none; b=NYuWzQ/QZoFRQy77cihj9hWgfoqAfAsys58+PW4fsPIan6qYWmZpDpazvHIXwHJi2Ng91ognOGGBStxbFJGDuvVV+aAHp0sfiW+gyGg9moFhFbrcwSIPgMamMa4mtqpd7+sb9uTLYtj5xMrC/T3qDSDRTLJVrYxpdwzxsdXQGiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270397; c=relaxed/simple;
	bh=kNsp9G05G8WGjn3P3znsOi9X3ME3wXj+8AnD9ltBjcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWGbXg6Tnb6Lh4USwoQZKi95gVCp9XjzLHKNHJHPI9YpSMUR6m6rc6axbBfUzqPfhSFp1D4QKJXZym2V09VDjn787D+Yq4COmGcM7x+II/Os0cQ4UsQnt3H8E5Ek39jpi2RpIWbPhl3dC4Fs4MYdLIE8YHbIWE/LyfimRDQmpEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPtt2B/k; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPtt2B/k"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso19968991fa.3
        for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 10:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270394; x=1790875194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNrPKdIDWghZHggUCTG80u3uh2+EvahbyhlOPaj6JDc=;
        b=XPtt2B/kQKpILJgwuJw4fopsDaotK6NJmfIpvFRYYja4FLlBpYK7bdBQ921lGf95GO
         s2NxgIx+n/vXdOSAeJKtb/BrrNdMnPCVRkOOfHSR+uXEORYqq9KpXtt2XDFGZ4qXmgqO
         3AaYadhI7lkYAWLKtinPC8Q5HElGq2VRB0n9rrbPy0QLup3pEPlmSyR1Ch+et52kyf9k
         8kFwhY8PZgoKVtQRMKqh+caN/5EChK9Fu2p1+/xyDd6NK/ZNJ5nkRZhu0jePbhDLTi3/
         EaeEfOwxVfEd0bhv+XUHK3axVfFZeBt0ecQAY8Z/7MPSBfirLi0HdUU67MY+S2O97hBX
         HimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270394; x=1790875194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNrPKdIDWghZHggUCTG80u3uh2+EvahbyhlOPaj6JDc=;
        b=OYXGqn7v+O3VWd6PQ8MRURufgN0LzphLdUDc4T+k5aanL+QzaQX5loYzzrnV1TALQO
         ACKFcEq0YW6zBsifYkeH9bn2xiu4/UK69tZAJuL/mradvj7suEtXDNu9CFJoi1AndZe2
         e079MAiGzOQXxQiTQfjdLvEtyfRxLAoi/emcTmoPptfwOESHGpqR0nsX/k6hT4y98Bug
         nhexBtBEqHye11Dyf/QnnZzDcDidh93umR0XiysV7BEQpfM5X4rDhvkM/1WxFhxIs2Sr
         N0RSEGBNUxitdjaB6+vCD/BaQswFxeRO7UP1vP6g+pG0mDE+mjw3MAsfwzjg7xWT0Tzt
         Z6KQ==
X-Forwarded-Encrypted: i=1; AKwUvBybKDib86WekggkEubJXIAtkKryTcx5d2uqC49197NCTJQVi+0M6SjfpBem3YnCO7x90EHTToAflN8/J5TU@lists.linux.dev
X-Gm-Message-State: AFuF++n5Zn3/DozyrWRVIRUnHbmUqoFvaR1AOa99GULIjsWGFT587DtK
	lwowqO8QVAvDVophfISdJZOKex8wRmiU4+k69X33fG1fmLPhPjzeIltH
X-Gm-Gg: AYBFou37WKwpYKA/N7SNULmRoA737a9V/l0lSMtg6uBDaP0p64YQEFZCj8yxAS9GFbn
	NnKWc4kuqHAUnMDK7Vn3q9x/HXbxWXo7gKSHwQwkGKoK0HjxA1m3unzvRcPEJmAW35bXFruiP+8
	Dpll53yJIrL+7ofwgre/iM1vOdOjk+2Mdp4E52NIZBeBwnQTjXZ2IsaXkn2osXGL9e5ZG28KOA4
	xYsqJd8tmEkoPGAL3BlVcz15dy45q7nhUTaADONJbQoZsUeNEXVjSIqtRhxVQXGkZBsYphWAASW
	KqaWHwpPLgnLn4ey/BxVo9btqmedYjwqB91TZaiDVZDrjbisC9pypwAjYfRbvRcADhZUgX8+8mV
	vfzcNIETJz19mh4VsytkW2//GS8xiB1pNeLgkf+eomjYDa+y2Dt452g1yzaRvvGI8bemN322YV8
	qVRfF1W4L/3lJI5++DWEOONiHusARzytB3FvUA59gnkhDlvZ2/q3eppmmhIqlNq7zcdeLmkAhX5
	N6ypPAciXkVeEI=
X-Received: by 2002:a05:651c:31c6:b0:3a5:d0ad:7df5 with SMTP id 38308e7fff4ca-3a63c0f6fb0mr7777901fa.21.1790270393687;
        Thu, 24 Sep 2026 10:19:53 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:19:53 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Date: Thu, 24 Sep 2026 20:18:20 +0300
Message-ID: <20260924171820.1179823-5-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924171820.1179823-1-koreev.r@gmail.com>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI-2 receiver already accepts MEDIA_BUS_FMT_Y10_1X10 but the video
nodes offer no pixel format for it, and MEDIA_BUS_FMT_Y8_1X8 is not
accepted at all, so a monochrome sensor cannot stream through the IPU7:
the ST VD55G1 IR camera of the Lenovo ThinkPad X1 Carbon Gen 14 only
produces Y8 and Y10 and no configuration can be negotiated for it.

Add the GREY, Y10 and Y10P pixel formats, mapped to the RAW8, RAW16
and RAW10 frame formats like their Bayer counterparts, and accept
MEDIA_BUS_FMT_Y8_1X8 on the CSI-2 receiver with the RAW8 data type.
ipu7_isys_is_bayer_format() treats every raw code as Bayer, so the mono
codes take the raw path in the CSI-2 cropping code; leave them alone in
ipu7_isys_convert_bayer_order(), which otherwise warns about them. The
two parts belong together: with the mono codes exposed but not excluded
there, any crop offset on a mono stream triggers the warning.

Tested with the VD55G1 on that laptop: libcamera negotiates Y8 and
streams 804x704 at 58 fps, and Y10 and Y10P stream with plain V4L2.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   | 1 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c | 5 +++++
 drivers/staging/media/ipu7/ipu7-isys-video.c  | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
index f34eabfe8..3067ae942 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
@@ -27,6 +27,7 @@
 #include "ipu7-isys-csi-phy.h"
 
 static const u32 csi2_supported_codes[] = {
+	MEDIA_BUS_FMT_Y8_1X8,
 	MEDIA_BUS_FMT_Y10_1X10,
 	MEDIA_BUS_FMT_RGB565_1X16,
 	MEDIA_BUS_FMT_RGB888_1X24,
diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.c b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
index 67a776033..10908383b 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-subdev.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
@@ -42,6 +42,7 @@ unsigned int ipu7_isys_mbus_code_to_mipi(u32 code)
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_Y8_1X8:
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
@@ -88,6 +89,10 @@ u32 ipu7_isys_convert_bayer_order(u32 code, int x, int y)
 	};
 	unsigned int i;
 
+	/* Monochrome raw formats have no Bayer order to convert */
+	if (code == MEDIA_BUS_FMT_Y8_1X8 || code == MEDIA_BUS_FMT_Y10_1X10)
+		return code;
+
 	for (i = 0; i < ARRAY_SIZE(code_map); i++)
 		if (code_map[i] == code)
 			break;
diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8c6730833..c9abd4560 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -54,6 +54,8 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RAW16},
 	{V4L2_PIX_FMT_SRGGB10, 16, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_Y10, 16, 10, MEDIA_BUS_FMT_Y10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
 	{V4L2_PIX_FMT_SBGGR8, 8, 8, MEDIA_BUS_FMT_SBGGR8_1X8,
 	 IPU_INSYS_FRAME_FORMAT_RAW8},
 	{V4L2_PIX_FMT_SGBRG8, 8, 8, MEDIA_BUS_FMT_SGBRG8_1X8,
@@ -62,6 +64,8 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RAW8},
 	{V4L2_PIX_FMT_SRGGB8, 8, 8, MEDIA_BUS_FMT_SRGGB8_1X8,
 	 IPU_INSYS_FRAME_FORMAT_RAW8},
+	{V4L2_PIX_FMT_GREY, 8, 8, MEDIA_BUS_FMT_Y8_1X8,
+	 IPU_INSYS_FRAME_FORMAT_RAW8},
 	{V4L2_PIX_FMT_SBGGR12P, 12, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
 	 IPU_INSYS_FRAME_FORMAT_RAW12},
 	{V4L2_PIX_FMT_SGBRG12P, 12, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
@@ -78,6 +82,8 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RAW10},
 	{V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	 IPU_INSYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_Y10P, 10, 10, MEDIA_BUS_FMT_Y10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW10},
 	{V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
 	 IPU_INSYS_FRAME_FORMAT_UYVY},
 	{V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
-- 
2.55.0

