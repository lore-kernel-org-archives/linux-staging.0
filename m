Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE3F2FF170
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777710327; cv=none; b=F4Fyw/MAllvigNTlm5z0Ki6K4pctnf7b6MuC0vRa2iFV4DibrxI165AcZG8hpm6R3hZEsOOXlVoUHt2Q1HJ9Lifi/rylyFG2NS9WW4YDuNkfhsuqcqEr+D1cpdLqxlibg4lCJ+sIm2m9pVbkJIxAmvyjfuJMcM5H7F/TPQVpvZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777710327; c=relaxed/simple;
	bh=0WAZDhluGVrY0GiqCvIRLbyr+zl9TYqg+4LeOUz2ppk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uaNCi8+1HlpXgRoh0dn3Cry2os6igF2BsWV2U1tSboK5lVuWBwwEQxHDNP9y3y15Fjbh7P3SxaZQAkZX78NMZ2oisTWno9OqpkW9MBxVO1YMcr0dnvYHj0r2SWaQ8ljWrQV1fQvl8hR0QxzlsZ7Nw5l0xU7SaWtl0IxgbwFT/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekCrVWzt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekCrVWzt"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so1884188b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777710325; x=1778315125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LDLzCL5jMxLJXRki96FPHhfOoa6lvhYX7V+gzTmTkqU=;
        b=ekCrVWztMX+4/u6ngVxsG/R7m+u1Dby9JEaw3J9fzSPBiTJxzY6Fx9woCS8PbocE1g
         xxOejdc+EFKHtNzIimaw8cWKWRbkUnB7uOHET6hyvHZE+QA3DkAr061JszeefGnhHrt+
         1hHyABLHf0THhhRZUYwex2o9f/cmIK10XzJTEqQ/LHIqPCPVAQnEICn/xqthhZG3KRpT
         rWGKCgrT/Kex2c0aHMgpPAaB1lbggpsfHX4dmS51lUNuylg9bKXsSiiimNBjXqNY/IQy
         pxtacgSQhhUxyFxgSqwrY7eyPpzhgx0DA0pTKFUQ3DeK3xbY95i7h6mf3doemc00dZZd
         3Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777710325; x=1778315125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDLzCL5jMxLJXRki96FPHhfOoa6lvhYX7V+gzTmTkqU=;
        b=hruNX3XYPHmfAABRW8qStSPyg2dh/hLLpUNCedAloFkToZowYsFi5bGvuRdjxxTenp
         VjsSGkB+Eiohl+76wj+WWt5/74fa2ETFeTTQ3D5i4h5e3trr5RTEsXifolk3wnn4otJP
         yd7KnRtcYz2N1iTiZdpK8DAFefZsB/fU5KBXLUOoueJRbtXOqIFbzA5WpGQnUIg8oheF
         nzGa3k4Pma/YW4hQzjpmfOvaOLIpl4G7YhuFE4eWADkHEoQUwkr1c5D57YonpwZg3H6E
         g19gt3+Jp/SSauTPt2X8h6Dt4kWikuHFjYuqxn6f3B0UM20MtucxtIidnjVUA8KXuGkb
         22Uw==
X-Gm-Message-State: AOJu0YwwnsUa+9TZDyIa8nl6EiGrz6RwM0UTRib9LWWQU2Lvpr0ZJeV7
	Zdj1dYFN9kI8jdebHk09MOKnruinDinEaA4W9krVAqQpKoh0QLJN8isM06kaS7+8qkU=
X-Gm-Gg: AeBDievqdWrgxJGbdqqlohjsqTqmS6ab4Cf9g8p+GLHoul+h7+jGnGL2TP2xYnV6zt7
	kMtOEm8X09w2bu7R698lsb91wuaxEN1LpJShfIs6xDfalgnjXEAUTwVRnaQRxLTPJ+G2/q3U3Rx
	4LmewZYBISsGAPupNIzytAwV4DtegvQoJbyBX1T8ilC8jsrRgueizuDUtpuWguFpSefFqEkszWy
	F0mYfpx4j6nM1lekaWu5d9ta5dbpLyQkY5w/0m7ZBvt3KHpqDUJhBZlXxOa4UmbWwY8eL0+s14y
	hefyxbWgeDDbhG0xu5qY8YrwkoGmsaOZU+H0vv6S3YgmkHW7RSEkm7UKvFW5lC77Y5DV1er2X/B
	sZP76WU1tq7KFnjhimB8HRE9Q7NSua+WJ4/0yzu8vMavwPXUVhBRWC/h2VB3mKUNJnCdD1zOTLd
	TsMe1FFZbLmD3lG+1xtEkrANc9GPMgYhawqcaTGkaFmX2DgXgfRMUv
X-Received: by 2002:a05:6a00:b904:b0:82d:162c:581f with SMTP id d2e1a72fcca58-8352d2efbfcmr2346847b3a.48.1777710325373;
        Sat, 02 May 2026 01:25:25 -0700 (PDT)
Received: from shirinkaul.localdomain ([122.172.84.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351d08065asm4133233b3a.3.2026.05.02.01.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 01:25:24 -0700 (PDT)
From: Shirin Kaul <shirin.kaul11@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shirin Kaul <shirin.kaul11@gmail.com>
Subject: [PATCH] staging: atomisp: isp: xnr 3.0 fix whitespace issue
Date: Sat,  2 May 2026 08:25:16 +0000
Message-ID: <20260502082516.16302-1-shirin.kaul11@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spaces by replacing them with tabs in function calls to comply
with kernel coding style.

Signed-off-by: Shirin Kaul <shirin.kaul11@gmail.com>
---
 .../kernels/xnr/xnr_3.0/ia_css_xnr3.host.c    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
index e90dea58215b..3da73001d645 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
@@ -34,8 +34,8 @@ static const s16 x[XNR3_LOOK_UP_TABLE_POINTS] = {
 
 static const s16 a[XNR3_LOOK_UP_TABLE_POINTS] = {
 	-7213, -5580, -4371, -3421, -2722, -2159, -6950, -5585,
-	    -4529, -3697, -3010, -2485, -2070, -1727, -1428, 0
-    };
+	-4529, -3697, -3010, -2485, -2070, -1727, -1428, 0
+	};
 
 static const s16 b[XNR3_LOOK_UP_TABLE_POINTS] = {
 	4096, 3603, 3178, 2811, 2497, 2226, 1990, 1783,
@@ -125,9 +125,9 @@ compute_blending(int strength)
 
 void
 ia_css_xnr3_encode(
-    struct sh_css_isp_xnr3_params *to,
-    const struct ia_css_xnr3_config *from,
-    unsigned int size)
+	struct sh_css_isp_xnr3_params *to,
+	const struct ia_css_xnr3_config *from,
+	unsigned int size)
 {
 	int kernel_size = XNR_FILTER_SIZE;
 	int adjust_factor = roundup_pow_of_two(kernel_size);
@@ -180,9 +180,9 @@ ia_css_xnr3_encode(
 */
 void
 ia_css_xnr3_vmem_encode(
-    struct sh_css_isp_xnr3_vmem_params *to,
-    const struct ia_css_xnr3_config *from,
-    unsigned int size)
+	struct sh_css_isp_xnr3_vmem_params *to,
+	const struct ia_css_xnr3_config *from,
+	unsigned int size)
 {
 	unsigned int i, j, base;
 	const unsigned int total_blocks = 4;
@@ -232,8 +232,8 @@ ia_css_xnr3_vmem_encode(
 /* Dummy Function added as the tool expects it*/
 void
 ia_css_xnr3_debug_dtrace(
-    const struct ia_css_xnr3_config *config,
-    unsigned int level)
+	const struct ia_css_xnr3_config *config,
+	unsigned int level)
 {
 	(void)config;
 	(void)level;
-- 
2.43.0

