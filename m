Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF10839A048
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134307; cv=none; b=NLI3NgsHzDlbMDGora469ivdQ4XEnmKhQeZ2ryJBIofNnlzyOXmCqghGK5Q5Fhz+zWVPcqTCjEQF6UWldKeo2dIf3R01ievpgJVfVEXDRe7tABX0eOsj1FTEDnnnRoV9dFYJUzTgdUmV3WvMOyAc+6+w/EzSitHcOyls9HygvpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134307; c=relaxed/simple;
	bh=g7WNCB9Rt/1OuSYvuRDcXaghERK+Kgq7rXBJpRUKNDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFDppGLspnBeQVjVbQC+kQodqN64oDgZ7D3Dfw1v68orUo73jFNGqoQaoIK4CXgI4WrfZadpn5ovbUjgngXDhIrU24v5ByBUPzwrFwzhUKQ4xkJzmUFzI4vFjMZSJmRYi0rktQp5cUtmn+OozkSu1IY71FatQIxY2BxIckqLf4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pWQ6puM2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWQ6puM2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba4a1a0325so98840275ad.0
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 02:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134306; x=1780739106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsfY8GRrXZdSk9lyMdgzW2ibIF3DXFt06J5TGlB1HVc=;
        b=pWQ6puM21dQZY24LF7IGyJC2tcdunZUrjZKv8rLDwnUlZNPz17dI2P1QIz8qTcYeWT
         YqW97dho4ZUreoIeiQv9mHgcLZ3B9J7qR5dX/eCWHSgrW/oPi6yvHQa1vwQVCgIyQkA6
         pE72ESxg+XsN54oDqbqSwSvRLRH1ZzfXM6Q1j1Cop9ST37rVXxHVOtK8PQ9SRnNghOs4
         +Ecjds+iBIIzXnHrfbtJmcSeCELqirjeVr8EgIgIfLAxJ7H5Wj1DP6jVcgAO0j++0lvR
         30A5pwWJJNJ8nWJt+1CtgAEo2qlF11xL8P2hhDR2o6hUj+QKpg508dtJX/SDyCx6EjUl
         NoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134306; x=1780739106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsfY8GRrXZdSk9lyMdgzW2ibIF3DXFt06J5TGlB1HVc=;
        b=chkmlqEXZttwllvg1FHRIddyvnPVcLPyFKMamvRDkrPZIT51wK7bpi6+vXfrwu8+Kp
         E2wSavgYx6QkCdweG+L2lMbs7sIEcPmkdt75HXEpXRrdLIOPyq1JG+cIhgA8/3wnlhBP
         L+YBtnDbL7UPqgAQkU6/akBZpDKlMcX01xGA4W5NrmUP3k8bE9PcPX02b0z6kN1JniQw
         2hkjOC8otnI1xWemUhHZgaZVqZCw1O6LH8bnigLeXDXzNhpnpv1WbO8BjUuVJNAxIz3A
         Eg7L7NpyZKlNLDaVCxl+CXPtcj1RjGWa78Zer8nJGrtDH6Y1YU007NILtIs8BStnav7C
         M/3g==
X-Forwarded-Encrypted: i=1; AFNElJ+vpv2fSWXJP7Ck4dOUPQEXrMnYBkuecAtlzm/mbluP1NYXklAbOuAmurnrNbFDpL56e3Rix4pKxfgEI4yT@lists.linux.dev
X-Gm-Message-State: AOJu0YwKBhBA7ALNT+q3/+Fu7VzWGp5J5gelNFv1XNs2oA7qPVNg/aoB
	yZ0HaaXGtUhLg1xiKXHb+AZI9gIcarrlcWjZwm7ZDw4EjtYxuBz89Nf1
X-Gm-Gg: Acq92OE3QhtjtDWkfhW8QUwWKUOtAADIx9LkJ6nDN+FnakoyCY592mNXzGPXLXHECll
	stJ5/ZSAA+hmgYm0M7iQCgSWQLrwB23aw1kWS1l8zwCcPaOQO1tfJTK+0Zb1NOjKjXyqu1KqAXo
	FnYZovEseCYGvOiGed+3eKjo1l1AhU8eKAgNmzvORnnHF8gvInsv40bjjT7W6c9V8Booq3kJhns
	IOZbUUjmoiC36Koo50bPVBoblXilNy5nZrtqRGqIVEcpc/JVD6TakF/my4IJD17QkU+eRiu+yVE
	rVRwYDWKAIh/8ZqpaSMTbDAKXBOmRE1RaXg0F6iEzMQuejh0qkyeZ7MGJuB9FcsO1+n0yE+NEqD
	ZUnMdDlHCXBTrOaOtXYViV4uAwue67MAWgcOtHepBK2uS8/6Uh4SSdhxZX7jlNhtPvtv3qzEOYO
	IDxzVEsL5L+JSqfH/oIMhF9ZZnq+FJDfMq+Obrv1BYfA==
X-Received: by 2002:a17:903:32cc:b0:2bf:23ad:8598 with SMTP id d9443c01a7336-2bf3679336dmr37430715ad.5.1780134306001;
        Sat, 30 May 2026 02:45:06 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:05 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 6/8] media: meson: vdec: Configure DMA mask and segment size in probe
Date: Sat, 30 May 2026 15:12:52 +0530
Message-ID: <20260530094326.11892-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdec probe routine did not set explicit DMA constraints,
leaving the driver dependent on platform defaults. This could
cause allocation failures or fragmented buffer handling on
systems with stricter DMA limits.

Fix this by:
- Setting a 64 bit coherent DMA mask with
  dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)).
- Configuring the maximum contiguous segment size to UINT_MAX
  via vb2_dma_contig_set_max_seg_size().

This aligns the driver with common DMA setup practices and guarantees
large buffer allocations work reliably across platforms.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4884ee04b352..f99335effe17 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1064,6 +1064,15 @@ static int vdec_probe(struct platform_device *pdev)
 	if (IS_ERR(core->canvas))
 		return PTR_ERR(core->canvas);
 
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set DMA mask\n");
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

