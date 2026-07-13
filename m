Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127BC33A708
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944601; cv=none; b=VEPI7Is+/xQWYGsZIj3/dc3Ifs13TVyGipkeJR4J2QmyGZCXhoB5a+f7OQ1fE+vRMMu3oxv+RdBXiEklHkyDMa3SMfWpxxIqW/msSfJZVjbVAFwe/tFeQj1UkAvI/buFsq5st2si16L+VPHM39EDFF2fgmY6W8SVYYCPcOIhtzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944601; c=relaxed/simple;
	bh=kWjWrkYR+dFbDvQ8L5AHa4OLzTj4rBUUdqyRkjtvM1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iact4HoOdMWbkkQDMe7qNS+yUHwAp5y7aVaZhsXvfcU75LmLS+myj2INcmXrrR0OqgJRBc3unGCN2UESJxCa1cTrRJku+z62z1DIWCLwzZl2pPqO01vuHZc8BKB2hnfySUXzsGoQdv/1Mt8+f3Re4zHLTvbf2+yVpkUTiyixp88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=obFWv+g1; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obFWv+g1"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3811f512167so3648847a91.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944597; x=1784549397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5VN0Op/PYgxXXGiNzBVb7Bc2A/YDsd2gosba72MniQ=;
        b=obFWv+g1H0J2BeMp0wx7w582EtZpXnjGLZds8IALIFs0LSSpqoGzqOsHKoydAetgKE
         5UAC70YhdpdSn0V/xevbLDq6KTWFuenrozaauTmq03eHzs5QlfdlHA/CVAvvEd0ew/c5
         L+imhJgdOchupc8D27LdPOO6RXf/2hus/nj0D3YNjLfoYWHGCoBsQSxbdo4l3d8Wm0eC
         wysl/ymr2qsVYfzipZvtThCHdVvmcuTFn+SqZLpGJl/KT1ScJCgjKbMt8isAhsi2Umqd
         njWYI61rov8zmihAgjC2Kg4Hwd7mZzhFFAfPvnfH2TNfCei1WeFOfbdBMI1ylVYY34cd
         uHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944597; x=1784549397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5VN0Op/PYgxXXGiNzBVb7Bc2A/YDsd2gosba72MniQ=;
        b=sHTWF2QjiwM9pV2s9n7TpPl8QqrGhgv03/xQdbu3cZCFGLBOE9fKmJlzu8I+RFBvyr
         tOjuRFOq2Gv8/wzhI7ICCWoNUsCxS9XblknYG9dqdM8xUcRfYY26lVh/oi5ApVaBOTto
         fpK76Rz77/EIJZBYYrOgM+D1s95H9v7chqo8V7bR9PwQYlDOF5kf+DnkFNdcFzHRG9K6
         ZfgFShncqpb+BVKg8Yg7FyN4OlIjbekE0qedvBcoj4wfSNVzPfjhcqWeCSO0bWTKIj4Y
         uF4SzfRunciT1Ne2MWROo7uC0kHBk94Auis+olVQB9CE8o1BFgHgTikFSPx09qfdmxiI
         cfQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8OrOiT2v+P71pppoD9c35+hTKkzMlUc8mSH54lLN8vL8kWJr24Y82b15M67JtEE9eh4YiV+t5GeXo/qL1@lists.linux.dev
X-Gm-Message-State: AOJu0YzMbKb/kmf1Uqke2TMLUsB8QeifzRTSMqKy1m2B+YFq3E0WaF49
	jyOCFQazeVkR4vbDAMzDMptV56f6o8IwTqu2SvzuoI1D9lnlwDZCX+su
X-Gm-Gg: AfdE7cnCJx+hS62Rrh4YDrWzKieIJssNlp8kljsu1Qe+vmpZSJqBZmzPNl5YyBV00NP
	uYNogbFarJchZ6UZ2nwp/D1ckouIyAlxu8eZknMKcPKnG39y1UoNISNpCZ5jBRIfBMkQkJIEOJM
	roBrLTPVNR7NP1NZH5Ezx5sVDlEa8u0+WxgjkRSMLcKnmK+72Q0Xm99EQx74Tl0qgD/bQKWxIgp
	W+knmGhR43F9ZM8IuIa21WbNTgziCDWGlmbGLVG0PHdBGuH3umeVtBM+w2geBJCdMOIBCbA3urk
	aVYYbMymNGyQ40erac7yDljCKeeEaq51WDIig8R6l2MwGiZHtcfThtoS9OJbMrgq+hokui64IsW
	LDdciDitK0TtRWdecvhssXtrt/Lf1AQg+TPFXTsXJ3X31bLpSpRN9e+0twGpyGNOA9rtYrv1iWy
	qo9ZYnZs35Fg==
X-Received: by 2002:a17:90b:3c43:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-38dc777b8a2mr8263084a91.32.1783944596948;
        Mon, 13 Jul 2026 05:09:56 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:56 -0700 (PDT)
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
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 06/19] media: meson: vdec: Fix race condition by canceling work sync
Date: Mon, 13 Jul 2026 17:37:01 +0530
Message-ID: <20260713120840.17427-7-linux.amoon@gmail.com>
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

Synchronize work-queue states cleanly during streaming teardown and
close operations to eliminate asynchronous pipeline race conditions.

The esparser ISR can schedule work onto 'esparser_queue_work'. While
synchronize_irq() ensures the ISR itself finishes executing, it does
not prevent any already scheduled work items from running concurrently
during driver teardown. This causes a race condition during stream
stopping or file closing.

Remove the scheduling of esparser queue work during destination buffer
completion, as freeing the vififo is handled elsewhere. Add synchronous
cancellation of any pending work in vdec_stop_streaming and vdec_close
before synchronizing interrupts to prevent use-after-free and race
conditions.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7689ffdb2e500..6fe9722577179 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -484,11 +484,15 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			}
 		}
 
+		mutex_unlock(&core->lock);
 		/* Synchronize and flush pending hardware interrupt service routines */
 		synchronize_irq(core->vdec_irq);
 		/* Ensure esparser ISR finishes executing */
 		synchronize_irq(core->esparser_irq);
 
+		cancel_work_sync(&sess->esparser_queue_work);
+		mutex_lock(&core->lock);
+
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 
@@ -999,6 +1003,8 @@ static int vdec_close(struct file *file)
 	/* Ensure esparser ISR finishes executing */
 	synchronize_irq(core->esparser_irq);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
 		kthread_stop(sess->recycle_thread);
 		sess->recycle_thread = NULL;
-- 
2.50.1

