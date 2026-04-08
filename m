Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A66C3B4EA8
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 11:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775647703; cv=none; b=Zow0psc4/2pK/UaIJ284Fwf3XcHTrR0f6fWzAMkrbPFpLy9ePFhHILNRLTfjjOqwn2mCQnw4/7roXAAd0P1DS210In5Ytmgx1D7CoCk3j4pTbHVfPXV1v9zNpAC6iYxOWFEV/+r9OxXlTAwwwGRxnedu/+2nsU60IZiBEu/ErNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775647703; c=relaxed/simple;
	bh=0F44SAnebl+8gDmCL1eC0MPRr12pzPk07RWa11swu+E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FNkn5b78CZFBzbv8ji2lFnWzSFmoh2vywUatZciqY0z00QSBi0WnwhY88NY+IXolFhjElFF3l3TyXS5m6owhzft2X7+3HaxtXRv2CFDkAWongOc5dzHnU/Wg22fVMYoUFq7a3vX6ffKd5VccEJ7yJDOACWrKnTi/awoBeRh4Nyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZIWLAeM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZIWLAeM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488afb0427eso35662995e9.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 04:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775647700; x=1776252500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLFWH+izSAtpskZPsHkGI7pPafV8We6hSzH9Fp0U3iI=;
        b=ZZIWLAeMMHkjYAAJovH1nPLfSIO5Py2b+6hH4DwQ40VTfxmPxdn4A/Dd0qWm2QvwKb
         Z0cDlYqjWwmq/nBF7f+9tkrn0ju6+Sx0EzdjpN5ldwqBJC5GXdO0vShRFeLbOFbM9v4L
         0r1McXF7C+xnxfZsEW9Y/NYbKmbA13YugDXZwELEckUxpCbm0OaC6v28mdzeIZUkrlKD
         L5FeF3vUTBPMgJOsxdvK0DSnn/R0gi0376CtiIbg0AWBM10uFi5DyPrEhgs9k3upggm6
         DWDr6UUDwn8h6nhOMcFrEAUWj0vWRXAuWBkzhZpR4y5Q1x4C4SrVELHuaZxj11xiihM2
         QDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775647700; x=1776252500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLFWH+izSAtpskZPsHkGI7pPafV8We6hSzH9Fp0U3iI=;
        b=UOGS2Ebzan3Bx0zgxc/eEWwPInLeOH7gKS0etQoHCKOD4Mns+swiuzvsUSkNeDByIl
         otdtjRXHhEyrJnV3RAwwu4aJM4uPnitEFBYB7nmP7vTeCQWDIvnh5c9ri6ZZPsPmaNbR
         8XMnpSUY6V/ZzafApoMG7M0P0skLaNRilFE9SRCZO3TZvgJWEAm9NZT14ItTlz2DQDB8
         3UPSG6UTXldSjcGHW6NKXoHn5LZlFzPVe0nWDFeaRVfsST94duUudR/Mx25wN0wJqb/Z
         azFNLGjUMkfAD+cDPaAYPQo5yXY3w2YA/eyNk8sCcULdvI3afAGPc3BOrcSdgvSMpv3b
         jV/A==
X-Forwarded-Encrypted: i=1; AJvYcCVdYUxjphcpDF+yvKxftz6DtwJEJout5EZ+/6OVX8/YNlBF/z14cnQznB6Gb7Oi2o0kmRRaJrBP2fN55e/k@lists.linux.dev
X-Gm-Message-State: AOJu0Yx64zH8pmJJgNpTZ14FlklWlRECo9gmTlu+HhoYUZ1h8SBdTdIH
	frh9bHEfXW+TCMs+WVmGvLJZttzHz3/IGwSg/KHcNfTwHfvLUMHk5yKNvkO8dgfc+kaD7Q==
X-Gm-Gg: AeBDieuXpDGpBZ+2b1wMsv8XPiBkJ/xvTiyw9u54DMFnq4qwY8q5tlgmxmtq/FHagfy
	0B/hHPJsYhaWTcDXFoFORX8dlXTdOONpKZntPYqTmD1llmaks8+NobWhmFO20WgP9tmTqKGHVe5
	mqkKPnz6oOihT1PM+faT+19Q9+PRDjm2gECLN+79q8RYjYsJG9U2WWVOJ1VYoRUv2v3IeMgadLX
	kz/qhdlJ6lIEyITReIk5E1YB5FsJE3kCdiRfY5AIn7UXYZriV4sBUQn+6TDpA/T+ffSFq3E7B2j
	MPgtbwGpraUYuPEVUU7gRR3DmDGDS9lAH0amRQGEAnXMD9YCbOdttlcYQxAEWwZY7b088eGWgYz
	5f0Bq1bApSiG9rejEb2uH+mIXTzy69dhmshiYrq8rg0R3LPXGKjgaXoJYHzCjbpYutUz+9nsfh5
	3/P2H6L6ZYOOKoINmNoMhK7IdR2BOLBjBc/SvilA8JMpWsgupVpgmX3efTcxwxFhM=
X-Received: by 2002:a05:600c:2d91:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-488a2aca406mr127841495e9.3.1775647700406;
        Wed, 08 Apr 2026 04:28:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:d997:3078:a4d3:4f51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889f6843dfsm424444185e9.12.2026.04.08.04.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:28:19 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Gromm <christian.gromm@microchip.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: most: video: replace BUG_ON() with pr_warn() in comp_exit()
Date: Wed,  8 Apr 2026 12:28:18 +0100
Message-Id: <20260408112818.95174-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace BUG_ON(!list_empty(&video_devices)) with an explicit check
and pr_warn() in the module exit function.

BUG_ON() is deprecated as it crashes the entire kernel on assertion
failure (see Documentation/process/deprecated.rst). WARN_ON() is
also inappropriate here since it crashes the system when
panic-on-warn is enabled. Use pr_warn() to log the unexpected
condition without any risk of crashing.

This is the last remaining BUG_ON() in the staging/most subsystem,
following the dim2 series that replaced five BUG_ON() calls.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
Changes since v1:
- Use pr_warn() instead of WARN_ON() to avoid crash with panic-on-warn
  (Greg Kroah-Hartman)

 drivers/staging/most/video/video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8ccccf..c5425c207552 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -577,7 +577,8 @@ static void __exit comp_exit(void)
 
 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
+	if (!list_empty(&video_devices))
+		pr_warn("video_devices list not empty on exit\n");
 }
 
 module_init(comp_init);
-- 
2.33.0

