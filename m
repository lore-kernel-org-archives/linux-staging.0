Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B4F2D1913
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213553; cv=none; b=ITbm+ag5BJB8GxqY+26ypAkt22/yUQHh6dtWBGMVcElZ7KaniiScBfMbnhU03Ja2Nm6Auqu+JiA4gR6bqmheC+Jbp/URmhaaHVAtdIug/VCbc5gmuQvTiMaNS+TMF1loElqiWelqcSZML5FqKx5i7pCS23O5SynRGYKHFs3plnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213553; c=relaxed/simple;
	bh=PJx7gLECZfGoQUEAbir4VvGcautoUDwg8jjI3a9WZrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6A1tYf281sozpXdlFD0c/MtSaL7VbIIhoNsWLSVClhRcU5g74rJP9ub7FwsVLxxvG2BE8ar+4QxZawM6n20V203XGpXPAWO9lAftE61u5zAb8QEu7BV+hAWR0hSXWsZjV8OnWYpNuYww9eq9sYDf0QmoenNefmsdWdFozX2gNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCOn8O6W; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCOn8O6W"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso4903109a91.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768213552; x=1768818352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=niQSiXKdR4fdfoXszCLE/IXTXWyTZ5Jsk+GKPgjv7KA=;
        b=lCOn8O6WGD3+PXLVxYurFlBi/KES8lxrchULECC35UBQQJin0DBHul/44x8xTq6jIj
         +GGPMUhZKj+FcH8rtCOLgqROflFoSGjFWpntkumPiTYjivlZ33hfQY43X5WzfUFqmSok
         4q7Uj24Le7eFX3FvSFnPT3g28DyyRr804kvYcFkx9NvAPWcPbbPcjcLfLqQLObYnPkFJ
         7vbusHTtqS4t/yi7s4oyAhwSo2OLByEjDJ5Y7TMN+acplHOP13afzkszdWaBRzwCyA+d
         F1WsOd7rII+hYudzPFeSopk17xsINcqx3TsVrIs+Lg970HdZxsLlHaNNCGCl8L1N7pbZ
         jkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213552; x=1768818352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niQSiXKdR4fdfoXszCLE/IXTXWyTZ5Jsk+GKPgjv7KA=;
        b=Jt5R8qsWfMWQWHZJ4osdr+x93uKzXvW1Ttyj0Z0DD7w7aWa3jCBapQI8j7o+ff3i08
         CXwaOLAx5i6uZd3iJx7tuadCyDbnAGDOh9EkRup1sC8X0kDnXKdKeCkz1baqtcQvGadg
         IIfnerAmj6gjfHqL9CKlInazEJrv9Hy0phIF3Yq5MBQdI08muukU4NAe+qS9tmWlCMq4
         H6WvFP7liuC8bLCdkXIGTpv9oHb2h4WjyTAkktN6Oo+jc+E2cvhFotmVDJ9y8loAt6+W
         CshqTnGaDgtxMN311XTOe08MyL+5lFO+V+hBkyc1dy/5auu4EvJyc1QeVFeSMcqFwFjR
         b/6A==
X-Forwarded-Encrypted: i=1; AJvYcCWiGqF5HaIcw/hFbRLFnhKjTmvFioHwgUfAUiEcQUD4vogf2TFoRLVD+envBkAuGea+cYeLh/mSyTXNaM2R@lists.linux.dev
X-Gm-Message-State: AOJu0YzazxdL5rRrGa6kbI1Qu8SHmpTZy03wOiHrwjw6izjdDGKmD3Mh
	qk7mek9CWOllHB+DpsD6s+A38eZu6KlkvoSVk18KLrYfRAqI2lEiZE9C9Qm6dA==
X-Gm-Gg: AY/fxX7m6WcvCVZa7JzojDHAaHJ/r36vKqpFpfbmtdnUywrjYXOqHAIDjWtB7rRVYba
	gSFqaGYg6vtoVR1PJ/QFKD4APVPu50iGqTaumu9Uo23lGO1jMrjtlxgbILqjlo2CDESK39oSFJ7
	cTM7SFlC1l8kGnjCuIXbGrrm1yy8k2SjD5TYIxsjZU1U1OOOgswmTTAmEPuzI6oZuI/HjhoMDRW
	m+O8hONWrvyC51z6h1t95jej0JQmJQm7V/pe4y3BraM790KhlXtr/QIgXaLFoJFknaNo47feRaY
	EryngkSb+131wEY60nMVjAQhm/xI/vx203GKiaTlE5vuPWYOldJTzW0XIy9yxIbNabTisz0x0Ty
	sIrXsAZ15yKEexs07LKxJ7vMxrxtd3FrT9aUnMLsYBCyEMv9zuTapJZ2voYKQFr8xsFHBvjv3f4
	GZGiSRnunVyf6blXMWbkg8ic8aBo/wGg==
X-Google-Smtp-Source: AGHT+IGN7s66GEG1FcM7dQWqyL2GztVWb2iAOg1IHVCwTH5nKJ6tLkigTpOSzwTx2WnkzILzaODU5g==
X-Received: by 2002:a17:90b:4f92:b0:343:f509:aa4a with SMTP id 98e67ed59e1d1-34f68d3b229mr16537095a91.36.1768213552042;
        Mon, 12 Jan 2026 02:25:52 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa78f71sm16804705a91.1.2026.01.12.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:25:51 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Karthikey Kadati <karthikey3608@gmail.com>,
	Unix Antigravity <unix.antigravity@test.com>
Subject: [PATCH 4/4] staging: atomisp: Replace ia_css_region with v4l2_rect
Date: Mon, 12 Jan 2026 15:55:18 +0530
Message-ID: <20260112102518.19926-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom struct ia_css_region with standard struct v4l2_rect

to align with V4L2 API.

Signed-off-by: Unix Antigravity <unix.antigravity@test.com>
Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_types.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index 5c21a5415..7cfb355c8 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -18,6 +18,7 @@
 #include <type_support.h>
 
 #include "ia_css_frac.h"
+#include <linux/videodev2.h>
 
 #include "isp/kernels/aa/aa_2/ia_css_aa2_types.h"
 #include "isp/kernels/anr/anr_1.0/ia_css_anr_types.h"
@@ -430,12 +431,10 @@ struct ia_css_point {
 /**
  * This specifies the region
  */
-struct ia_css_region {
-	s32 left; /** Starting point coordinates for the region */
-	s32 top;
-	s32 width; /** Region resolution */
-	s32 height;
-};
+/**
+ * This specifies the region
+ */
+/* struct v4l2_rect has been replaced by struct v4l2_rect */
 
 /**
  * Digital zoom:
@@ -444,7 +443,7 @@ struct ia_css_region {
  * Set the digital zoom factor, this is a logarithmic scale. The actual zoom
  * factor will be 64/x.
  * Setting dx or dy to 0 disables digital zoom for that direction.
- * New API change for Digital zoom:(added struct ia_css_region zoom_region)
+ * New API change for Digital zoom:(added struct v4l2_rect zoom_region)
  * zoom_region specifies the origin of the zoom region and width and
  * height of that region.
  * origin : This is the coordinate (x,y) within the effective input resolution
@@ -457,7 +456,7 @@ struct ia_css_region {
 struct ia_css_dz_config {
 	u32 dx; /** Horizontal zoom factor */
 	u32 dy; /** Vertical zoom factor */
-	struct ia_css_region zoom_region; /** region for zoom */
+	struct v4l2_rect zoom_region; /** region for zoom */
 };
 
 /* The still capture mode, this can be RAW (simply copy sensor input to DDR),
-- 
2.43.0

