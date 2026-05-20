Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A113DDAE
	for <linux-staging@lists.linux.dev>; Wed, 20 May 2026 04:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779252059; cv=none; b=Jq4YwsrYTl+QdCgKmldovwpM+H6vJBmWPPY1hzFN1IUvLWGbSbJXBx9te5jAXU478XV+ms9UVy5lVYBIIa2wybBhQ1kewaDhPH3SdCmtG2D6yLI14MRJqw07HPexI2i7/ggXEq34VorVtwI96OvkWpV7T+ZumlAFcWteg2ZgPSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779252059; c=relaxed/simple;
	bh=IzCpapzovKld03EFxt2Y7uGfXk1dtMIpLr0vVycq20k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=arGwjb8IO/4dIq4ZBUOIl5M9qfcJ/A/gQ6ASOrVS/6qgjg4WZltmHKRkUHGhb5r09BcsPnv/Kjubs/f6xIdYy8M/aO4zskw5zqDjGRZlr4qBOJY+mitbBGVA2dRxljb3eyp/QMi9QFh1Ns+iSV0RgEtpllZL8DTAOOQXBDqaR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mg+vwjZr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mg+vwjZr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-835b78c3797so1825016b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 21:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779252058; x=1779856858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UawR2ecAAmpl5iNmgN346ehivn3mNf/9XSeJ91i6yF8=;
        b=Mg+vwjZrn6cwqhgLVQDxDQqx5nd0VhMAJYO/z5ce5IW3fbSKApjUEnf8pOK8QHByBf
         woz063Cl6qmhef6XCEd8de0ubz/oIsGwSEsbvTQVAqSW/fDrZHTvsLjmbq+yFV2O4Z5U
         N3Sxh+GBtYia7SvrvmNmB8QlnR61qM9zeEw2pqTAunCcJhOpJqhaF+S7YiE/IuZL+fDp
         UvCxbo+vP/sgEsU+WNe/pwrRhlz4i2ki+ZjvAetEX7ryrzd3ib9fpzVbmyv76dvhxfk0
         IPPzmhb9MZn5welMUWE/KVh6d5Dz+2tT/TLzPhmNdQmGXOFSFfA5pyqm1+L4xRh99a4P
         uYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779252058; x=1779856858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UawR2ecAAmpl5iNmgN346ehivn3mNf/9XSeJ91i6yF8=;
        b=XSefNZIGGlGdFrgWeyTut8rFijXu/JVZ9LY3q1EZ+JGGB8EWVLVkde+ingixdG2J5P
         eNZJZ0q018twZZx77bEN7g1Wrszxx8hyfTX1r83LMfkLt0Dj/NNsX52+MAqRSNFU3gZz
         WIN6HQChi5I0fHZFE1qKM3/74uXO9j16pO+t03z6mBP9+vLtyuy+e89rR+aFeiWgS4Mj
         80M7qPp+bteyXdjPlHT/3GE66c0H+MCNJtXeXR2xF0OtCRt9W+8vp5KQkrl+8Ocb0IIv
         NIwVEQhZS6EupbEGc+CfUAjFJh6WzuOxLIOpDdC5OVwQ/Lv6QsOgdtCimm/6+rB154jb
         vRww==
X-Forwarded-Encrypted: i=1; AFNElJ/zYyqXiSP2Hqu+clyvEw3giRWjb0wmk1wNtcPMBB+XtUYskdZpclsi8ZjG0g/cPlRFXw5xbv9sQ4Xlvvz3@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm44yYfbWZEhg6TMFpMYYgmZZ2yfTMMKX+Fg4jfrOzRas93Fwu
	2OLEjgb78+EKTjBC9miy7/fI7KSXey7RqeTIZC8HBuxVAIy549iYN/Fl
X-Gm-Gg: Acq92OEWsE2qh4w5AcbsmzYia7ksXfPesVsanhm0kdQrwgy8BFOiJ8yEvdIdzvjossZ
	zCI1P/kH3+6ojmeOY6VNSHeTxUI8s6dJWEwpq3ClDaR3m1XFyvrXGwCpT0EQToA4dNfiDWL2/t1
	oJTMEsWH8SmBNfejiXnFj6dgrpdmd/7xOs++lEHWcJ95lLUx/TAYsVKIQr6u/Nka+sc1up2cIH2
	0COqtZqMSiMD62S6s/FC3Rql4CC68FVhY73QlhGhisP3M1AkIVelSlwYgjnLZIb773CI7mETHDC
	4PRtQ0ztpueWMnKULwnQd5X+Sy7/qHnpYdj51biQx6Nkz4R8bzGaZk47wvEsRO75Ktq5z+eALmz
	to3MKN9RL7Zx8yFk+79IEwIyNEh+M9Wp22MOww+Na/QQa/vfI3dl4vK29ZO/RJTtcuFAxSg1SXV
	Pi/oz3tHjpH7nhG2vxCVxUQXdnF4Soiec=
X-Received: by 2002:a05:6a00:8c2:b0:835:a682:a6d7 with SMTP id d2e1a72fcca58-83f33bae2camr23163556b3a.4.1779252057807;
        Tue, 19 May 2026 21:40:57 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm18649802b3a.39.2026.05.19.21.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 21:40:57 -0700 (PDT)
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
Subject: [PATCH v3] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Wed, 20 May 2026 10:10:41 +0530
Message-ID: <20260520044046.7553-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdec_open() function previously jumped directly to
err_m2m_release when vdec_init_ctrls() failed, skipping
release of the m2m context. This caused a resource leak.

Fix it by introducing a proper err_m2m_ctx_release label
that calls v4l2_m2m_ctx_release(sess->m2m_ctx) before
releasing the m2m device.

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
v2: https://lore.kernel.org/all/20260321065408.209723-1-linux.amoon@gmail.com/
   updated the commit message, applied the suggestion from sashiko
   below.
  [3] https://sashiko.dev/#/patchset/20260321065408.209723-1-linux.amoon%40gmail.com

v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail.com/
   tried to address the issue reported by Nicolas
   improve the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..a039d925c0fe 100644
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

base-commit: 27fa82620cbaa89a7fc11ac3057701d598813e87
-- 
2.50.1

