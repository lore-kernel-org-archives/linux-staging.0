Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5FE40B6E9
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944674; cv=none; b=D/O0IKNyB2lnftNXjr/L6863gukhuyv+bjY3l+BnPgWEmANI+2PX9tj8DANMPNRDoqHuaSYiIfClxbXaNypwhbeUMEPi+eAq52vS+TZ5eRUQ+t8OW4W1cJuAub7emcnng3D+mziI/Z5VGPkIgVJaV2QiPcdtoQsmPlqBk9fQpUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944674; c=relaxed/simple;
	bh=zCGdfwgN+TNG39gAmZu2s6yLUo3JyS1qCB3nKCP6UcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8dRaZsC5CxR5caKauOGmV9iel7xwJL7PJoJ/TiQeLV5jQUWtf5vBuN5hKM+VytfMErTnCPfF9NHtBzt+TzK2f3oplF4EyWrORXhXzTNWShUGnrZ4p9NoUpM9NcrQcOEDuJ2M097zCAAtVoADRyzLbEaLVamM+mDQVMrC56Z+nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9D9o3FX; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9D9o3FX"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3847e8b0f3aso2506317a91.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944671; x=1784549471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnt3ypfWeNL23UY1KrHNZewux6mQtgVXM5HeMULrIrY=;
        b=D9D9o3FXztSRy+AHN1i+UeY9dzJLLDKiKq61k2MqETe7JS1DmliigPUmUwJ9ovaJHg
         2IZwf3+rpGLRiMLnhZiJWG1rdgo2dj21WXsbicK5yJ7PKzJQc1lCvK9seLLJI2gQkhW5
         AHIdu7FPhKDfg3k3kKrvW/gLfJiy5OiD0/CPYva7B9Ai0ZnfCiOJtxXRGz3OomPpUlak
         Ydws1xJKycmUUyTCTfCjdor6gignQ54K8XP3DRMdtDR7sWr7WJwwD0Zwb7i6dDuaw/vU
         lVUWP8TzPJTbBmYUQ2k2hq3vJicnmtpub3vh18xEJe+2CMA3VZCybCeuqUNPQfLfP1cu
         O1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944671; x=1784549471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnt3ypfWeNL23UY1KrHNZewux6mQtgVXM5HeMULrIrY=;
        b=F0sKhQKw4A4pEfUuj2acAeHGlkfLZUYHiFeDnlhHnolPfov5xzfxcMahEoAJpXrZ9n
         vgPvGPmtlO1OUMXxzYdU7zUL9TlyICT9tKYk7xjCO9XbGvnUbyYQTTC2ETmmSgEVhBW0
         UWS/KJYzMAIqaL7ydlegpFEgDzT/gUXgejxdoaZR6gUc/n5bIk5ZwKi0tbx+c3m2vful
         kUKtJ1AOwBrpGe1VwIO/Gqb/4dVj9D5px9Wc+Rx6FGjbMqVL6UwXgrtZTSXkt2Ma4b2m
         1pSVERXBDwUIRzpXhdv8Z/m7Szg798tCisYucDYipZ4Dg7BgoVtBH0Jm4+SF/jwxe+yW
         fGvQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/MKkOJr1zVcwi3N0NF4lZYFyydcBOg3ZHkc1onVPR5ND/NUBIblJbwcEY+AwdS+91/iYWRTD0HKpPIpFX@lists.linux.dev
X-Gm-Message-State: AOJu0YzGWSpNOqO4wZDYONNjooMK/fCe+c3RXNdYWj2Ux6SeVhy8/GyA
	TXdwEj9YTj1dYJTie/M9xE1wXbvCgENDHq/j7l2QzxHggvZdqnINe6b/
X-Gm-Gg: AfdE7cnQGzgy0DfoKGfuxTBC7YSl/fB2Wz1y/vzAMDzLN+oYA/q+L9AegBhSDvs685P
	zmUlTnGDSm3PuNO6vHpiqNad2JUko7kVT8Vcl5b2qPl+lGzdKsqsemoXokqyRA1AUjkS3lKrGV1
	B1GttNFVHPIY9oqR+M/HzAPTaISi0XD4ah3sFpWrzxAFHrm/HLlD1BW3rALnHqnIKjww/d+nNDk
	sIJVePpy+LHWC7WAjDXZ5Ej5AMJCyiGsFDT+XLQ0o4LBlWF96/F9BieyRB581YN2UD6ZecUsJoj
	W1LTiAXKr8bM2Ia40fah4PcaTTfhn5ISvSVer9q5yJdSsKIyIDefP6Fl+S34pFHsMWtPwNW9+ey
	+O4lF8BtEsFbLCDm7Kbz5dgONXCJtIFmXcRiHG56iRWOOZgjdjWfa8g1fMVznjSq9K6BrwJ7rFy
	hVIKCjOElOJsZVQVO8qvCE
X-Received: by 2002:a17:90b:4990:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-38dc74c4c2cmr9218450a91.7.1783944671501;
        Mon, 13 Jul 2026 05:11:11 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:10 -0700 (PDT)
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
Subject: [PATCH v7 13/19] media: meson: vdec: Fix race conditions in job abort sequence
Date: Mon, 13 Jul 2026 17:37:08 +0530
Message-ID: <20260713120840.17427-14-linux.amoon@gmail.com>
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

Implement proper cleanup inside vdec_m2m_job_abort to safely stop
the hardware job sequence during a streaming abort or teardown.

Without this, if a job is aborted right after being triggered, the
deferred work item (esparser_queue_work) scheduled by device_run
could continue running concurrently. This leads to unexpected behavior
and potential use-after-free bugs if session structures are cleared.

Fix this by flagging the session to stop via WRITE_ONCE, synchronously
canceling any pending parser work, and safely clearing the active core
session pointer under the core lock protection.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index b3e1d99e8889f..ac86a9c4febff 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -167,6 +167,17 @@ static void vdec_m2m_device_run(void *priv)
 static void vdec_m2m_job_abort(void *priv)
 {
 	struct amvdec_session *sess = priv;
+	struct amvdec_core *core = sess->core;
+
+	WRITE_ONCE(sess->should_stop, 1);
+
+	cancel_work_sync(&sess->esparser_queue_work);
+
+	mutex_lock(&core->lock);
+	if (core->cur_sess == sess)
+		/* Safely clear hardware ownership since we were confirmed as the owner */
+		smp_store_release(&core->cur_sess, NULL);
+	mutex_unlock(&core->lock);
 
 	v4l2_m2m_job_finish(sess->core->m2m_dev, sess->m2m_ctx);
 }
-- 
2.50.1

