Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130AB7C
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 19:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 538C01F4725C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1648755476;
	bh=s3TCwg9L0AAOtv/6Hb2IdzZi6+nwv8qK9bwTi/Shc+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jfGbAELsD56jkeFy74WurVTn19hU0NwWH0mqm7jGdhva3aRlObO+CSaQ05wC3Hl9b
	 IJQP7wTfoGK5IW9uOdJIaRJ+a/Sza1KTG7p7mjnINjGQY8W9oPoW60r3ggaWLSGvc2
	 7I1uswmzE5ZPvQ5z0eFTKiqmH73zPPp02kgpQ2MsIVe7XC8WEhSijExUFXdxuOrfHO
	 aFPDih9mmHf5LouncQ1S0Bktk5Pcg5ivSp6CWHMCpIr/GKuznpcvrAb7Gl0nXrb9KL
	 HpAWLFCO7LniNhwiGb9LtS6yp8pTqgzEKDczRcS1fCLZ/uuGIb4FmNuO5sgnfTU6N7
	 9rRK4jd5T4Vnw==
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
Subject: [PATCH v2 14/23] media: rkvdec: h264: Fix bit depth wrap in pps packet
Date: Thu, 31 Mar 2022 15:37:16 -0400
Message-Id: <20220331193726.289559-15-nicolas.dufresne@collabora.com>
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

The luma and chroma bit depth fields in the pps packet are 3 bits wide.
8 is wrongly added to the bit depth values written to these 3 bit fields.
Because only the 3 LSB are written, the hardware was configured
correctly.

Correct this by not adding 8 to the luma and chroma bit depth value.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index bcde37d72244..8d44a884a52e 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -662,8 +662,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	WRITE_PPS(0xff, PROFILE_IDC);
 	WRITE_PPS(1, CONSTRAINT_SET3_FLAG);
 	WRITE_PPS(sps->chroma_format_idc, CHROMA_FORMAT_IDC);
-	WRITE_PPS(sps->bit_depth_luma_minus8 + 8, BIT_DEPTH_LUMA);
-	WRITE_PPS(sps->bit_depth_chroma_minus8 + 8, BIT_DEPTH_CHROMA);
+	WRITE_PPS(sps->bit_depth_luma_minus8, BIT_DEPTH_LUMA);
+	WRITE_PPS(sps->bit_depth_chroma_minus8, BIT_DEPTH_CHROMA);
 	WRITE_PPS(0, QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG);
 	WRITE_PPS(sps->log2_max_frame_num_minus4, LOG2_MAX_FRAME_NUM_MINUS4);
 	WRITE_PPS(sps->max_num_ref_frames, MAX_NUM_REF_FRAMES);
-- 
2.34.1

