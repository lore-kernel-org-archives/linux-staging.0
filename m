Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ED939EF0B
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134317; cv=none; b=pVJQDsS8CByE5HLsuNjvbp3Cs8fVFXB0/ZvQMyqbwzTkTFBUsLwzc06zVoW+qz80ygT5lCYu8nIURvcpbshy4FRST746LPgqoqROraZ6uNYA8qx+dKFKEGyk7nOPkfAuxbSINDPcsZCXxbfsI17EJT1/ndt9N7xroJNJrPs0wqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134317; c=relaxed/simple;
	bh=r/mFmOM61+eHlTftM3kVYPBjuVOCnP0h2xGjOd4i4LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L10obzGRmt2lIchGTrgguAp4MAY7HYJ0zRLciBWylhekqgbQq3y1eJ+3mzanX8PRHRXq4ljwQhk5dDIWzdHWPl1FdGTbrsDWhETNm68T2uuvZmljdedodZz9rq5yXmPdHbRFPDqtkUl1IYvAInZfrCNO4UMZtvVf1cSzZd4ig1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMGLA1uJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMGLA1uJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf008a99d4so29393225ad.2
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134316; x=1780739116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5aJiRofz4S8JTYcjNZpyXHhE2VKKeRqZ24DGJJ/QHU=;
        b=ZMGLA1uJ2PSzd2dRklbC99m4p1nQIIHGQp0YElRd1tUe1ybpD5IGkeZ/wI2nfPhddu
         SiXdzHZgINtlPLjRGRNgkgux87zZuHVcd21Kyq8aVLoz0idwRCfK/oOAb0Xpsi2gPI7s
         bSjuG0r9B0ojlbxo3crlIJGbY5apSNXf4TeNxsDWK9bJxOvub3j6L8pC3IwOV1xIgDI/
         shXRjYM3dpdjRJoe2D2Jxj7HWaI6wii+bbadV0clJLPDAv29R2ztMZAiwNrsL4jsRdju
         GYV7vPr8Fa3Qs0zcfAkf5HPe/qEk4uIkKwkwAcYWn1x4rcci+i7gsITOzINgWLNP8Hgm
         YuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134316; x=1780739116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5aJiRofz4S8JTYcjNZpyXHhE2VKKeRqZ24DGJJ/QHU=;
        b=lvCItZ/X2BUGIH41dQigLOrsTbUV4VHnTNXtD8JHjeuiVJ8EeMrrd5DWUlzCl4fg0b
         6q0D5bGKp5Jqjw9xSbw0yyOBqsI1u4AYyM1BAr5Lpy5uR1krASq5z3Vu7geVuDU6M6QP
         yocsO1AIYwN8dZi+tfHcVJtuWHEc9QBkRrs7C3SnfQOX9WvxNbRsc5plM2GyvrmWb8rs
         YBrIVCnzqTgrcqwH0J800IwjG5hDradv3LzSLtViL0E2K9iaLGa043LR02zPSokEwHi/
         q6Pa6sSJN8QPgj+p1LBTOLrQ8yGRMyagWNYhU7HGbX6sTQb9jjDci0ZbBGgGyXB/FUr7
         1NxA==
X-Forwarded-Encrypted: i=1; AFNElJ8KAD8E3ZE9/lITF34wQK+4IPvppbBocFNBYfYkbGClERTPPCK7vMvPH1x1LxWgPXhLIZHNRUODE8B2rzT/@lists.linux.dev
X-Gm-Message-State: AOJu0YzScwI5GVHZrn4kZaDpXpjwlSeWv9ytvQf813ppiKrbLvC/ymWL
	Js4WjQDg6pFecId5JBNn6D+VLResSnWQUY+wVFrOG/QI4S3EJ1UH5XYD
X-Gm-Gg: Acq92OFGeQp9fxkq8jwLoyP3D08uOzy+V1irJQ4wZLhttYOlRCY21HJ5PtvmPeYhN34
	o290okiEBYtjdumGcj6C2BZ3evST8Q4MZ4Ym3nCX+SS7rSJejx0VzYen+uO4VCWq/rScfYJGTJ2
	k2axppwLAHj0AEZssy1+/Yj7XJVO1BQXHBnSmKgt0IBHqBkQD5EgctGLKceWcpldt5Zt+k+Br+1
	tBHcFD3ZhAtuMaIO7lF21yKCzeOagzjXj0qGZs0JXVmU8fMzk2TUlK8N73k5JAJFgJQSPT3M43h
	ZvNUMzCrFj1jx4iUa8QoEO702nylK2yg6Zz3a3UPXTvYv9KRkbTMzguCKeoub3J0CjySb1AHNl8
	ydvxkYnwcaN8AiwLa1WVi7ik6EGs2ucaBErrNehm45RrMM1sFsEYx4ELw/NrdJAGyiIigrNCXbv
	H59Lny63GJCeTB/K3bzzJ8SqiInJXGcJQ=
X-Received: by 2002:a17:902:e88e:b0:2c0:a3dd:4e6c with SMTP id d9443c01a7336-2c0a3dd4f17mr23090205ad.38.1780134315999;
        Sat, 30 May 2026 02:45:15 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:15 -0700 (PDT)
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
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 7/8] media: meson: vdec: Fix NULL pointer dereference in ISR handlers
Date: Sat, 30 May 2026 15:12:53 +0530
Message-ID: <20260530094326.11892-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hard interrupt handler (vdec_isr) and the threaded interrupt handler
(vdec_threaded_isr) directly read core->cur_sess without synchronization
or validation. If a streaming teardown concurrently clears core->cur_sess
to NULL while an interrupt is being processed, a NULL pointer dereference
occurs when accessing the session fields or codec operations.

Fix this race condition by using READ_ONCE() to obtain a stable, atomic
snapshot of core->cur_sess. Check if the returned session pointer is NULL,
and return IRQ_NONE immediately if the session has already been torn down.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index f99335effe17..3897c75b19c8 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -996,17 +996,36 @@ static const struct v4l2_file_operations vdec_fops = {
 static irqreturn_t vdec_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+	irqreturn_t ret = IRQ_HANDLED;
+
+	/*
+	 * Use READ_ONCE to secure an atomic snapshot of the pointer,
+	 * protecting against concurrent clearing during streaming
+	 * teardowns.
+	 */
+	sess = READ_ONCE(core->cur_sess);
+	if (!sess)
+		return IRQ_NONE;
 
 	sess->last_irq_jiffies = get_jiffies_64();
+	ret = sess->fmt_out->codec_ops->isr(sess);
 
-	return sess->fmt_out->codec_ops->isr(sess);
+	return ret;
 }
 
 static irqreturn_t vdec_threaded_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/*
+	 * Prevent late-stage threaded interrupts from dereferencing a NULL
+	 * session.
+	 */
+	sess = READ_ONCE(core->cur_sess);
+	if (!sess)
+		return IRQ_NONE;
 
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
-- 
2.50.1

