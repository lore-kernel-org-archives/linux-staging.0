Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C06E3F0768
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 18:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154866; cv=none; b=iyBgjfYlEGb2MlHq1BaMKNMFsS5iBct03xMD86tPOdjYhdmi+yqfCTE4UZNYKTIt8oegbpbOiEhwLnx5f6WJWkbBbItzEUjys0uMcgHo4Df6pPSvdd7HdA52mmSNYXx2+fo3u9+fXCscAudn6MW/w5rv2DRlWqBjoYw1gHJaWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154866; c=relaxed/simple;
	bh=wyq5W/u57ccvu5nuOwIucSKyF20x4rNLLNnxHJNFwaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoRC2k4IjaIjdd3mm0vHzEev/aBKiToYwoiZ0dV055zoa4aoUmoh4hgkX0+VzksNzRBGLLJPps2T1v7OJiE0LF32hrt9b3XDJOWifIgIgxwLEZAFM3w7tjcw9Mu6R5Plnm+7whzVuEkCDxW4bACqiu/GEVV5BYOpYFhmxReDxic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esCWs/B/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esCWs/B/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso1069875e9.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154861; x=1775759661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HPdsHvT9b8ErzkI6+gScL5hWU8x38ZFsJYEpzY5RL0=;
        b=esCWs/B/SYNoR9kYaT8MHyxofUQWo6k6TN2HmMK1Ad/TkwLgWfQMI0XLdRuLW4wFCv
         wjNZ8smIL/xFK+ySmJDD1fELBKSvNFIDucYzrphSxDNAPBhnDMA4I3lhCGK0TAOl2b5o
         z2rt6rilUNCw706xcAVnE6u6IUry68FlU90a/epcQe8HYpLALDNJwp6Q/IOQ2vDBkkjf
         tdnD8u8VgqtxqdPvF+/yP5CaXEtWGSuD/bREK4DOrX56HHpd4TKyMc3uXMbeu2VV563u
         21MfELXHJYUuHWxWXINykn9ctm84indKf34vqpIBMptzMJh/8Zozxs4wfJWlIE53ie25
         ILcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154861; x=1775759661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+HPdsHvT9b8ErzkI6+gScL5hWU8x38ZFsJYEpzY5RL0=;
        b=jI3pyt9XJRftCrZuVzdUBr/Yj7M9+633ZVrPeZ47Zs7KGYvbBi2qhYkN+2evUmPXnL
         U+fbzdlyhEAj/i/dQp5zou3gEZ9OixMWeKx0Q77tVhXgILQFsNOYW8Yjg7mRVXgR8hHh
         b2zwGaJfTQcVyjl5JDFgRGU0mQCQJ4MSXlcNBSyFv+YhkpQgn5xKs0l/mHI/kdh5Ahlt
         8ANbU/0jedS3dGczYVLG4S/zZyWwmxM9GNj5b2zRiUGhSuleNVVUAUCVysZ/MqLq5PhU
         p/jgem8tsdl6BRrtfHvxESJhRhDszoLQSV0sFeVhdUFNKmgh/raGXWVtV4gO1pI3AQ5E
         twdA==
X-Gm-Message-State: AOJu0YzsLUcq9grau/uiNeOpQUrnWu4pFGRn2VbC81oO4/mn3Cq9jR2q
	4Lk7mtUofuC+IVFoJB0DDZ7FAHxbGgHaeuyZzKZo/dkZ+jzzxo4WskgIVyVEFA==
X-Gm-Gg: ATEYQzzgXJP05+k/cOFmCXFfOa7rYy4B8HsjkwWUDgyNpC3aTqcEtO1UvCZny0+ozcg
	Yc0RD4biM4DBfjLNIaHa2uc2DsJasCNBgZCJuweogtOB+LE/7fEKskZeXUdSpb91v3cS00kYzW6
	BHd0stcqsMuyIhZxwun3YGaUbI8z3oXKy9KwW5BbM9QUDrzeXUbWmJHCaUKygPPXqxss547KBek
	ye1nvUPWbMZR89Db7f4Yo/xOzYbTrD02TFXfFDCSUsh8nUgk0Hhy8yhDGtcpEfNL/CDS+HEMrvI
	fGuAuo+TDXUXMbFCoYUlSik1l5U8LMORs2BIn+XW9YRqGFYW31NMyyF95gIwTBK9k21F0Fn/lNh
	0R+fb5W1A2DuLvCAWQAzxtzX+fJq1+nGfaJVEnEo0Yhg4v4T/7FOvIRqWjyzuA1Bs/iiRKelU+x
	fDXc55821qAsvbNqX0x2hvi8Axl14ZVLIiOC+KZdboqFeHEjkwfBOd5lk=
X-Received: by 2002:a05:600c:6286:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-488996dfebamr1784015e9.7.1775154860903;
        Thu, 02 Apr 2026 11:34:20 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1cc5:ab9:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm205797825e9.1.2026.04.02.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:34:20 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 1/2] media: atomisp: gate ref and tnr frame config behind ISP enable flags
Date: Thu,  2 Apr 2026 20:33:44 +0200
Message-ID: <20260402183402.444630-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402183402.444630-1-azpijr@gmail.com>
References: <20260402183402.444630-1-azpijr@gmail.com>
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

