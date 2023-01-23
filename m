Received: from MTA-06-3.privateemail.com (mta-06-3.privateemail.com [198.54.127.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939B37C
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 19:18:32 +0000 (UTC)
Received: from mta-06.privateemail.com (localhost [127.0.0.1])
	by mta-06.privateemail.com (Postfix) with ESMTP id 19FA618000A9;
	Mon, 23 Jan 2023 14:18:26 -0500 (EST)
Received: from bpappas-XPS-13-9310.ucf.edu (050-088-208-136.res.spectrum.com [50.88.208.136])
	by mta-06.privateemail.com (Postfix) with ESMTPA id 503ED18000A0;
	Mon, 23 Jan 2023 14:18:09 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pappasbrent.com;
	s=default; t=1674501505;
	bh=v9a1fv396joFpPHCngbbu0JqMfh+uZzL3+ZM1rjZYqM=;
	h=From:To:Cc:Subject:Date:From;
	b=EhE6xylCj2/9+WTSRj6eWeLuMpJZqTl3NBQgdngAZnpcAjFRkaNtcy96TuKzErHFO
	 85feHLV/1nDTndy/VdckUL/09agtT+kyjyB0PsMasmoksB4zHiIrOhmZ0M4d/6ShPr
	 kJHUu5YZ+pnr+yf9CoGIrW1O0z5fdtXfYWtF6Q5sk+AdQT3gYyLKkMubcQkS/LVNkl
	 7+lwm1jMa2YUzvfe7k9XIpToNHr7RwlXY8w3SdP/WW/sKLq0gh3kze0dVpNBPlh7Mj
	 FEz1ieQRPShgPUVBUSbxpiRXfJ67QqxRtmrgRrvxGJgGKvd+c6pF8omP+IaPqV6juR
	 FBiCqLY/ryKTQ==
From: Brent Pappas <bpappas@pappasbrent.com>
To: slongerbeam@gmail.com
Cc: p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brent Pappas <bpappas@pappasbrent.com>
Subject: [PATCH] media: imx: imx-media-fim: Replace macro icap_enabled() with function
Date: Mon, 23 Jan 2023 14:17:14 -0500
Message-Id: <20230123191714.22430-1-bpappas@pappasbrent.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Replace the macro icap_enabled() with a static function to comply
with Linux coding style standards.

Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
---
 drivers/staging/media/imx/imx-media-fim.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index fb6590dcfc36..ccb35d098a19 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -68,7 +68,10 @@ struct imx_media_fim {
 	bool              stream_on;
 };
 
-#define icap_enabled(fim) ((fim)->icap_flags != IRQ_TYPE_NONE)
+static bool icap_enabled(struct imx_media_fim *fim)
+{
+	return fim->icap_flags != IRQ_TYPE_NONE;
+}
 
 static void update_fim_nominal(struct imx_media_fim *fim,
 			       const struct v4l2_fract *fi)
-- 
2.34.1

