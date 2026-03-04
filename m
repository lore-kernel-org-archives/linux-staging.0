Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A3422A7E9
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772618769; cv=none; b=D8XXia0oqtKhCGi47jxYSjdzzOnxXYhY6n/ebJKGuqAJen2KNDd2PSXKxhwAHgQzxlWaisN0wzdaIAW8ICOnBl2QnbSGKGGkeU3uvQPpcrw6Q9MnXrZo7rLJh9bM2y9jpo6aQBVAG2PTwvipskBhDcgsokoJrAs0EA6Y0ZSzUBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772618769; c=relaxed/simple;
	bh=CBiwXMAd3YWbKWaXPfqC7/kVDJWdCo99WBgOyx00/mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWRzudPpGWTzaJXQs2m0SeMXlTmMoM3b9CPu4ZCyvECEQXp/SfbTPFPPHfh17thAZldqA3+0hFMLVzY5CiULd/bGD+paDs1ulI2ri6iZKzWoLrCpetgt3ElLqG5QSwnV0mcgYhBmaBW44ogu6o8e0LpwhOzbuiNrdysxB2wleWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTDEjnrm; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTDEjnrm"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ab46931cf1so49246425ad.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 02:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772618767; x=1773223567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bsGz9NobNNMerVOOjKKJ0LgJD2SxFYXhHAVBSa0LnTg=;
        b=QTDEjnrmx1EpkCew2M1IkDfg9dqDXur8LvIb25+1MJ9Qz+wNmhz7hjvnUnWDEgWJBg
         197Dew8WIYqBaVQyeVsl7jda4TsFVvi5SX/xJmiHDLgvVeuH+Q67KS7LdgzmnfRGKdFo
         7VvPBEvuhzjSQLd4WGdVTV8B7UUnWIesMoNis4ZlmRSlwqU3qRQLv4GCyeY/W+R/vkDR
         OZspsBgFuN8v62VfSiD762tWhUSh6Z2Ud2iQw0Qp0/8Vve8F7GXSp6oRb3VLANRlW0X5
         uqx0JqMj/4R/aautJ3RRrc29EUbWFWXHseCpiloT58yj1X8nh+KBu96VTXUlTHA87hK/
         R+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618767; x=1773223567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsGz9NobNNMerVOOjKKJ0LgJD2SxFYXhHAVBSa0LnTg=;
        b=NrQAg60ICuWSs6cVb28WTCM6zjMSlNsNq0ssIf0CMhjkBNFq2UJUUUQtLXebIoQeJa
         0ZrNBaxfwR+ZorL1x+uoKmKcknXhXvutpUUWkvXWPVeL4taEeui11GrfJrcQA4NY2uOv
         YBTcCdysHVwts2dTVXnAzWRXXSRqPPyI0B8fwXcIliiS1z9VW9cjaf23rzcwMio5nEQK
         H1kpmiKjPYkUAg6zeAmQ9o3d7tli1SdXo4UzLbhHAuOTXYdOnXPZbpqE+T0ofLihguXT
         3cGWCDanr3uCV0W7+VAISRqY3quVvSVgI64AOyb0AGXYYNpW/JtxcKLfp0PF4yCgGNGA
         fYJw==
X-Forwarded-Encrypted: i=1; AJvYcCVUgknrfcQpPF2AYKSNhahfBMlo2KnZPpr+JxA2LQbZiCT/WDDmM/+2m4H86y2SNbg5BtJB9SThHig/e8Yz@lists.linux.dev
X-Gm-Message-State: AOJu0YyyoBnvvZEYtfB1t3YCsqaRU75AJ2uCNdoH0uttfmmfmKQ31efN
	Ky1IVGHvx5FCBQpGwWqRzxxBPnkP9zQ+Chs+VGoKv1j3xOGvy+7+W4q3
X-Gm-Gg: ATEYQzz11JM1SrSkS5cnn4JVsthTnvmmn+p8vawkVnSUYU7QIaPrEdSchSmm/dLZ9ke
	9ZNiJYbpjdo52KR6BXpaZPYYHUHRp+eveYuBhw10dlHxKX0nc+JvGFJW3VcKdeBq74ajcXfvyOp
	YQGO2LC3M09bxwubcI4wCCarIUik1EyJCLjKmDuwGIu9PRdaOooCWwZpkOBBdBlQIGXFV5SLpTo
	5iAOE3YM+x2bpsWuLIl69jEbHUaEHKcJxVtdzBdztBTX5B1u61RSAYcWrH/xhMVXkRp/CsZMfCL
	eTucAXsMXxyoTjhNh4HLqJXvsK2rqXE/c2CtXj8Fz4CsMzyKHZO2yY+bGzIkQ/Y/uZSNJgXhWrT
	wrP8IeTNVFNko+Db/RNoe5/HZIyXQua4uu+sRu8OF/HkON20SETRG5PADuSGpESwehBybIpR/Vb
	zHe3eHP3O8pH1ITsGBYymB
X-Received: by 2002:a17:902:fc87:b0:2ad:da28:8c7a with SMTP id d9443c01a7336-2ae6ae0bfefmr15253245ad.8.1772618767233;
        Wed, 04 Mar 2026 02:06:07 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b48f4sm191220555ad.13.2026.03.04.02.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:06:06 -0800 (PST)
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
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Wed,  4 Mar 2026 15:35:53 +0530
Message-ID: <20260304100557.126488-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If vdec_init_ctrls(sess) fails, or any subsequent initialization step
during vdec_open fails, the control handler allocated for the session
is not released. This causes a memory leak of the v4l2_ctrl_handler
and its associated control objects.

Add a call to v4l2_ctrl_handler_free() in the err_m2m_release error
path to ensure resources are properly reclaimed.

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

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..a5ab0c2390f5 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -914,6 +914,7 @@ static int vdec_open(struct file *file)
 	return 0;
 
 err_m2m_release:
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
 	kfree(sess);
@@ -926,6 +927,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 

base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
-- 
2.50.1

