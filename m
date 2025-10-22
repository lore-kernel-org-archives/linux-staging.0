Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F00734D4E9
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142903; cv=none; b=HhAl0VJ5cE+unp/+oqJI6/RNEwLx0ThzpK0QC4KitbGTrPH4QyitkIsRW9oivbTucz7qLezj+oeRvFDEhfsbOLQez3+hhaqD/d31n6AcDATwK+EjyT902p9uUc+KvXBnztFNU0YVE6aDAd2lIPUsy6RuImY4fL7nf+cRC3B2aPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142903; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHOj34PKAkA9V7SmcISrH/4lQGK2d76mbd2CiMT+hVpwN1J41CyqQdjpncivlrBsi0ZX8Bpbzh558anlZnAon+c5VWs/p7ekpnNKLuImDDl6hA5DVr/Y33CprI//3yxyRVpHPMC/ySPD+aJCmPwRNSfwXutOpe/prV5+qKstwog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU+dB9C1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU+dB9C1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47117f92e32so46784275e9.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142897; x=1761747697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=TU+dB9C1XA84UWrIhjTpHh5Ao+aEDQ5h/uuP7HZfYSeggpDgpuTw9cSmHNT0qrcvcU
         Ui39t0gZ7Jfz09ORkWUUeXQxD6SBMOyG+FzV7JNYnUIlgPerXVdoVEtEXgLg8GZFBKDw
         Y1HAOGBfyjnAE5zi9vYr01GB/qylkL+1Hk5f+XwR55x5tADKS6rwplJ5LrjHreUmpXar
         AfyAn2+kR2bIYRfPfRpzslORyFzcLaU8InnHl4fFbDwk6fY0XnsyEVsT6eKI9U5fqf9B
         7DBVR42z3wLGSoMWPcxCtIi9TImHgfdPv0XtWBDfixQqzSuFFE7GEoI+OOnlDr2uuVgl
         vu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142897; x=1761747697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=tWIJAZN4ibk+qDyOok2TP1fZ3KZJWrKLtBicgnOyqtDzI2H+qZvhdVOXPDTdYmIifx
         eGe+Pva/XP2zRFu6RO4Bi6izM0HGM3Sc9xIdtXT/XY8dzQ5ZnGfA1EvrATdd9LLZSYAr
         HBPe2BTVgYOPRH+uvyEASTDVZ7dxn5u7U1TGiwGH3BjC6FpvIpGgOFLU4PV6/EW6WaUK
         0B2L+kTOTv0gTpP0lnnCuUYwrsyhdw4Z9uB5orzLPP0atr0SN+hQat8zmmZTUqSGF0o6
         me50AqvCwyASeb9ObRKUOahRim/svEn2FXJv0EHd6q/xR6hcvfyDCqDrcQ7bjqKIf7Q8
         qBMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqOrGu4iiQfOp2mTgkkoHaIBL512X/gI0P4S7AQ1Ldl/qgzpaowiPpkFj35miKg6W/6adT69sQUCiETEOT@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5+5cb1CA+m87BpnYRMlq9/1Ttv+x9LmNlXmj68cl4kvvCxQIi
	hxkeuxWoaUbfAu/cPMGD5HRFbhTDPetraGSed2EIkjyfgCTJ4zmEddtg
X-Gm-Gg: ASbGnctQhR3YydYlX1ZUd6KL8waFIFxnJwXq4qXJ9xcxKtIjP+TGO6RV9fgfD+3O83G
	XrBsjA4hsrwAdQvev0ARs9m3Hf6jFpa3nTRw8FdEzRgLpELsjeZgJem8Z6LIXoFraRsxEoSoALN
	BSiY9e5gNMXagX3A+SkGxCenIQPnznktwt9elUCzU6VYAs+eQFLq/z0mI4TpZBzVhDzo4MKbzu6
	ubgDu/QMAQq5WobiZ1CY5/AP4x5yGmVBybxjNQloW2cIzN5+wKc22blTakLKxTOQceOpYRh8n7H
	7BIvJgK4ZRYjG9ygtouKMCLBAreyuxAIfxWP0nng1tR3SMZyH9zs5sF0i73CscB7EWU6vgMjSwM
	sRFOcmInhf6N7GuaJylOo5pUFByAA6N/Q/dZBW6UY8Q//Renc2cHOEvBGzZt54USyhwDtIRsFX4
	CJTg==
X-Google-Smtp-Source: AGHT+IEQ89eeh/r2+ipRz7waSS8oqSfLxP7wC0ZsoklWA5VZX65aruo6BpxwArM9GCWrpFvdCs8Ryw==
X-Received: by 2002:a05:6000:2308:b0:428:55c3:cea8 with SMTP id ffacd0b85a97d-42855c3d365mr1542726f8f.50.1761142897063;
        Wed, 22 Oct 2025 07:21:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 08/23] staging: media: tegra-video: csi: move CSI helpers to header
Date: Wed, 22 Oct 2025 17:20:36 +0300
Message-ID: <20251022142051.70400-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

