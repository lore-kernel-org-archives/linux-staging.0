Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B136EAAB
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 05:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778219879; cv=none; b=l8NAXGNImP9VKdpOdmri+zhLka19V798L6T+l50uK59ZLciTDw4uwvOweTZRIT5tCOLMQmFYEqlmmMWO5Ri9yJIC2AqySTEV+QFusR4mmXcf/PXUSdBH5veG/d0/TTYg3YpnsjUE/tL/QmbCRNa0j4oMArt46zGW1e1xYefJD/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778219879; c=relaxed/simple;
	bh=CBQ+SncFB2uYqntCJUuXqdVfr19evlSniIdg1FFRmNk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gB2BN1itIU3mn2kezsMSoACZuPORhP9ERmEk3mImOByCLx3AIDOpGcwn7Aj8SA42G+Z3dVu75xqaDWgxegAWx+HoM7K9BGiuAp32H/7h4uJBMdA2nttEfgB/I7t4UkoSavOwaPKy4SQbQl+t0KGdiY4r1e+KXDC2Jhz81JENNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxPfJKN7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxPfJKN7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso15010625e9.2
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 22:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778219860; x=1778824660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=;
        b=WxPfJKN7nX/NaKRFYYZgXExL/zx//8xfego6wZ5+/MInq6hnzFkfDstsmmZJ53nAr5
         5sJc0rmdc9vqeWUaPPdZZ9GtaMXXcuyRxyAv7jTtoi/xzO0GUkaDR99KNB/8nBbK89Ps
         vW7k6oUGcJm/zvSxzyWDzLInWRhRVBbtWBjxng3VbpafzWUrg9GD9JnZqvGDI7YNLw8G
         rtikQ43QHQJR9FmVCOCiV2e9PzAy/oUcs7HlIGeqmJ3q5C+Ap4LrAAeTHBmtfN9FBvdx
         m2Ph0eSc82TVpSgFpcp5gaUbmpMg/NF2NYzTkskf1XuMCD8wLrD5t58H0mo+2ydGuCXQ
         CHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778219860; x=1778824660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=;
        b=TpN5vLuGHtnCStqUAJU0YV4k5ikpfvrblgdXixT11Mze0lVY4aQoICPMVgEucghM4n
         bYUaM3MWxhm3KHDhTU3eHPZx9JGC8Rye/SzA5aT0ExgrpiWbggVxiLw7L6x3YNtpeQo5
         egbr2FG4yy5gzVftmTwPxEqcSHF8lcoG1vSTkMD36upcSBrCFEMndjPwplLFPvlT/L/w
         SlFgmxRGdyivj43TxXxxsnkKrTAbxpXWaA9vfuHeknQkJM00jDa9RSLDWioqp+W4M71V
         bdXxWGqug92w0Q4nV29mBwewGBvhSF/vr6kqPQCYXOqu1JXGmEWggnPFZiB/5zOuhrcv
         +hOA==
X-Forwarded-Encrypted: i=1; AFNElJ9YLKsiu2p+xwCHKZ5+8+Y3mxIsvm28mUcjB0tJixU6d4Zg4WrJqrG31sbE+UdVK/HuBZTAunKflVNQIclc@lists.linux.dev
X-Gm-Message-State: AOJu0YxrAv8HGyECiu9FJMQaXdlFXDF0EiWQhIofu0kqBkGMth4RVY65
	FuRM86eb+4qbFlfpuV33FrMctbskbMllbFkce3L12qWa94PzAFRqRHDu
X-Gm-Gg: AeBDiesMWJ5L93jXjDLVk/qZG+ZYDL8KJTGN8njj+XosMP/t546YXswXOzrkUc2DZ+u
	tBidxqgbNORWLbWGhR0MY4uRTy2eKmVGAOGjha0MFFczVZ3kzq02hjEFpz/BQRnNmdh/NAhTzDK
	h77nAvpecQKKBRcBQY36sg23JzbzbEhNdxl93V+lF4Cbd9OC60uPyvFUkG9UMel7s9gggdqPV9r
	/eqK144CCCnY50NxhS1sTxHyxLrL48fxwtx5aO65JXaFdJ/zZ65UCwtP81f9zSsEATnHzE4Dx1n
	3mLdal3dBL5iLE6Ajl0AwiUKlJ6bTsRDIsFbm90gZqsbE5uElBPAsygLqP12e6b/ayC4YFuP7jF
	wI6/92akfPte8G4psBaaFHkPGSZ7ussBXaPIRV5KAXQRroX1uSPLNoGI3D0hD5zf9w0Grb0wniy
	ZMYGLgHYMiofHRM5UYeDkYoTAWlQ==
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr194731085e9.21.1778219860332;
        Thu, 07 May 2026 22:57:40 -0700 (PDT)
Received: from House.. ([182.180.27.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm10278735e9.14.2026.05.07.22.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:57:39 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Fri,  8 May 2026 10:57:31 +0500
Message-Id: <20260508055731.19784-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
Changes in v2:
- Combined both meson typo fixes into a single patch

 drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 76e9ca7191ab..ab4374e3b2ef 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -12,7 +12,7 @@
 #include "vdec_helpers.h"
 
 #define SIZE_WORKSPACE		SZ_128K
-/* Offset substracted by the firmware from the workspace paddr */
+/* Offset subtracted by the firmware from the workspace paddr */
 #define WORKSPACE_OFFSET	(5 * SZ_1K)
 
 /* map firmware registers to known MPEG1/2 functions */
-- 
2.34.1

