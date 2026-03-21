Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51095374184
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076060; cv=none; b=YCIEtBpoZg2mDYk2ZDUa9PIE9NWrgHRl45AyJY5kqSsIEfM20Ed7KWtwhCr/5MdK0JiUduo01xZ8QngZUEOukL9kRTQrQ8SEQXJtwqqZvENk1M9NcLirCR8Mzrl4mE2PZLcD9xTOrL7Y9EjAJCWHGn9vBiEZlqdWuVEE2Vy1hW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076060; c=relaxed/simple;
	bh=o88VheB7Ue9cz3AeJEej6NtWuPSWVpzOFlfKchReNH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V9yeNdRiWvdvQ9hOU0s3qD5qHvCmUszsyGgQXdtWjp22ONGueyo/bcGU4LRish0DsAE4mu1E6Rc7mEuw+YNwRMOo71MPnFQlu03COJ4UV7MW/3zGqLm/DyA62QC4maNY/Jp+gDoxjPdDNhYvSimH58sVLQH296d84UyrWFfXeu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpK558ZL; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpK558ZL"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so897507a12.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774076059; x=1774680859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGQQXI1iMDOQW7zjWSA3/NeC4tENFjL25ABxgm3fCbk=;
        b=lpK558ZLs9jVL6xxRgdqoEvcCKoK+CGiR5od5yCm2wgiFcRCOyiiA43oaachXnY6XS
         Sy49BKrg0NPNwlobnkhDPOjj/h+yIJ8FpE46QBocSiR7M6JitwtlEtOCOtJO+Vy1DGMX
         ZR2gSfGoms+jV4HJ71LlWGtny1s9qFBkNEiGr9Pi03H48Da9qXFofhle/E+Y3ewJM37F
         cNtE6aQEFq9hHQhNVqWXLw+AZC55uhZ16y+BHHVqNQmx7jnNgRzs4v8ZVJobKjk1zro4
         kOJ0XSrxO62FHFzOU2EJ3KTbS2WAB7X9e412zGjE9v2XxZs0Ug9fvUpJX9aaN8Azvies
         poeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076059; x=1774680859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGQQXI1iMDOQW7zjWSA3/NeC4tENFjL25ABxgm3fCbk=;
        b=d0lxw5ZwFre9WC0unkYijTjg8QuwLRznruXtW+pQD0XmAn/VkKNUdB39qvIENGoQfz
         +BoynD/sY7FSivRhiJykHmfkYZ5AtcGL8HGJJLgi/ViFIofcgtQwO+zMstbjmuFfxFkB
         j9Xo+4v30Kbgin10/a3A0c3E/fO0ZyUQxUiXkNuDKQyoSB+RKZRLu4WvMvS5j1zpneCR
         k0YbNbil+KPgeIfCDfP3JRccM9brFSPluc+rqErCt4lDR/HS5i0cQa2O8y7BjFx1uww2
         878OVDhjc4CAoz6l4FAnoU76t1B65r6PfA1H7IsG40akewA9XfCvg+yXrXPjd2T22bTS
         QNTA==
X-Forwarded-Encrypted: i=1; AJvYcCWSv9PZKN/kR/u9PcQO33jyguasH9tQCMFetqVqaeom40kjGiXuCJa2JsM9Ov+sDjakmTR3XtHRgjowrDOU@lists.linux.dev
X-Gm-Message-State: AOJu0YwuKemKfkTJFQp7PJWMaVm1gs07YW7rznTXUZqeUWPoyBX9SRLS
	T/ctsXpi1WzgZFjdc/u+uit437BPKQolA3Cq+V3vIXouqiGmOtTANby8
X-Gm-Gg: ATEYQzwFObthsdRWHrReeTtMpeH9zfikrCVwcE3OJ/ZZBxBQabdFedQR3GFQRRVlIAm
	u7/oWq+KvustJvwQOSn1CyU5AmUnkBexYxpWYApkL8s0w+/MRh758h/3VqnVayV7DH3F9rUbsw/
	d/TKdVrgEd5el3l4eoTfjAg+cUy35TzGWafvY1XvY9uo0Vjv65nsJsWgYxJ1IFcNYpfkURLRxKe
	KEMTwqkO+xsaZ7l9UKXxbYLAGerUTfAvpfwnnE1yLDKrMVXxYx5wrdaQf8qXAxhq8eCL5G3I9AJ
	Xyj7N1o0CpZYt3AYExpGfEuZjnQxqvKL2CgoFqNblTW1CJ4YROpReBWKncOWiTWrOxCeMTJMcTY
	Z9rBrpA8m5p99//tH7dG8N0HCU7LYLHSdJRKN2zjR05daDeRWuoZhCnXEH26byXt8Mb6Pdrtj9J
	mjrQUp0Yp+v47qoxmx7Is0
X-Received: by 2002:a05:6a20:401d:b0:39b:e0f4:322e with SMTP id adf61e73a8af0-39be0f44141mr2372219637.62.1774076058629;
        Fri, 20 Mar 2026 23:54:18 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74456fbfb0sm3188114a12.29.2026.03.20.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 23:54:17 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Sat, 21 Mar 2026 12:24:06 +0530
Message-ID: <20260321065408.209723-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdec_open and vdec_close functions in the Meson VDEC driver failed
to release several resources, leading to memory leaks and potential
use-after-free scenarios.

This patch addresses:
- Missing v4l2_ctrl_handler_free() in both the close path and error
  exit of the open path, preventing control memory leaks.
- A leak of the M2M context if vdec_init_ctrls() failed.

The error labels in vdec_open() have been reordered to ensure a proper
Last-In-First-Out (LIFO) teardown of all initialized resources.

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
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail.com/
   tried to address the issue reported by Nicolas
   improve the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a76..3a5e4ebe0b34c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -877,7 +877,7 @@ static int vdec_open(struct file *file)
 	if (IS_ERR(sess->m2m_dev)) {
 		dev_err(dev, "Fail to v4l2_m2m_init\n");
 		ret = PTR_ERR(sess->m2m_dev);
-		goto err_free_sess;
+		goto err_m2m_release;
 	}
 
 	sess->m2m_ctx = v4l2_m2m_ctx_init(sess->m2m_dev, sess, m2m_queue_init);
@@ -889,7 +889,7 @@ static int vdec_open(struct file *file)
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_release;
+		goto err_m2m_ctx_release;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,9 +913,11 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(sess->m2m_ctx);
 err_m2m_release:
 	v4l2_m2m_release(sess->m2m_dev);
-err_free_sess:
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	kfree(sess);
 	return ret;
 }
@@ -926,6 +928,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 

base-commit: a0c83177734ab98623795e1ba2cf4b72c23de5e7
-- 
2.50.1

