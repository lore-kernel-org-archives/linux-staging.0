Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531D52F90F0
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166857; cv=none; b=HzJve7G0dEbpXv9OPenbwtqZiiA04cQdip6ixs1nB9uioRYxMESHUXdWwrP5mAGAPcB0KQICpyt0M/975VrnuMZmBgs70wUbIgaiyW+KzQ2VcA5L/lUqlQLjKAzTXN707HsrNYJU4AT/bCUVxjs+2yxzCkE4wf09CLkdScmjZ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166857; c=relaxed/simple;
	bh=83trvudS29OzdJHAxuOmZvr+OlnRGtgmEdTMi7zJdY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5hpo7siuf3jO8ZhQBzc9/XWi+WwIeswv34eGY2Uzk+SXxZpTWH6FHOAT2sKevt4bNyyxE7dksQlzkSPa7SWRhO1Qf2PHL41W1MmfY4udLoi4NynbgpMghleVpV6Zvjw8CYoAXoHkYqEM4m95gmI19rMH4yqD6wYI3igmDw/K8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmcQFqMH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmcQFqMH"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5608d792558so3492144e87.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166853; x=1757771653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srN5K9aEte+IHJ7do+e8te0vwtoLo2YE64UbrpcA8GY=;
        b=kmcQFqMH7T3iuX4DrU4j8yOitm3qGvtq2WMFRFXowbAGRikJAik+wYyrcfTyQjeKq+
         6jUcR39mR+GUB6ZYjtR5lBn9Uq73EnmBWxrrNSrMHsVlSxUNbdzOnkgCBZtL4JTyGBfo
         xMKA5HVFLdXjvrpOX3T1UdekkGwbH8gCF/kdXmY8EyLkLbHGI/QtsiEkGUF3HMCqz5+0
         /f32hJLFCZoyVJi4WXmdHcVvLnOzOt6x1iGQjZXLcs3tWKkp3aOYdPe8z6HFNA1/pjDe
         L4IOtRSIrP3J1VAKPmgrXONZoJm5s7IoXUeneSOvWxxAamMw1MCkcLVQ5Xa/KYnrqWNq
         BhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166853; x=1757771653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srN5K9aEte+IHJ7do+e8te0vwtoLo2YE64UbrpcA8GY=;
        b=bDD6BAmpmMv14jDrdT7tl2bFsBiRpkqcqIwsJn4bXPjMG1rt9TPyA14S7VUjvWMlkl
         N2oK0Y9PK8jx/NyVFiXKmMNEjzROpcJmkf21nM9jt/8YkqzA4tpe7zr/5VORn3UX5ag6
         W+ha/A+DaJIWOx88wYMZ22yPaIHKnh3avbvZK1B8/SLCfBGrqr9JwHVo8N9kw7TyFYwb
         gDDR1qLXqMFasVVLeWg31avA4Hagd4dis3VlvvFKJpOsMiNjla39vHToakIAto1Dz3so
         jJ6SVw1IdXrMuFJ4EgQw+04tYbe2FkrXZBDu3SkMxMs6c5r0mARADmDycYuOM9nuhcnY
         Q/dA==
X-Forwarded-Encrypted: i=1; AJvYcCUZG3K5AJOb5j1Os6m9hOsjgRFc3CQjQ2GL7BX8CUchuMpYht/EDf5OeFYzlKdVewaPZQ+3XRbIC9Ux/Byv@lists.linux.dev
X-Gm-Message-State: AOJu0YyxzHTfXBMN8S8WLF92oOtrfqqHHlw7xmL3xB0YrcntlShIuPOS
	81w74ytBl4/d/I7Zj447NZtLfZt7F9KLpXpAwFDZo2i0vRDm89W921pn
X-Gm-Gg: ASbGncusZIAFV8byXx77ZqPdZXTfbWZAuvfhZXmd8W/tmr4BaxLyb4Elc/QaeZ3KxeT
	oEV+ukNE74WhSfw/7ZIxhJ7FVxBOnxu2ZiM1mSMdPOTkeW3k64MD4kntwaZUIVJ82ZRarMOwhVd
	pXqDh0lNltAdaAu2yuNJICmTjpZdv09InUo424oHXDCIqmEPVqxpIp8YPuxQQ1qvqC5oJO7DyXs
	THa1V+1sAAWl8++QilbRgheJHYoyMfYHjWTIc8RClY/SHiMgLCaVZOUFLaJkYMO+xurmzeBzmEo
	PkQelDCJrSI5sJY3J0+qVHwNhJuNfvKJE0VFpTRK9hkqpHPHVFwEh8sIyV8zBnHfuThZYnL/G9E
	LH8z4+lkTX5xBpN8JyH1RKjZ4
X-Google-Smtp-Source: AGHT+IGCt2eHiwI1aZznp5qV4unVuJPYb6+RIXeJ7Ssqv7sSVpNp64yWTQMgPLJorRM1xtlStCmyhw==
X-Received: by 2002:a05:6512:39d6:b0:55f:391b:54df with SMTP id 2adb3069b0e04-562618e1854mr654591e87.47.1757166853171;
        Sat, 06 Sep 2025 06:54:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 07/23] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Sat,  6 Sep 2025 16:53:28 +0300
Message-ID: <20250906135345.241229-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add HFLIP and VFLIP from SoC only if camera sensor does not provide those
controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
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
2.48.1

