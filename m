Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3075DD306
	for <linux-staging@lists.linux.dev>; Sun, 29 Oct 2023 18:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="H9PoZAuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1698604504; bh=WRRtLa+oeqOclDr80uDaQHUf1YbVCIa0sIISFMlgnvQ=;
 b=H9PoZAuMsp4dcMmXxsEiWkijxhuakIhnvlyGadgQ3xwNZb0Yg5znMlu3lvt5Mb/0uLLa37t7x
 ItFGBFm1lV4MR4KmgjdYlofsdAGN7MmxZdVEBlT6TTjUM6Cck6jKVPhLq9U540O+M2k4FH6dH2o
 tyay0jIeCR4OTMnmE6KOhRS2vaZXmZQYQPM3bsEg7lE+dArH7D7ukFihwNPQnSB8gKO0HsydIxU
 NB/IBJitSf0IFwZ+GTxXcOyeTSTXspmEe/MPQzl9ojP7d6N5SgTybhTvgcS9XFQcpjno5+Zkgsl
 2RMsbPXUtFnRLz/uEJ8/BiYT5JHFPc6jJtyKDFKsaTZQ==
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: Alex Bee <knaerzche@gmail.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Christopher Obbard
 <chris.obbard@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 08/10] media: rkvdec: Prepare for adding format validation ops
Date: Sun, 29 Oct 2023 18:34:15 +0000
Message-ID: <20231029183427.1781554-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029183427.1781554-1-jonas@kwiboo.se>
References: <20231029183427.1781554-1-jonas@kwiboo.se>
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
 149.28.215.223
X-ForwardEmail-ID: 653ea5d78fe0ffca230b0f70

Add a rkvdec_valid_fmt() helper that check if a pixelformat is a valid
CAPTURE format, and a rkvdec_decoded_fmts() helper for enumerating valid
formats.

Use these new helpers in preparation for adding format validation ops in
an upcoming patch.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v3:
- New patch

 drivers/staging/media/rkvdec/rkvdec.c | 47 +++++++++++++++++++--------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 10752a517971..bd3568928060 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -27,6 +27,19 @@
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
 
+static u32 rkvdec_decoded_fmts(struct rkvdec_ctx *ctx, int index)
+{
+	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+
+	if (WARN_ON(!desc))
+		return 0;
+
+	if (index >= desc->num_decoded_fmts)
+		return 0;
+
+	return desc->decoded_fmts[index];
+}
+
 static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
 				       struct v4l2_pix_format_mplane *pix_mp)
 {
@@ -54,7 +67,7 @@ static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_format *f = &ctx->decoded_fmt;
 
-	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
+	rkvdec_reset_fmt(ctx, f, rkvdec_decoded_fmts(ctx, 0));
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
 	f->fmt.pix_mp.height = ctx->coded_fmt.fmt.pix_mp.height;
@@ -239,13 +252,25 @@ static int rkvdec_querycap(struct file *file, void *priv,
 	return 0;
 }
 
+static bool rkvdec_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc)
+{
+	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	unsigned int i;
+
+	for (i = 0; i < desc->num_decoded_fmts; i++) {
+		if (desc->decoded_fmts[i] == fourcc)
+			return true;
+	}
+
+	return false;
+}
+
 static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
 	const struct rkvdec_coded_fmt_desc *coded_desc;
-	unsigned int i;
 
 	/*
 	 * The codec context should point to a coded format desc, if the format
@@ -256,13 +281,8 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 	if (WARN_ON(!coded_desc))
 		return -EINVAL;
 
-	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
-		if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
-			break;
-	}
-
-	if (i == coded_desc->num_decoded_fmts)
-		pix_mp->pixelformat = coded_desc->decoded_fmts[0];
+	if (!rkvdec_valid_fmt(ctx, pix_mp->pixelformat))
+		pix_mp->pixelformat = rkvdec_decoded_fmts(ctx, 0);
 
 	/* Always apply the frmsize constraint of the coded end. */
 	pix_mp->width = max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
@@ -425,14 +445,13 @@ static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
 	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	u32 fourcc;
 
-	if (WARN_ON(!ctx->coded_fmt_desc))
-		return -EINVAL;
-
-	if (f->index >= ctx->coded_fmt_desc->num_decoded_fmts)
+	fourcc = rkvdec_decoded_fmts(ctx, f->index);
+	if (!fourcc)
 		return -EINVAL;
 
-	f->pixelformat = ctx->coded_fmt_desc->decoded_fmts[f->index];
+	f->pixelformat = fourcc;
 	return 0;
 }
 
-- 
2.42.0

