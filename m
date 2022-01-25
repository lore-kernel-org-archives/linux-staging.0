Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A022CAB
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 17:12:49 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id c188so2284440iof.6
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 09:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XdxEZ7YOE8VCe+Ly6ca0cU/orZy3e2bgmci5GFke7S4=;
        b=Nf/57L7y2j6kymmxNnIEbBlYSt3knUksoS+BuxMQ/gMtOGsDWiNXTF+NovrOH6T9R0
         5nxuHmzxDb1qNm0qbxAKkfFWqK9ClBgIPADGPG96ccn2T+NVvKEFsG5Kjt80egTfm89X
         xO1BlhMa9ziZ7eL6OmnRHjZKwzMHa8IednpTfriJ4PBuuFGOuISgxhHbYoSayQtJ3oIG
         jwA+oF1Jtzrs4XRG0CTdNqgBS3QZL0qEN5Sbq1H5281AaDOlIBfMeNtqdmj2rkbeyFVt
         hveJXHXr8iiBAeMSdH6ghTdWccf1xw6+ohFe831H2J14+HM50hsovnVwio6S7fMR+4qb
         YYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XdxEZ7YOE8VCe+Ly6ca0cU/orZy3e2bgmci5GFke7S4=;
        b=j+Z1ezxXrh3k3HR35FPgPfX63b5fAcEdj8Nm85LFuY+3abRvDsvS3msm1IcLFGdQvh
         8hHzMr2Fr38nzmcD2a5kFCfw12NJ9NfFuVLlM80JGqw1vMWJ6N1TE8YNK7o5NgpR1W+R
         IYz5Uv0aGUirgc8eHoHnblwfzV7UOYScqUZeASWT8w1m3xFNr6al/VXuKL1vukQaz6G4
         +lskWX8COdVKU8SJIQd1OcoVz2DdTS7RnU3wXXOMb2QdO40xa8aW0B06wa6MfnPwZNYj
         XUXaCu7FdyGiM4ghuEyVT76vIWRDGHrxaYO0aAjlqW1s4BkFvYcEyGDinOkOh6Bye2gd
         7BDg==
X-Gm-Message-State: AOAM533ZEeYZfGlfESoRi8th/suSANYiO7go4jVpjpBJgkOZEVhWFUUO
	dSGlQOq9nyxlpga/EYFK6+I=
X-Google-Smtp-Source: ABdhPJwZ3uFCY2UY3PIrcdmD6IkV07uqs3j1K+i9dUSqnDgifh7kXW2qt7LOwNYp7nowhjXrJwqaXQ==
X-Received: by 2002:a02:cb01:: with SMTP id j1mr3442600jap.194.1643130768156;
        Tue, 25 Jan 2022 09:12:48 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6592:b6fe:71b1:9f4c])
        by smtp.gmail.com with ESMTPSA id m14sm8090291iov.0.2022.01.25.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:12:47 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: aford@beaconembedded.com,
	cphealy@gmail.com,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V4 10/11] media: hantro: Add support for i.MX8MM Hantro-G1
Date: Tue, 25 Jan 2022 11:11:27 -0600
Message-Id: <20220125171129.472775-11-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220125171129.472775-1-aford173@gmail.com>
References: <20220125171129.472775-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8MM has a Hantro G1 video decoder similar to the
imx8mq but lacks the post-processor present in the imx8mq.
Add support in the driver for it with the post-processing
removed.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index f56e8b3efada..8f020ba15194 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -615,6 +615,7 @@ static const struct of_device_id of_hantro_match[] = {
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
+	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
 	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
 	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index f0bd2ffe290b..c00b46e06055 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -299,6 +299,7 @@ enum hantro_enc_fmt {
 	ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
 };
 
+extern const struct hantro_variant imx8mm_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g2_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 849ea7122d47..9802508bade2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -327,3 +327,15 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
 	.clk_names = imx8mq_g2_clk_names,
 	.num_clocks = ARRAY_SIZE(imx8mq_g2_clk_names),
 };
+
+const struct hantro_variant imx8mm_vpu_g1_variant = {
+	.dec_fmts = imx8m_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
+		 HANTRO_H264_DECODER,
+	.codec_ops = imx8mq_vpu_g1_codec_ops,
+	.irqs = imx8mq_irqs,
+	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
+	.clk_names = imx8mq_g1_clk_names,
+	.num_clocks = ARRAY_SIZE(imx8mq_g1_clk_names),
+};
-- 
2.32.0

