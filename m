Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9581C4404
	for <linux-staging@lists.linux.dev>; Wed, 17 Aug 2022 14:15:29 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C41DC3F0B5
	for <linux-staging@lists.linux.dev>; Wed, 17 Aug 2022 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660745158;
	bh=kSCXGcq5H05zQq19jPsNfhJBW132uDa7sGBTwXgYgjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=KBbSNTjXgKB+hfMjyZXcHlrE4zw1iZCQ4ydhUPhr7NzVd+HkWp2zAQERmXZr2Bk9U
	 a+GxDlEDHEvvkA66dHHxRr1XeQtwNkGYdnU/elZFwEYL+NN88VkJDmYw8Po7FAWmNP
	 dgDWk1pzTvEj2xvBfknUamhZe/Hca+aZmPtFlfz534eSVP81tdjmw+793CKchrjmph
	 vOW4kE7xSHVCjF7oYM0Mp/JIqKyjg+AvutW9mHwCu/A6+BBo1QRmg7w0l9viD6WXgL
	 RvdR2Bu61L28FfWdJpOnzc0IcnyM4TxRaHIBpT5vg/V0c76lr3xd5HWTeg0Nd9alzG
	 pz3fy4K4FBMXg==
Received: by mail-ed1-f69.google.com with SMTP id x20-20020a05640226d400b0043d50aadf3fso8975847edd.23
        for <linux-staging@lists.linux.dev>; Wed, 17 Aug 2022 07:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=kSCXGcq5H05zQq19jPsNfhJBW132uDa7sGBTwXgYgjg=;
        b=OYi2/xTFSEuiBFmsEXQ1MUYg1e7l+/iYRCdH1tMmQeBWv/VLLNDk+w3UVhG0qc6UOl
         FOse79qNpG+a3B/ihglc8ObmJez4ooCv9c0LGFc29aCCuHsVwloVstPsGjj+po8CyHux
         nDvhjTwJYXhhU94f7B69U2j9JgHj2nHMuzctEe00u7Y0VEjChKYJr5J2B+lQN3AdeT76
         3PYBW8cCiQVqhtTtlFzQuoiYOUa5IxU6Q/Jp+p8OWz25sCkv/oljfgCfltcBqQ12OjY9
         fljDgmaUAiUqNsmGFngx1GULZVQOdyhpB0FvicwUFvD1f0aKTIAtiXAaKRiwgN/2jKvS
         fLKA==
X-Gm-Message-State: ACgBeo0qkBdJuI5VT45iE/1RY3GG+agXKmwXmiBeLnL08RdhkGicvF1H
	Wy95ZeXlCAjwOGQKIUsQLj2HRlkjan8NNRUPzkZy4e8Dtb62S6C1zyK6mZptr0XJ9OEKfpMGGYq
	yp3KbOt+/vlQ+Blk12idAik9s+yhniAAx4Bw3JXf/MRE=
X-Received: by 2002:a17:907:2814:b0:738:545f:54be with SMTP id eb20-20020a170907281400b00738545f54bemr9113438ejc.534.1660745158121;
        Wed, 17 Aug 2022 07:05:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7vF5bJb6zsBPhAQ1W8GKZlyq4EQV66kfHwkKI4Mx/QZf+aSWQo229JOM7T+wVina/z5et9Hw==
X-Received: by 2002:a17:907:2814:b0:738:545f:54be with SMTP id eb20-20020a170907281400b00738545f54bemr9113413ejc.534.1660745157911;
        Wed, 17 Aug 2022 07:05:57 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906309700b0072b342ad997sm6737603ejv.199.2022.08.17.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:05:57 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: narmstrong@baylibre.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH] media: meson: vdec: Add MODULE_FIRMWARE macro
Date: Wed, 17 Aug 2022 16:05:39 +0200
Message-Id: <20220817140539.150013-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The meson-vdec module loads firmware so add MODULE_FIRMWARE macros to
provide that information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 .../staging/media/meson/vdec/vdec_platform.c  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 88c9d72e1c83..c7750d4be848 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -280,3 +280,23 @@ const struct vdec_platform vdec_platform_sm1 = {
 	.num_formats = ARRAY_SIZE(vdec_formats_sm1),
 	.revision = VDEC_REVISION_SM1,
 };
+
+MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
+MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
+MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
+MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");
-- 
2.34.1

