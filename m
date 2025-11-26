Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54C3315D3E
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764139981; cv=none; b=tqDgOEBo7nYQ5ggKXiBVujoBssq/WwwFuffbivQmEyMudGoHKMSGUNytiiCGDEli/wxKjmOMyitedRq+2nNQjEM54uyxB+AY/TQ8jySAkq4cXq9c7aZXnDrWNgTzpbmR2NDGZKK0rWPTOnFkg6BS9PWU3PHhJH2zGBrT+OLGjfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764139981; c=relaxed/simple;
	bh=BK+tZ9pD5eAAc9qRGUcd0m51Raok99lisnLY6sDj8Js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YvQGs3ghN+QYHropqvP5j324l9jSTVraf4pfsRB5WIKD0CMKVPZ3H47wJjyIOBWBExl4msuOIOrQeXiw8oy2K9rFm5TAm5kWVinN3x9djP2sbY0KZn23VPpYigPlHba0e5GV5lVxY2y2Du7czGS2gAbCWpoAe1VKUUVfPGs9RNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpPhPdKZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpPhPdKZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso7867486b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 22:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764139979; x=1764744779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HgOIexVeDfDtUYQCupJMpajtM+/Y7OYtN4nw8vkU+0g=;
        b=jpPhPdKZLpgccRnWb0jeBl7BJG+OU2cX2KXE/8xj19NATjiYceMf0pIgvSJio1y2ii
         F9D01hhsdsuJ3zpKp3mPRzGprEgDwN9FECfqNhOYpRuGWdQKX19Ni/85GeIFwn95EAXb
         jo9T1WRP76tt8tGm+t91RFoWDGlFhMNSFhFJL9t4EeswcGv/Rgn2LSc6YOP7MXK3Sf3s
         VZx3t0+ax3JUaoj/J7jYGr21NNrYuBcL18Gi/MyeRN2B5GakH+QTpJrZn0i8ktGrU4cA
         yZu2Jl072A0yN+FH12MyYQAIR0hql0KJQQkr+iyVK/RhN5REcoHliRTX5DSERlAWhX8d
         1sZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764139979; x=1764744779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgOIexVeDfDtUYQCupJMpajtM+/Y7OYtN4nw8vkU+0g=;
        b=YTdkkuZigVasHIDYV4dKyJyYpUhQiRydvpbp+JLAKmj9F4Q2UA91x1vEtOTUmEukgN
         UFAvVFUfp1CSX4bbgFbez0Lfz8LwK5qn6YPkevbbp2/ov7e25UQxW+F2Nx02yOchhEI+
         haVORCq8iZuiDjZp3DGW/R2Lh34J5HKhQNjZqeMOQx8UpGvrCF/vCa9WA3rbjsAqpAzz
         dtRE1nz2uX34KpNZRJiMAzsJUD2lJvtx6pPrS7FF2DN+01GZFX8MHZuExLgNoQonRkF6
         5+2+XsWXKGGKAJc1uzpRoIt3u7lrmUjRCO6otWOZee1jzeTmIcq4x5xJIv0395zpyLIQ
         PmSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzm2UQRT74011kuYRyz7aNgSFmS4mBwBU/dRgPY0f8Kdf2vgBBGBKx3y6pMKseGr7K1X2ew25FGKtkwbfK@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw1O/GxWTIqxeY946t2DNlo6SjRJ7itADA9ot0BnCfKWTnE/9R
	PX2GI4EX54XqeNaEomBwu2mYGCbpOh9dTMuLHouCfgkE1gkoohLDlzzY
X-Gm-Gg: ASbGncunMysEScnErLHWmOKW4qXiN4YDROvtdstYeomDKKbTZ0k+Tt8aqU4dzuigVPu
	G1f5Vj9oMwcDTe06DFjr/wcjeNSo3r/jXM0sXYc1o/+1Hma8uE97MYBxbMZCb+4PFLy4j3pr/9N
	+nv1YrmqI4FrrIIQ9lLN4/2RUJyXb+tqdz/esa6Yh76+Fstk9oVKgxx+6xOgexo0dCJz3/4mvsT
	9+OpCabTIU7qoBiEPeRlkPdJba5w9rSgX+AoGrQuSQ+drgpG7wtj9UHuDmfO2L0FeoZPyiB93EL
	3LpWOYHlkxBGdXg7TQiyGU8yH0ksQcXNMzGLBNYl/HzDfed6kWXlhkw1xYfZaj3/U+YeIBPeU8e
	IIXA5aqkCx6puP3rT2zYu9ily9UPYANLT88BO/zN+GmdhnLVaQmKnJGb8pwEXItGnOknxAKXqlF
	bMyDazQQ5gijdBtqxW2LaiQCgSVZDRAtgelKX6
X-Google-Smtp-Source: AGHT+IEE4CTbu1c5peHPM99zicrUlC0JsRXRgiT1+i7EQCCIG5zPCF+CYZG2Zt6NXjE83or4Omrl3A==
X-Received: by 2002:a05:6a00:92a2:b0:7b8:e02d:d5b1 with SMTP id d2e1a72fcca58-7c58e609950mr19280180b3a.16.1764139978740;
        Tue, 25 Nov 2025 22:52:58 -0800 (PST)
Received: from LAPTOP-6H9JJHSF.mshome.net ([61.1.189.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174c9dasm20077037b3a.65.2025.11.25.22.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 22:52:58 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: thierry.reding@gmail.com
Cc: jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH v1] media: tegra: vi: replace devm_kzalloc with kzalloc in probe
Date: Wed, 26 Nov 2025 06:52:42 +0000
Message-ID: <20251126065242.12186-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace devm_kzalloc() (line 1881) with kzalloc() in tegra_vi_probe()
since memory must be freed manually in error paths. Freed via kfree() in
rpm_disable, as recommended in the file comment (line 1204).

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157..73127ea6ee49 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1878,7 +1878,7 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	struct tegra_vi *vi;
 	int ret;
 
-	vi = devm_kzalloc(&pdev->dev, sizeof(*vi), GFP_KERNEL);
+	vi = kzalloc(sizeof(*vi), GFP_KERNEL);
 	if (!vi)
 		return -ENOMEM;
 
@@ -1941,6 +1941,7 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	if (vi->ops->vi_enable)
 		vi->ops->vi_enable(vi, false);
 	pm_runtime_disable(&pdev->dev);
+	kfree(vi);
 	return ret;
 }
 
-- 
2.43.0

