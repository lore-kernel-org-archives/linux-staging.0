Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B254C70
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 20:00:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 963391F4388C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1648497612;
	bh=Y/EFmW32eD4KkKmhvAOQSjuBN39ky/laGXZQlpMupCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bSgtdbGw4tYbD69RdtJrdkBRkEuQp47VMh2KzTtJdxoliJAInHWpAHa19MWxP+ef7
	 8+GEh/+RSK3v3aF5PfKNrNUqd8rGHpodqKNHRdiTz1R8P9f4Ov4nFjly0Wk7J0y2KL
	 ebN8TluDyF/oyUDQjHticp2yjGFipQF4zAyFzAqMG8CfzypxRAqXv+br4WHoTNwEjv
	 P6RrkSI/k+dhLbroD+xeNFri+pu9XFzpF62MkVHgPTQ4nnYpVB6DfMiWOJSEZ4+rGJ
	 ydKvI6bNa+vrgIfidR0R1xXfsNdXWfyLSjqgVojDmoT2bhEoooxxac6gjk4LUS5x4u
	 htRTV+HcbUkHg==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 16/24] media: rkvdec: Ensure decoded resolution fit coded resolution
Date: Mon, 28 Mar 2022 15:59:28 -0400
Message-Id: <20220328195936.82552-17-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220328195936.82552-1-nicolas.dufresne@collabora.com>
References: <20220328195936.82552-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonas Karlman <jonas@kwiboo.se>

Ensure decoded CAPTURE buffer resolution is larger or equal to the coded
OPTUPT buffer resolution.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/rkvdec/rkvdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 05824f1997f7..22c0382c579e 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -269,6 +269,8 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 		pix_mp->pixelformat = coded_desc->decoded_fmts[0];
 
 	/* Always apply the frmsize constraint of the coded end. */
+	pix_mp->width = max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
+	pix_mp->height = max(pix_mp->height, ctx->coded_fmt.fmt.pix_mp.height);
 	v4l2_apply_frmsize_constraints(&pix_mp->width,
 				       &pix_mp->height,
 				       &coded_desc->frmsize);
-- 
2.34.1

