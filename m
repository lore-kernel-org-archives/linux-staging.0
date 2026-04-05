Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1D285068
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775381471; cv=none; b=F/xrMSdWt8BT7H++/ZPkqPkZNmXzrJPp1R4Fbj7wHt/THdVXU+9Mb0RSEefwSel4TnVvdCXbqUBl/HasDz7dWnt02DcYJAGMJ9/xt2Jid1MpY+l+eaACmeeY8YC6Y5K+YHgGDVrql2qh8ET/FmIlMUxtjqLNNxe+x0NAWbVjwq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775381471; c=relaxed/simple;
	bh=wyq5W/u57ccvu5nuOwIucSKyF20x4rNLLNnxHJNFwaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGfqp5r++Dw4oy50Nu0wQUPyleHIAb2/RDi4xVLfyObfBNZMEqezGVgY2/Xyibd7us8rjqMBYy143l0s5h9bKqj9+VCpRZUW6GwWswKyqWEXG4gHkZJae4EafwhIMocmKVKvABbB7SYnDHo3Cq+7SaigZglDqKLnyIRIB6Q1w8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX4ZI9EW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX4ZI9EW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so27948215e9.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775381469; x=1775986269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HPdsHvT9b8ErzkI6+gScL5hWU8x38ZFsJYEpzY5RL0=;
        b=UX4ZI9EW1DrVqiShfODAfF4MvrDqIAQH8g+/lRiILw/GHsuSPhjkF0W5ElbM+3g3QR
         H0/5C5gD+AEkemoNjkR46qlFVzh6W3/4m7rrvCgUUBjoKuyM12jszB0xIZxbjQcM7GJN
         72l9Gom4jf6TiJoNcfEMtfbrWHIyPcZU3JlEJClpgZ8QXPp7TTdkjE0n5ZnKJaIU8XjW
         EBHXoaaZ0JYOy8j8bbQ5MEMudQiveyDZhchRmy7CA40jkBMPmborKfXTH/3Vq/iOcsxG
         CTo7osRzS8AKWJOp+TakkTm9IcpX2uQ0HMObMM+ZSfHmGxy/GnM+iCAqTAAcbeI53xn0
         ySHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775381469; x=1775986269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+HPdsHvT9b8ErzkI6+gScL5hWU8x38ZFsJYEpzY5RL0=;
        b=B82t2E79mgz7Blvwo/OSfRRbW9/WKREhhU3leVdJofgl3YoCtU7t+JCL6HuMnFQVMi
         0kf7VmzFxjppOEoxySZff1kGQBbtKE7W5sk5HdUi/bJqUEbWk6G5zmMKcdPRIYVG+Z2f
         4U7zaMNH5ZnvCVzErrfHk+eJDoN80sgRkIAkw3uqGAZyyocoE+brokCVAoNAmfQlqkE4
         74pSX+gXROJ6lyf/21hky/jwa108ID8a0EAChQ07r01Sto/5tCR2xEYWbO1CDqD+bdhz
         xQM04brQaZiumKmmQ4waXPE/NFbtqaALcJoe5n+PUJbRlBtje6uGxjTVIQKyKqSef+VD
         Bmiw==
X-Gm-Message-State: AOJu0YytD+nkuMQ8Hi37jgYAd67slB+MFVq2diuSlJ22id2WCnYsLshn
	zY4DuDk5XJAAyyHi8DnPrcBZqRWrL8CYbXWZaKkhi+qW7NANhrKmT18ODxxQ1A==
X-Gm-Gg: AeBDiet9nIOnFoMZh+Rjx0mbKifEY0csMfMCFLkYzyO/QLXJaHLYNy0wqboUWQIGet9
	NtovS9KYUV0gqoeyc7jelkqI73V8EYj/26B2dqJcYurK4SLBAsefCQRF/9EKkDRpGFt5+MoJmfQ
	/wZMyBLswa+NR/DRN1aSPTrK9NsgUHmtT4pr15PrI3g2dSS69ukPNiwQW7HhAOUIv0hhPjmRWHQ
	neuhywrRfXoDSjbj6QHdI66GIZkgNyL0nVwYMub3Q3QYKwZ2Nd+TcJt8bpVqCiZ8F+JMY3Sw2Qe
	tsBQ6uglOpBWnlXJA9omDEk23G0r48XkyvjEQTQwPV3vMBgdcWyicBpJiNGqiwUTIPimIGPHvUR
	s1i20HeZToV6RmyDjYHUjrvgNpEPvNszaqNKicCri06evJ3zxR5RoVY4v9rJ1mEMEtG0r4YKkRd
	sLLhwWb1Y6XZdI3UrImD+DfvJ47Cikx8luwhbC2czrZaeXcA==
X-Received: by 2002:a05:600c:a4a:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-488997a44e2mr135868585e9.22.1775381468491;
        Sun, 05 Apr 2026 02:31:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1c83:b0bd:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm29156707f8f.29.2026.04.05.02.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:31:08 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 1/2] media: atomisp: gate ref and tnr frame config behind ISP enable flags
Date: Sun,  5 Apr 2026 11:30:43 +0200
Message-ID: <20260405093051.515222-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405093051.515222-1-azpijr@gmail.com>
References: <20260405093051.515222-1-azpijr@gmail.com>
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
built into the pipeline

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
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

