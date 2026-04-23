Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193B33EE1EC
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 12:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948756; cv=none; b=ezpvcHiQRxV+Q4zg3h12PKtPXm1q1Vhh9zpwdH3g3kAt7DdUjMsXBIeXgeY9Tct7hkx7VDrlFAv/NXl2i7PJBg2ipBF4k/TECyocOdmZNF5c7/eaTcggy6qrsWfZGfxwakjlbgVL/fBY1rL+Bv5V8HWcKHuIwh7WSM0PTiwapGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948756; c=relaxed/simple;
	bh=tKQ2tJ6SD6k4XaJGv1agTBDudy2Fgh4ItfGIyGUm3ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olW5X3N7OGroBdimnAg/QDQzvZuZGYxng1uG1CrwX6xewPJuvSFC2uuHna3GWKRIUPA07AH/ug/pRn5UmvsbsE7GOs2uuDfl7zpyE2JhI4cLV2x8hAHikGtZhBNpPXXnAnCZ/TWrSyJ7Z0VUnN6ugky2Spay7aMYX9bA17g/Va4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOxEOgoe; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOxEOgoe"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82faf871346so3699949b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 05:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948754; x=1777553554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+RZEmGjfBSKMztRaXEJerE29lzPNudyadXu2P4tV0s=;
        b=hOxEOgoe0l2BmdbpCO9BYT1Mzj8Pirzo8zZ+dncwkc9H2i/3YJL526Of2ZN5CBH1Mw
         uLsS6QPeDRvDpv/ao/AQKLZh8mzq1Pf1n3zoMW7mUdX2QKTXR+zqDGnUdtI2CiG+T3b9
         a+UkIKWo24McG61uaD/TJlt6LC8lA591DbjLE68HpKPU26PQJo1bxh3vWZ7blWA9lkE3
         YTLAHYMJWy59DyDmqau8VPpM2wboZTK9bIcp4Cv0+WVFzioP2AV5dsXUOSxHblTYidqh
         pwVFfNK2Mq7C0Yv00tgO0+kQYpT8K+gSNp+1lrUnFHMFCzjnn97xdT2jvOBomwvGqi8/
         WnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948754; x=1777553554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3+RZEmGjfBSKMztRaXEJerE29lzPNudyadXu2P4tV0s=;
        b=GdrGRI6W8kI61wWBiFTrPJpf73xAsy3uUyzfUhwsXV62mvO8uPkg96ASiHGVXCTZMb
         0Ru3SrDOYDbTLlYageppj5w6lUuZUvajZV0eOSA+WADIzAxgDYZj5iWL+2LJDlvfIMlB
         x7n/JrawtnmyGJ7xn2IOB9xNjSYH8tzuPKIlaDwDRevE7h6WunSnflcU/vACLFzvpixd
         uhTcm4mEcWuq3rB3cRuXFZl0YxfMaE74guBa2hehbrnDv7XsbfrF1S01FSYT61SRB7+i
         DTY0skklT42CdUer+F6Lo1j7AtGeFlFP2nOwP8Co+Zl5XGZJQzrV9uxlKT0jklUrau7z
         NBEg==
X-Forwarded-Encrypted: i=1; AFNElJ+YORhJWZm1bbEZu9kerEThyBoiMHwPIUbTO8ayiquqtRFoph0r9MXQHCFdpv94nQ8kFpzzxDi9zUQmjfck@lists.linux.dev
X-Gm-Message-State: AOJu0YzSPbJ3ZB9jfcRcbs+WzCd3IaecZdi/6ZdOptulsBzNzPLe6kK2
	7SiP77yMWHy9N05yd1spHzW4SafTmujzl/meNZOT8xJ45eanD+U2jN8Tk+vVLQ==
X-Gm-Gg: AeBDiesMCGyXWzzEziUKIWnGd671ZHeHzw7y7LSOo4NeMT8y1cw6hCvQKbSwjH0vjPR
	VwISIdTXU0bv4O0BcgghHDh5QTPwaeZ0jj64cxUFHHm9iXAYudcBtRr3AXgCLTuvMe2SGNKGrFx
	XkqoO45c0gVv07kV/PrpLziFS/AvET6FS1sSziICHD/pxTLzBLpD1MU/60OplmfeMirAdlOat2w
	Z50dRyeExZxjduuqnl0rSRm2JQVUaLI/uHwjmXhEw8I17iGMT4XO7+IzLHh5/XOmhagby2UowmJ
	lxH9QNDsl5CoSF2JEutc4UlM75scNYYkU52LVc1XmUOtEkOygrgPdW6R1Dgo3o7+zMbAPb0enXj
	APGEFGQ10z0Ah7UGDDkK+RB6ATGDE2sVmApFb4g4e1DsQkSTtkflP7MeCZZocCz6uF/MM7CggBW
	3N9GWJLhTO86JtPKUmV/7bCrmWkMYeusEEwB4E5l4bfpEOHoRJlaSLQv9DW+JDESA=
X-Received: by 2002:a05:6a00:ba02:b0:82f:8b20:9165 with SMTP id d2e1a72fcca58-82f8c9222e1mr28873037b3a.44.1776948754378;
        Thu, 23 Apr 2026 05:52:34 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0092bsm22043687b3a.50.2026.04.23.05.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:52:33 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: [PATCH v5 1/2] media: atomisp: csi2: Remove unimplemented DPCM decompression
Date: Thu, 23 Apr 2026 18:22:15 +0530
Message-ID: <20260423125216.19217-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aejF4OlVJtKSknxg@kekkonen.localdomain>
References: <aejF4OlVJtKSknxg@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The source pad format handling attempted to map DPCM-compressed mbus
codes to their uncompressed equivalents. However, the rest of the
driver does not support DPCM decompression, making this dead code.

Remove the DPCM unmapping logic and simplify to directly copy the sink
pad format to the source pad. Add an explicit comment stating that
DPCM is not supported.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v5:
- Rebased onto linuxtv.org/sailus/media_tree.git (per Sakari Ailus request)

v4:
- Complete removal of DPCM decompression attempt (per Sakari Ailus feedback)
- Keep source pad simply copying sink pad format without unmapping
- Replace detailed comment with explicit "DPCM is not supported" statement

v3:
- Drop "staging:" prefix in subject (per Andy Shevchenko)

v2:
- Rebased onto latest media tree (fix CI apply failure)
- Fix missing linux-staging recipient (typo in v1)
- Fix indentation
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..64419c1a805e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,7 +107,7 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-	/* FIXME: DPCM decompression */
+	/* Source pad format is copied from sink pad. DPCM is not supported. */
 	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
 						  CSI2_PAD_SINK);
 
-- 
2.53.0

