Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8336D39D3C0
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 07:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348946; cv=none; b=u6VvYO6FJXfI8/IidkeFI+f3RqfSTLiUoQcRCX66ySVOy1Z0dzmytd3D6c4bmXNheyMVSfLzt0S/HjnseExyquw6M8rSpb5mxichsh5C9UA+MqZxMNIYL8yEiSOVrnMWuh8GGkyu+iiTEZv4yrUTpMdQ4iaOwgjNEWsXACaej2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348946; c=relaxed/simple;
	bh=n31stoUzsPX4RNMyRRmVvUZVj4OVkqdnAHTSrpxgKN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZT85wqQX/o3rPRyeBBXog2m2Stzhk8SHPsm3R5aCwEJoUYKV/tqPDqNlw0rTB7vvVMyDLMPTPoZi1QinesiWqOPa6LUI8A6ScBMbh1dbuQHJbrP/nLZFnxsPJomwDGaEd+WKfCMZhn5QVeGpyGjrft8pdHhvZjZuz24e8di2Y8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIys0oBD; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIys0oBD"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3680540a6efso3101991a91.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 00:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348943; x=1779953743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mklgo4SEnQFqu5UeBwzviEPZFhn2UwuL3rIfaoDrBUI=;
        b=gIys0oBDXTyG6MPK0nhQU0fALA4jT7xWDzYMET+DwTvEP2XLsnnpYiqhLpZ04b65gJ
         FAMkdto7TLgETH70LlJQ71ck7J7Mgv75plY5dV3U5cCmxR7TffBDGd1EfblHtzG2+y7b
         LV5D/WqUkXgM8TeIbSQ+YBTT4gbegnVYmw+Jml4TRmYZHncH/cO9+lB+U0pBwAEI7B3E
         NzZh172TWgb6AxgWOzkheOCdEG2t/TjSg9Tv0yB22Zb5F0gOa6YPGBpbY3Ktj9zFfbcK
         RmunO3lQtL6fKrpzlgEGfoDYzTL8I0w+LoQucU1hiWQO+nF1GgdZmvxh7cF0rB6Zz/NL
         UCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348943; x=1779953743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mklgo4SEnQFqu5UeBwzviEPZFhn2UwuL3rIfaoDrBUI=;
        b=cfA6JX+iA5A05MbYkq6O6J+yeJHz6i9TYWUN/aqMU0J1SDlLFkFapkigwqxvKV/dck
         /M26HpWCj8gbdy/2xhipcqkHfP/vOQeSEEG/+aBPuaXL6FTkPgjl4Kws/BeKrNsLGo3C
         0VCbv9Nt9B0K0hGPy8GDA+FELV/Q9IIhWPB0zqrYorXjmdLtG3zLee76gYIj7iTr/csB
         kCoqO2nKOGY4/x+pi1lbIKiTlyVHpU6vtjtLkujPZiOV9xeGMEugFQKlA5PL5D8zX9em
         d7f0I2Ma/SQ3OVXmo74ho4Bs9obn8Ef6qbI1B0F/ojk5BIeEx6yUnIUCdoZgnL86dHTU
         bBAw==
X-Forwarded-Encrypted: i=1; AFNElJ9bO5lD7upN94iNGm9hqtltx8JDEqXPeMdFK5RqSqtwr55brvEkTnQ6b80V3qeHgkvrya2szis8MmCtPptx@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3O24EbqpsOVkmbcdosTefWeMeZ27TdnYECfMyxAAo4beZlqzk
	gJ9dy4o7B2oo3ZhFibuC9nTDu/4ADd6NxpYNvCDmiX2sSqmWq0ayvb8F
X-Gm-Gg: Acq92OGqTzQ+MkI23a2blOZcuR9WzDFSEK9g4ZCnrSRB2AECZz/gZa5pZjBCcXee9hO
	68j0hvD3UhmOc2Zn+B8xq6VqQL0lnF0Hzrl2I6Ih7UO2w0mfw+R/XqppYpkpZBJsBKPWujqERly
	GlzatpHVURLRV7gQdpUQyLkfuENg9s6cVfp4xddurnE6ciq7ng9t7SQ4z3whIT1ioJ19BmlM6JA
	KN1oIMkWGbXVHs5lgU+FIinxG4UBL5CMKgKsTL6o6i/IzdjVL8vxGEhVWdI9cI85zN1qeHlYDno
	PXfGFkMHgQqhO06u9D0B/VXQjPxcCpJn0vpv8tTYz2LI2D7qrcLosso/te8G8TB1UF+gGOR6NXV
	RQJXJv8eOcGMPDYfr1IgvVH16ogRLKdCxLRVngbt3hVLH5+fU9vrOCT0a5P5wxSvodn/bnu/KHD
	TpWtcAoe3qZ8JZPflyf+iN6djSmnN/dxg=
X-Received: by 2002:a17:90b:540e:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36a4514fbcdmr1729123a91.8.1779348942657;
        Thu, 21 May 2026 00:35:42 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:42 -0700 (PDT)
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
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 3/3] media: meson: vdec: Cancel esparser work in error and stop paths
Date: Thu, 21 May 2026 13:04:13 +0530
Message-ID: <20260521073449.10057-4-linux.amoon@gmail.com>
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

Ensure that esparser_queue_work is canceled before freeing the
session context. Add cancel_work_sync() in both the error path
of vdec_close() and vdec_start_streaming() and in vdec_stop_streaming().

This prevents background work from dereferencing a freed sess
structure and triggering a use-after-free.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: new patch
 If vdec_close() calls kfree(sess) without first stopping or synchronizing
with this background work via cancel_work_sync(), could a concurrently
running esparser_queue_all_src() dereference the freed sess structure and
trigger a use-after-free?
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 8615a935e86d..a57bd4a8e33c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -358,6 +358,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 0;
 	else
@@ -415,6 +417,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		if (vdec_codec_needs_recycle(sess))
 			kthread_stop(sess->recycle_thread);
 
+		cancel_work_sync(&sess->esparser_queue_work);
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
@@ -937,6 +940,7 @@ static int vdec_close(struct file *file)
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_ctrl_handler_free(&sess->ctrl_handler);
+	cancel_work_sync(&sess->esparser_queue_work);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
-- 
2.50.1

