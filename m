Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1A4C6D
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 20:00:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 359211F43874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1648497607;
	bh=Pb+CkJFTFCox4aOeKaVWm1HNnI9nYoASnBQM3lzgOEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nTUduKXw1HouhCvW/Gy+aJmHH6nF/jyB0cwwEPV6jAWA35xHLQXGqidD26RIhIOlw
	 JZMquk0QFevH4YHJ+f8Vv5I6rdcV3SBm9EDQyplYLbC/FXI5WqFKeDgSpVdzMtcw8V
	 2g8gTxRcZuc9LpQbg8E3vYKY/OMQEhgdwBDUo0fNQkMLi9w41b3jmvIxwvb05jcPt0
	 UtiOLD3nauFSK6vxXNMHvoVYWcMC1tREK+TQXFIGD8SYeIXvhNpU6yV6SlUDGR6+ro
	 PijOsp8nb4HovgDIq9hnkG7AotFwRc5qqSNcvhCWjmw8ISiWJinaFJxMqVAvM9Rp60
	 PnQtAyaXK9CKQ==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Ezequiel Garcia <ezequiel@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 13/24] media: rkvdec: h264: Fix reference frame_num wrap for second field
Date: Mon, 28 Mar 2022 15:59:25 -0400
Message-Id: <20220328195936.82552-14-nicolas.dufresne@collabora.com>
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

When decoding the second field in a complementary field pair the second
field is sharing the same frame_num with the first field.

Currently the frame_num for the first field is wrapped when it matches the
field being decoded, this cause issues to decode the second field in a
complementary field pair.

Fix this by using inclusive comparison, less than or equal.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index dff89732ddd0..842d8cd80e90 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -752,7 +752,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 			continue;
 
 		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
-		    dpb[i].frame_num < dec_params->frame_num) {
+		    dpb[i].frame_num <= dec_params->frame_num) {
 			p[i] = dpb[i].frame_num;
 			continue;
 		}
-- 
2.34.1

