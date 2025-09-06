Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81D62FA0E5
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166858; cv=none; b=HqGKIFqrgD2FdqYrmeWQQwvEq67FIdBqCjWww//6p7IN1VNdeQgtBu1y0xQ7dYmv++hDXVbPzkbPr6ikcTcF5aphhNrvhKlK0esRVlntVnh+MpSnc27Dvr3PNAYASno474CeiZomvfad58bydvrxdolL4r2op1biswQ8yHx62V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166858; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHHouRxz6PKOzm8isRpK1AjOBBDfZGRtVneIG0AJKW5b7l1YoiC7xSvOKcaDlvHcpKZa93ER+AGXOUU2w9/UGP5Kh7EswmqEYPVSKMmnjW69EEZzcDZSj9c4RU8eV+I12FA4tUjFEa8qn0kqsur00AMPsQO23Q2oGjGwUA0EBqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWPQ2hrC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWPQ2hrC"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f7039a9fdso3240677e87.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166855; x=1757771655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=YWPQ2hrCDLQlnSLNQj5+o5Aa0HgDptXReUKtpyRuUmXf61as450jymRAvBG6EzsHTr
         T8FDlvcXAXjCpIRrfW7OdUKp4X9DGGi93GHlz21N5hzOIJYKMGyirygYGflt85TBr7jC
         NVj5/gpKNX9DYv90rBxxeFQtoUuCh7Nx9gkYHCzoK8/I1DUKofGvnKDleSFSntxDBsXe
         GXUP4ZiaEPtmFYmgL4nen8u8n0eImz7G92muvHGZnmpxVa60FdQtvBqHJXRrnxEeVAsX
         NFVX6fHHu7Dz3w0ivqZrsbEE+RrsHSaz0FLVPypygnHL8J0GZVO9oS+Di1cyG7tMI0Jw
         lWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166855; x=1757771655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=l5GIo4RH66EHzYe0UQH8s/LhNiSwsEeAtoyc+a9Ulf1QLd4F801tu6COmXD1PND33U
         2ninDFzGw7XRHPtXFdjgQuWNAZw9uTFKPiT22FnbTbYNeodjcr384Hz1EOI5tsgkHpVe
         BPyfo83mt7uJEYDn+xeIamu1V4R+44DL7R+EZF2ueO2HQ4etGzdzUOaTQg5jp0H2iDmW
         gg639zdWV/JyXcaGNM376pSc+NCD6NFmWf1yaiMp4ewOF2N4mQSPisJ1lEAbMS5RLM8R
         V07MiYYuWpSW011pyz7JF5GsWBKVUYo2MOj4Z7XUOzdhZ4+G8M+k9yx6oG0i+zGQs/GX
         d9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJBfqWq7lCSWwjfNFlJNFVAZqUHY7O17t4LCIhSNkhd1tgzgABQpOPumlXk6w9qEWjpxR3RSymb64//1LO@lists.linux.dev
X-Gm-Message-State: AOJu0YyksHiY0IETExEjAWWOZ3XReulaD/exQSMNHiGHONLVocoL8teO
	VbA6VPUP1IAPZ8PIUY6DIDZ53RcSFP3GsG/svZLcTQxs3t/XCYsp7eh2
X-Gm-Gg: ASbGncsOSOwNei/FK0M/iDg5327E+M68HxUmxGMFIiL6ZMKRmq0TX88kwwDqsSIlVBi
	IXWlIR+G97Vs7ECaNrPg6xTnAnPrnN/S5WjJKthP+9n1OsxpLitHgYEAM4wOVulcuLh1FD5owJ+
	IQjUgXnVcB8DdkQrkB8+Y682vY6hVc7XzarE9qRP6fsgJxGCB+zVMROT5+XdQgjV1Oa+5WBy1XV
	EbgAv+arheIOUGAIurFnXAWh0ixPciQ5esDp/dN6O1niuY/2O8mZWjLADDqy0xEpFgra6gYSq3C
	5FaOrexAQxm7BYI1amZbHHx74inroJMJh1av+n+bQUIw9J57jsk/73mjR+5t7HSS/sC8vwKtVaP
	U1iA1pAOtt3s8Fg==
X-Google-Smtp-Source: AGHT+IFJ1CwuflLWYrmyiSyRWTAzKVjGXj+OEC/CNxiHekgIHk2zT4rRYD0MencyqeeFU/tqUUarsQ==
X-Received: by 2002:a05:6512:128a:b0:561:9635:5b1a with SMTP id 2adb3069b0e04-5626275d86emr572346e87.36.1757166854707;
        Sat, 06 Sep 2025 06:54:14 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:14 -0700 (PDT)
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
Subject: [PATCH v2 08/23] staging: media: tegra-video: csi: move CSI helpers to header
Date: Sat,  6 Sep 2025 16:53:29 +0300
Message-ID: <20250906135345.241229-9-clamor95@gmail.com>
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

