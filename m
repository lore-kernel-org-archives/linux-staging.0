Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E17A
	for <linux-staging@lists.linux.dev>; Fri, 13 May 2022 20:29:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 7FC571F46483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1652473795;
	bh=HEETDTFaV8Jr4FyaHgjigxD+fRrzRsYiKM7mEOGoNmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DRcfnh3oM2e+iY5OVgfBPViyB1R8HzRN7EGwmsv0HiWeiKn8/prlTyovriPq6aAGi
	 YelkJEHGWZzlu8MFXOSCTG+7/BkAjSe4JxuTh7oqVNvOG+WguOdn7SRa+eNFe9loh7
	 C9TlKiLRKEjVZgR7D6mqqyxBOQOlWBcZ49QucyW8xAet+9K4cCJfTmgKWC26E32uoN
	 S7QrSxgu3duuuaGPweLKsq9EJqjEKT/g0BY98q5IKNH75Ka2UPQ///34Z222qALPg2
	 HhyODvB2NtFiJ/ratDO2d5/qXSl8JFIWZXZjgahYXcnvlEqD6mpgFmnfh4pPCmVEYB
	 kQnmBKFOn7gHw==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nicolas@ndufresne.ca,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-media@vger.kernel.org,
	Ezequiel Garcia <ezequiel@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/20] media: rkvdec: h264: Fix reference frame_num wrap for second field
Date: Fri, 13 May 2022 16:29:15 -0400
Message-Id: <20220513202922.13846-14-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220513202922.13846-1-nicolas.dufresne@collabora.com>
References: <20220513202922.13846-1-nicolas.dufresne@collabora.com>
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
field being decoded, this caused issues decoding the second field in a
complementary field pair.

Fix this by using inclusive comparison: 'less than or equal'.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index fb41e2fd8359..57821ee3b213 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -782,7 +782,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 			continue;
 
 		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
-		    dpb[i].frame_num < dec_params->frame_num) {
+		    dpb[i].frame_num <= dec_params->frame_num) {
 			p[i] = dpb[i].frame_num;
 			continue;
 		}
-- 
2.34.3

