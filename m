Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA862E5418
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813448; cv=none; b=ie1tmf6hSVDQxkh5n5TB4bm41pdN17KnJFCHs2z06ywotodb31vMtasJKaO5Gb22PuK2EdJvk1i4aAQWJIbccmfMWzQtwqKeoxwN7W3qAR0TdK8X2VB6tcIdiXqW3iK9v29r3FLe0jPb3epBvYCvXvliUY4A6Q2P9EOB/k43mGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813448; c=relaxed/simple;
	bh=unhDWU3j7HXm8tKnMiJwHfKNJbf2ZhuKuePm6ASfLQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qql7iYWUvUH1Wm0NfbaTbn2vwa3xICKOu1YUWxFSmJOs3x1Pkio66x9B7MBE/7Rk8KHMdjJWydmQYSiD3UTCI4Y7zfjIv9Nu56vKOKa0qpPMxw5oHHZR/sfMWQTKhKppVgFtMVZTYAZ0q+4bY3mEkQAqyLRhDqbq4y2BU7jhB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkJZ/JYz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkJZ/JYz"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-579c95a2be2so1261110e87.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813444; x=1759418244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=XkJZ/JYzdYzGLdX7Q+OICoKOg2HXDUxbmkHqO47jrVAQoBdHj0wgNahMHjyFHI6ao7
         qMvPi38wlWFkp2xpNjG6uNczsTXuO1ZXv3Q1mnmnj+RlycyNoeP+kWheBX5kx11L0ixf
         G6DKDbDivyGL/51MT3IWT7o1JrMuPJ5WU9yRngDfUte2IWxmTVknGnIMvlhMsi3w3Q97
         bbMAMUZJlxJc3ffyK+OigGrbqVKtudu66VjUSRyiNLF86pXxWdYluXbtAeyftbGdNkbG
         n+iWwwG3PP2uHZHArKWg7XlqjMA0dbQOXl/lNUUmJk/f0nOw/4Mqw/CwjtU03urlaRmg
         GBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813444; x=1759418244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=oVp9sae9I2hoG5RbmuBvZe0nxyauuChvoZowa9yWC+PmBXzq/c/Lf8B80m1Jv64bIC
         Z+YK38D+ASLK3SYr83TFNLcZFZVcS9VBDWGONW8wPlC6yMTl8hpuSUAuMh2ZSWtYT3JM
         2w8322udcIXV/IwFQoEfh2d0Ys4dj77abjXXHgIjXzc6vkEp7xLMXSBJzJ7XbXKHrmtR
         d1NLDhMfsLRua57CEk7hwZ4EK/x+OJcG+i27CA/e4ihEyanyc9knKIBXOrV9AunF09PK
         RVNxu0UItcFnQgpfJjA4XpWj88YRRTprsHhwuDtbYJ/Wm/fY0Ie4CpSicBzsedJ2p/QR
         Sjgg==
X-Forwarded-Encrypted: i=1; AJvYcCXyRHKIj4IxHYaphCHpdwSXSw/pcZGnQ6ze8JJShMLzGFZKU/ZdtZSV/fUO3vixioGTRwzpsf3H+10gBz+X@lists.linux.dev
X-Gm-Message-State: AOJu0YzAFgUAiVVTJhyOLjH82xZdBZEdykHkkKTHtOO/mFnZ6+hx34FQ
	l9gJKvlxMkeXqbDRgYUDYVaIBxFUb/RF1GHGz1HLtLyT0IoW4u2bQPiy
X-Gm-Gg: ASbGncuWAlQ4hl/b1MW0WjAZzED4CAJ0veP/4d6d/w+W+nW8ON1ufQ6j4BROegh/t9+
	tc9ol3TNm/3fH7Q/ApSouf2JOA4K8hXCmAjrUVJxXIztLU7m3tRgC3u9WdVShkcHkaysbZFWrDn
	rH2v5MedujarKC6/KliFmHz+R4yY6r1dmu+csHIYW/GB77dpNITSPSNaCyVkr+jWPIaZVgtswkc
	qv2zmFSAJYhcmTegJbuOyJVYJiH0PpXNnPbxCCtBQH7FGi4/wOgjGdjMnswVkI6K0CaB1st+3Ir
	8BXsZe0nYZiqMjF0C+xRONjdcsO9zNaeZt2AxDkRcTNxAv5qqWCy0XQJ7WoqYhOdFUvz4hNL7uN
	dXbt212uv5XnMWA==
X-Google-Smtp-Source: AGHT+IGmndnr7Gh0aHTSxGSLl1Clt2mwmPdyke+G1kRc2c45XCUN1RqNAuzwlMAkSvKsRinuBceSbQ==
X-Received: by 2002:a05:6512:684:b0:578:f613:ed9c with SMTP id 2adb3069b0e04-582d39b6b06mr1182270e87.43.1758813443698;
        Thu, 25 Sep 2025 08:17:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 07/22] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Thu, 25 Sep 2025 18:16:33 +0300
Message-ID: <20250925151648.79510-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

