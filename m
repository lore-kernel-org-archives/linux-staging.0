Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586728;
	b=KihgIm4r8wdZzWmOaKyW9x5TmWtXUM5r66NGj99Dp0ms8+/0weuA2ubUKsf3/Pg4fY0f
	 jY/34XmTCL6frQHWdK0ScoMTyis8qzSPKmeTLmbxUOgbTSF2XvHk4hTsxqb5bi3upzcx/
	 oyYlc56yGDvyKa1aGEPtZ/h09BV2q8ch90DcHvpF4OJd6qR7Ij2ujk3rdF1xKVjk2JxPb
	 Qk23vKu4fKPYlkTrwDrZKSh47CYEku5PCJ+IKvGBy6aW6tQDwwuzq64etwkKjrNWGQr0t
	 v6wwxn+wCmu7Rz0J8eWJ9BWqT9d9phkipKulNqYZbG58iuN0qbgdO5Dopm0zuz8RO1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XtCH8WwTweMS9Ucgtu2uo1F4H13X1qJECuCGrC2rDzw=;
	b=D+4ZnbjcECP6EH3KVnZ3XdPiQT/UxV8iAfNVX1IPJdFqdwa+UDmCbAAkxJ/S2fdc/1Bg
	 PjN59HGuRbxFsWnSv9oWVGxHRvY1PPw/aikI+4OwVVdD2J6SQNVnVOHXmRHlThocmjyc8
	 JJTsTOMCv1ZRIITqYly6GwBJLcm9DGRo/fLxhHPrwhbrsueOb0dKHNTaRflINhQlEzF2A
	 uEStvP7Qe1MRh5kB45phxhJ7hBu9u0hZh1YKxCQr3NC8AuItDF1hBQYRfiqWzuxljUv1a
	 nOer/ULpQrZpS3OefK9tyX4MX7NLP6mcQXnVBNbNDKPsKRpvhVcMQ65VnBMf3lFfSAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M12RabVM;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B0606D46D
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 16:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 156B0606D46D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M12RabVM
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso32967766b.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586726; x=1795191526; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtCH8WwTweMS9Ucgtu2uo1F4H13X1qJECuCGrC2rDzw=;
        b=M12RabVMK8sNz1zq84lnF0pJ5+VhoSrLEy/i5rFuJM12De6MqIQnZkEwP96kqPVHS+
         Xq9lKl75jAMSRR7TrtRcns54Am1BULFoNmTQqXutotHwlV35TU1oR2fn56YuncgyeKt0
         Z9D3sNxZqq/+dAVToSJ0Xa6Z6dDTcmEIzRrnC4Er5YI1dKNw2ggq8GfsmkfdySRjKX3x
         prx7qxMUcDwQB2zsDFxr2xlAV5u9MkQHWHujOHb9rnV4pfNek6ich0pAyt4Tvbv+8QCc
         8loLAJQrs8KQb1io/+C67AuoohccZHRco3yghgnhJT47jJd77gksBN6erxaFLAXwr7YX
         JFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586726; x=1795191526;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtCH8WwTweMS9Ucgtu2uo1F4H13X1qJECuCGrC2rDzw=;
        b=OTahSij4d28rHEisor4uWN3sOgC69HbiPok/dXeIDB5m934on2NrmcU53ta/sKOZ8d
         78Ih41dchP63Gs8U/JR5tx1eS94xATgdf8aoF9tUipeqsg5psnDLaYnvAJ3GT5VkaEi4
         L3EZ65B8+N/2NIWAbJJHUuujXblv4ZHvbkvDY6F+8oHPuB/ICUT5VCYWPTEM72mKkVEE
         20w6YDXUbdSdeLfGKU6IoGH5cn72uBUkaBdHZgPtOQWOvM5/cfKs1irv9DREX5M6K5PI
         9eORc/omX6NdlswI53RXJWUy5lID47CjMEbHkpqB5FQkigvh4TXqxA/aFgqPRaefR7F2
         cUpw==
X-Forwarded-Encrypted: i=1; AL+hErGGhEi7EC4cg135SxJhdpcpmcQw30nzGiecjmVfndXHhQBS4n+fnaZio/BhKP/qB4bA4RbKy8nVxK3x54f1@lists.linux.dev
X-Gm-Message-State: APuU4Z+Tn1oSlEEgcgtqPngVnoidaEwrXMZfo9Kw7/BP/v4Nhfylb/ap
	eWdTPS23/ErlchfWuX7SEt+AsOGUVaGehMzIvHFcOslDnTBHxrSiKih+
X-Gm-Gg: AYBFou1+lX29IHDtpVUFhUgO8W3wCR1QTvmgVWQwXwUczzxWGJAn6IjtazENf5zmOPA
	e/KptByBMTu7P/LhtAYxV/lAebL0Wk4PFX/ZMbxGL2Fk0huVg0s2K4wbIVmzPyaOsjUviM9bzAd
	6Zvkv5DKgVEKnLif7/v3oFbylNvYnYJLep93VY+dfvfWdHEsrEahBb/Mn6U4ex2gSv1GMZ+Vf41
	RrELB5C1UuMH5BUFA8fm+NKLgccXF5i+tHKIm0TxoY4Ab9/eQkdIvpqDXvva4Q2n0anflc7RzA3
	EDASYqyevdxfnXBux8cfwIPigHYKkO8X3aXAtdRnoQ01XsRTZ5O+FlmGf8/3cADQE6XcDeHXGKg
	/5RxLz60/r08GY4+NGMf7nMKjeXoX/0O1qcj1fd0v7PTUZAzO/TSNeOO6s5FZJ6kjO6+84/RpJ/
	RBBqtu4AlRnhDlM7mpMiI/Zm5wfZcNliDzlo7Vikq+OLVa0c+lTpzjnGeKTXOqfa0nx10zm3f69
	ltqCyYg6qcfVZZl5iOqst55mnwu2NPAA7UgC9pjrE9v70H+DbJ1jUHcHgEnHfFFNXCmicrKswVQ
	JJe+On6yeVWlBWsLBVq4jw4ukcBceFQu8WDS8HeUdy9TLm3i3GQSFIjjl7I6kLk7P7xtSNU2G5e
	t/VVM6GwzGg==
X-Received: by 2002:a17:906:4795:b0:c42:2f4e:522a with SMTP id a640c23a62f3a-c509636a806mr256654266b.25.1794586726178;
        Fri, 13 Nov 2026 08:18:46 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:45 -0800 (PST)
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
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 03/10] media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC descriptions
Date: Fri, 13 Nov 2026 18:18:12 +0200
Message-ID: <20261113161819.36847-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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
index cdadff98eae75..f27ecb1ba29a7 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra20.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra20.c
@@ -809,6 +809,15 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
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
@@ -852,7 +861,18 @@ const struct tegra_vi_soc tegra20_vi_soc = {
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
index d8c77d1290efd..12eaa89304e84 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1935,9 +1935,12 @@ static void tegra_vi_remove(struct platform_device *pdev)
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
index 46328e488aa38..ff5c9deed4c88 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -292,9 +292,12 @@ struct tegra_video_format {
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

