Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9A451054
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 21:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991830; cv=none; b=sNzjUDPUfEMHNqSLIzhZhApMq2ULnAvNJ30166oYTMJU9soK9GW5JLumolq1r16gr1Zz96IXdjehX1D0HI1B5j1iRl4omMhorIkvdz8tC0nB7JK9HVWYEYpFzz5vXHRuGxw1t5ZffPKYjQNqRdNPuggMJbnXG8BG1u0zMyrMsgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991830; c=relaxed/simple;
	bh=HEOh/2zfJtpsxctQhzZwUU9VXOdfk2AHOVDm77USX6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOkh6T3+Y/334AizRGTQ/KFkOB+xw5HMlVhpk6roQzBtOqtogdxyPOzQUrQHlBkygBp7tPycS6aSF2tsXU+Z7wBTvprkk8DJ+lH/ZN7kE4aYrpdBwERpTsLxh5/DqkvlaUllXHTsyXlmEOo/dZxroeBiyLvev/V4UkprUpL+Mfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3dMjwng; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3dMjwng"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so47770555e9.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 14:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991827; x=1775596627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0p+vcDzh9k//T8x4e9/jUT1tl1SO1LruCVo6s74BwBI=;
        b=L3dMjwngg/v28sa/AofwlGTyo/FmRsltmHC7sBZMfvsaCRl8GskQNqPWVTZ8EXsjhE
         Xgk3rZb/oCIYr63afy0XE+MeQQEK8LiFFMOHWLLfDJdn5HX39bQ/yO9msqNI7uGRR3kp
         SR8KGefi3govG7vPNmgRcwmFLoM/DsDX95Ccw3hmMgLnxIqMRQkYz9iKdL4u5lfeOPmU
         yfuBurQDN5eFiZcPkLiWWvKUGGMhN+QmqqPku1oyTnKMbvDslyWhRIIHykM3xzlbb8Kq
         sGsSCzz+2BKhGcTAAUp8dCJmEnk3a283c0NjezTHasAsvWJzAW+pxU0jzQrtEElOC+Z0
         f68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991827; x=1775596627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0p+vcDzh9k//T8x4e9/jUT1tl1SO1LruCVo6s74BwBI=;
        b=X3p6aBnDrUWtV65RBDdE0oqy9G8mdlbbrQcjrQ02eAvFDHleIVmjvMmJVCO2Nhz4uh
         9E8fM8iwzsz8OKgY7aWH6ZCi7H/rd8B2NjXK94gxxr1lIJE0l3ZLzQPtDfUfsiCrE0ki
         TGzF5fFvfyJajSk1fpjOiLC21m/JIegCy1LNW3QJnc0aDB02aPx8b0ReS41va5hg0uns
         j62gT+05v/TVS9WYnQc0B3Rv16DlVdN+qjL4azDsITtvo6QgmlNJXKRWQQCaHGgQKZOU
         3ezhlR3v/WH64q/LrIIpZayvB6oEvp1sRQAooLmUxlzlYz4hIOAgKhvIa3VQicM3SkZW
         I+BQ==
X-Gm-Message-State: AOJu0YxPu7OYNFWHnjkX10Uyk+cNKPgzjs70c1BowMdzBq/bjAi60cfQ
	jC/6u03EsbQOtsaDxmHabiWVPBuvxwOwJwMjx4QFQRZTkVB1qhl8/CmNAWevvh48
X-Gm-Gg: ATEYQzyjCDp24BTN0R9ADw/XLWeVHVCIDwpVZ1/HxOfO1V76y8y0BsVQn/M82U5dosT
	994r4PH229TTO0x5IdN4VIFMlEipyrKUqxhE9GlEV9RexhYh18IlJXiYt7G2nYQDaup84SYk/s8
	eAGkMn8rW5qic7v2jUbLlZHmBiszxAuLnaZpMPsqZZhtamHAH20jscpZSd9dzdQkFWbUNtw6JmG
	t6fkHTm2H1R/c7XvNTA3Y18T+I2ncuN5AgxplRTTwCHA5Q/Q6I7SN8HBbDhYYWfQyyFhT7CNsvA
	eSZQ07cvHWIDY/ImZTl/VBi+hVECn5tvvYlysEWF/wFu2vLBkLmk+DuI7p7PPY+0eeLS0pKUNq2
	l2XWg9h6itAsh3wF4gg6z5k3sXV/ZFphHSptwN4YO9iAdFHlH4PsPdI+ENQm+znmx/k0qib/2xh
	Ekj7tCpjH6L0qVjOUPJSGZCAq+Pp/ij0UegCrF4GO9FUXMwTZAS0/U0bNy
X-Received: by 2002:a05:600c:828f:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-48883562a22mr16825715e9.7.1774991827075;
        Tue, 31 Mar 2026 14:17:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:186c:aad2:ccc1:5aff:fe8f:d494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e81a2cesm66051735e9.8.2026.03.31.14.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 14:17:06 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Alan Cox <alan@linux.intel.com>
Subject: [PATCH v2 1/2] staging: media: atomisp: gate ref and tnr frame config behind ISP enable flags
Date: Tue, 31 Mar 2026 23:16:11 +0200
Message-ID: <20260331211649.421777-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331211649.421777-1-azpijr@gmail.com>
References: <20260331211649.421777-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FIXME comment noted that delay_frames can be NULL for certain
pipeline configurations, without knowing why. The reason is that when a
binary does not enable ref_frame, delay frame allocation is
intentionally skipped to save memory, leaving the pointers NULL by
design.

The ISP feature flags in binary->info->sp.enable accurately reflect
which features are active for a given binary. Using enable.ref_frame and
enable.tnr as the predicate for their respective configuration steps
ensures the configuration path stays in sync with what was actually
built into the pipeline.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 6da151e7a873..abdffff41ae2 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -775,9 +775,13 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	ret = ia_css_fpn_configure(binary,  &binary->in_frame_info);
 	if (ret)
 		return ret;
-	ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
-	if (ret)
-		return ret;
+
+	if (binary->info->sp.enable.ref_frame) {
+		ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
+		if (ret)
+			return ret;
+	}
+
 	ret = ia_css_qplane_configure(pipeline, binary, &binary->in_frame_info);
 	if (ret)
 		return ret;
@@ -807,22 +811,18 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	if (ret)
 		return ret;

-	/*
-	 * FIXME: args->delay_frames can be NULL here
-	 *
-	 * Somehow, the driver at the Intel Atom Yocto tree doesn't seem to
-	 * suffer from the same issue.
-	 *
-	 * Anyway, the function below should now handle a NULL delay_frames
-	 * without crashing, but the pipeline should likely be built without
-	 * adding it at the first place (or there are a hidden bug somewhere)
-	 */
-	ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
-	if (ret)
-		return ret;
-	ret = ia_css_tnr_configure(binary, args->tnr_frames);
-	if (ret)
-		return ret;
+	if (binary->info->sp.enable.ref_frame) {
+		ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
+		if (ret)
+			return ret;
+	}
+
+	if (binary->info->sp.enable.tnr) {
+		ret = ia_css_tnr_configure(binary, args->tnr_frames);
+		if (ret)
+			return ret;
+	}
+
 	return ia_css_bayer_io_config(binary, args);
 }

--
2.53.0

