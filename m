Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A36063D
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 12:58:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 9A1961F4398D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1650977914;
	bh=MTyE9QSy2RUy2J+DqczMQkzQ2U7CksfjNGFIrOd9SV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J9X8SraGQdLyW+/JGUWxPCHGxezEXLlPh5u0O88RM7vcGfKUZ1NvV8FhDg9p3TbfV
	 KJqToHGy8OAloKMz37PAL5AAe2VNPEHwmLhGX1wqvA/fzDZrsPArcgOmPca5aeyllJ
	 yW+FyC4MMSs1gDzXPzSdUVfwT77sU4oFCs0WXV5EwbguRS4Ui8Pi6Kj7y/J1o9chV7
	 msxtO1hRbODKHyxxlAdKBGrKxvEB39UoulTByyp54H/9METlccF8u1d7hHlsRTjJ2B
	 o5oXWPrhNtvvt2WbIcpxXa+m/j4mFD4P/OlEDp0QagtTCgp7DrlMWjtEPOpKAJz0KA
	 jV/SE88oopK7w==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nicolas@ndufresne.ca,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 20/24] media: rkvdec: Enable capture buffer holding for H264
Date: Tue, 26 Apr 2022 08:57:46 -0400
Message-Id: <20220426125751.108293-21-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
References: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
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
2.34.1

