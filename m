Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377181371
	for <linux-staging@lists.linux.dev>; Sun, 29 Oct 2023 18:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="HXHKZtHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1698604493; bh=UMyPdcE6zeOq+5y1/omox7ixHdl35HYxXzyXW/wl23I=;
 b=HXHKZtHuw2U39iDoIzCJa8IGTW0iQJKWmHlXt7LSGItWcBUbHJjykSnbdhz8j6nUvsHUSpkey
 X8X8NbG8oSgOdpAYQLBAC6AKS6b7yo5rUBli2YtrwcodnQeVeznObJLrY3XYs0V6BMFeyQFm2aB
 fqUbeef0I5aEgk2FGkMUxwAYpPdqPAO/SEgfx1v8OCP9GktclnKcHifu4LLPfu9xF/0ceUzlqG2
 mvCfP/nrxSvnfh+c2drz9vBknknF7Q5bgB5GyfF9zhFznoTisBFH57d4D2/nWHJDe/5zubphBMS
 2AWYS0ZYMYHkQgZzBxUc8bhOTUxgZcAEi9i6Sci+8tyg==
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
Subject: [PATCH v3 05/10] media: rkvdec: h264: Remove SPS validation at streaming start
Date: Sun, 29 Oct 2023 18:34:12 +0000
Message-ID: <20231029183427.1781554-6-jonas@kwiboo.se>
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
X-ForwardEmail-ID: 653ea5cc8fe0ffca230b0f49

SPS parameters is validated in try_ctrl() ops so there is no need to
re-validate when streaming starts.

Remove the unnecessary call to validate sps at streaming start.

Suggested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v3:
- New patch

 drivers/staging/media/rkvdec/rkvdec-h264.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 8bce8902b8dd..815d5359ddd5 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -1070,17 +1070,6 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_h264_priv_tbl *priv_tbl;
 	struct rkvdec_h264_ctx *h264_ctx;
-	struct v4l2_ctrl *ctrl;
-	int ret;
-
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_H264_SPS);
-	if (!ctrl)
-		return -EINVAL;
-
-	ret = rkvdec_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
-	if (ret)
-		return ret;
 
 	h264_ctx = kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
 	if (!h264_ctx)
@@ -1089,8 +1078,8 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
 				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
 	if (!priv_tbl) {
-		ret = -ENOMEM;
-		goto err_free_ctx;
+		kfree(h264_ctx);
+		return -ENOMEM;
 	}
 
 	h264_ctx->priv_tbl.size = sizeof(*priv_tbl);
@@ -1100,10 +1089,6 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 
 	ctx->priv = h264_ctx;
 	return 0;
-
-err_free_ctx:
-	kfree(h264_ctx);
-	return ret;
 }
 
 static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
-- 
2.42.0

