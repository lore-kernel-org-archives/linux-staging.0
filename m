Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99478408604
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944651; cv=none; b=gQtz/UHNCc0XqX1XevMezk7SAfICgnxN9UeOv0s6t9rxa3hkNCe7WtTtuIeKDYzFdcRQIc2MfsiwjJ2WFLjqQO1C0AeYYhR6Z8+VehsRxtKvCYKCjck9Fawn3J1TTMfA0DPotScb4yClu5e2lVhlkml36wRHx9aeiXG83jJ6YPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944651; c=relaxed/simple;
	bh=86BevP00Vb2nr0l/gWPTl/2RFuTXiK146v6jmeBi3CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E12+NNedwVccS8L73EVNWgtKFRc7gUkxuQoW1i1gYPCsxT/TA0Idc5e+c1C+Wfig1jaOXA34JVjC5tC5tsuiYzCMWA8YaBdf1FuajyfehuUJ02TqB9Rcrn+IInSwqZ8fc5rJ1R6I/YprJOQ5SiFEupT787ClQd6wN9Fc3Y0qVYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2/uY/so; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2/uY/so"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-caf707e3a70so506892a12.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944650; x=1784549450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBddtjFYWhyXG/z7saOr360Gpb3JLBOtzUiY/pJ38ko=;
        b=m2/uY/so7hVNcw8DhxHFiTeGlmiRhHFHBU6kiJ/FV4N/OAf2n2nfuibDX6ai1ipimp
         cQibuPntBrha26xUmw34OCfmhCt+hK9y5IPsAnEhNFGJh0eFJJorZh5VdbqXrkJpYV/y
         dMop3a+PxPYrlhsAcdbz148VVJOWGDCb4IK8TEbIFo+toGwY2h4hqUYJi7QGq0LZ+MPI
         4aDi0Z3FL7KNQM0EjeQwPAZ4Ev+FqJ+RY4lltVlz/Z7Fl8w4hPJDZHSptC9Zg2zEkkIo
         qfDK7y+WrbSnr6jMWrWL/B3xjtLq5tdaNYlynbhR5cP9fN4NYtcXPMZeRfwPSWEI4wt8
         0L3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944650; x=1784549450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBddtjFYWhyXG/z7saOr360Gpb3JLBOtzUiY/pJ38ko=;
        b=qHoGihKIql3vXzAJwLzEEAquRYqZG2o92DCl1pw850URWwjNnkS8xRNPYcw8H/QOtd
         dEkqJH8KUyIHi7aZRLEgw6TnCy1FvI23MMuK4ZGB6VUUMmFDC/XApDS4DlfgaZ9DjEw3
         bLB51H/Ch8Mkhn0LkEBOcZreCSRo7+96l4vkO/vNVkisq1DnOsfRCiS+w3JBjV/ifJV0
         S2VkMaYmdoA4sX79FLJr7/ChrhFybjif6gCq3KeHKsPnMZzdnfI4D3Gsjh9ogJm/MwYu
         2sLkWLJ/a1O+/lC0BSIHfK/yWakxfsirB0gp81FgVPHTln4DB3wxuKM+kgK4HAgxjDMD
         9doQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFmvfqC3HOEckyUZwKzQtEC34stNervxW5HBLNMQwZN6mDW8crNBtV2EHvE+XmKgJme6xubLusWYQU7CRk@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ8ajtiIxuhA90Qe+DLqtLBSMfdchgK6Iro9uhOE8a9JyF6gHQ
	Y9ummXGcYCTI9PtR5Qn+26XTHOzqVRING0CZwLr3BOZjxP/jo7ziZgAA
X-Gm-Gg: AfdE7cnC1Wt/RcKddw/ZZwGufge1rTX2qwgA1vDVIKtGADNoYMR4iTRoi8SuJBwliZa
	/DP82uJsq72gLV5ec+JWOg/jvveQyqNqzPP0cVadsEUnzkRqWe/2ORpBwv085lAAzvPsMRD7EXb
	f6ogCJ3OTJZsPmwVVfrH9Fvfw+YN5G3xaelJxYx5Ty6VUJitvJh8ZS2P0P1kt0sAfTTdnqvr/U7
	+OdlVwwX5Qpvn4s4ln5UJMY8WheTGH9LFhZeFlrvksOdY7tsAXSTvwomlbQSaza0JjZRmVKcnxT
	x5OW6Y1vu4X00+MqB9Felqr07UMkeEjvvxkMqIR83oVGJGu5VuwpcGeaSLPguewSqmvKgCwlGNM
	rejjLVv9czoa+HtjA+zOH7utt93su6L+7rfRxavZtqzoQELEPmWRaH7PqVqcTUw0NwXmVHFIWLg
	pls4MngDgl3myo91V9Cri7
X-Received: by 2002:a17:90b:4cc7:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38d13768de2mr15327432a91.4.1783944650044;
        Mon, 13 Jul 2026 05:10:50 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:49 -0700 (PDT)
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
Subject: [PATCH v7 11/19] media: meson: vdec: Update core m2m stream state during transitions
Date: Mon, 13 Jul 2026 17:37:06 +0530
Message-ID: <20260713120840.17427-12-linux.amoon@gmail.com>
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

Explicitly update the V4L2 core Memory-to-Memory (m2m) framework's
internal streaming states when initiating or terminating streaming on
the device queues.

Without invoking these core framework helpers, the m2m engine's
bookkeeping of active source and destination queues drifts out of
alignment with the driver's local 'streamon_out' and 'streamon_cap'
tracking variables. This misalignment causes state validation stalls
and incorrect polling outcomes when the device is subjected to quick
runtime cycles or strict testing setups (such as v4l2-compliance).

Fix this by integrating v4l2_m2m_update_start_streaming_state() right
after a queue is marked active in vdec_start_streaming(), and pairing
it cleanly with v4l2_m2m_update_stop_streaming_state() at the end of
vdec_stop_streaming() before the session core mutex is released.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 83a9b1238972a..0eb39aa6014ee 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -299,6 +299,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	else
 		sess->streamon_cap = 1;
 
+	v4l2_m2m_update_start_streaming_state(sess->m2m_ctx, q);
+
 	if (!sess->streamon_out)
 		return 0;
 
@@ -529,6 +531,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			sess->changed_format = 0;
 	}
 
+	v4l2_m2m_update_stop_streaming_state(sess->m2m_ctx, q);
+
 	mutex_unlock(&core->lock);
 }
 
-- 
2.50.1

