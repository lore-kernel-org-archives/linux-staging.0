Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E178444839D
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835771; cv=none; b=VDICpHRmn+OCjFzopk5OlxSiIGgJ+1KL2LtVFzgw2vpPbUfpFYa/ruNNy4iWwgHU3Ns7Ysd70A7mVATyCnMPRDwchvo1sgIK065yNjbP8DCrbClF4E7oSbwB7R5k1gIyWM4T2jrRtqLNMj8NGXMyOrTbSfvkbwn5x9YY/FYgC2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835771; c=relaxed/simple;
	bh=5o6ANdOnsEwvHNkc68cYshSKpXo+cUGt41qHOl1Tkjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=syPbU1nXj5K3mKI7xdCQZeQBU1r2YFCedFJYoyYji2KuKOjn5He2NO645rUwhJD7XcB8anyznXBiGGDnZn4sQD16TvEJlE5VdhaYG/gBnBIgNadlAwgiAe8l4LqsThM/0CRSn0vqNvphKFSLnXzK3JvlcezDohYD06QVd2wVA7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdCvpKpZ; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdCvpKpZ"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-448b89f700fso2205637fac.2
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787835756; x=1788440556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YbfpkMbK/g+UAyxQUtADUS+ulixTWRPAVGbjBEwn60=;
        b=VdCvpKpZXrb97G/Jm7o9VFqbupZDmWVeVKl5PnriDUoIZmr44225UDD8Jk4KP+ocab
         s4SiN6udZHn4X8ehIvz1+mcs3P3jRRZhgSmCgNOXqIhqA1oCUwc2BE1edeLi1znTTbuk
         DsWFd9qoDolXo169fUww0/Na0loncwHE+fnp7TyfbX4h06AW/ycq3i293vwP1HU/F7bt
         n01fbi6VWCwZk+Xdw8yBf71YZmEUIDwRipHUp7qFTOHgfTUWpyDp34MB9WV4pIkiwPq6
         iXFOdTgUQf9ZMihGpnfb51pOK7/oqPJ91EEO6gMe0zBrbb2tXo+wjdkM7vQZ/LuwDpzV
         tNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835756; x=1788440556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YbfpkMbK/g+UAyxQUtADUS+ulixTWRPAVGbjBEwn60=;
        b=EROromtuQr2ijd9v5GlIEKhWZm3eVxFcyjwZesJEqJCmWh1BnHFwYzCbstcAkbA0hD
         uFhTc54WcTDhiwQKTnazv8PAQm7LVkuEnF/mlgf0y2n+nJ0MWgchpzNgqZWkQtYNP3ob
         xrB2fx1xw0e9/Zm89CkI4MP1LTv6UcNn2ro3xF1tNgdG8Ve5g98MEjq8cjGYNeTHAtex
         KLz7bharX9us2nNAD+Xk+I4hLaVN3IkGiep/TaZXNzlwrLJdG9dYTEulMmeTNASEanRY
         1hFqu1opzUs+K3FnxhlglDuRpJuh8Zx4yGe3ZuswopLeZBHVBQqrJAx2zhkmFzqffwSP
         sWCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpI46zGZ3hmHu34L6/AASkb8VHTVNqLz+wpiDRQKCZ/uUn6ds3iOKvSVzuIzxa30KlgfUCJCOF0gW/ziDXV@lists.linux.dev
X-Gm-Message-State: AFuF++m6Hk/gulUZTs640r8fTPwl3Y/gsbZiwqGnqVDtdSGeT3qSr2Px
	ll2NnsFFCPBpFLJ3kTymTbd2IDxyxpzI5TO4eRgo99xN+zooknCv1H/6
X-Gm-Gg: AR+sD138/H/IHhkt8Fl6vqOjjUaWNFv6P5DmwzZeKHM+uOgogXKo36nuZ0x2BXVWISq
	YzEUMWU7alB5agUPl6CmgGeRhB+bbuoZdUfoUlHpK815gN06zHi4bHcEWWMhfBLoylRh4BsjpzS
	0BAjqikuvnjBmc91OLbqL+ew4ORzZICiOMv+XTc2Rt+vAe533Aa3BX3d4ajEgUzH3ENz6HAD/cu
	1yAkaydD/v8REE4jhttTsqsFzLr3Tw9djvanxPRJJ1bhAcfjU7faYOb9K9xjw4SWkTP7xwaL2ph
	qu6rKai3WTbVw0DwQyZC6qyc/vOZyBh2MyQzT7pdnedjdc6z8GueuylYLyF/Wz32EckA/SjyFCV
	s+m0skJkH9wn90Rp0hLQFve7VT09ta0I4kvh8Gxb7yEx6uYBbQddsupnTDjv5Wt6DNR8E/RWYkP
	wSesTBlbC0V4y1Wh0TQKXMbf0+qLdsg4X6TYFKDGkhgpbtb0rXwKIm56u2NXUE
X-Received: by 2002:a05:6820:4c0f:b0:6b1:afdf:a01 with SMTP id 006d021491bc7-6b1afdf50c4mr7622702eaf.18.1787835746080;
        Thu, 27 Aug 2026 06:02:26 -0700 (PDT)
Received: from machine ([182.69.183.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9035ff1sm15598089c88.11.2026.08.27.06.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:02:25 -0700 (PDT)
From: Kartik Panesar <kartikpanesar@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kartik Panesar <kartikpanesar@gmail.com>
Subject: [PATCH v1] staging: media: ipu3: remove unnecessary dev_dbg function trace
Date: Thu, 27 Aug 2026 18:30:40 +0530
Message-ID: <20260827130040.117697-1-kartikpanesar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a dev_dbg() call that only logs function entry via __func__,
flagged by checkpatch.pl as unnecessary ftrace-like logging .

Function entry/exit is already available through ftrace's function
and function_graph tracers making this redundant.

Signed-off-by: Kartik Panesar <kartikpanesar@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 8063401246fb..b2c8fb7d6813 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -290,7 +290,6 @@ int imgu_css_set_powerup(struct device *dev, void __iomem *base,
 
 void imgu_css_set_powerdown(struct device *dev, void __iomem *base)
 {
-	dev_dbg(dev, "%s\n", __func__);
 	/* wait for cio idle signal */
 	if (imgu_hw_wait(base, IMGU_REG_CIO_GATE_BURST_STATE,
 			 IMGU_CIO_GATE_BURST_MASK, 0))
-- 
2.55.0

