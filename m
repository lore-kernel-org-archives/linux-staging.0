Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D52FB3
	for <linux-staging@lists.linux.dev>; Sat, 26 Mar 2022 18:36:35 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:3030:b:56bb:4cb:3227:231:99f8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 69D8D1F44FBF;
	Sat, 26 Mar 2022 18:36:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1648319793;
	bh=0LbIskzUpKi13BEPgM5TnTSCxgDUwO8aXIcFBWj7xRE=;
	h=From:To:Cc:Subject:Date:From;
	b=cAIrxgy2Y+0pcqgObdaDi6S0q5QsLxN6WptKxFirODn0OlleztAfRQL1HWkmOmr2z
	 DZIXz3mk/A9w7J+R+EjTBLJ0JVsFkPXg63k1ZpKl0i5kTs6UZHBt9s8b6nMnXU4tRl
	 WkVAcejKbsExYRxGpZ9Yw/hpoxEmF54oRyAIBeUQotAT7FX0BoVUUJ+WNHWXNLEInn
	 hL08afOr4lkDHh66HfTDYsuOt5QCjWrjfj2eIlJ3ip4jxgZV4Esq2s7Nh7Czzxtmkc
	 q+Wk/p20kp8qJEHCRPnQ/yADOOmn+hat2awVsNGESa2lRdVuSsXA53Dzvh81xlWmVn
	 sQTeMEKjxXbsA==
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org (open list:HANTRO VPU CODEC DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: media: hantro: Fix typos
Date: Sat, 26 Mar 2022 19:36:03 +0100
Message-Id: <20220326183603.66797-1-sebastian.fricke@collabora.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments within the Hantro driver.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 2 +-
 drivers/staging/media/hantro/hantro_hevc.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index c524af41baf5..c0645e335fc9 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -406,7 +406,7 @@ static int set_ref(struct hantro_ctx *ctx)
 
 	set_ref_pic_list(ctx);
 
-	/* We will only keep the references picture that are still used */
+	/* We will only keep the reference pictures that are still used */
 	ctx->hevc_dec.ref_bufs_used = 0;
 
 	/* Set up addresses of DPB buffers */
diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
index b49a41d7ae91..9c351f7fe6bd 100644
--- a/drivers/staging/media/hantro/hantro_hevc.c
+++ b/drivers/staging/media/hantro/hantro_hevc.c
@@ -59,7 +59,7 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx,
 	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
 	int i;
 
-	/* Find the reference buffer in already know ones */
+	/* Find the reference buffer in already known ones */
 	for (i = 0;  i < NUM_REF_PICTURES; i++) {
 		if (hevc_dec->ref_bufs_poc[i] == poc) {
 			hevc_dec->ref_bufs_used |= 1 << i;
-- 
2.25.1

