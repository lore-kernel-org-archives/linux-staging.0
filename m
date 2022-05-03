Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3D82FB3
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 13:55:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: benjamin.gaignard)
	with ESMTPSA id 64CC91F429C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1651586136;
	bh=P5xe8aK24FneKrejeJc2PeEEYU1RX6wkZjpKA6DtjL0=;
	h=From:To:Cc:Subject:Date:From;
	b=FctP2ezJ1BzuLidot3tZBewEQHmgjWSjKvaPpojBML/H6pY6ZFOht8x1DlUyHwuZ3
	 0TwHfMrqlr/17ABbP4t3eSdAl/1D0JQMhjx+AG9fO56ZLV0s969e8mHjspxxuN+adh
	 Sx3OxcFS+Ngz4yVBUpNWpORWH05Az0NJ1CeTgJNhxqbI3wN6sQoByPKLBuQT/ycEUw
	 tWCuAtEVcsV/2H39VBN3Cn6UzCm7WnKxY4wHbXwxQ3D/Qlf+wuS6FqUxDms7CFewXF
	 VqnsI5YRV8UJax11e0wMqfR82z6C2EL1B+Q8S7W3ATSyyoIEEnNQrn20ftw7glliPy
	 Qtib9O7YaoAYg==
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
Subject: [PATCH v3] media: hantro: HEVC: unconditionnaly set pps_{cb/cr}_qp_offset values
Date: Tue,  3 May 2022 15:55:29 +0200
Message-Id: <20220503135529.683474-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always set pps_cb_qp_offset and pps_cr_qp_offset values in Hantro/G2
register whatever is V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT
flag value.
The vendor code does the case to set these values.
This fix conformance test CAINIT_G_SHARP_3.

Fluster HEVC score is increase by one with this patch.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 6deb31b7b993..503f4b028bc5 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -194,13 +194,8 @@ static void set_params(struct hantro_ctx *ctx)
 		hantro_reg_write(vpu, &g2_max_cu_qpd_depth, 0);
 	}
 
-	if (pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT) {
-		hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp_offset);
-		hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp_offset);
-	} else {
-		hantro_reg_write(vpu, &g2_cb_qp_offset, 0);
-		hantro_reg_write(vpu, &g2_cr_qp_offset, 0);
-	}
+	hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp_offset);
+	hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp_offset);
 
 	hantro_reg_write(vpu, &g2_filt_offset_beta, pps->pps_beta_offset_div2);
 	hantro_reg_write(vpu, &g2_filt_offset_tc, pps->pps_tc_offset_div2);
-- 
2.32.0

