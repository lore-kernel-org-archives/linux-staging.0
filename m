Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605995;
	b=lLJTDQsUtAJtg9A3dh84RhpIz+xbqCrURqDxSSuKlgLIK41UKkOgYyM/Z7YEHnnvSlZO
	 uf2yTTxI3CdO5OX0idVXIjvdN8gUOBuAzorbY6W0+GXeIsICSMUBOC/7BjGnqsy4J6EeF
	 WvkZHxXrUXvMfVsBYW9HX5y0spTMJB1iUmFOhqSnyPnEfjpw823DpeqW77o9J8m7owTkn
	 WWEBwvxWineD+4FpghU8W+pba5f5WGiRn4+LI6x766QnH/JWPaYW8f7xWtAsz8v5gZXLU
	 RWGaGhcLRORQ5KTGLByi402uBVCf221Lyq9bQlwVA8OdWunX5h+ZW8zhyQMBqIKFq4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DajO//3VjDJDVFEXWo0EyF15if7O9RtU+D4ToQxNblo=;
	b=yHUeBOzGH+ADl9UxcoFcGI5F1vfbZeq2uhPEx14pc2xoslRo548Jffo9MGRkDomwT/Bj
	 6UnKOc3YHC0oMKNNTN7SiE5Z/8WYSeyUOuBUjfEo/x5rWjl2TcseVGkm5UP0aY+dI1UNl
	 45wFBP6mXyLYMKsIEv030C+5LJGapA8Cv9Xb7+sZvbb3ync6n18BVk5oLAK+VzmkdG0QW
	 nmpkYIoMJbiaGAlUGV2arrsbKVpyT/tQEnxyqELIq0jtPGJ7WeGRdgT4vVAJaBQiZHhLz
	 rnPTdBIDK1bDMEST9A4mNrFD7jc/z1hfOZztS6ozr0Hj2ZAC1XeaNq3ATvPVqRidmvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hIAzEa34;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC78860A2605
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC78860A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hIAzEa34
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso6604768a12.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605993; x=1796210793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DajO//3VjDJDVFEXWo0EyF15if7O9RtU+D4ToQxNblo=;
        b=hIAzEa34HBM3tQw4QJl5P2rvOLHoYwo6lZT976+E28Rdq9kb56rNY+1NxMltW3Z5mC
         BwoHVTs29JERlN4w5n8ly9JPfVncH1k6WzfsAPQ9qX7IDncT9etC+2k1Md1OJ9BGVawc
         7mesNLnefxf/EPUd8nU5RVLI1z29XcFhMrgcfOBEi5fKXH8v2or2Be5zQaJm9dlBB42s
         BGtUDD5vXxvt/aSN4mHA5BOGFWBYpf3rJGD/TtymkopQy6dh6rbYerqbHmaJ2x67ccbw
         5QkBvmL91XVp0Jbjcbsu47Uh+2PVJn2AekTAqn3IKedoTKUQhWRar4W391Xn0uv7Mpy3
         9Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605993; x=1796210793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DajO//3VjDJDVFEXWo0EyF15if7O9RtU+D4ToQxNblo=;
        b=fT8uCkdQ1O4/A0sNlI9BdQQxKnRQkFnbkI0p8I5yHwC79nFUc9AFweFdO5d7ZO7ehE
         2jLDVSXJhX/tNTyoPu+v6gENvPGCd3XBvMs4E7UqF7Cs2xZJaewsKl1FFgsxo9gPIQCl
         1KObKvdVCRgdKsoMjkQFL+UH0hDzYLYYrnbDKOpRxDQJokCzg/kDtYtI6VEQpe9xeTQk
         D0gc7T16E5dgwt9FbOSQAVhsI1nDeFHNi/miSB7CBTTOeFNTHO61fTaeUct7Tt9nUlLA
         B5ZexZJ/RXypx1BQGg/8kVt2oHw7MXnOvyEVkvpwFv3y0d0WyN+hiYWq3I1MYLWAZo62
         CNSg==
X-Forwarded-Encrypted: i=1; AL+hErFY1P7GGhg3go5/l7wa3XQ3sTHBD5B9LVPS/9cbZB9nVxNhJCDYdtZ0LJe7OwjEqiqQJEjBiJBs9QGNiZaS@lists.linux.dev
X-Gm-Message-State: APuU4Z9RcgcF4x8Rffr3OqE0qImVSRHfxSloM1autDYNFuoZ0ykq3ug4
	4CQWmBDw7unHKTDkmQvAzelAuG+Y3HHKgr5Q0P70zoLw6EgQe/oTkdX7
X-Gm-Gg: AZFdTZelgraZ/DLamCbT+SZIzoHy1zNtTX7srkNDaJndyLVZAIR5iT4/d6peOWf80lI
	qkY4ap2mvYql9jmEtRb5n9tVv/TuPohdLRdpDK2W1wEhqo8vUJwE1Gs+OuW0PWuZxpIGEveHPUd
	57JqejZ/liwdhAegYqzMQ8PPqzCgX4I1HHaJNSC7QrhNrcrZqf5uZdH59jgsZLacTtBxHgKxh0n
	toa7rh72tVBNSQd3ufXp6eOnmVI0dlfYHqj+K9zDzf+U7U1gm1x17ZkyCs8djXgD8d+2ZoDK5pn
	LKbMo4QSntXOQ0D65DKMmXIrPy7kzuoX+EynV/fD/qiXmI+IboBUd90zK7mZJYqwJIVfAm+uGLe
	meXfiqeND2pTzI0NYWIc7QJvF1dFMMcUJmkeckBfwsqS3U20cm4+ODNA0md3YbVP25/oTw+hMox
	r/+EOInV89+0X6sbC/vqVTNglALVLJI/0czWcfFJ3NqXJzZkVNwelZxiVfLk/RsylJ8ak0E7q7c
	Su7yodNe16Sl2D0Ce2CZ4SkpN9/MXjiOfzM/s686upySxk7lYyvKQT40Y3tFw8g4dBCAFw3oIOz
	vuSHveKIpVTd/JxcWFoKBtgRNIc/ttl/nXLVERsNpKhAA3zyvWfcUcmmwFYJKXQMrMEc60vQPWe
	AXmUkDgBXbA==
X-Received: by 2002:a05:6402:5516:b0:6ba:85f6:9b4b with SMTP id 4fb4d7f45d1cf-6ba85f69da8mr8715017a12.41.1795605993067;
        Wed, 25 Nov 2026 03:26:33 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:32 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 3/7] media: tegra-video: Move Tegra210-specific functions from common CSI
Date: Wed, 25 Nov 2026 13:26:09 +0200
Message-ID: <20261125112613.237333-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move and staticize the tegra_csi_error_recover() and
tegra_csi_calc_settle_time() helpers from the common CSI file into the
Tegra210-specific code, since they are used exclusively by the HW rev. 3
Video Input found in Tegra210.

The tegra_csi_calc_settle_time() helper uses a custom MHZ definition
which corresponds to the standard HZ_PER_MHZ. The custom MHZ macro is
replaced by HZ_PER_MHZ, with this change folded into this commit.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/csi.c   | 72 -------------------
 .../media/platform/nvidia/tegra-video/csi.h   |  5 --
 .../platform/nvidia/tegra-video/tegra210.c    | 70 ++++++++++++++++++
 3 files changed, 70 insertions(+), 77 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index aaab884d99f54..fb4b4c0c7cfcd 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -19,8 +19,6 @@
 #include "csi.h"
 #include "video.h"
 
-#define MHZ			1000000
-
 /*
  * Test pattern generator configuration
  */
@@ -263,65 +261,6 @@ static int tegra_csi_tpg_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static unsigned int csi_get_pixel_rate(struct tegra_csi_channel *csi_chan)
-{
-	struct v4l2_subdev *subdev = &csi_chan->subdev;
-	struct v4l2_subdev *src_subdev;
-	struct v4l2_ctrl *ctrl;
-	struct media_pad *pad;
-
-	pad = media_entity_remote_source_pad_unique(&subdev->entity);
-	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-		dev_err_probe(csi_chan->csi->dev, -ENODEV,
-			      "failed to get source entity\n");
-
-	src_subdev = media_entity_to_v4l2_subdev(pad->entity);
-	ctrl = v4l2_ctrl_find(src_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (ctrl)
-		return v4l2_ctrl_g_ctrl_int64(ctrl);
-
-	return 0;
-}
-
-void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
-				u8 csi_port_num,
-				u8 *clk_settle_time,
-				u8 *ths_settle_time)
-{
-	struct tegra_csi *csi = csi_chan->csi;
-	unsigned int cil_clk_mhz;
-	unsigned int pix_clk_mhz;
-	int clk_idx = (csi_port_num >> 1) + 1;
-
-	cil_clk_mhz = clk_get_rate(csi->clks[clk_idx].clk) / MHZ;
-	pix_clk_mhz = csi_get_pixel_rate(csi_chan) / MHZ;
-
-	/*
-	 * CLK Settle time is the interval during which HS receiver should
-	 * ignore any clock lane HS transitions, starting from the beginning
-	 * of T-CLK-PREPARE.
-	 * Per DPHY specification, T-CLK-SETTLE should be between 95ns ~ 300ns
-	 *
-	 * 95ns < (clk-settle-programmed + 7) * lp clk period < 300ns
-	 * midpoint = 197.5 ns
-	 */
-	*clk_settle_time = ((95 + 300) * cil_clk_mhz - 14000) / 2000;
-
-	/*
-	 * THS Settle time is the interval during which HS receiver should
-	 * ignore any data lane HS transitions, starting from the beginning
-	 * of THS-PREPARE.
-	 *
-	 * Per DPHY specification, T-HS-SETTLE should be between 85ns + 6UI
-	 * and 145ns+10UI.
-	 * 85ns + 6UI < (Ths-settle-prog + 5) * lp_clk_period < 145ns + 10UI
-	 * midpoint = 115ns + 8UI
-	 */
-	if (pix_clk_mhz)
-		*ths_settle_time = (115 * cil_clk_mhz + 8000 * cil_clk_mhz
-				   / (2 * pix_clk_mhz) - 5000) / 1000;
-}
-
 /*
  * Proper CSI configuration
  */
@@ -867,17 +806,6 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 	return 0;
 }
 
-void tegra_csi_error_recover(struct v4l2_subdev *sd)
-{
-	struct tegra_csi_channel *csi_chan = to_csi_chan(sd);
-	struct tegra_csi *csi = csi_chan->csi;
-
-	/* stop streaming during error recovery */
-	csi->ops->csi_stop_streaming(csi_chan);
-	csi->ops->csi_err_recover(csi_chan);
-	csi->ops->csi_start_streaming(csi_chan);
-}
-
 static int tegra_csi_channels_init(struct tegra_csi *csi)
 {
 	struct tegra_csi_channel *chan;
diff --git a/drivers/media/platform/nvidia/tegra-video/csi.h b/drivers/media/platform/nvidia/tegra-video/csi.h
index 25aff2581f069..addd1b82685e9 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.h
+++ b/drivers/media/platform/nvidia/tegra-video/csi.h
@@ -175,9 +175,4 @@ static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct tegra_csi_channel, subdev);
 }
 
-void tegra_csi_error_recover(struct v4l2_subdev *subdev);
-void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
-				u8 csi_port_num,
-				u8 *clk_settle_time,
-				u8 *ths_settle_time);
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/tegra210.c b/drivers/media/platform/nvidia/tegra-video/tegra210.c
index 90d984790696f..474f906e8bcc6 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra210.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra210.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/kthread.h>
+#include <linux/units.h>
 
 #include "csi.h"
 #include "vi.h"
@@ -334,6 +335,17 @@ static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan,
 	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
 }
 
+static void tegra_csi_error_recover(struct v4l2_subdev *sd)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(sd);
+	struct tegra_csi *csi = csi_chan->csi;
+
+	/* stop streaming during error recovery */
+	csi->ops->csi_stop_streaming(csi_chan);
+	csi->ops->csi_err_recover(csi_chan);
+	csi->ops->csi_start_streaming(csi_chan);
+}
+
 static void tegra_channel_capture_error_recover(struct tegra_vi_channel *chan,
 						u8 portno)
 {
@@ -979,6 +991,64 @@ static void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
 		tegra210_csi_port_recover(csi_chan, portnos[i]);
 }
 
+static unsigned int csi_get_pixel_rate(struct tegra_csi_channel *csi_chan)
+{
+	struct v4l2_subdev *subdev = &csi_chan->subdev;
+	struct v4l2_subdev *src_subdev;
+	struct v4l2_ctrl *ctrl;
+	struct media_pad *pad;
+
+	pad = media_entity_remote_source_pad_unique(&subdev->entity);
+	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+		dev_err_probe(csi_chan->csi->dev, -ENODEV,
+			      "failed to get source entity\n");
+
+	src_subdev = media_entity_to_v4l2_subdev(pad->entity);
+	ctrl = v4l2_ctrl_find(src_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (ctrl)
+		return v4l2_ctrl_g_ctrl_int64(ctrl);
+
+	return 0;
+}
+
+static void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
+				       u8 csi_port_num, u8 *clk_settle_time,
+				       u8 *ths_settle_time)
+{
+	struct tegra_csi *csi = csi_chan->csi;
+	unsigned int cil_clk_mhz;
+	unsigned int pix_clk_mhz;
+	int clk_idx = (csi_port_num >> 1) + 1;
+
+	cil_clk_mhz = clk_get_rate(csi->clks[clk_idx].clk) / HZ_PER_MHZ;
+	pix_clk_mhz = csi_get_pixel_rate(csi_chan) / HZ_PER_MHZ;
+
+	/*
+	 * CLK Settle time is the interval during which HS receiver should
+	 * ignore any clock lane HS transitions, starting from the beginning
+	 * of T-CLK-PREPARE.
+	 * Per DPHY specification, T-CLK-SETTLE should be between 95ns ~ 300ns
+	 *
+	 * 95ns < (clk-settle-programmed + 7) * lp clk period < 300ns
+	 * midpoint = 197.5 ns
+	 */
+	*clk_settle_time = ((95 + 300) * cil_clk_mhz - 14000) / 2000;
+
+	/*
+	 * THS Settle time is the interval during which HS receiver should
+	 * ignore any data lane HS transitions, starting from the beginning
+	 * of THS-PREPARE.
+	 *
+	 * Per DPHY specification, T-HS-SETTLE should be between 85ns + 6UI
+	 * and 145ns+10UI.
+	 * 85ns + 6UI < (Ths-settle-prog + 5) * lp_clk_period < 145ns + 10UI
+	 * midpoint = 115ns + 8UI
+	 */
+	if (pix_clk_mhz)
+		*ths_settle_time = (115 * cil_clk_mhz + 8000 * cil_clk_mhz
+				   / (2 * pix_clk_mhz) - 5000) / 1000;
+}
+
 static int
 tegra210_csi_port_start_streaming(struct tegra_csi_channel *csi_chan,
 				  u8 portno)
-- 
2.53.0

