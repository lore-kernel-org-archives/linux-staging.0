Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4020639EB73
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134329; cv=none; b=ukljiS6qR8YUxmjCFioT2zUZH2rwPpczg2/ZSJSNURHEBXjSwAyfBjer6EAUoUC09/xGkYXDuZ26CrajawD/8hNMW4IjUoWtZMqmvpVv3EPhwoSbloxrXKHW9spcxF5ZVGQ2ZzywXBoIuCoUPG6P2y74nuuh+W6sOnbyM374kr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134329; c=relaxed/simple;
	bh=LyUfGFZW+p2oW5KkXZ5y3kByeO4P0yiGXlBBXARqQcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LV77GzB9WqYA9iwOp81zy1DcMBoVhGW1e1e85fJLFHRtEnMg2LgyynPIvIC5ppelqa3MrUDMJyeaGt1+/oLfdMWWVt1XU8Uc+RIZOAT0AvQzll2WCSczuDyubLNFAwDr/K8qb/J4Sr3X5YGHcgGVW0dGeeXOdz42VvFlfPpsnUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJFmNcit; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJFmNcit"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf1cda2b17so12737745ad.1
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134326; x=1780739126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVc/26APRiTPbdxNs/jo+GGLcrXaHHIyPQYjeJMMqc0=;
        b=MJFmNcitHVrOTbK6pViIqiw/KNgrmnXIUBO/iXp2v7nAUCl2PnUtdFwM10tlwx80Uc
         K4kJOlg+0lCPGo2YQRAETqCLlxRV1sc9X35xaoshGe8y84kV/AO1UAfEnqgUCJWvM/IS
         o/B5v3htl+mOHPWvsQu7ZJhOkEgPuxCpnfV8ltIatUBsjseIsNp0ssdmSTQA455thaMO
         bmwpa5xhvThEmd95yruvzfkigftRgQCr4HIwf+BeLOsh8L0iwBVM1bm5wvNJGXDJR5Yl
         09r4YbgCMmEzPH0r/C7YNeiPytwaxM1naA4OcSKQqshQJUPtzndoPAaLzZjkseQM4a76
         vSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134326; x=1780739126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVc/26APRiTPbdxNs/jo+GGLcrXaHHIyPQYjeJMMqc0=;
        b=nAHTO4Ogwxmkgl21KCYl8OoPjrx4KkIcRFT8gurJ7B5XDRMDDLccWCTUrEyy+z/cxB
         vKqgHk3ZMtuz+M0MoMLcXXsz7dNO/sJdKA0b3nx79AnynXWEnSlRV8Gb3tIki2hKRqZA
         Rg+w6XMAXbHwESUNwMoWOae4EJw+y/AVTT1kK9YD3/AjDHjjS8qmKS7cLE/TE82jPEaH
         o5NCv7IEZ9Zz10c+APsgS/t+q7WSbGEeleBXW760fBBA79oaWK2bFXzD3aykZ7sOYkmu
         4FneBAhj52y7KT//XaoFzht5AHSNAOko51/Nwea0aso6tY18i08rdMZm4tCQgnPqjfut
         P9zA==
X-Forwarded-Encrypted: i=1; AFNElJ8OTgP7m58OI2N2m6CujEw0Cr1XNId30c8zCEuJVP86Ycz6mzcdseUp7LWzzJiIg1m3vKcXf+kdRM+khb1A@lists.linux.dev
X-Gm-Message-State: AOJu0YwQW25dWSSWAaK4IUtr1XE1oOu+Jrb9ii2DgWA4pc0vVCAm0czW
	W2xTapjw/LkSQ/D+S4VM8a+4Jw9LXghB6XrsX8spRsCxjqxfOa28sXxh
X-Gm-Gg: Acq92OHMfzqUdT8KRt3TslvuloOvsY5fDSy1RVxMSoTU+LtvJRhf1WHCQxOwjSfz3ux
	10NPJ+66x0JqGsJJ27tQ97FsuhhrdWXA8c5ycc7nIhT02CfvOYvmC2iHjPy8w1A8xK/GAFb4veR
	FiiHpYAlODZIbPdhihP3hRI66P2TURQIYWysRc9cJlF9xTLYnSGg8aHSW833B2i8V1sQhp03WNF
	Wyi7ha02a4ayH84KOZizPOhsRA6ihGY+LxpNaeEyq+FSURN+9Ct+RqRJoH1dJWPVjds6sGZ2DP7
	gh5FuhXasaCtvPRHGGDu9VB/w+l/Q/QfdRiaYDRGn8my5v5imf1s2xPmmBSm/PgWTaMhH0o3avC
	Lv7F1xuuARzVyCG7KLBdswnHJY90SDCevlGOyUaLjX4XnhoRIe1AZ9E4KZCQQZZTJRA1fMH+rpf
	ek47OyYbdThpNBgQqDEqtH4qS+XDJuetQ=
X-Received: by 2002:a17:902:c402:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2bf2048b983mr72327425ad.8.1780134326539;
        Sat, 30 May 2026 02:45:26 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:25 -0700 (PDT)
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
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v6 8/8] gpu: drm: meson: Fix DMA max segment size for DMABUF imports
Date: Sat, 30 May 2026 15:12:54 +0530
Message-ID: <20260530094326.11892-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When using hardware-accelerated video decoding via v4l2m2m-copy with mpv or
similar players, the video decoder driver (`meson_vdec`) exports contiguous
memory allocations as DMABUFs. When these buffers are subsequently imported
by the display controller driver (`meson-drm`) for rendering via the GPU or
compositor, the DMA API throws constraint validation warnings.

- Call dma_set_max_seg_size(dev, UINT_MAX) to allow large
  scatter‑gather segments.
- Ensures the DRM core and canvas allocations can handle
  full sized buffers without hitting DMA‑API warnings.

This aligns the driver with common DMA setup practices and
avoids failures on platforms with strict segment limits.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d3..8570add8b831 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -247,6 +247,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto free_drm;
 	}
 
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
 	if (ret)
 		goto free_drm;
-- 
2.50.1

