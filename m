Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C5B7A
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 12:52:46 +0000 (UTC)
Received: from whitebuilder.lan (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A15526601724;
	Fri, 10 Jun 2022 13:52:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654865558;
	bh=y4VN0AML4mJdPo0xkn5rxhw/upvGXg3kQ19JexvXyQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UI3Skr/92kfXBj52tMYRIZ6FWRT/l4PEhIYivbCO05yNRyVcPNbvgF58uk6e6+iQj
	 Kt3JacKtz/oSASW2AH5I/QH7vXPMz6wOCiOsyncXJ936xqn4AZ5m3kmiw1X/W6tlmu
	 xf/VPUEhR65CHI4yAG+aF1fRIK9gY//Rd+U5uh/A86dr2fmKKu+XaIBn3mGETMSOdv
	 Rd2KKU96sZayrHVHhRJo4EvEmomy08l8/miShcx1rPDAlwdt5i4tK1OPwfYD2RCAkv
	 iQrqhZCJU60bytKOvheg2H2SuLwBfmgt8jjNdeG7jG5sm0OqBOvTtsnLFCAPOLaSKM
	 ZvnQuhht3iQVQ==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	kernel@collabora.com,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] media: rkvdec: Add an ops to check for decode errors
Date: Fri, 10 Jun 2022 08:52:12 -0400
Message-Id: <20220610125215.240539-3-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
References: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This optional internal ops allow each codec to do their own
error status checking. The presence of an error is reported
using the ERROR buffer state. This patch have no functional
changes.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 10 ++++++----
 drivers/staging/media/rkvdec/rkvdec.h |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 7bab7586918c..7e76f8b72885 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -950,6 +950,7 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_dev *rkvdec)
 static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 {
 	struct rkvdec_dev *rkvdec = priv;
+	struct rkvdec_ctx *ctx;
 	enum vb2_buffer_state state;
 	u32 status;
 
@@ -958,12 +959,13 @@ static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
 
 	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
-	if (cancel_delayed_work(&rkvdec->watchdog_work)) {
-		struct rkvdec_ctx *ctx;
+	ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
 
-		ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	if (ctx->coded_fmt_desc->ops->check_error_info)
+		state = ctx->coded_fmt_desc->ops->check_error_info(ctx);
+
+	if (cancel_delayed_work(&rkvdec->watchdog_work))
 		rkvdec_job_finish(ctx, state);
-	}
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
index 633335ebb9c4..4ae8e6c6b03c 100644
--- a/drivers/staging/media/rkvdec/rkvdec.h
+++ b/drivers/staging/media/rkvdec/rkvdec.h
@@ -73,6 +73,8 @@ struct rkvdec_coded_fmt_ops {
 		     struct vb2_v4l2_buffer *dst_buf,
 		     enum vb2_buffer_state result);
 	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
+	/* called from IRQ handler */
+	int (*check_error_info)(struct rkvdec_ctx *ctx);
 };
 
 struct rkvdec_coded_fmt_desc {
-- 
2.36.1

