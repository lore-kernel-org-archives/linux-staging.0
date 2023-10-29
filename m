Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F6D9456
	for <linux-staging@lists.linux.dev>; Sun, 29 Oct 2023 18:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="FictpPKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1698604496; bh=oUZXSd3mNA7U3mwNKfQV7xxJvG8Airy7VIo0pNLNDPc=;
 b=FictpPKCGIm1yZeoL9lbU1tlIN4Fhpmynh04CQgXvipctzYXrMLjbvhRafJwGK8t/XFrZy0mV
 6/+buZFmCe1N3rXexpvOCCGTOl9XjuamISC0k4cYXhDlxvyZA7l9v49q+5SIoxCCNVVLQsTVJTO
 jKdkhkg6lhYACixiGc6iOPfQ1yZYanTaQXXOmIn2Wr9lqjA6v6OLk45+D418FXnHl3pqk8EAgUl
 QItrmKWGl+lSCQkPXneRRPdS4skZPJY6Qs2SftsxQnxrnGAoCTWzLEUgy/2fkdR5VKrT4SkErUv
 94sWNt49vUknJp1+WxYB2/FJ7G5owYZYHaLrIjj9GnlQ==
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
Subject: [PATCH v3 06/10] media: rkvdec: Extract rkvdec_fill_decoded_pixfmt helper method
Date: Sun, 29 Oct 2023 18:34:13 +0000
Message-ID: <20231029183427.1781554-7-jonas@kwiboo.se>
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
X-ForwardEmail-ID: 653ea5d08fe0ffca230b0f56

This extract setting decoded pixfmt into a helper method, current code
is replaced with a call to the new helper method.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v3:
- No changes

 drivers/staging/media/rkvdec/rkvdec.c | 29 ++++++++++++++-------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 84a41792cb4b..8d8ab529537c 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -27,6 +27,17 @@
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
 
+static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
+				       struct v4l2_pix_format_mplane *pix_mp)
+{
+	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
+			    pix_mp->width, pix_mp->height);
+	pix_mp->plane_fmt[0].sizeimage += 128 *
+		DIV_ROUND_UP(pix_mp->width, 16) *
+		DIV_ROUND_UP(pix_mp->height, 16);
+	pix_mp->field = V4L2_FIELD_NONE;
+}
+
 static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
@@ -192,13 +203,9 @@ static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
 
 	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	v4l2_fill_pixfmt_mp(&f->fmt.pix_mp,
-			    ctx->coded_fmt_desc->decoded_fmts[0],
-			    ctx->coded_fmt.fmt.pix_mp.width,
-			    ctx->coded_fmt.fmt.pix_mp.height);
-	f->fmt.pix_mp.plane_fmt[0].sizeimage += 128 *
-		DIV_ROUND_UP(f->fmt.pix_mp.width, 16) *
-		DIV_ROUND_UP(f->fmt.pix_mp.height, 16);
+	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
+	f->fmt.pix_mp.height = ctx->coded_fmt.fmt.pix_mp.height;
+	rkvdec_fill_decoded_pixfmt(ctx, &f->fmt.pix_mp);
 }
 
 static int rkvdec_enum_framesizes(struct file *file, void *priv,
@@ -264,13 +271,7 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 				       &pix_mp->height,
 				       &coded_desc->frmsize);
 
-	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
-			    pix_mp->width, pix_mp->height);
-	pix_mp->plane_fmt[0].sizeimage +=
-		128 *
-		DIV_ROUND_UP(pix_mp->width, 16) *
-		DIV_ROUND_UP(pix_mp->height, 16);
-	pix_mp->field = V4L2_FIELD_NONE;
+	rkvdec_fill_decoded_pixfmt(ctx, pix_mp);
 
 	return 0;
 }
-- 
2.42.0

