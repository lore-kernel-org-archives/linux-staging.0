Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD5E3216
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 20:45:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 47B301F448A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1649191510;
	bh=t6w6zh2urP7UBHlWH5GWukchWArbLK9mbtqizbdraAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TkK+aVQN462OFzg3kXJMyyDzO9T5YZP4amtnyD+IC682s9lJt9HfFWJIqL5686Ljz
	 /JF9E3x+CLnwgJ8byoIc1gLKjhAYVf5LLJvnskfXyFbE0nNpttYv4gxOg1s9CsRTNs
	 AwdTGwxXdcxGIx/YlfnIu7+3Za8p8RI0he0Yu3Pa62uJ73r6KAHWnd+2NyYoKq+xfR
	 vULVmlkefvGmBpcWiLzWObKsI1+YnxZxTF0muf+/GqNSWumbYdHjzwdySXF38cSXGe
	 eWSRYf7IRpZi0MWDeZfFszhSmt7gZWD2MD7j0ZuG/oZyTGQAwwt26oDn+Fis6PS2GV
	 ylea4nyVQ09Pw==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Ezequiel Garcia <ezequiel@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 17/24] media: rkvdec: h264: Fix reference frame_num wrap for second field
Date: Tue,  5 Apr 2022 16:44:18 -0400
Message-Id: <20220405204426.259074-18-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405204426.259074-1-nicolas.dufresne@collabora.com>
References: <20220405204426.259074-1-nicolas.dufresne@collabora.com>
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
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index f081b476340f..60eaf06b6e25 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -781,7 +781,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 			continue;
 
 		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
-		    dpb[i].frame_num < dec_params->frame_num) {
+		    dpb[i].frame_num <= dec_params->frame_num) {
 			p[i] = dpb[i].frame_num;
 			continue;
 		}
-- 
2.34.1

