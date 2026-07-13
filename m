Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30119403B10
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944736; cv=none; b=I1/QZ9+XBY3SFzQJOdB2vxSXt8sl5K4RmGq+KxrFlHWKSwFldnAmoHp4raPIHnmpc+Atl+gf933nOty0MbUEYA9RGE/HF70ZBY8mBvg9Iou2dDyYJDBspaR3FivLdaIcA0BAHDG3p1+WMPZk0WR1KywfENvZQQbSoRJEUcDMU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944736; c=relaxed/simple;
	bh=UMezn0MtVX4wmhIqEFMG2LHdGGi0DGlWMdQqs9pdrgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SG+AzJwjOLUbuX6d46UqAxoBBY967m0ByjnGni+H7M8EB3aGdju6kCotdufPhPLECj41hMPw7jYUfFXZ+r+wHdzl+fkePZZXE44ZdlRWtS/O+7m74z/U1NZin7+GG0vEkSJXebLQo0XeuZMIjwSrWy8ZgRBEtmjt/foaCzYuxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxiKyLOK; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxiKyLOK"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so1969021a12.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944734; x=1784549534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCvZS+UotNJvFZgti0pR+2qbKuDNmgfw3z2iv69lpMk=;
        b=nxiKyLOKId34qlprc57naPKnn/RfbsACZa5gNIAQmDBOeJlRAA9XPqCRhdzgPrCaxz
         u8P5KBaotsRHRmStJZrxP1vcg/kKWB5Zb7LwWwkbS3M6SLtWdJranJhxcuxjse/EcLKw
         UQN7TCssjAHoQWaO+dSpQTuVhjmy1hO7vnaZl2VwMnoW6o0IH3xcMA3qwmythWs1ef2n
         JvKquMy0olnT26uvMzPaFWvHh9WM2Jx7aZiEbymRoJDVEUi6Jr3/N3lN+TKcqPwaFZb4
         ysdHmkEKk19jicAJvVGSyeLCc1mAS5fccyNQdzIjIMeKKzHkOqpk9DOAYDP8tFVnt7oC
         fuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944734; x=1784549534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCvZS+UotNJvFZgti0pR+2qbKuDNmgfw3z2iv69lpMk=;
        b=cks15x7XFEm15x3nG3w37bPq4lV5f2CMTTx3vQws+7kL14jFNTgWVqa2zs74CGgoPi
         0D+BKgdcJiOeTBiMDcEbFlTzCXZj/tenJ2h2mFkFMVlNalll1ps9SaYLMkc79d/dNnMX
         1oBCfLywJdqJsbVvKpbeu4UYFGfYywGB0DZjmOLp2BeiYkbV0LI/RUJ/tH0fhTHnkATC
         F5ev3BLXAQiRk14L58AKRAZuIjvbsGIWApUAPGvn4wzTTd6oncc3n6zN+20f4i9LlhAF
         gGfhOAMJA4NLGcQaXNR0NKG4wQLp/6M0fl8J7s/GLsJgH6RCYcnYxc78Nbsy0XJxjwwp
         hYvA==
X-Forwarded-Encrypted: i=1; AHgh+Rpa5iZB9ob0dhY+odhSYasCMaLpc/NkVAxedgXY1PTmgwnn6BRltoif66aiGifDUnrUIV/HzGVeeys5yJAj@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5Ka5ajVNdC150hjprsoCsdnjiezAQAS1KOI3c9EZVZ9EqkZZe
	k2JAk4ojtMXpATlzOWKe2j55AQxyuc9u5teGoIAl8+cOhzmu+koTvPOo
X-Gm-Gg: AfdE7cmN6Xfu0aYXqEEtx3HrnXYHBACMgAU1KfS0Z+cS3tv65ORMVZVHXNqQ0SYdpsy
	viCHwL6+Y+eUYmXTI0OoPqZBXRiUWU2eKgi0noPeGM9UAxtUwaln0Yon7xlw3WTz63feSX2cbRW
	1vmG8liaLuEijHxMdEfluFJrIYGYhqmT51tEEhbhDYD470HxeZtmXweoPUvh2ZIqs1AL+ilGEnH
	23LV5XNSYLAooYu3ucfS9Zk24X95OoO/brjCQF1fHwzFEECw1l73HXypWPSuWac2/Q51+Gikbq2
	MIh2SFDnKH27zSDIlFmfIviMK8bHxiOqty0Yr6qoE/utoRymzwdh/J61bQ8HdlwrtnjgDxESTEl
	wpNtyipY152l1C1061xObSYJERaU50wzvDw1eGLDKqjAmlcXVJus3kcuNRlleCHXDEh1F9vwz2c
	4y3mRc4cx7XQ==
X-Received: by 2002:a05:6a21:6817:b0:3bf:80b8:9c8a with SMTP id adf61e73a8af0-3c1102d7cf9mr9542534637.6.1783944734620;
        Mon, 13 Jul 2026 05:12:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:12:13 -0700 (PDT)
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
Subject: [PATCH v7 19/19] gpu: drm: meson: Fix DMA segment size limits and maximize allocation boundaries
Date: Mon, 13 Jul 2026 17:37:14 +0530
Message-ID: <20260713120840.17427-20-linux.amoon@gmail.com>
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

When importing DMABUFs exported by the Amlogic video decoder driver
(meson_vdec) for hardware-accelerated rendering paths, the DMA core
subsystem throws constraint validation warnings. This occurs because the
display controller master device lacks explicit DMA layout configuration,
causing it to fall back to a default 64KB maximum segment size limit.

Address these architectural constraints during the master bind sequence:

1. Initialize and validate a 32-bit coherent DMA allocation window by
   invoking dma_set_mask_and_coherent() with a DMA_BIT_MASK(32) argument.
2. Maximize the contiguous scatter-gather allocation segment boundary
   check constraint to UINT_MAX using the dma_set_max_seg_size() helper.

This guarantees that large video bitstream frame buffers can be imported
and scanned out across sub-driver domains without triggering allocation
warnings or page boundary splits.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d32..899e70bca4ce2 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -202,6 +202,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto free_drm;
+
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		ret = -ENOMEM;
-- 
2.50.1

