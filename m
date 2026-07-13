Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86763409115
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944704; cv=none; b=GkgLGvMO0/fUBfESMvpOT4cYLVG+yAQnZtXtRd8qWY0xdakDGIsoC8aNy8F3H4xkuu7CtHwUN5B3K1feHt7bzR+H6fx8SRSakPQf8s69+o6DRHJ/gdwGfiD/P0dTMcJnJc8vCZDLvC9FkwTLsVRjXRXpsh4Yl0GOFAYOsMSqYoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944704; c=relaxed/simple;
	bh=Oo1zBhvF60qelrBXEcyAajK7JtUh598aCvxZV7Ifbmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDV+mToAXf5CPt45rExMrYIKlKPpbeMPmTImI9Donp6qkgalRUh9ohAFQxnh9ftYg+8Jl7dtg0Bx4PjQmlIklNzPWLvC/ALwVJ2TzVwdFxx6BgzsCqzEg9U+bQFuIFD8GMLOL8DImeHscE2Ti2lP9n8vkeebeip+6VoP8dhebww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mR7ZhAqY; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mR7ZhAqY"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2575767b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944703; x=1784549503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrLz/BgMOWZJw3Q53MMnd8sHfRljAQMBGTN2LAcpT4M=;
        b=mR7ZhAqYnyXFISMPNZ1KpytJEn1AL0xCYgK34T/iguAwVjzSwDxjoBjjMnd5KHqywG
         glKt/lWS2MHP2eIeT+np2fHir8DBzyv7ggJMNlWvWenCmKGv4pQshTQZAfm2J6oVKO5s
         IYiYLyhyznvYvT7oWw4VF+qJNTatM5P9vwu0MGDedED1XrvMRDo7CMmEw17n/ZVi5oYF
         2njGL2115OMloY+8UXL3fAPpWS+KyTOzGw6Jgv4mkgRuknlhjshpbABxIzymTChWsQrV
         eVkjVkOgKPOkp4OcUbXPLQXg81v65ibrtje7i0BtTA+BcrLSNudkVhE+6h0fu1Bt90+p
         EooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944703; x=1784549503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrLz/BgMOWZJw3Q53MMnd8sHfRljAQMBGTN2LAcpT4M=;
        b=OpROei500musMHotuAu75rH0AC8aRuXDpv/fOEZcToE6ZVtlzFFXyTIvUEmFe9TwB7
         7td3CVg5KdGnEwky1wKSUbZTe1JfGVac3QrwDk9uCWYNxUL9BtW2g65bK7K7LaZjr/dP
         y0jEHKyw9An76e7oLvU5aaYVRoplscBrtuZahnNGh133yw5Un4gANWCWCLNgQTFEIr29
         btqCXKDQGf/ZwaBswwEdBdpp92DAKv8uYIFDRP13jWQV0vAz2piVthu2trsr8txKkjq4
         1+IH1d6NMy0T9C5Sa11jw79LKDTsRJO2VQ9+v2MESonzX+Jx3ZF+o8KJW5D9+Lbzsh+b
         qA/w==
X-Forwarded-Encrypted: i=1; AHgh+RpdAhiQvDXU2PTN0uQYUb6Q1RiCfeZBJlnKvIRE/8LcyzvagNKhbxYJtpwCAd/oGeX5lPOx/C45uzsqb0Xa@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1uzNPelIVeU0Jex1A8lL6r6Y50TUJ36pRVephC4RJVoeCvGfG
	AcxH5fZa8eATH6GWS8ql0uat9pavkZ5xFF5JHnLcebujUXOTUNJ/3WD3
X-Gm-Gg: AfdE7ckpySSoE00FYGCRoZgnGm6Kjx/X2NLrVbro2mI1ygHps5SD5357Z6pDxjrZiDm
	hkN2Lv4+sIFb2c95bp+1rbGkVa2MjVA/R/nIIMpJIzO/hA7zOIe+ETSjtgBLnbBJZPv4zCDtKEW
	Z6hGXARkIHhNpsmwxAOJYEAJe+5KNBqF0AuAV3EuRqYfbAZq3WwGFK6uacnwpl67YhluNhVdNuU
	DBd5J3oSrMSnd/vMylROiyJ83yOFpCdMlMr2ODBuZs5cOMn8yuzaOFzpy/1vIFkBNVWbScPJ3H5
	9xZ/sODgIXdsPqYlWZUE8RZl/ieeK24rYcpOi6jwkWsFzUtnRrO3hPKUSN9FsVosI3PDsMulLFe
	ZNTcyJDGKhDWDGR1qsx2VzcgnSvTRODjhHtdpRm4dpAH20D6jf5z4tiltnU5gvuJ26aoKaqV7zW
	n8N11KSwPs2A==
X-Received: by 2002:a05:6a20:da1a:b0:3c0:9c18:d5a5 with SMTP id adf61e73a8af0-3c111073a84mr9971121637.66.1783944702870;
        Mon, 13 Jul 2026 05:11:42 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:42 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 16/19] media: meson: vdec: Configure DMA mask and segment size in probe
Date: Mon, 13 Jul 2026 17:37:11 +0530
Message-ID: <20260713120840.17427-17-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdec probe routine does not set explicit DMA constraints, leaving the
driver completely dependent on platform bus default values. This lack of
explicit layout initialization can lead to allocation failures, restricted
address space mappings, or broken contiguous buffer handling on
architectures with restrictive DMA layers.

Address these platform constraints with the following changes during driver
initialization:
1. Enforce a 32-bit coherent DMA allocation window by invoking
   dma_set_mask_and_coherent() with a DMA_BIT_MASK(32) argument.
2. Maximize the contiguous allocation segment boundary constraint to
   UINT_MAX using the vb2_dma_contig_set_max_seg_size() configuration
   helper.

This guarantees that large, contiguous video frame allocation requests
work reliably and explicitly aligns the memory management paths with
standard Linux kernel DMA management paradigms.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index ac86a9c4febff..d33cbebc4453b 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1186,6 +1186,16 @@ static int vdec_probe(struct platform_device *pdev)
 	if (IS_ERR(core->canvas))
 		return PTR_ERR(core->canvas);
 
+	/* Enforce strict 32-bit DMA limit to match hardware capabilities */
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set 32-bit DMA mask\n");
+
+	ret = vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to set DMA max segment size\n");
+
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
 	core->platform = of_id->data;
 
-- 
2.50.1

