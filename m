Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC753054F6
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813450; cv=none; b=fS9ELzT6fC6r5PZagB1SUmlsFH06AUqycIkhjUIzQE/K8dlQGCr2TfIpn/Oqu5G/mmdZcIw8eylPAnH7zOfj54Fmhk4PSGBoZSbeDcIao3NoE5TL+/mxm55u0a1s2LloOxvOvHfzo9bgNan93L9/R1on/t9+/5Bv2uO98gw3Shw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813450; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oxm9ZbRAXeygMjBuk+YChzk3c0tIw8xtBkoqdwM4QTh9Z5l6e7luzcquWkQpOyOxe817xNawKxA3Q1E74+5JkqazPBLrX7Lpy7nMak6NvrSU2OPXOof5eEYgPFnOR17BOm2KzEbdNn18r0ic0Go6SAsMo6teO6htLj65roiSpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWJ2H3tm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWJ2H3tm"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57afc648b7dso1345930e87.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813446; x=1759418246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=WWJ2H3tmNZaDLAGSVZo7VShw0ZetqBt41/8q389YY8m5Yeve+jMbdKHxU33wZreHvc
         rUBw3kPUwPUyRJ3kTVVQfj0vgcuB0RAJyakbHxMNkp/t+WpKJZGfv+XkiuXvMSJ/rVU7
         Objs6r7IDMkaAmpobDeduHDmWA4MhH1d+w4RsOgolV7yKB/Mty7ZXGIjwb393xY9RFY/
         YBG0r7iMByltvZKsQoYEZ7jJ1NzOUUAiTWf1qxzaaXX2kYTo85wqyITwbe4f2j8oy8FM
         7WIz7SvzSqO+VtCEGk3okOEdU+r931Byq0vCBSFeM3RgrqKAifqogq8h1SFahw3G2UPc
         0thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813446; x=1759418246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=r2a9ya+QHKdTVDtIxuXWvuHqrBxl0K7ivlw86jsbMCRLR9m+8nuzfaLhHhevwOq3VL
         19CPIW7ZfZR7IR3ef5Fni7NnAXoINHIGmhxljwpfwNtvP4ig9vWzxn1JNuUIh6GltaED
         yDV/jrdoJU5mK3HDugMqADQHm4gYVBDgBQv3oLeiw7K1kqSQSsR9yRvMqJiVyJ/J3hNx
         P0A9GFtwHUczJfKjALpil93KqMQwZeWJPQdJesv7YSu/Vl9nLEbw1RYgKoWFftUoYQ3+
         6Wbz81KAZIq5eiF4NTUeiy4BBh6MgRtIDEWT/KO2DrLUCZBZRyzCXlbq87VUnUw0myZN
         OFNw==
X-Forwarded-Encrypted: i=1; AJvYcCV7YYUoQU8lvQ4AVKT199Q3Roj8l82i5THNAcLM1E1v9f0gfl0gLPI39Nxb7OvWng0TnfMj3MmoLz8wPk/V@lists.linux.dev
X-Gm-Message-State: AOJu0YxsM4NUGgK3g+yWYxWqQmgEtG+GXwl6+BlKbtN0miulYGesIf7K
	FBdZGun4Z91BfM3v44nTGTfyWAxjF3yA2ETdpoIpATM8nWgT5bRL1yOX
X-Gm-Gg: ASbGncsmgfI4Ehaf041cRH7uhie7wVob/rysrAa50LL+4yauk1dZYh2FXV+/G97sbwo
	u8brriUK2mIbN3XU1aNdy9I+/yqLiZHUbb2quCZTojW2uXIRrRrZaRMWGoF0brleD+0aEveWU2o
	nxteHDWAQ127NX0+LZRLvJVTyGSaIa7XpAxHBgjnxELiVOdYTQWYnmxLpYfndRDck7vg02F/wfj
	wZvf61KiqNlP4MG7Y7Zopw+eBiD73bjh+gUb5OG6CXqvsig1rELF3ZaqhtFUdOE0gHv23JraJxK
	2JBELhRhdPxwjumDP9sbAirtfnkX11Gujlkh39fAWHH1+Wc/VhDoCbnym8aTAwomI+oAH4bbcU3
	rySM2FAGWI2qzxg==
X-Google-Smtp-Source: AGHT+IE9s8LEs7isC/WkOOjmZSczeI87yN4+QY99sZheQ8v0ntKzIh9SCdVR9v8GQcLfMhBuoMmtIg==
X-Received: by 2002:a05:6512:39d1:b0:55b:842d:5828 with SMTP id 2adb3069b0e04-582d2f2796emr1520385e87.36.1758813445428;
        Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
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
Subject: [PATCH v3 08/22] staging: media: tegra-video: csi: move CSI helpers to header
Date: Thu, 25 Sep 2025 18:16:34 +0300
Message-ID: <20250925151648.79510-9-clamor95@gmail.com>
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

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1

