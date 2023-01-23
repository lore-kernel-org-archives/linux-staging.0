Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3869A817
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 07:17:14 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d2so9832037wrp.8
        for <linux-staging@lists.linux.dev>; Sun, 22 Jan 2023 23:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orgUUcijT9HAApybCZNzBbAQbGQJs54lfazjlNmvor4=;
        b=WRCsLiXIOEL4Z1N86sUMV6M5XLpBKylpzBAmHT2JzYCDncyvy3j/2S4bjMMfg7qFKA
         0t/8RMvcLyZ7Hm9n96j07NCQiO0W+kmPVRWXVr+h89ghY/sTHrxYPc+OS8d29zTk5YkL
         R2V99J6yTedGvuffOXjjSPdOzMpw3ulfv1FGRRhKw+rs9DPPR/2HHXTGbaAE8VEord0k
         L1jrrYxn0HpQiAaH7N57dxlP7Mota1QnShp2jTLcf6hdindbQiKhv+eA9iTK69PNKT6+
         1Tc1h4oL75lIoqP1tBYZeVCtVO81vEHJyaCuYYKfsOCbx7toPCmVdZmurYF1CZhOdZGC
         XtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orgUUcijT9HAApybCZNzBbAQbGQJs54lfazjlNmvor4=;
        b=cnj49LbZEmwxpR4EB5j9O1bSAee82nqoeo59myOt6EN+Y02ZSlm3NXE6Trz3qPETkM
         Ynwe+TCvDLdITlj8BXmc9OV3fVr868Gu55pASlbM0Ok0CYe/quUnznR3J3M3b/Y1uPB9
         pCtjx0rJL9GpyFucgqt5b3jTFAsZof4vltDfRM8GAwaU9ArQUbVwGYe18AwSmeeYnxTB
         k9O4e0kHyN5iE0s+Jl4MNU9yuyNfJ/CYVrakx76QFItU8QZQcmZjPqnKvbyV/+lgwhXj
         pXHQ4Zi3Ei6n/UEYX5PP6jfMJW16aPX+fbp4AhZ6HCYjTsLSvZfZvYl0AcYRHsWmGp2x
         X9kA==
X-Gm-Message-State: AFqh2kq3rfj0QHu8mM/KtJbVRuwkl4Gs0syrBnv+KPafvebl36ep34SJ
	mhNTgc+ysB9ORxzkQyLuedM=
X-Google-Smtp-Source: AMrXdXvWh4N79aN3+Zbpk2+4tvBaV8mZGbORgIeWR2mMNB6qANbMFGt0GeFzVFZKjCoaUSqoZ0vkbg==
X-Received: by 2002:adf:f790:0:b0:2bd:ebc0:6f79 with SMTP id q16-20020adff790000000b002bdebc06f79mr20538950wrp.46.1674458232520;
        Sun, 22 Jan 2023 23:17:12 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id f2-20020adff982000000b002bde537721dsm23713801wrr.20.2023.01.22.23.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 23:17:12 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
	Benjamin Roszak <benjamin545@gmail.com>
Subject: [PATCH] media: meson: vdec: remove redundant if statement
Date: Mon, 23 Jan 2023 07:17:08 +0000
Message-Id: <20230123071708.2670751-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benjamin Roszak <benjamin545@gmail.com>

Checking if sess->fmt_out->pixfmt is V4L2_PIX_FMT_VP9 was already done as a
condition to enter the if statement where this additional check is made.

Signed-off-by: Benjamin Roszak <benjamin545@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 86ccc8937afc..7b15fc54efe4 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -314,8 +314,7 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 			num_dst_bufs = codec_ops->num_pending_bufs(sess);
 
 		num_dst_bufs += v4l2_m2m_num_dst_bufs_ready(sess->m2m_ctx);
-		if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9)
-			num_dst_bufs -= 3;
+		num_dst_bufs -= 3;
 
 		if (esparser_vififo_get_free_space(sess) < payload_size ||
 		    atomic_read(&sess->esparser_queued_bufs) >= num_dst_bufs)
-- 
2.34.1

