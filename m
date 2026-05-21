Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599323358C6
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348917; cv=none; b=uqvQ/b5FaMyGF040xNllcnpPxV+gUG9hrzO4VJpGBCD7qJzjcDCPKs6pPfitHPlY+0utAua7LfQXI5qvO0h48FVckcWwn6AMYmhWKvY0zgj6JXlmvsE34N3jTgEqzSWUzV/1XiplbQjfKsb8JsvVRyqZA94VTvnwjhxgSdRZxes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348917; c=relaxed/simple;
	bh=ryTUXf8sC7d0Ori3299ByXCBMLqJUA7IfN4hnFcDBsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksy1Gh4f/h7y7QpZ4lB10w4vszDQ/8z8JTfUTM5MEq1NB7FQjENFK99oAzxM3LtPYkr//86CmxM38DZOqNWv9itLniXrHT7PlSfvIqsbu29h73FyekbVNhUYR50wiWcBpnCd7EXYtHDX72cvaUkCDUBTYSpxYN5y9azfd6W5RaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktThOb60; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktThOb60"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36643b96b99so5370930a91.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348915; x=1779953715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62v+VUjFmSMO7xe18HMoRAsN6xnzoeMa1iqyd56dOLs=;
        b=ktThOb602gF9VO/0MgB//tfWzxDs4/ltazUMbMyuNI2KmjG4ZmsiQsjfwWPjcxdkYS
         47ZVPuznzKTpdKzm9HS48WMJaF9RK9QkDI/NZ3wqAnULwsl6SfO87Uwi6UlvrkmbZdZc
         bkXCHvlOoy1ONB2HuLDRshndJ+h9iG45ys/Su6Z/kBFctHtXf62F2a7utH7V2IcmDpd9
         8D12wvKJOAmEPWzyDbq7ciVEZRtO01NZVIYV/64Yaz+AcR1McWW9PjVfhU1CYJBwjMHZ
         AsgfjydEHxT4Lcq3wVLxKl/ww1XteKv74LR5uFdUcRQW3ysEX7tRvjn1HWxF4iyrWstN
         yx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348915; x=1779953715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62v+VUjFmSMO7xe18HMoRAsN6xnzoeMa1iqyd56dOLs=;
        b=oZS4oSv69I/nYBkCSfyqipYyvsbV8uIWJ3w8zLUiObj39Dw/l7pEWf/3nCterRaPb9
         7+WqHF6F+CXBXzGzvC9jHi27QxLVpCWesOMRPgZ7yUBWbE8NaVWNMST3BQKEAzYx8aRZ
         u7JHjPV2MaouFzDMByaWcfMAW13M8VqEJs4ER4i6l72w0SXpQxpXBl2GtVrYfRUm1wcv
         TnF6oZb5q6nbSQxHSnSOCUeQy7f+fqZuTbrwod7wB/qCo7SA1MI7+G07Ouh9cRsl+6W0
         TKqngBSbnzE1vVZ3ksMagkhC5F9yqJhVm4LdIubClnwHLfkak1zjlx0ZgztBOuDRZ4Ic
         X6jQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NOEj5r9JBwxWiWSiOP2XcobEQdb6CA9cOPyAjIAquf5XLppvA8MPIvGgEElLU7NxXE4gor36310LgTBMw@lists.linux.dev
X-Gm-Message-State: AOJu0YwomN/SfpZMfeB9wGRJsuChtqAI2USWf9mxnL2LQqSi3gj63qE7
	ESxtEEaDw0nv/8tvU2Obksh0vj9hHgXXBSQItFtt1rXcIQYWad6xT2Ta
X-Gm-Gg: Acq92OE4P3xWoSnHHxN45q2JqECRgJVP05UOuske94BNR5SHEB3iXJKTjuFhb2JP+cv
	xmnnkZXA8w2AdzYPJziECNdVgvEnsi+/QI/0iTKYxl+zaag2Ryg8stfhVAhTzbrcIu6lfXiTB2v
	cnG11mt+5wyIaQqmNDoohk87nrgVdgswncdHBwqT8rYNnxe+bBtZfnwXXn3MPgjqDL6H8acTlHH
	OBlU8Wb1wx+JLy6EIGoqLgM4Ro5IxmL55QQsyuM6FrbC6gyZ/DPemgi18nU/KH7865DiRsbaR1D
	MPd5/1qY3YciTbBrN7fI0oyHT8oRrLrZwhz+4qZqtXyq01d3KAGP4wHKC1og2oXGznQJkJc1vQh
	NpEK4cXmRECO92bCvnt8wlzhCvMXHUxQBOUDXcMehdLihsEBr8CKTsNgXyO4+7rjFdCAWj9lW9a
	+WgwiwgGuSHL+yaSwZk+kz
X-Received: by 2002:a17:90b:2c8d:b0:36a:2a9b:3fb2 with SMTP id 98e67ed59e1d1-36a45600421mr1777569a91.16.1779348915390;
        Thu, 21 May 2026 00:35:15 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:14 -0700 (PDT)
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
Subject: [PATCH v4 1/3] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Thu, 21 May 2026 13:04:11 +0530
Message-ID: <20260521073449.10057-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260521073449.10057-1-linux.amoon@gmail.com>
References: <20260521073449.10057-1-linux.amoon@gmail.com>
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
index 4b77ec1af5a7..9244fb09eb36 100644
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
@@ -926,6 +928,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
-- 
2.50.1

