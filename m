Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9852D61C
	for <linux-staging@lists.linux.dev>; Sun,  5 Nov 2023 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="T5LzRYhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1699203355; bh=DHrB2MDEvgLvMGiiGW4ysBRF9ISWcTsdFhQXpZT8qmk=;
 b=T5LzRYhA2bBThfe3HrUK9sc4SOk3PGuOvJt2ZjUwX0FdFPRqqohnBHhZOyCdzVrd0QTxU9qDM
 Khx9I7Cf9WBmGtidydYOhbv9dTsxQIikpP+yQSkIyryH0rYpAxMEFY8HI8CGCFL6orQfmy50UNW
 lVHQfUBla370I0OgeK+33FRqRu1B3+6Q5BHKJVKEJs2ihHHicCdYiKxK03MKaBTYP47Mhp58Aji
 xkBdERKf82jB38egPALpdTXwrZ+Sy6ahzKOq1hbo3Zrn6ULDvl/HfVefQClyxFE9Pn2MO5laoCg
 9rIrownKdYzwDvH/Hpi5dRi9L34BnnC+DCpGv/ULUMGQ==
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: Alex Bee <knaerzche@gmail.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Christopher Obbard
 <chris.obbard@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v4 07/11] media: rkvdec: Move rkvdec_reset_decoded_fmt helper
Date: Sun,  5 Nov 2023 16:55:06 +0000
Message-ID: <20231105165521.3592037-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231105165521.3592037-1-jonas@kwiboo.se>
References: <20231105165521.3592037-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 6547c91a42ad2f8d15246935

Move rkvdec_reset_decoded_fmt() and the called rkvdec_reset_fmt() helper
functions in preparation for adding a new caller in an upcoming patch.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4:
- No change

v3:
- New patch

 drivers/staging/media/rkvdec/rkvdec.c | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 0570c790ad08..7a79840470e1 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -37,6 +37,29 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
 		DIV_ROUND_UP(pix_mp->height, 16);
 }
 
+static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
+			     u32 fourcc)
+{
+	memset(f, 0, sizeof(*f));
+	f->fmt.pix_mp.pixelformat = fourcc;
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
+{
+	struct v4l2_format *f = &ctx->decoded_fmt;
+
+	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
+	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
+	f->fmt.pix_mp.height = ctx->coded_fmt.fmt.pix_mp.height;
+	rkvdec_fill_decoded_pixfmt(ctx, &f->fmt.pix_mp);
+}
+
 static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
@@ -169,18 +192,6 @@ rkvdec_find_coded_fmt_desc(u32 fourcc)
 	return NULL;
 }
 
-static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
-			     u32 fourcc)
-{
-	memset(f, 0, sizeof(*f));
-	f->fmt.pix_mp.pixelformat = fourcc;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
-	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
-	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
-	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
-}
-
 static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_format *f = &ctx->coded_fmt;
@@ -196,17 +207,6 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 		ctx->coded_fmt_desc->ops->adjust_fmt(ctx, f);
 }
 
-static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
-{
-	struct v4l2_format *f = &ctx->decoded_fmt;
-
-	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
-	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
-	f->fmt.pix_mp.height = ctx->coded_fmt.fmt.pix_mp.height;
-	rkvdec_fill_decoded_pixfmt(ctx, &f->fmt.pix_mp);
-}
-
 static int rkvdec_enum_framesizes(struct file *file, void *priv,
 				  struct v4l2_frmsizeenum *fsize)
 {
-- 
2.42.0

