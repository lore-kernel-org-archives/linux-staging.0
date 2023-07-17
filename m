Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1E253C8
	for <linux-staging@lists.linux.dev>; Mon, 17 Jul 2023 15:06:20 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4be:84ed:4a71:a2ea])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8AAE96602329;
	Mon, 17 Jul 2023 16:06:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689606378;
	bh=FRTZXCxmrhmbJigySAGoMfBq+46yLv4nhFi0T5kqD10=;
	h=From:To:Cc:Subject:Date:From;
	b=HkCE/fpXN6izquRUoL7dKUqu1EjdsbGb6dTk2T9oNGfO5AAimaMt1sjvo0rsXZivk
	 CXIXOE9NrFuP5WO52RGZwfeJ17ETh2YPEr8d5nNAc6BJwFqrd1sQD6551bFWnkUIPQ
	 bXHcnr81zCsh6YwrYUbrEisFgZc9fc0niAxNYOkKReHNUrOa6V4joqwpXSmS8Z44Qy
	 CiRKl5XL4WfjxOzU4bgNsjvXvbhYm3hP1BG2Fd+osNRitMu6sr12RdWsb60tpqEYnc
	 2EF+h8ZaoXoiu2lh1ja7YJEIoyduKUExGP0DoQ+ep5XGm4jnxgFJAsrIgjj6GuxhmE
	 e9kFtmK1NHAlg==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nicolas.dufresne@collabora.com,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: rkvdec: increase max supported height for H.264
Date: Mon, 17 Jul 2023 17:06:11 +0200
Message-Id: <20230717150611.42832-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After testing it is possible for the hardware to decode H264
bistream with a height up to 2560.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 134e2b9fa7d9..84a41792cb4b 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -120,7 +120,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 			.max_width = 4096,
 			.step_width = 16,
 			.min_height = 48,
-			.max_height = 2304,
+			.max_height = 2560,
 			.step_height = 16,
 		},
 		.ctrls = &rkvdec_h264_ctrls,
-- 
2.39.2

