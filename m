Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618A539E
	for <linux-staging@lists.linux.dev>; Wed,  6 Jul 2022 18:29:20 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q9so23217828wrd.8
        for <linux-staging@lists.linux.dev>; Wed, 06 Jul 2022 11:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ipO2NkMUMMvxvzZn2ltri7y+IHfLy0+fza0bQjlk34=;
        b=lkGkOKrNCzdbqRpsx09FoK7d/OanN8Jr9CgkeEcU8CM5aoHdA6Pvhu74nWGVd50Und
         hIfGjNZqe3qCQ25Qgt27NJgQXnGTSa47OFddWoEBSdwb7s5pbP9so+VzOBfHwLBUvSOj
         K/WRLDMeQgAacHo3Xfy0WPdCPHUQRS04LN/j912/BOdpLVJCrfcvu+8YP5coRQzOLy/b
         VWZz78ujP3oOQFeHy0E9BJ3czWex1efyuk4h7eh/+O6QBaR5iuB2s1uvdml7ikROky0s
         ue8NB3jiiaMQCMMi043vRnOB0zZAHPQIw1cAAnhzvMecpLGjaoVrG+LsKk7TWSH3LQ8B
         SKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ipO2NkMUMMvxvzZn2ltri7y+IHfLy0+fza0bQjlk34=;
        b=Mw1OLtzXLRsnyD5i7RK9bWD4Flxcz13iJ0XVhpHeL9uqp410oyzXhCxjkJ9Wci8CnA
         Ug01luGVOXNuZA1ko4s/AWxpW3ehiTkOt/3ff7pduSFsdahXBcWt+PLRjV1oyRFh9cTp
         8ap/HrGmWbDYbKrUEttmiDkOWeNS+P/DOHllqv/zdkDza71s1wEISfsuX7Or9f4euPnU
         NBQOVgHBq29DfPAaqsVlxYGsFFI9ELdSY37XOcbwb+KV/DqwiSk782H/Wx//WOqSPnU5
         dOKYQYzgc3FQobGNqrWdKRQ9O5y0W/DjK1/R9E+rfD3P8nxq44k2IfGpNexGifbUWX+1
         0qWA==
X-Gm-Message-State: AJIora8vAiI3C0QxMBP992m54Crjman1qvG3J/W94e/2ULK6GwU5hZgT
	CVdExiGQOUSXJBYOkScT/sw=
X-Google-Smtp-Source: AGRyM1ux1QIOhjvHQjtoROyzGjFt6VIyFfhw6EWam9o2tDucO6Mufz2phavnv2wM30ROS89HUqHXWg==
X-Received: by 2002:a5d:64ad:0:b0:21b:b412:a34b with SMTP id m13-20020a5d64ad000000b0021bb412a34bmr39603551wrp.161.1657132160349;
        Wed, 06 Jul 2022 11:29:20 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm5142406wru.28.2022.07.06.11.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:29:20 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	benjamin.gaignard@collabora.com,
	nicolas.dufresne@collabora.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 7/7] media: hantro: sunxi: Enable 10-bit decoding
Date: Wed,  6 Jul 2022 20:29:01 +0200
Message-Id: <20220706182901.78949-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220706182901.78949-1-jernej.skrabec@gmail.com>
References: <20220706182901.78949-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that infrastructure for 10-bit decoding exists, enable it for
Allwinner H6.

Tested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/sunxi_vpu_hw.c | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/staging/media/hantro/sunxi_vpu_hw.c b/drivers/staging/media/hantro/sunxi_vpu_hw.c
index fbeac81e59e1..02ce8b064a8f 100644
--- a/drivers/staging/media/hantro/sunxi_vpu_hw.c
+++ b/drivers/staging/media/hantro/sunxi_vpu_hw.c
@@ -23,12 +23,39 @@ static const struct hantro_fmt sunxi_vpu_postproc_fmts[] = {
 			.step_height = 32,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_P010,
+		.codec_mode = HANTRO_MODE_NONE,
+		.postprocessed = true,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = 32,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = 32,
+		},
+	},
 };
 
 static const struct hantro_fmt sunxi_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12_4L4,
 		.codec_mode = HANTRO_MODE_NONE,
+		.match_depth = true,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = 32,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = 32,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_P010_4L4,
+		.codec_mode = HANTRO_MODE_NONE,
+		.match_depth = true,
 		.frmsize = {
 			.min_width = FMT_MIN_WIDTH,
 			.max_width = FMT_UHD_WIDTH,
-- 
2.37.0

