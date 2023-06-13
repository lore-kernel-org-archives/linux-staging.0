Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F4823DB
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 15:48:58 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 350CC3F26B
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 15:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1686670784;
	bh=h2VB2F1nqgPgNlWNC2nzeOkEx2tuyJu/3uifBQZUmKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Px1GsJBpr91+X+7dRDPpYZOSu31kCRXMwUv1yRwhk0LSTw+MnXf3q/0x6j5EMI2Hl
	 PKhNnljqQhYp64fIh0dsOaaY2ENyUvAjU7T/pbozQOHlqO7vUwc7DIwd5njsqZDh5q
	 gxeDlAQPCeEDnq4BfAiNQ4T+ncUVs81YYlWVfvw+Twtlds7tDgHDjh61gqXKpYf+c5
	 SXXGXV8/A+9494aMHL99ZVyGs6CNtDEOn6tNz1alFrVdeZ8ECan4kcqwbDO/vIisgG
	 Mhk4uB9L3HF8h6ByoEMnRXR7/XW4ZiHkTN9JE7KOifUmN1E6ZI2v2cyyC1OHc+rYTg
	 N8U9/Oov+xVwQ==
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30e5c497f90so3310370f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 08:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670783; x=1689262783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2VB2F1nqgPgNlWNC2nzeOkEx2tuyJu/3uifBQZUmKY=;
        b=REF2KHjnRmHIb6TY3ZaWG3n+0D75nRYxIxRaZ4CCkaZx9EIbvDXpPSP/kvXq9gPKLp
         3IBUGFfZ3/T3udcPFOL+Ra8rNRwK3hA9aysu/hNGy7/arellaZVdIbcX99actWQl+HwL
         p7osgn8XVV0Uj8Bee+nCIkkjwE4iML42PjrB2rRVPxAoZRelEK4lA5ugPxodkFtpfagT
         MAA+YnpQLV0DvihmlmNiqICCtxfhJb3Svo3ztJ2Xk7VAXOnQ7SedKtVVwO2lVsTximJr
         uDMW1LFIrhVrrkasZsIayoFHxquGLvOu4zTv/DK9O7dfq2Vf/LAqv11l0fDDg5poOwR+
         bwUg==
X-Gm-Message-State: AC+VfDzo8UgW/fANgK/NIYQ8G75zHikFG2UTuHBspJ/7dsfA35Qj9B40
	0TbtdxLVb8c1PZuSzEKhLb8BxWzet1EM+3Y2Vj6V5s9/RHniNPb3BpiEesV8b7yNguHrVWLUIWo
	DFuYQA7n1PQEDvX0sDWvsJNBFFVbY9gu7/HUExbhic7s=
X-Received: by 2002:a05:6000:1248:b0:2f8:3225:2bc2 with SMTP id j8-20020a056000124800b002f832252bc2mr6846725wrx.41.1686670783783;
        Tue, 13 Jun 2023 08:39:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7u6y5BjGv0z8bT/LB9RrsvWeO5qrDCAe7zl2OSeRDtbWoTqJ0KQBMBeO8sS2CFGRWa+dBvvw==
X-Received: by 2002:a05:6000:1248:b0:2f8:3225:2bc2 with SMTP id j8-20020a056000124800b002f832252bc2mr6846717wrx.41.1686670783535;
        Tue, 13 Jun 2023 08:39:43 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id b5-20020adff905000000b0030aedb8156esm15556257wrr.102.2023.06.13.08.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 08:39:43 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: gregkh@linuxfoundation.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	martin.blumenstingl@googlemail.com,
	mchehab@kernel.org,
	narmstrong@baylibre.com,
	linux-media@vger.kernel.org
Subject: [PATCH v2 resend 2] media: meson: vdec: Add MODULE_FIRMWARE macro
Date: Tue, 13 Jun 2023 17:39:39 +0200
Message-Id: <20230613153939.152457-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230126153258.1558471-1-juerg.haefliger@canonical.com>
References: <20230126153258.1558471-1-juerg.haefliger@canonical.com>
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
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

---
v2 resend 2:
  - cc linux-media@vger.kernel.org
v2:
  - Drop duplicates
  - Add Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec_platform.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 88c9d72e1c83..70c9fd7c8bc5 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -280,3 +280,12 @@ const struct vdec_platform vdec_platform_sm1 = {
 	.num_formats = ARRAY_SIZE(vdec_formats_sm1),
 	.revision = VDEC_REVISION_SM1,
 };
+
+MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
+MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
+MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");
-- 
2.37.2

