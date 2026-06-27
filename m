Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F22390C95
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542372; cv=none; b=IQs1X+lI3hgFZXBWbG+A/X0UU5+Hae/Z1a+zfu1ujBFPrSWMwnEDDlNLP7UXVS1s7QpjD3yZhYoHx/jozDcI2Gb50u55AKtUWt5zRNH2U0Y7Z2dOW68kbuLYphRXH6XwHuVmL+NurwUEbY56TTqUhSx3mjWEjlMv8L5YfmZH1V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542372; c=relaxed/simple;
	bh=zqrtoIgxqlPm1yGRfDaaOKs8e4n9g6P9Nhu6aDp1pAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYeH5Om5lpQAmwhgu7nzPZg0pC3+sc9S2rFUHRY7lmszC7I5ZaMgaBsPT7B7c6x+ib1wKJZxLi+aOu2N2RvXnwvRWE4pmufnUmvJrFVraBzZfT9HlH3+a2D4unkkOAWBCMmWssgumw1Hl9srhGD+m+Jfo/QI4zCz/FtY6o281eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=dHl7ypvI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="dHl7ypvI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4924f8db066so8100375e9.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782542370; x=1783147170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3B6M5EhMpzjG7Zmkrc3EdtRy3lRAN9WZO0zjTSLhxM=;
        b=dHl7ypvIX+s/5cE8FwuVGkkJZ5ExJ4p5mFKKNocWpJKZbpvaataSyTKnytopohyS4+
         NKjdhMp24HVcYdZ359/3S45d6zh1KDzvLSV03KL1iCoA9IiWbLAkNd8NRyeR6n8XC+5o
         xZ0y01JnwXZnlWTXy3q9bv3mbq5P2uWuPBT0hjAY3MADM+ufLV+us1e0WY3AwbSmUf9x
         qK3uGbgDyLSJJth1H/WIOpQJu4eBvnyGbHvMSjV33zkp4SLNZ1EYBitGL982HWpA+87G
         9NjTBfaU3Xq6TgCCBbbzM7KRpWbZtNZVD3cRfwXneluJbfZXJywgc2rd9jMrvJeyIroj
         Xz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542370; x=1783147170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v3B6M5EhMpzjG7Zmkrc3EdtRy3lRAN9WZO0zjTSLhxM=;
        b=cWMVkapHZ2hfST8Rj7b5cyOlZA/lcJ7wVx1558Ln+O7eWH3/gXQuv29yQe1/afXCco
         nnQRZtcOyYzRdxsVRD6uwrM5X2CrNvl+NvnNvt+CnuLRWgtB4adHoGpnikxPFo24dswP
         BKufOIy5PBsBbAxfAU0r+WaA2s8hMMjBn+BmF/5viXYfhRURQjaRTspxjd0XU2UqJ2AN
         oPma22oVPyqXtpfr2vHF2dkT62b1LJxatVnVvMlWi1h5JIsVxAyUR7GILgj8nKOj9Cdr
         /JwvFepqOq2px9YaZ8IWbEfL8vdqKdXCR3dZmJ8ZAFiufm7SR/xNnOyR4gJeeXoWizov
         ofmA==
X-Forwarded-Encrypted: i=1; AFNElJ+j61hJEw8x/AN41SnOxQ7iRfVz+xQBJDvVkQ2fl7BT/kQawx4m4kX5ZiEBT0TRgy55pDnqzyPRxitRLG1K@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0ZKFxjeVHgMjpeFnQt8cVFRufaA3udJK+qu0tsddxWAWlZCz2
	XJcgpCVj9mTkzV2hWNqXs0J41NyOMvI1t5fi3PAB/t1c0GL/JAKDK8gyOm3X8jnKWv9q
X-Gm-Gg: AfdE7cmKTPwei+CDcV/gRZO6pYc70QSopKWvoTUCtlqTkjbfMB0z+F1fRwAfyGmkk7o
	yYsETcnQaZE9b1JQbgGByDrBrulIg0/GDe+CbXVa/4bwQ2KOruqKAQuvkHCckeHY84MZDtph3Kt
	EGREtlBcrHq1svP50A74wpnfpc9WyrK3df5rTVq06UaY06W+jRF7sA9T1a4nnXUywO7wSWomod+
	qTuxUGmyUjOJJR7HcvOVSlD8IQbDND1wQHxcEW+ye9rBi2+2xFBxG9s1BI01trHe/VhgM7faPWk
	jFWIDYShcrAhmwotzwsXEJcvQPIC8VXscRTZlDPtD7mO3MSSVrU+LkTrevnV3u+/cCGZsCSyDOw
	HXOBhZxBs5XZhMb2cV6VjCbjj2AELUAeaPpj311Z46kruP9J7hXAD5NDdtSTERiZ0tIvm4alTXy
	ERyMtmX8nMyHInG7iWlNXSOYu/VLsMPis2dQSO6mScqz678fRwE64Px5vd4jioOxUbXr4oqDl+u
	Rk8d0fOi+P5FDZfcgAxviYbqO04XIFyJIU=
X-Received: by 2002:a05:600c:3f0c:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-492667e9b5dmr131450645e9.0.1782542369935;
        Fri, 26 Jun 2026 23:39:29 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c285fc1sm79198785e9.1.2026.06.26.23.39.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:39:29 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2 2/2] media: atomisp: bound DVS 6-axis table dimensions to the allocated config
Date: Sat, 27 Jun 2026 08:39:23 +0200
Message-ID: <20260627063924.79491-3-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627063924.79491-1-doruk@0sec.ai>
References: <20260627063924.79491-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_cp_dvs_6axis_config() allocates the DVS 6-axis coordinate arrays
from the stream grid via ia_css_dvs2_6axis_config_allocate(), but then
uses the user-supplied width_y/height_y/width_uv/height_uv as the
copy_from_compatible() length. The reallocate-on-mismatch path also
re-allocates from the stream grid, so the destination is always
stream-sized while the copy length is user-sized. User dimensions larger
than the allocated grid produce a heap out-of-bounds write with
attacker-controlled length and contents, reachable from
ATOMISP_IOC_S_DIS_VECTOR.

Reject user dimensions that exceed the allocated config in both the
ISP2401 (t_6axis_config) and ISP2400/else (source_6axis_config) branches
before the first copy.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel
Baytrail/Cherrytrail ISP hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5046a0ec8bba..9338aa009923 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2630,6 +2630,20 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
 		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
 
+		/*
+		 * The destination coordinate arrays are sized from the stream
+		 * grid by ia_css_dvs2_6axis_config_allocate(); the copy length
+		 * below uses the user-supplied dimensions. Reject user dims that
+		 * exceed the allocation to avoid a heap out-of-bounds write.
+		 */
+		if (t_6axis_config.width_y > dvs_6axis_config->width_y ||
+		    t_6axis_config.height_y > dvs_6axis_config->height_y ||
+		    t_6axis_config.width_uv > dvs_6axis_config->width_uv ||
+		    t_6axis_config.height_uv > dvs_6axis_config->height_uv) {
+			ret = -EINVAL;
+			goto error;
+		}
+
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					t_6axis_config.xcoords_y,
 					t_6axis_config.width_y *
@@ -2682,6 +2696,20 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
 
+		/*
+		 * The destination coordinate arrays are sized from the stream
+		 * grid by ia_css_dvs2_6axis_config_allocate(); the copy length
+		 * below uses the user-supplied dimensions. Reject user dims that
+		 * exceed the allocation to avoid a heap out-of-bounds write.
+		 */
+		if (source_6axis_config->width_y > dvs_6axis_config->width_y ||
+		    source_6axis_config->height_y > dvs_6axis_config->height_y ||
+		    source_6axis_config->width_uv > dvs_6axis_config->width_uv ||
+		    source_6axis_config->height_uv > dvs_6axis_config->height_uv) {
+			ret = -EINVAL;
+			goto error;
+		}
+
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					source_6axis_config->xcoords_y,
 					source_6axis_config->width_y *
-- 
2.53.0

