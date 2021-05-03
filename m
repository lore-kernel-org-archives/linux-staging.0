Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B970
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 16:39:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 789EE613CF;
	Mon,  3 May 2021 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620059997;
	bh=AQJ9f4ACWu1BWs9uka6D3ZPaN2EluY0pQ4R8vA/fE8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CEE/gm44lHQAKOI7NoZ0wgUfCW+nuLMld8ZmZL8s38n6uzIZklmBlfI3m1N3cCvLH
	 pe+HbAb2spN0u7+N3rCdnskNA2He34IVNugEAHxTR2F3/wPs/ZvHGYE0fUwGxFaHtv
	 9nYmry/KbY6+jX/jNKQzaamP0OWqW/hAzAKCsEiITvYq3bYQydY1ZwcTm6WQmb8UK9
	 VBJwv386YOQV4jM1hbVJ2R/exuYF8fUA4s825cC26ADSicBWS4CGoU+xhSWTUWoeVQ
	 fpIuTxO4fP/zhU6rfO1SLtwfRBrYZ6CKB9YzApm8Nwa35ocJ/eZWCPFR+WupYOKRcJ
	 0sCx9bnZdnrIA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 10/57] media: imx: capture: Return -EPIPE from __capture_legacy_try_fmt()
Date: Mon,  3 May 2021 12:38:54 -0400
Message-Id: <20210503163941.2853291-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163941.2853291-1-sashal@kernel.org>
References: <20210503163941.2853291-1-sashal@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit cc271b6754691af74d710b761eaf027e3743e243 ]

The correct return code to report an invalid pipeline configuration is
-EPIPE. Return it instead of -EINVAL from __capture_legacy_try_fmt()
when the capture format doesn't match the media bus format of the
connected subdev.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/imx/imx-media-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index d151cd6d3188..fabbfceaa107 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -553,7 +553,7 @@ static int capture_validate_fmt(struct capture_priv *priv)
 		priv->vdev.fmt.fmt.pix.height != f.fmt.pix.height ||
 		priv->vdev.cc->cs != cc->cs ||
 		priv->vdev.compose.width != compose.width ||
-		priv->vdev.compose.height != compose.height) ? -EINVAL : 0;
+		priv->vdev.compose.height != compose.height) ? -EPIPE : 0;
 }
 
 static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
-- 
2.30.2

