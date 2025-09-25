Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A39309F04
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813453; cv=none; b=JHUss+B3OSFrmbj/UVsDpL5QTHVazSARw8MwsCVbzZ0nhSz+jHy5AarhGkep+t0UGRkc6Fu7LNbn7wDe3FRhjgGGlyKLnY2ohVzX3XJydGBIdKDq4uz+sHGLehoXLGvtVETxD+PoLb0pQYuLkjAGXajTOhPLlJWG9/141qjeog0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813453; c=relaxed/simple;
	bh=PeHm1wrR0AAPSTDMxiNgwUZQ4BKQBSCJMUznSgFPtDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuBzZJqlAhrdRtS40NrjFmxU/wuz0zUNhht4j8Fajr0gBnF1sCU82rG5Vh7FHAyGMSRO0VIGQ1ssZK8kkVGbOoq4K83qjV4GBhYPkUL1RkWP9f8Zlye58aA++JgOqJ3iM5VteqQKjntISJHXzeq8IqNUIZKnr2PgA/5splsG+B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbFm7bET; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbFm7bET"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-578ecc56235so1057263e87.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813449; x=1759418249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxcQ3SZL/bX2w7ws13Plp9aplxV6uyygzePW373+H0o=;
        b=JbFm7bET7uoacdr8xCvz9RePtynHxSAHmOUlNQXbsrZ8NGj5qe1sdSI9ds6CoWcy+S
         vCyUL4yJXEQlWQ/hXu5/RDwGIxPmcsznC8rAXABHPrqIVLtkst1ZZKNhHIVXBdL8UkRO
         Tkar8i8Z39l5YWp5SRuEUEwGSkRdAvJz7IZyCWZShCtTjx7kTmNX09EurtJXk4NUTtFC
         9P33n8wHHZsZTiJHc8clpto3zZ25wrD4VzblUlmDFPWsB0M7df8iMb8f6PIghFcmKFhj
         l7g/KNpfLsOdXFUEIY11RNy1lGzkE+ZgIwkBDpd1ZtXDO6VV1q1waLY234JFTo3cfrr+
         wf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813449; x=1759418249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxcQ3SZL/bX2w7ws13Plp9aplxV6uyygzePW373+H0o=;
        b=OddMurSmpGv1ossL80LRXGUCXkSagYEcGP7Y2attZ4ZVnZ21C7qxYriP/UMeDnCKpE
         7LpRwn7+FENHNmyMFYKYLSueOtFrrQn3OMEHq3gWELF2AMma7UV/SApjPtiH211i5h6A
         dxRl9qe8sU97CqHss+1qezKaZyftPxZ6vsjAI/VgaNSuCDe92c6Nn/khOHN5UAKpKLHJ
         zF+ku4BzFr9+VTEe04idU4W3WIw8jCwPsa5y5UI9Hui7CKES3FBFkNmWiVLUPT2Q44VF
         VK2Q7ZBz/FGy+EGx2O1GjEcSlcDrgqruEcVFx++pXb2d4I9jhQOcXO19ErETSfNSmqF+
         ESxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrHOW1G+ZNxf+BxIUvMd/j2cgb+bytTW/VX2oMOu4zXzJBYoYV/RQ8/sAgxZYpQFw6q/HjawXJjTr6QcpG@lists.linux.dev
X-Gm-Message-State: AOJu0YxlqD45/zczaO7DEZ9tBnpu0vWHYUZp+sbjn8wg+mOt5VXv9F/N
	uWPCv8z46OjXhRJNAIOgJaxUj+Ls8F0GVuMMd8x6RiKRNXAS6As21QHh
X-Gm-Gg: ASbGncsiqr1lpUUVXqZ3isVOzvO2pC94nBucDQuMiG02uiOsVqaE2Wf5KA4xhJS6XYS
	5F6YSQ7q63fLfFd+qWaArtlu8jQF/v+l9zig1XjnumhUvpTC+G1ls3PLR2R93WWN95qlrx04SFV
	3y2BmO1S5CL0kn+TZAxuohGRAQinPni0O7vBJpn8n87DXYDIcFKp2KqY/blRRntyraRzGEeG8IB
	7HTCcKAiH3b3PR4cm0uL3Nn2/g3BLlubsTlZDfhFZuwV+UFL1jEDar/JfmCwawRQGa9OrHE7czf
	IUuJzHOzf29pXViJ4tiM3NAzupdPLKCWnA+t8X7m5IFHDY0xxsXcgyVEW0TeIKtwbSX1usCIpUx
	hxcomtpAwI0U20g==
X-Google-Smtp-Source: AGHT+IEpmsCgXoe+pHNnDNycPilUYF9YFAYkKb7YBcFS/w6Rr+i+BRLl5E2waSe2wlPmiZ/s/OW9iQ==
X-Received: by 2002:a05:6512:2213:b0:57e:ad46:b0a0 with SMTP id 2adb3069b0e04-582d092f19amr1131015e87.6.1758813449054;
        Thu, 25 Sep 2025 08:17:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:28 -0700 (PDT)
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
Subject: [PATCH v3 10/22] staging: media: tegra-video: vi: improve logic of source requesting
Date: Thu, 25 Sep 2025 18:16:36 +0300
Message-ID: <20250925151648.79510-11-clamor95@gmail.com>
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

By default tegra_channel_get_remote_csi_subdev returns next device in pipe
assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VIP
or even HOST.

Define tegra_channel_get_remote_csi_subdev within CSI and add check if
returned device is actually CSI by comparing subdevice operations.

Previous tegra_channel_get_remote_csi_subdev definition in VI rename to
tegra_channel_get_remote_bridge_subdev and use it only in VI driver since
core VI driver does not care about source and does not call any specific
functions.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 16 ++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 14 +++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9e3bd6109781..ef5f054b6d49 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.pad    = &tegra_csi_pad_ops,
 };
 
+struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+{
+	struct media_pad *pad;
+	struct v4l2_subdev *subdev;
+
+	pad = media_pad_remote_pad_first(&chan->pad);
+	if (!pad)
+		return NULL;
+
+	subdev = media_entity_to_v4l2_subdev(pad->entity);
+	if (!subdev)
+		return NULL;
+
+	return subdev->ops == &tegra_csi_ops ? subdev : NULL;
+}
+
 static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   struct device_node *node,
 				   unsigned int port_num, unsigned int lanes,
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 90473729b546..04b538e8b514 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -160,8 +160,8 @@ static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
 	wake_up_interruptible(&chan->start_wait);
 }
 
-struct v4l2_subdev *
-tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+static struct v4l2_subdev *
+tegra_channel_get_remote_bridge_subdev(struct tegra_vi_channel *chan)
 {
 	struct media_pad *pad;
 
@@ -182,7 +182,7 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	struct media_entity *entity;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev)
 		return NULL;
 
@@ -204,7 +204,7 @@ static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, true);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -217,7 +217,7 @@ static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, false);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -1630,11 +1630,11 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		goto unregister_video;
 	}
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev) {
 		ret = -ENODEV;
 		dev_err(vi->dev,
-			"failed to get remote csi subdev: %d\n", ret);
+			"failed to get remote bridge subdev: %d\n", ret);
 		goto unregister_video;
 	}
 
-- 
2.48.1

