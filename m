Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E87210B
	for <linux-staging@lists.linux.dev>; Fri, 13 May 2022 20:30:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 556061F46480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1652473801;
	bh=97qH9MAwt4IfrnTZaZQXT3dbPZPKSF1LMKpA5X+Ai/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fAOU94QvsZuULWUCMD5y91dOEGbHjkpuyz4xFLajyvtMqF2+bqnHjaVjUQ6TmsEF1
	 PbOCu26qy7SRC13hkZwUCHq0+1mreVQyQHIJxwGvgvJBrtHtV+Qyw0VbLlyygkNTNh
	 zDkqYi2Rq3Mj9NCP0QZA6tOS7YUK1EMBpXk7DXhwK2BrcDJ88oQbNadoZcMnG7WE+2
	 OCmqL1SknN71gqGccgItegAPjfq2HJRlL7LM6HeNOOjlDv7nsVa7ljQTaF3uI1Rcbm
	 Nye7rk42/XaiF6/9mjjdVW63YpqNH7OKF7FC54UBpzBZnokZq0eivHSGmqFbxBETnL
	 HdZ7HEA+rXMOw==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nicolas@ndufresne.ca,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 16/20] media: rkvdec: Enable capture buffer holding for H264
Date: Fri, 13 May 2022 16:29:18 -0400
Message-Id: <20220513202922.13846-17-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220513202922.13846-1-nicolas.dufresne@collabora.com>
References: <20220513202922.13846-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to support interlaced video decoding, the driver must
allow holding the capture buffer so that the second field can
be decoded into it.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/rkvdec/rkvdec.c | 4 ++++
 drivers/staging/media/rkvdec/rkvdec.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 2bc4b1a40989..7bab7586918c 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -127,6 +127,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.ops = &rkvdec_h264_fmt_ops,
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_vp9_decoded_fmts),
 		.decoded_fmts = rkvdec_h264_vp9_decoded_fmts,
+		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
@@ -385,6 +386,9 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 	cap_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
 	cap_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
+	/* Enable format specific queue features */
+	vq->subsystem_flags |= desc->subsystem_flags;
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
index 9df0fba799a4..633335ebb9c4 100644
--- a/drivers/staging/media/rkvdec/rkvdec.h
+++ b/drivers/staging/media/rkvdec/rkvdec.h
@@ -82,6 +82,7 @@ struct rkvdec_coded_fmt_desc {
 	const struct rkvdec_coded_fmt_ops *ops;
 	unsigned int num_decoded_fmts;
 	const u32 *decoded_fmts;
+	u32 subsystem_flags;
 };
 
 struct rkvdec_dev {
-- 
2.34.3

