Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBCE2F27;
	Sun, 27 Feb 2022 14:50:39 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id hw13so20017519ejc.9;
        Sun, 27 Feb 2022 06:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=se5fdTdf84xDWqTWcks3tih8Dd3br+tSQjNncikkPL8=;
        b=WsxMOlMSwbUo4F4tfM2v66cny1ddxMCxjW/WYiH2LPsXUP0Dgw0BB4U5alKPAeg5G+
         E0/6lKV+dL/upl6B084xKPuUNJ5OKq2P50p0DTossOk75HFDqMr8p69TYGbva8QvM3tI
         /ELppltgd1GoRKhJfYnK5didNSdoRgcEJ++Y+wZ62VL0lxEqfWdRoioXUfoCZ3NHhD4G
         Fg3U9k/MUustCZxsQDuEHO2KiD9gKEQdEfL95eW6XonSLkgDMl45BZCN2IoID6Yyd9Pz
         XS4DhLDsiolky6cyni5hk1amiOStXP0EEDh5AKOkTs8V3iQpU4ZAEO/i1kPX33L7hqBh
         p8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=se5fdTdf84xDWqTWcks3tih8Dd3br+tSQjNncikkPL8=;
        b=TwrdS4k02LfyALaFBUp9RYp7jKmnLXk4Cz4proEGDSV+TD27GtFvSSQKNAOoUPksIT
         23z0foFcI7VoW8WLzQPUwM9n95JiYID+Iu0r2uDUIpA8z0z6kib4mAWac8Y43jn9THYf
         o94XRc8qWQbvGywd/gzHdHaOFYs4xXXS5e7TVS0IsJ9b0lY1O1FPHHtb1JcSimBxMlj1
         qkymdhArCgJ8INZrzlhim6Z6cNGOsZJDWRJEWv3IYO+iRHGkYRil/jX/G+Tx6Gna3kbO
         qlb5rkANLpSF5+QZI3REQ92DlP77tFCHHY9aNWfRYJH725L72dkIl606XKB9pHSIotvY
         HK9g==
X-Gm-Message-State: AOAM530uoZpUtBqAcQLtLigXL6G5nfXuwySHQXNP76J1gA/CA7HEpslL
	dbZpV0YWHsTTl4H4xZkSp7Q=
X-Google-Smtp-Source: ABdhPJz2uGFr5qrfNl7dYD/dRIIHoDCaicFBQ09kr3aVt9005jUPJ6GCnQpGx27zrb9Kmn6OzpytMA==
X-Received: by 2002:a17:906:2991:b0:6cf:6b24:e92f with SMTP id x17-20020a170906299100b006cf6b24e92fmr12153116eje.748.1645973437696;
        Sun, 27 Feb 2022 06:50:37 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm3501887ejj.142.2022.02.27.06.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 06:50:37 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [RFC PATCH 7/8] media: hantro: sunxi: Enable 10-bit decoding
Date: Sun, 27 Feb 2022 15:49:25 +0100
Message-Id: <20220227144926.3006585-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
References: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that infrastructure for 10-bit decoding exists, enable it for
Allwinner H6.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/sunxi_vpu_hw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/hantro/sunxi_vpu_hw.c b/drivers/staging/media/hantro/sunxi_vpu_hw.c
index c0edd5856a0c..8d8a8937d6aa 100644
--- a/drivers/staging/media/hantro/sunxi_vpu_hw.c
+++ b/drivers/staging/media/hantro/sunxi_vpu_hw.c
@@ -15,12 +15,23 @@ static const struct hantro_fmt sunxi_vpu_postproc_fmts[] = {
 		.codec_mode = HANTRO_MODE_NONE,
 		.postprocessed = true,
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_P010,
+		.codec_mode = HANTRO_MODE_NONE,
+		.postprocessed = true,
+	},
 };
 
 static const struct hantro_fmt sunxi_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12_4L4,
 		.codec_mode = HANTRO_MODE_NONE,
+		.match_depth = true,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_P010_4L4,
+		.codec_mode = HANTRO_MODE_NONE,
+		.match_depth = true,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
-- 
2.35.1

