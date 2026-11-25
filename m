Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605993;
	b=WU2kxyojIpfvcHTNHaDCCixJa/FxA6HEciIWVWmDk/WSfPBVVqzUrkUuAZf9z1Ht1URY
	 ngjoT4SGGtzSfkZw58nUkpWmTgX38aVlim1CrPy71fjF9NhR2lvuutkgoLGonvCQjV/RQ
	 EKYJoGt6MjS4eBfnQSy+G4C1pmiRzz7jlloSt+v8Fy3fOfHSnHHv5lrr/NHqBovQ94YdI
	 wNvK38pfAs6xWz+IdZ8b8dY/wCyOJnffqYaNlTm2sFdPaLXrMUKvhhNozNL7jx+eSzhxB
	 yhyzpESeb7qEPvUf1fcSDHv+jXHMrDDNW6msMu7m8WBnprKafFJzYPXPxTF1738YI8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
	b=yqNUEjcPU8GoU2C6Jj958Swi6U1SZ0V4QshkWkdUIV7Ijyu4leEU1qZr6VLZqYLY3pbo
	 zoT/9AoeJaAE2qFShNS3RxKNUbpa+HdjYVVY7uqFhZv5Be2nVeA/LxeBuyQd6dMqKlNX9
	 jH3Ci0GZtS8LVNyau5mB0MFwnhGS3lYhHGbIuCYldZe+nD5ZS3p/89OSuWzWev/+TGRV7
	 +MP+8d07ZgpWvTwMH8JvFou3mxHbFCvrnVGAUQkNGurR5hxaXJMX6LVQpPQI6NTMxd77Q
	 2gyJ6fK6ZtorT54/P112yXSOErblguy43H+AAI1eP+TkBA+EBX6q8956R0cjzsZLCRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNvYBPXg;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D212606A6B3
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D212606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNvYBPXg
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso7290596a12.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605992; x=1796210792; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
        b=TNvYBPXgJ0nZ9NyT+exsR+jxNYY8X9VEfv9z2uL9F6nUjvcgyRSS8oEtD4D1iUEkun
         7OpALmjRk+37N7CGGVVPw5XCj0SbTMhJZVYDP57DBa2OmfLHFSLWyMlfKFQckF2H9I8v
         8spdqW1xjscUsZTyfJa+byIF83rNkjpTqieFaTeTHzzOFvgn0TcYNiLtRBZP0zm58Srq
         w860xx61i8405iE7fgCtibS/ATQ0ZyiNfzNaP5A2Il9pblQo7NWZBMbyrsm1S6pCnhFH
         4C6/+WOQG/3ZsAQ0pVzoZ3ei0GCuGBQ1HNGWdjAEiHNKvyg8/nK3hlvDxbrsolhfK22A
         WAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605992; x=1796210792;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
        b=GtuoQD+f2a81YZj5cwEIl/lkOx3DrcjMnyst5tFtCv9Lc9O3HQtJ0kAZIobcIRUxMA
         McThXXRE0LtJv9yo59c6L7Y+OLM0xzYE+rrcBYY1Dfj5qSz0G/btRKw7lQ0bBT4USkm0
         GoXsfuqOGL6IvD+yAsdXCcmQEZfEVmqL0Hdu1stSe4rYQ2Bqo0GMTo7mfqWgHK7V+/pz
         ZXfXY84JIz2eKV+AO2XusL67A4ufQfis6kiEbyVEjPNLthw9mYbb5IUQ7cimdlajO+Pp
         2Nse49ckCdPRDD5mWIiEIcJG7K63Syd5RVzIIReKJ6Nxg6tWbn3cindJAOcRGuNrSTxF
         AGJw==
X-Forwarded-Encrypted: i=1; AL+hErHZGnsmunTW/TgkwTCxSCpUoKjCvUmZXkhj/TND2RibRx7axRDoNzIvHpc8Eb4GxzPieEEqDjjLzwnIkG+0@lists.linux.dev
X-Gm-Message-State: APuU4Z+8a3oTYSXm0sY0ORBjAYqUWq0CRRgF56ZISIAdpRDKMxGJ6RGn
	18t80wVrQxZ9yig95+yfz9FLbYMmIvhozp6ahMTP32crxV8BQcR/yIUE
X-Gm-Gg: AZFdTZf5tr6dZsI/Rm3yjlFQ1c84TxVVoVM1h7ZrvQYj4X3p3OVwQEWkSZWltNd/Wmz
	LTMtOSrZSoVjkcOSA33RC+cpHkvYt9k5zdi6NnEE3xOJB3cjfX9+MzfFU2re1H7AbMBFYtsfEol
	P4RZRYgsscHLfmrKSCx7vdF/BkcJGhZqxDk62EoTHSOaqSWej2YYRD8ICiFD7+//BdGh01r/RUB
	suZkHZPSv9oWJs8R2ke75StsQ8pbqLysiTFIw7FiOMYKI6H3hwnU6EAr16Pt3xGeWIPPgmDh6Cx
	bWs5mO7x9bBw1W3AZGJBqNfVQRQGRnAaiuZuZea/xXU3VDiKb785GD9Lm/YBc8NIOyCQRh4TNEn
	DvJTkk+wW6zvATdJn5JGlbWoBhUgrdk+yDk+Q8H9iCEVsvrufVg23QnwQxwwVTX9NYEkJRRX9/y
	N+mi65sQXb2l6NDEm6gL75Wn7KN1+M8QOc0yY+t0SP42zZzsaY38uYDrjT3uQrjC3FFZmXyvgWI
	jK0AI6Mlzpsl8bAF8q8J2Z78bQ3twf5EQi6oHVX9PXmqUHVDkqaxGdxCRsHOt4NKi16jvfVYfEW
	jU55bzYL6lNfXkVLq/d07K1grC1jjk0GLGuJv0bpR8Ir1pP57bsoexW7NcZgt4k/L2+iaFD6suf
	R3p3h4BDZ3A==
X-Received: by 2002:a05:6402:3222:b0:6b2:2339:370d with SMTP id 4fb4d7f45d1cf-6ba37ec485cmr14832157a12.39.1795605991602;
        Wed, 25 Nov 2026 03:26:31 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:31 -0800 (PST)
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
Subject: [PATCH v2 2/7] media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC descriptions
Date: Wed, 25 Nov 2026 13:26:08 +0200
Message-ID: <20261125112613.237333-3-clamor95@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Further investigation shows that the current maximum VI clock rate is too
high for Tegra20 and is better suited for Tegra30. The correct clock
frequency for Tegra20 should be 150 MHz, as it was set prior to the
addition of Tegra30 VI support — a value backed up by the current Tegra20
peripheral OPP table. Tegra30 supports up to 470 MHz for the VI clock,
but this rate is available only on higher-end Tegra30 SoC variants. The
highest clock rate supported across all SoC variants is 300 MHz.

Diverge the Tegra20 and Tegra30 VI SoC descriptions to account for maximum VI
clock limits, setting 150 MHz for Tegra20 and 300 MHz for Tegra30.
Additionally, remove the APB_MISC workaround for Tegra30, as it is Tegra20
specific.

Fixes: 071fa83ded5e ("staging: media: tegra-video: tegra20: increase maximum VI clock frequency")
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../platform/nvidia/tegra-video/tegra20.c     | 22 ++++++++++++++++++-
 .../media/platform/nvidia/tegra-video/vi.c    |  5 ++++-
 .../media/platform/nvidia/tegra-video/vi.h    |  5 ++++-
 .../media/platform/nvidia/tegra-video/video.c |  3 ++-
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
index f8d2b5e1b4131..c8a8fb3cbba0f 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra20.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra20.c
@@ -825,6 +825,15 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
+static const struct tegra_vi_ops tegra30_vi_ops = {
+	.channel_host1x_syncpt_init = tegra20_channel_host1x_syncpt_init,
+	.channel_host1x_syncpt_free = tegra20_channel_host1x_syncpt_free,
+	.vi_fmt_align = tegra20_fmt_align,
+	.channel_queue_setup = tegra20_channel_queue_setup,
+	.vi_start_streaming = tegra20_vi_start_streaming,
+	.vi_stop_streaming = tegra20_vi_stop_streaming,
+};
+
 #define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
 {									\
 	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
@@ -868,7 +877,18 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 450000000,
+	.vi_max_clk_hz = 150000000,
+	.has_h_v_flip = true,
+};
+
+const struct tegra_vi_soc tegra30_vi_soc = {
+	.video_formats = tegra20_video_formats,
+	.nformats = ARRAY_SIZE(tegra20_video_formats),
+	.default_video_format = &tegra20_video_formats[0],
+	.ops = &tegra30_vi_ops,
+	.hw_revision = 1,
+	.vi_max_channels = 2,
+	.vi_max_clk_hz = 300000000,
 	.has_h_v_flip = true,
 };
 
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 98411c3f4a037..52384af92d8a6 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1408,9 +1408,12 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vi",  .data = &tegra30_vi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index 44893c5c6e651..965357ebaf0a3 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -291,9 +291,12 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+extern const struct tegra_vi_soc tegra30_vi_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_vi_soc tegra210_vi_soc;
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/video.c b/drivers/media/platform/nvidia/tegra-video/video.c
index 2e84385708bac..d483fb709d127 100644
--- a/drivers/media/platform/nvidia/tegra-video/video.c
+++ b/drivers/media/platform/nvidia/tegra-video/video.c
@@ -123,13 +123,14 @@ static void host1x_video_remove(struct host1x_device *dev)
 static const struct of_device_id host1x_video_subdevs[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
-	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-csi", },
+	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra30-csi", },
+	{ .compatible = "nvidia,tegra30-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
-- 
2.53.0

