Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBC52FAE
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:43:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7334F61208;
	Thu,  9 Sep 2021 11:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631187804;
	bh=4YGcCdxw4MTG0LbsryXAkz2ES/z/GJ0yp39prEeTR7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uGH9F5L/tx777rcVnLDnrkpr2MIdwVCGgYC6ugL2I9Pe1hAyAQK3qMAkHVPPXMt7O
	 0JQmKhJmoajFJoTfyMzLkDSV3+6+yWC58sVNdQHPVjsurnSQdd1GR4qcLh6CahFqlP
	 aLzSxcv3+0DnfqMNcraPpAxl6hJYwasatrILmgeUB6cL+D/gqTMDxCaufXg55vMLVY
	 wFhC3aE7YBmc8dutG0Zz+w710OdlvGwaNb9M9a1Yl0bdk5ogj4c6jjOD4YRpQ5IgBB
	 eKvhF+BkUhiYzsrUygxhtkGo0JTre4dNP+qUvV5cSliedfLfPAO4oKknhWMTCoKNJO
	 wx/Qpfwe0jNfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.14 107/252] media: imx: imx7-media-csi: Fix buffer return upon stream start failure
Date: Thu,  9 Sep 2021 07:38:41 -0400
Message-Id: <20210909114106.141462-107-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 0ada1697ed4256b38225319c9896661142a3572d ]

When the stream fails to start, the first two buffers in the queue have
been moved to the active_vb2_buf array and are returned to vb2 by
imx7_csi_dma_unsetup_vb2_buf(). The function is called with the buffer
state set to VB2_BUF_STATE_ERROR unconditionally, which is correct when
stopping the stream, but not when the start operation fails. In that
case, the state should be set to VB2_BUF_STATE_QUEUED. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 894c4de31790..2882964b8513 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -361,6 +361,7 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_csi *csi,
 
 			vb->timestamp = ktime_get_ns();
 			vb2_buffer_done(vb, return_status);
+			csi->active_vb2_buf[i] = NULL;
 		}
 	}
 }
@@ -386,9 +387,10 @@ static int imx7_csi_dma_setup(struct imx7_csi *csi)
 	return 0;
 }
 
-static void imx7_csi_dma_cleanup(struct imx7_csi *csi)
+static void imx7_csi_dma_cleanup(struct imx7_csi *csi,
+				 enum vb2_buffer_state return_status)
 {
-	imx7_csi_dma_unsetup_vb2_buf(csi, VB2_BUF_STATE_ERROR);
+	imx7_csi_dma_unsetup_vb2_buf(csi, return_status);
 	imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
 }
 
@@ -537,9 +539,10 @@ static int imx7_csi_init(struct imx7_csi *csi)
 	return 0;
 }
 
-static void imx7_csi_deinit(struct imx7_csi *csi)
+static void imx7_csi_deinit(struct imx7_csi *csi,
+			    enum vb2_buffer_state return_status)
 {
-	imx7_csi_dma_cleanup(csi);
+	imx7_csi_dma_cleanup(csi, return_status);
 	imx7_csi_init_default(csi);
 	imx7_csi_dmareq_rff_disable(csi);
 	clk_disable_unprepare(csi->mclk);
@@ -702,7 +705,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 
 		ret = v4l2_subdev_call(csi->src_sd, video, s_stream, 1);
 		if (ret < 0) {
-			imx7_csi_deinit(csi);
+			imx7_csi_deinit(csi, VB2_BUF_STATE_QUEUED);
 			goto out_unlock;
 		}
 
@@ -712,7 +715,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 
 		v4l2_subdev_call(csi->src_sd, video, s_stream, 0);
 
-		imx7_csi_deinit(csi);
+		imx7_csi_deinit(csi, VB2_BUF_STATE_ERROR);
 	}
 
 	csi->is_streaming = !!enable;
-- 
2.30.2

