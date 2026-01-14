Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E84C30C353
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 18:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414064; cv=none; b=Q88AV/9WoUCMtw14hxSIlw32l0eTWrrEjMjAUw4hJQXcLEPOJeXq3BcehMFU3jNjTFKYZ++m9uiPACh97yNzzE078h1YufNXmHZCH8a8J+QF4YQ9kBrx6R68yrgKnwDpEyvA4q0pPzNs+VutaWIIn8lDB0xZN33820qQDb0hptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414064; c=relaxed/simple;
	bh=U58OgqkF0FnLNMsluxHv6GR+9+T+DzItDJduGe9JjeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IL3yS1mz82oNBUCCMbZNPX9hEJy9XomVaYy1FMeHE3ucDIV3mB3QZDpV2Ds+lUqtgXEiqT44DyKtrC3CaQWQKemumJjJSoh1TdaKBQMH4xOKl2XeVmMumEzoR6MLsw3xL5i3XCd2ecaDpMq+hsMp+xchgQArAKXazF85zAaMKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcJgM78/; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcJgM78/"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so45138a12.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 10:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768414063; x=1769018863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQjaCQcS7+ndCFM47qBrIon6U6oW4IRpWFUDwNmONx4=;
        b=fcJgM78/DL6cSh5VphtzAOh4qcXViLAYt0w7MKo63DfPgrzwVafMaHF0sZgnbT0eJ7
         bXwqw5GxB4WMbsYEFpcWpVhkGkMWW0Po1yr1VMprFZqas+cZdZGJmI+xK0qcTayJ904T
         KZfCfwHhQRs4k1jNeiNJ+2dx/ScQYp9lLFFEItb9qywvu1ad/mlH0JESfXMDdc8A6i/D
         oE7CVCyRUrdI1Jw/8RN96KTFYqF5DLDC7JzmGGoMNqdCo3mn0UwLRfEj76omvYUj4Jk1
         jerzhEclPhj9xuW9HbF8LkWbcL098VBKc0tcVh3e9tR9kRSh+yHok++qF3wHM3g7pp59
         7LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768414063; x=1769018863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQjaCQcS7+ndCFM47qBrIon6U6oW4IRpWFUDwNmONx4=;
        b=be7LRkuGeymgu22h2L/P9wkMGPQYOiO9aa/+0mJ+nj+/QOsAHRmXgpYBXbiQnHMRru
         7OmIBe+mqxpF5HU5AFMzM3hT2EkvZ1UccMwXBRRSsyZzIwOjzwjwP4bNudj/3ccILeVa
         5xpuO+a4OJ+qin95HRbvusR7rma3GtJIme7g3RmVC42XjmNUUzE+r2ZCTCpCJBAub3uE
         Wku69gaXZsWbE6aEVZKAlsemQzUcOPfZNYx1zWDTMKr8jM6Pbzau1zQ9A75EPpTTxnxk
         0Pb5l5WGDN3p/xD08+J0DItCkYEY8xOTw4phZOSt3MCLrb1rM0LwOU5G1jav0ji7CXLS
         KKcA==
X-Forwarded-Encrypted: i=1; AJvYcCXxzk6ca976K3X9QLnrOJ/KHESrG0r66VNPIUj/GiWPL4Fk9f2mm+hm3BH3R/NXb1ImrVAad08gQG8HVDFJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+DBc5TyC1Kre9i1KmPd2aUx72msPEm1Sx/3RPkYa+GhYQgEMb
	i0hSEUd0RYmStCR9QdYHOdoytx7NpT8G2ZFyeFyTSHdZs6rSGD+jTaxt
X-Gm-Gg: AY/fxX50unxtMXos65Vb+/VrloCZlEpBoa9h3BwjISh2U1bvaZrgcBXdKIg+I/AVFZh
	qjxzOghKQqN4u8OWtJk53VjkGTvP+7Qgbw79lclhsJX+xIZMPpS5HrCI8tdNDsxBhibW+UotIgj
	uJ/8PH8RPoL4lnOoYM1WChCnGuEWYn+1w7o+B4vGLG2eONPWQyzkVj97NRhTtQrRu3ZzS2RWSrl
	kF9xLzsbMsvZsZh2zxUchC5IzZL3KrYC4wYP0xCEh3ohHH73Bh1xyuXx0kyiOxx7x1SXUrGx3Ot
	QpoVq2Nt5NEcPi85fgePQXDvbkAV8uQeRdMNjA5ozP2MK+lK3ptoIH/GB4u2BhFwWmrrGums20R
	YH4H/5rivZahiZ7fnx+D/2Zjn8fJyKKJ1VVVcJSU39NbvinDHJbE3qdC6ZnZafkGYBZxCqQRDtQ
	BeMsGCe1Nk+UCXiXJIiS3L1/PuyBje3VIlSg==
X-Received: by 2002:a17:90b:2e87:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-351090b0ef3mr3627828a91.15.1768414062538;
        Wed, 14 Jan 2026 10:07:42 -0800 (PST)
Received: from karthik.bbrouter ([103.215.237.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35107b75c70sm1424570a91.5.2026.01.14.10.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:07:42 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2] media: atomisp: replace ia_css_region with v4l2_rect
Date: Wed, 14 Jan 2026 23:37:30 +0530
Message-ID: <20260114180730.39744-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Karthikey D Kadati <karthikey3608@gmail.com>

The struct ia_css_region definition is redundant as struct v4l2_rect
provides the same functionality (left, top, width, height) and is the
standard V4L2 type.

Replace usage of ia_css_region with v4l2_rect in ia_css_dz_config
and remove the definition of ia_css_region from ia_css_types.h.

Also remove historical comments referencing the addition of zoom_region
and include <linux/videodev2.h> to support the v4l2_rect type.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
Changes in v2:
- Replaced ia_css_region with v4l2_rect in ia_css_types.h.
- Removed definition of ia_css_region.
- Removed historical comments about zoom_region.
- Verified atomisp_cmd.c logic is safe with the type change.
- Updated commit message for clarity and conciseness.

 drivers/staging/media/atomisp/pci/ia_css_types.h | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index 5c21a5415..f7b77901e 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -15,6 +15,7 @@
  * directly but still need to forward parameters for it.
  */
 
+#include <linux/videodev2.h>
 #include <type_support.h>
 
 #include "ia_css_frac.h"
@@ -427,16 +428,6 @@ struct ia_css_point {
 	s32 y; /** y coordinate */
 };
 
-/**
- * This specifies the region
- */
-struct ia_css_region {
-	s32 left; /** Starting point coordinates for the region */
-	s32 top;
-	s32 width; /** Region resolution */
-	s32 height;
-};
-
 /**
  * Digital zoom:
  * This feature is currently available only for video, but will become
@@ -444,7 +435,7 @@ struct ia_css_region {
  * Set the digital zoom factor, this is a logarithmic scale. The actual zoom
  * factor will be 64/x.
  * Setting dx or dy to 0 disables digital zoom for that direction.
- * New API change for Digital zoom:(added struct ia_css_region zoom_region)
+ *
  * zoom_region specifies the origin of the zoom region and width and
  * height of that region.
  * origin : This is the coordinate (x,y) within the effective input resolution
@@ -457,7 +448,7 @@ struct ia_css_region {
 struct ia_css_dz_config {
 	u32 dx; /** Horizontal zoom factor */
 	u32 dy; /** Vertical zoom factor */
-	struct ia_css_region zoom_region; /** region for zoom */
+	struct v4l2_rect zoom_region; /** region for zoom */
 };
 
 /* The still capture mode, this can be RAW (simply copy sensor input to DDR),
-- 
2.43.0

