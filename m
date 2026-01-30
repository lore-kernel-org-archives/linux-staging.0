Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7750037F113
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777401; cv=none; b=GjFswdk4HJD4MYFxihhpR06K0Ks9GT1iPil9wEO+MwGhGItPJfD/F5GcO4TdF04TH1TC843p3Um6rMhHrpUcuCRIAwrNe0RPYoXLxxZjhDcj6FC4b9ivHz8YrefSNqVInbCScU4W0g3CksAJ8EL8/T231POUqDRyVvyqG74P5LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777401; c=relaxed/simple;
	bh=W/c+p5OzSzMCPsuxSreuM0YQnwu6gX3JEtOSgZZKgMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WlSA9RLv/dnp99+XN2DjUC6nkCpTXqHZZKuYHKLHOc1U8qfDZWpMPKHB9Q2rlF1tWX7cftnoCE1xLJD8BZX0oBn9LnvYv7VIk5Lxh/fqLeL9xxsMDDf6h9XuamhLZTXex2qLMk6zDQxg9fY+7QBpk+uW4ATpIYOXCT6MTGHHBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0FWkffO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0FWkffO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so23432665e9.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777398; x=1770382198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuLhv0mNsbTmk14Cy+1I+agalhgb8cQohYYZvZhzur0=;
        b=H0FWkffOpsuiLVJcUYxEp4oNc7PoOJT235ujP7zXwjY7kFw+TT4+9gsEK4zGYz62Hj
         cF6IlgRdLCYi6FYb2XFRS6+y+VP3pDv3vK77umjL8Fk0B8Qf3ZGK/FozBjtQ4PApmCe6
         GCj0t5lJI+gjjpKANlP1lvGc0RKbktEzMKJ7xP1xUVGYYW3LOCzdF1bW+N5de04ndTRB
         43KqXXbXfE1YhIxrXSViEjXTBl6m/gFdbfb4XKPblF+eIQYWirYeweRftJT+oOdUBt+8
         kKA3SluKyyGw2ALeTu5Luh4GTY5Se1z92vtR67wj183sGvVMaYdxiXmS2v6bc/enjwFW
         HYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777398; x=1770382198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vuLhv0mNsbTmk14Cy+1I+agalhgb8cQohYYZvZhzur0=;
        b=XUsRw0xQLJpT7L90VkrM725Fmjac0iTcqoTwZ5ulNu1AhdsNA+Rlb84V3EIpO6Ws83
         fr4lvYELKF6XfyB8yhzkEP+u175eFe1+8p4R0HmgXeTgVFc7cMVk8rn6zYKV5/SETyqF
         yUZ5PPdYr0k6kD4b9Z1UH0vnrpsPiCx5qWgdL1y1hBg1/ZUSXEQYLJW3KijuIhXwwhvI
         4hcMZ6Kn6W9nbIBpXAz9tW15WiMt8kYW9lAZz+GwSFgkSuWJCMe57oAhauo4KX7Z/OXV
         8D5AEWgOgcPF9W/9unawtOgwcp1oNZV4x0q0cLgvcigLvZSwxTZ0MI5MhTRSOvpHgkl0
         UhBg==
X-Forwarded-Encrypted: i=1; AJvYcCV3QkEe1NdRBnDJa/fQ/bPcqCXN4RFfAmOueJBDjHAEtELM39wCSqXvPNP9SCkd5jmP4pyXilDghT5TIpi/@lists.linux.dev
X-Gm-Message-State: AOJu0YwCyvtyS6yGs1J+o0hZoWNM6q7VBupDpPc0cF/ddwxoLFLW8+lo
	Nc//dJL1+NjGL/W6iz4dngqMta3mbWMyx4LnNAVqV90VBeEHYJbxkWaT
X-Gm-Gg: AZuq6aLcgBxbzfWk8u5u3NuL30lOfcHryfHS/4URwZKE6iEiLgZSNMkLl9l8KIP8TLf
	kCHH5TXNxJBDTS00Jbfa4t1aPCvybLSCfFLp0JQYlQsxhJbHXaScqaXOIWFGOkseqzNr2IXYjX3
	24UcAHhtZzfn1dKoqmlj7NHKvt3lOlP4Q/Iw2jwvwWWDXOUraxLSBAStU2G5+wJ+1r9S8jN3lKk
	u/trnJ2XU1wJf0Qc3wJ4RzZnDJRkEGYSBhWtewH0aVmwQR3pm5uU14Q3zj9yPueP4scmnbyhWo6
	IuYxVSRKcXIUnN4nfyB6fMIVtErfFs6Nv6gob5CuV9Z175YOGNl73TtdInHXudbb/TY2kxk3Cg0
	xd1JIJSvf6DVppWcRZJywZuy08dWdpz43d42CGFq5wPgGmyXlNyAZ7tUtTfiJEC5DeOb8qa6GvS
	kB
X-Received: by 2002:a05:600c:4f48:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-482db013b90mr42921685e9.0.1769777397748;
        Fri, 30 Jan 2026 04:49:57 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:57 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 03/15] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Fri, 30 Jan 2026 14:49:20 +0200
Message-ID: <20260130124932.351328-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 70a84158b589..0f98157a7e91 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -962,6 +962,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -987,11 +988,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.51.0

