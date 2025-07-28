Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1019B221FD8
	for <linux-staging@lists.linux.dev>; Mon, 28 Jul 2025 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753687676; cv=none; b=o2MQ0UNJefL1/B6B6g7W0yQ54/zZg2eldv6R+5R2+An8Zsw7ZReMyZS11xim+e8d9MlCNXG6stUSbUv7k46RhfuQufXJWgRYYdKmPvecXN/C2WUCOJ35t18o2w8gNSzNtWjmRyGGQle736l/fWZyroZCFtESxYcD5rL2ffV0zQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753687676; c=relaxed/simple;
	bh=s8XctckT3Sdb4YvEEyVaRTMNQimbq2CU+c1oA1oZ7ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7CghrvgOsGcb2oqMIEsSyS8U5FeDkhPuf4wZ+tbSYpohEGcsmJ/b0LWsau/AZvYryVRT5SsVr7kpxK2H72rR7HNbomem6jrH2E/lM18yX4llx+/Y3dCgbmGbGZQLOtwmcea7ZoUgdturqpILASFR5Zo2fgLtH80zx9PXpVDrLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKkIO+NJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKkIO+NJ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24049d16515so962035ad.1
        for <linux-staging@lists.linux.dev>; Mon, 28 Jul 2025 00:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753687674; x=1754292474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIkA7rxj2aeFkUnZL3Z4nhuVfvXyGjEGJhkZwRCP+pk=;
        b=QKkIO+NJD3CmRtV1MWCRuYoIrHGxLPHOlGpWHqkZXJz2L6rleMDj8IlhRPIZL8MG8d
         2YnYSEt3fkiMGeLpKahu4b2KKIPdylzemnYmZy2CdMTl6ea+pxw9O9FKRjKMP3LNxncI
         HHIaXUOSPBvRwZPm5XyGonm3AiO6/xVIKGH+TA4cO5jPY+RtLY/6EH7Uk7F3gGtUOHTM
         4QoUOqWaJGh0Aw9x9rQeLpXiALEEfZM5m2gCd23fPDVy+iG/d0zo+UIHu1q54IJEfSP9
         WMCu86GZ9K6b5soR3wnJPtx7HFAyYcUpYc19aAewgGDjhz8HHE4vVa09q0H+MCW19HOB
         inEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753687674; x=1754292474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIkA7rxj2aeFkUnZL3Z4nhuVfvXyGjEGJhkZwRCP+pk=;
        b=jOglk5EsOUWmzVipHtG31aNl4ClGWW7gpKxmp/3S8NqZwowLsKybhvBpKCsFbEPGDZ
         0ij0sPePNkBhkM42JamCbhGEay2/ByKfrIADyvur4RXVkQXZhsUNHGPyfC2ZKL7goxOB
         eDbZh6Vh561Ma38VzpWS7SqUA7dNyo3jDi+bZ0PGg1G6wc7TU4ri1a4SajYuPRtM5kY6
         nUSrRFhm1byh4a8/x8gdOxUDTATNkTWBT1dBZR/MrKfJH7mWGyZftdsL/2SRqsgdPwkM
         Ozp00YSTlPV0y8hUKcgXsr+T4KL73Lg+axB2t6jO6gcqQ5Rr5hgaWQFFtjkIwN9j75Dd
         PJow==
X-Forwarded-Encrypted: i=1; AJvYcCVK0Ba8bU/WiYib6RghfWyWc4SY+ZN+7evPstcXg4ZEUImcrmXig8qBJXha4MxDeOAqwQPlzdn2ardsHNK8@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3P0sX0V6769kesIxsfaiRh4IT+cKS7nu9BczeoZ/VxJZRGh+n
	coFTiiRuD417jFnSU2o4CSjKyPZCa9L5aKF+Tglsaz06DQwNNeAxVhQW
X-Gm-Gg: ASbGncsmqh/TY6dlO86qOgImQTlDdRZDFl00nP5o8P5ghgJU+bIx5jK95qq4cEZDVXR
	qi1cB4z8X2dZbwfTKkRzK7+wtI5kG6jQszL4FWtuLv9e+LK1jn42p8owrYbtMfHFieW8z2DR1hW
	m9UnHefTbi5vtPGbMRKhVTf2u/i/tWRrokq+n3UzPj+SYQhRrkRmlMXrLiuNZDMw1Kx7UObYFoi
	nsuREqM/vNj0WkGOBax0Xqp5Z9+SWEFhOsbRED5yCz1nkbD7S48QqLmn4FwWAVR5Xd9qiqIzzLA
	JnKiXoSSGfb7ZSmjGTH+ayuecKZH4krwiWYcg0kGMKUiNyXJdF3ojRFnKaBZjPkxHTveWW/dCRP
	NTTiSIl5ycMGV5GMo0vVHjh55eQ9WPfpxsaB0IDxXmxm6Gv+ffnHcG+Y0K4Xbk3BYKI3tfJzcic
	IbuQ==
X-Google-Smtp-Source: AGHT+IGxXFmKSvT4xZhknxQ8XN0geHH0nu1k5wB6QGBZYZRXvZJGddPc1NKhIESQxbDZ2gZaSJERlA==
X-Received: by 2002:a17:903:fa3:b0:235:f298:cbbd with SMTP id d9443c01a7336-23fb30ac008mr182227745ad.21.1753687674219;
        Mon, 28 Jul 2025 00:27:54 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([49.36.68.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2403f4dbd1bsm5783435ad.59.2025.07.28.00.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 00:27:53 -0700 (PDT)
From: "Darshan R." <rathod.darshan.0896@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	jogidishank503@gmail.com,
	"Darshan R." <rathod.darshan.0896@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix indentation and styling in output kernel code
Date: Mon, 28 Jul 2025 07:28:22 +0000
Message-ID: <20250728072822.10730-1-rathod.darshan.0896@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated the formatting of function definitions and if statements to match
kernel coding standards. This helps with readability and consistency across
the codebase.

These are non-functional changes aimed at preparing the driver for eventual
mainline readiness by addressing common checkpatch warnings.

Signed-off-by: Darshan R. <rathod.darshan.0896@gmail.com>
---
 .../output/output_1.0/ia_css_output.host.c    | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c471..4f84c6d3622a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -34,9 +34,9 @@ static const struct ia_css_output1_configuration default_output1_configuration
 
 void
 ia_css_output_encode(
-    struct sh_css_isp_output_params *to,
-    const struct ia_css_output_config *from,
-    unsigned int size)
+	struct sh_css_isp_output_params *to,
+	const struct ia_css_output_config *from,
+	unsigned int size)
 {
 	(void)size;
 	to->enable_hflip = from->enable_hflip;
@@ -74,7 +74,7 @@ int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
 }
 
 int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
+			  const struct ia_css_output1_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
@@ -95,7 +95,7 @@ int ia_css_output_configure(const struct ia_css_binary     *binary,
 }
 
 int ia_css_output0_configure(const struct ia_css_binary    *binary,
-			    const struct ia_css_frame_info *info)
+			     const struct ia_css_frame_info *info)
 {
 	if (info) {
 		struct ia_css_output0_configuration config =
@@ -124,10 +124,12 @@ int ia_css_output1_configure(const struct ia_css_binary     *binary,
 
 void
 ia_css_output_dump(
-    const struct sh_css_isp_output_params *output,
-    unsigned int level)
+	const struct sh_css_isp_output_params *output,
+	unsigned int level)
 {
-	if (!output) return;
+	if (!output)
+		return;
+
 	ia_css_debug_dtrace(level, "Horizontal Output Flip:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "enable", output->enable_hflip);
@@ -138,8 +140,8 @@ ia_css_output_dump(
 
 void
 ia_css_output_debug_dtrace(
-    const struct ia_css_output_config *config,
-    unsigned int level)
+	const struct ia_css_output_config *config,
+	unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.enable_hflip=%d",
-- 
2.43.0

