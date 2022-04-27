Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E23D60
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 17:39:44 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:2c00:b769:f52a:a984])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EC0611F446E5;
	Wed, 27 Apr 2022 18:39:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1651081183;
	bh=wubek6jsK6/qsanCIGdPiaJ1o3gzVzBo/gvth1wB/vo=;
	h=From:To:Cc:Subject:Date:From;
	b=Y79/wIxYTbOwPYixAGTaBBZNRB8zmd3SZGjCnvJfsNZuvLmEbWYnslZK5M6WvQ6P5
	 JxK16BOcFIrkY3jGUv26y92R6MejCsgD6c6Z/mAZRflie9cpLpzuBvFPmWI17ul61U
	 wr4M23odwjjKx+6B9eajZykjqQNi76CmliFGZpQpO1PWoTT7udjFd2SgYuP4y4yw6O
	 gPLpFcV0XJME9s8onFeTdEdGiA3KcpSVdbXDj9cfU99FU9QqAPEc9tPhE2UbWZI8Wg
	 TZxQUY4ak+HCJ5SHRwoOqJcWStTzGg9nitn/dWyrlaJDKieEbVyloWjjzLpA/Jyh4w
	 Bow5OUVMSEyIQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jon@nanocrew.net,
	aford173@gmail.com,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2] media: hantro: HEVC: Fix tile info buffer value computation
Date: Wed, 27 Apr 2022 19:39:36 +0200
Message-Id: <20220427173936.17092-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pps->column_width_minus1[j] + 1 as value for the tile info buffer
instead of pps->column_width_minus1[j + 1].
The patch fixes DBLK_E_VIXS_2, DBLK_F_VIXS_2, DBLK_G_VIXS_2,
SAO_B_MediaTek_5, TILES_A_Cisco_2 and TILES_B_Cisco_1 tests in fluster.

Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 2:
- Add Fixes tag, thanks Dan

 drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index bb512389c1a5..ffeb2fbeefd2 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -74,7 +74,7 @@ static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 					no_chroma = 1;
 				for (j = 0, tmp_w = 0; j < num_tile_cols - 1; j++) {
 					tmp_w += pps->column_width_minus1[j] + 1;
-					*p++ = pps->column_width_minus1[j + 1];
+					*p++ = pps->column_width_minus1[j] + 1;
 					*p++ = h;
 					if (i == 0 && h == 1 && ctb_size == 16)
 						no_chroma = 1;
-- 
2.32.0

