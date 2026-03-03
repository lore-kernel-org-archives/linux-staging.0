Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22333388E6E
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527377; cv=none; b=gGDeweqpSq3hAMh32C2+A3QFxlXBA9Y9oARb7IHBLL+QWV1mgxsmd6wR7lxxMMxoPPigEhxOLn6WloTrezKPWttV8ndWpVY2kGrF2JosOAk5kuoo3wx+ONEwUGg8y+29kuOIkU80WTh3S8gQmx31fuw2ZZa8jG97jq0r0TlOZc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527377; c=relaxed/simple;
	bh=UKEDgSoNiWITE5rlNAFBVxpTjkZzbRTCWfb1BLNAxdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EF6aGbv3aI8u3W5Cv6hBacvG9bA/lWBm6AXq61zvFh4NJX2hcQww7c1C74QgWotRUNymINBJixuvVhbI/QV9weFsIHFmuakHdhfUDGKVb1GVDpZntrHTklOIi4agH4pWrwWqrL00TpB6vTMRXNZWli0kekT7Jla1hMX24Tn8rHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSeYa63A; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSeYa63A"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-389fa0d1040so76322171fa.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527374; x=1773132174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tq2yeiELH2O2leNzpOSOy0DgLmB+c4y6g32iEDIZZWE=;
        b=mSeYa63A9Y0xYjhj4oihy/wtNp+0THRvl8kouSFkw8fDVfFX8ahRzb7HPTkEhy/60J
         dA4qAvzxfMzbhY+DUzFdpq09r7bK+iQYVvqwGsa3kUPvHyxPBuAQjuIOY6AvG2mLf7sM
         jB8VGT53iljZX+dO8bp5z0uBuUBik5+QAYAIcjo07/GCkxJpHD7zrJGMFKVDJ3XXVWDG
         uZEdjYEyadONGlMcbXq1R74zgqJ6XoEmY+06Eqeo2EwZBaFM++gvyWW01QFKqawxv7t+
         FZhDgBhixqpJRzZRWnpWfuX2EgfJM+DzZpX63tvM8HQ1qQCsDPUPjaWsBzg5awf+7OnN
         EyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527374; x=1773132174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tq2yeiELH2O2leNzpOSOy0DgLmB+c4y6g32iEDIZZWE=;
        b=FTMFvO97SWZYb+Zq5A+vHrXoGm4gVlzcZ4eDDARVEjYd8Gl2Km+PW8+YMY9LQtcaEg
         5vO1Md8dX0r8LuNaDt/Pk62J4QD1XmHS7pQaujIdwiMsmShtXykWYruGUeTJvKlLXm42
         qmQ9+yPBld9YdIMB9eL60rNxnzHAoZSw3Krc6VrvEv8euQGtzuQDR+ih0LqMBEmXpP6X
         deXwGNn7c1Skozq50fRJEjEmp5s4eg8NGMhTq1cRrOTnuikfYAImHsZYLNWx6W5xiQXj
         f3Cl+toW2bkui/UHHsY3D8zDPBQnXmSx2kg/8Xc7Epw/wAKkrS6TBxv/JfMMhezxK8kj
         IShw==
X-Forwarded-Encrypted: i=1; AJvYcCUHNwqACgS1ujgPNU5j1/0qTnjJdCctOmlnM9RNiMPEI3IqTN9lR8rrHYgt4HPn3ZSv1NQUL/wM0nUJ0rBw@lists.linux.dev
X-Gm-Message-State: AOJu0YzmkRfcxSuc0HaciZdkA7FS/Fu6c3IWU3MnEY4U78J5XcS3PZ1w
	ovOZ7XoiRwfdhfwg5aH3T2RJuM5MqJs22OECfR4FOim1HajnBqgy6kIo
X-Gm-Gg: ATEYQzwwqEq7ZtE/p1jJvn9py0pcdBDqf41cpRJXfhUAu3PKQ/uPhMGGbtR67pWxrPs
	HwJBGXM+k3pPpXUpGIP+kNnJjWowd+eAiSlm/Ai6QoD0wcu0uEi81E3fCFu3VxIJ6okcmcv1yjr
	3kssyb7LYUMFXvhb4+d9RMDy8X+qBXBOzO/PeUVsMhC75AdD4bBaHg38TaqXd1o+I5waAdCEzAU
	4S8mRVhINtbTJjHA1LoRZvwdnyb4/5g9mMcPtQ7AR7anR09JdDNUHTyEuMZHh3td7Xh/CMbT/MO
	WRMhgejLXrELcOchwGMWTvaHMUxkKP6uL/f8oFcg3T8cZt4eLD2PYrAuS4MRIzVIiPcaJFQdwPm
	1qmfPe6j9LlHW457A2Mo0xQ9TOtGBsLj/x2MSiDR8uPRKM6S4Il+qCHiNoCpLlxXLcnATNZD61l
	gCGtgIUII4PV8c
X-Received: by 2002:a05:651c:2120:b0:383:26ac:4fd8 with SMTP id 38308e7fff4ca-389ff07fd9amr102630141fa.0.1772527374144;
        Tue, 03 Mar 2026 00:42:54 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:53 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
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
Subject: [PATCH v7 03/15] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Tue,  3 Mar 2026 10:42:26 +0200
Message-ID: <20260303084239.15007-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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
index e0961bc0a017..19eebfdae221 100644
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

