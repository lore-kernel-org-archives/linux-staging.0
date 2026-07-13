Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31E53F6C48
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944726; cv=none; b=DSD1dZG4UHv9bvjGRRAuZbWrANPYHs3noeW5uwEuLr8v5nBTxyOpB2y3w7P6n2h/wiiMlypJbLNNS6X+Vlt3+uN8QRMhANVuL09sNuLhcPl86dd0BOu7wjWtGdGHBH4fHWE2GBBVkV1mFMvH4oDtDq1lsWLg31cmmdN9VgVes5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944726; c=relaxed/simple;
	bh=ONUAUDigrwjdBwgyupNLuYzWtO9nh/4QSdLBbjitlQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1/XgwEpgwYJLO+YdTI2iBGGuwRz8qrY348OknztI3ahpPMlOASzec+O1v9lqWI3IEZpafR/CrtRssqFBDgWSwqJl8I9AvovvizRHbMGnFro4D9Bfl8qE2H5yJuBvKtHNfpEluvMQ/ga4y5Nom1Li2HvzKMa2H5Dxho0ajaYsPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8hkU00w; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8hkU00w"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2769787a12.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944724; x=1784549524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPxreeozyC9OlzBX8SeJZagWhfw9u0AGRhVPID7x7h0=;
        b=l8hkU00wicO0a6ZboChrnGKFheQuyMETz10IvsWqEkiikdP8N9y6DHhkYYyglsyXpf
         BZHO3J6SBVBYYm0ArY0B+EHKw6kAMKc8FLAXjs19cACt3uHh7bdQaJQMzVkkfwiTgX4Z
         5gj8Xhhbf5stPDVT2YVj8cX7kDe7e/gmOa4YKBGNdeSOIHxFMmO4bD4Ga608dqNpPIWL
         17N4Xki7GD9UR9FbmwH78+jrBQUVeKYAhBDqFGYbtbp8Yrh9h1mdVujAX48qcL912WnY
         egJpko8k48oXsm1Th0h70IS3ssIxBR6HKiRL3Rs8mMDG9Rf/cisBjSop6H2F8QtU9ilw
         ypeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944724; x=1784549524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPxreeozyC9OlzBX8SeJZagWhfw9u0AGRhVPID7x7h0=;
        b=IFPnFDudm/0aIu1pPEFM4pzWHpOY8GzlEoIYGLfnDv8A9bVRKkrh2AxBTyQAOz3txW
         Z8l6mmjsBx8M8ULgWOQLjvQm6gNklr/eZ9aVY/D3ZH1HMLG8bN5RYFj8LxHCpV3H8gHK
         4thSixIxh06ybKvGxe1F5+evdRyHZzy6UJGVee3NyGrwyeAsFiDYzEiSGYexPq4tHloC
         LQvv4URDMFAz/VMHvTYEtlxgsyHPKAwH8m2e0qichoyg3TIuxzVSHsADKI88BRgJm0yW
         a9BPxStgU+Pf9f10d5pf4IPh8orIgMZqWrZ/46UEE8NPCkfLvwuGCuG4AyISNr1vv6uR
         wP9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr0jlj2KmfOno8F+j+d2ZuErWKGx4h4hLrZzHK3a6TiwbdqhhMrV0TvuRLNkc55J/xIwZnv2ami3vM3nYeR@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvlcw92YOFBkmrYzXAzx2qqVIopRJNu7wcVRtwbw+dtgVKxbQy
	JO915VY/+V1d5R4m88UX5zfa7P8iX6FFKHY0SCDbsH92PAcOSxEvlaQ7
X-Gm-Gg: AfdE7cm46JunP+lDgOW4GcX1dY8J4FQ5DEMVxt8ZVPv3dANL7d+GBVcyICdTvxAoArt
	dmBsrlxyFG1+RqD0I9CDjF7GLCgvW9NKrHs9hRpHBw5GZGXXKHxQn/VTGMqDKHWqrlqHr6SoK/4
	NW7Yn5/FG+xvZMOnuLJq9GQPQAVo86UrRc1bVFeq0kfr3Z5AwuwU37whsCRj/u+q0jTqGRHk2hE
	igOZJUi+krI9lf++StsaiWv2lhmq1evEy/Hsr9XDiYlRw74JOqZSOTIK+t4V3G13Yc6FMMxCnal
	C+N27HZFkWW7yAuW+A+3t//yI5Hc493xCDGfM0laBVTMy2MpFVHEUaqxqux1OF7hz+6DhJlmRGr
	I2kV33up57dZoRHPpkBbI8q2QPNPD5IQ30Q7NyqfjfDR2Mg3V6LRYCStyu5fzhrWkXS08lsGXmY
	6+REaZEiSjkORoulb71paipzio4untevU=
X-Received: by 2002:a17:90b:4cc7:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38d13768de2mr15332791a91.4.1783944724165;
        Mon, 13 Jul 2026 05:12:04 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:12:03 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 18/19] media: meson: vdec: Increase VIFIFO buffer size to 32 MiB
Date: Mon, 13 Jul 2026 17:37:13 +0530
Message-ID: <20260713120840.17427-19-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During 4K video playback, the hardware Elementary Stream Parser (esparser)
can rapidly push massive burst data payloads into the Video Input FIFO
faster than the VPU decoding block can consume it. This causes a buffer
overflow when stream usage breaks past the allocated hardware boundary:

[ 1852.587956] meson-vdec ff620000.video-decoder: VIFIFO usage (16779003) > VIFIFO size (16777216)

When this overflow happens on Amlogic SoCs, it triggers an invalid memory
state, leading to stream corruption and fatal kernel panic lockups within
videobuf2 error rollback handling routines.

Double the parsed bitstream swap exchange memory pool (SIZE_VIFIFO) from
16 MiB (SZ_16M) to 32 MiB (SZ_32M). This provides a larger canvas window
to cushion high-frequency frame reordering spikes and prevents the VPU
from crashing on demanding modern streams.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index d33cbebc4453b..824e2f156adeb 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -29,8 +29,8 @@ struct dummy_buf {
 	struct list_head list;
 };
 
-/* 16 MiB for parsed bitstream swap exchange */
-#define SIZE_VIFIFO SZ_16M
+/* 32 MiB for parsed bitstream swap exchange */
+#define SIZE_VIFIFO SZ_32M
 
 static void vdec_free_canvas(struct amvdec_session *sess);
 static void vdec_reset_timestamps(struct amvdec_session *sess);
-- 
2.50.1

