Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A533E5EE3
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702762; cv=none; b=uqjfoWEmeWDxKqLrxHPKV3B2kMpyep765XnbU8i2c8k70yXmwKWI5vr9xbSdV/nngyKMNXhMeonSsu1pZMxKBNafdULpvcq6+YEyqPLld0UkBnf3029mF1LjUI6ZmJyWyxA7QusBxGkfJb3z2t6znFqRIowF9IVc9yYPJHNMhTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702762; c=relaxed/simple;
	bh=WIS3BgyrEbuPFk0DAL3nE3V6IGRFLo7gF/BE5feLCxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5BbJ4nmysI0gL+cfBJ4EzsuSRUrwfvMnUxoXqBdR5ZcFlfvnFxc9K39mRAaDA4SMdfVzrytuM4XYAAL9sIU5NJeIV+UHK5fuNiGZZHs7v4sSgKxQpNpTBXR0Jh8TsWcuwM1+L5LHjAO5yvi5KTFUDEyXHdnDz43zjXPvjAQ4u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpM0unlr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpM0unlr"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ba4a1a0325so63121555ad.0
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702760; x=1780307560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gZEIwW5TqIv7uy+nwwFRwQeWX+dkGvQ9eeETlxlcvg=;
        b=gpM0unlr/txfpfQ98Z0NxHMiXadyG/u3H77MKNYwwrN8ROXRltEiCNED7Ekb98PQcy
         WOFUI7QFXNNXa0/Qw2wKzXL8mWpYfFUlZpHY+UGqjkmIUpLX2Gt9eurL7VDapGKdf00Z
         h/7bEEf1KvuI7OoK/3Tj5IZp+Tt8tVhSjsxfKMKYqBd4mpvHa5aKonr49smKLMKghBQj
         vg7Z9ipnZKvXxo8QHW7CuqWEbpHTT8+45v34Pb0ZnDgRIz32+f0h/Osk+0GiznhoH5xO
         IsfR6aAE/iueKD+5rbW+NnbUu0u2HZZ4UY7flmJdzeqOXYw5Iah8hFthAiEpVVkda8Eq
         8xNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702760; x=1780307560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5gZEIwW5TqIv7uy+nwwFRwQeWX+dkGvQ9eeETlxlcvg=;
        b=ckCwUv/KDipfPuO1gH1zOvpGNhpgptuZqHR+s9HJF9Iho3fbPATb1+ROFgq/ydWdHe
         SnKQuj+AI+SKmyUQSYsx6MQ/jHalJUdAO6oPLqJRzs9R8FcV6ZAOSjtrxC2c8AXlCuoJ
         1OW5DksXbibl8WXAi/Gkg/LHAI+PM9iBuZwLTD8MX1pQmMq+kJcB3tIHeVlNzhCrGBYV
         NtiyIe2oFWVXippNcodmmvOTFNkrcsDtNmZ3J/t7yk/yC+EEjg6BNb4gvSKt/VbF1mkp
         2SDGJ1gpsHiHP0UGJvB6BzsO/n/c5sa1J947wCLIjUaqgfmUgTqj/AYsHZPoMJ02p8re
         XuZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RLwAd1AXWEQ8m/OrkQnoTTuKpMpJBSta/HltEcZx9c/+aqGPDdMov91biRduWHRF8z1T3BF5nD322cFvn@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5r/oGQPs3FRhYn4EBF16cJfT/AfXBesas5WK1Fl8eBovBgagc
	ei5OphxzU9/tFnKtsAsZcJ6cLp3VXxE6lBQ0pYCu2vaHjtXqsoTm4XEm
X-Gm-Gg: Acq92OHgxILFcxC/KpNrtNDEBufoYUqMj94UAs7AvwSdFGwbMSZpM4J8/osLuSGBMou
	YHxkDj/5Es/H6opKq8eygUZRsaQ8vuGzLo2MWZTAeG+6Xh899qPmDiiJZFaxIjufYs0FK4n1DJx
	qby/YN78rIcVJY/STfk0GpWqlik5lROqrQAXsZe+jguCeyt6vw1thHMR+ZqeTcZFLmJf34jErCU
	NLVICIEYKCHNNCwTYoY+Neuc62kzLHFF88x8kc/aggjeS4Y7/SrgzdOwA0KrX8cVqXFxxkSPXUO
	wsPc7O1Rpua06pf+OL3uQP5uX0B37KazaWRUV4n87sES9QtpOLXHtfBf/bwVHRHRjmQG0u9c2pI
	zvTQO3D/84rhkfN2dx5GU1XUrp+fMDUV3/aLCMuBJjZVrHjMfevS5bfZT3XaXubHSd7pVa6J6Wg
	uuSc5H2t2nppc0I7Il1VuxiHfOVS2NBw0=
X-Received: by 2002:a17:902:f70e:b0:2bc:8ebd:af76 with SMTP id d9443c01a7336-2beb03466afmr148144335ad.0.1779702760099;
        Mon, 25 May 2026 02:52:40 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:39 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 1/6] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Mon, 25 May 2026 15:21:49 +0530
Message-ID: <20260525095216.12078-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdec_open() function previously jumped directly to err_m2m_release
when vdec_init_ctrls() failed, skipping release of the m2m context.
This caused a resource leak.

Fix it by introducing a proper err_m2m_ctx_release label that calls
v4l2_m2m_ctx_release(sess->m2m_ctx) before releasing the m2m device.
Also free the v4l2 control handler memory allocated by vdec_init_ctrls()
in vdec_close().

This was identified via kmemleak:
unreferenced object 0xffff0000205d6878 (size 8):
  comm "v4l_id", pid 5289, jiffies 4294938580
  hex dump (first 8 bytes):
    40 d2 49 18 00 00 ff ff                          @.I.....
  backtrace (crc d3204599):
    kmemleak_alloc+0xc8/0xf0
    __kvmalloc_node_noprof+0x60c/0x850
    v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
    vdec_open+0x1f4/0x788 [meson_vdec]
    v4l2_open+0x144/0x460 [videodev]
    chrdev_open+0x1ac/0x500
    do_dentry_open+0x3f0/0xfe8
    vfs_open+0x68/0x320
    do_open+0x2d8/0x9a8
    path_openat+0x1d0/0x4f0
    do_filp_open+0x190/0x380
    do_sys_openat2+0xf8/0x1b0
    __arm64_sys_openat+0x13c/0x1e8
    invoke_syscall+0xdc/0x268
    el0_svc_common.constprop.0+0x178/0x258
    do_el0_svc+0x4c/0x70

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: update the error path for v4l2_ctrl_handler_free() as per the review
    ccmment to fix the use after free bug.
[4] https://patchwork.kernel.org/project/linux-amlogic/patch/20260521073449.10057-2-linux.amoon@gmail.com/

v4: update the commit message to add v4l2_ctrl_handler_free() in vdec_close()
to adderss the issue:
  This isn't a bug introduced by this patch, but does vdec_close() properly
  free the v4l2 control handler memory allocated by vdec_init_ctrls() here?

v3: https://lore.kernel.org/all/20260520044046.7553-1-linux.amoon@gmail.com/
  update the commit messagee.

v2: https://lore.kernel.org/all/20260321065408.209723-1-linux.amoon@gmail.com/
  updated the commit message, applied the suggestion from sashiko below.

  [3] https://sashiko.dev/#/patchset/20260321065408.209723-1-linux.amoon%40gmail.com

v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail.com/
  tried to address the issue reported by Nicolas improve the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..18a22b79e835 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -889,7 +889,7 @@ static int vdec_open(struct file *file)
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_release;
+		goto err_m2m_ctx_release;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,6 +913,8 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(sess->m2m_ctx);
 err_m2m_release:
 	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
@@ -928,6 +930,7 @@ static int vdec_close(struct file *file)
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
-- 
2.50.1

