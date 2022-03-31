Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54E4A42
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 19:38:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 08D9D1F4725F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1648755480;
	bh=HmMBg5b8YH4LzW0sBzAl4u/8f+BCfQenxWj/fruvkP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KbVTEhI17KkBlxrzHM4EuGkf7QIYl4hZ/hOfcIcrzBe13cx9Xk5TLnQilPRIkCk/u
	 +RAY0swuwiXIxoC7+k0vRmZm036mvACh+quaET/cKJOI1pwgQV9em1k9c0K7ymuKsf
	 /Q7biHye8EnmdIsduVy61i1tLrDezx2l9quW2m4+1MKZOo/JAiSUAXxQnx3emifXBL
	 8COXL3t4Q7KArtzscrvkyquK+0+O2W+4FznSZTULfF5040+lllV7hyjwDLsz/z77P2
	 O3gWwpXQDdPv8zkLNX/NAufkBj5R0d8RXWFUa8vfYn7pR9ZDFaRx+fBm4Bc5cxyEGx
	 fuwF0A10DIMuA==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Ezequiel Garcia <ezequiel@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/23] media: rkvdec: h264: Fix reference frame_num wrap for second field
Date: Thu, 31 Mar 2022 15:37:18 -0400
Message-Id: <20220331193726.289559-17-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
References: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
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
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index a42cf19bcc6d..730f8ebf7f58 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -773,7 +773,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 			continue;
 
 		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
-		    dpb[i].frame_num < dec_params->frame_num) {
+		    dpb[i].frame_num <= dec_params->frame_num) {
 			p[i] = dpb[i].frame_num;
 			continue;
 		}
-- 
2.34.1

