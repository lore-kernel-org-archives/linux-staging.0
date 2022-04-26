Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4689D63D
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 12:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 61F8F1F43992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1650977899;
	bh=gu3hWa9l9RwIqYfPgXJTq2hXyJdb/X3UYi37Vl+bXOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A9PPhaws+0UJKFGVd1hph8rKqPW0f16roDicNJFfCdGnt2qPN466cQ22WLaQfg4U5
	 +Jxnnc1YkNht2e50RoYOjFvb/wNAKG1eu+UGyCbR/EhBVNTOiBmGazcu+7DO0/G5ql
	 WnI0BtliPH3K5k0AyymLQZNm8otEZaMpTYQsCZo5HAI7ZBydI7UbBYsjEizKhU0c4c
	 JTiYZEDPyYpzkw2cpXNWb1S/C+OrHDHktRpzO2Or1om6MilkX5eHtIzxOxPweZ9ioC
	 WIyhM23PqBPJS0uf9kApXCI2runbW5D6iZ2Uyj/LxM4r2W/haPC6ILBcRTnprAIRMr
	 u0V8WQkrdXY/Q==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: nicolas@ndufresne.ca,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/24] media: rkvdec: Stop overclocking the decoder
Date: Tue, 26 Apr 2022 08:57:38 -0400
Message-Id: <20220426125751.108293-13-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
References: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While this overclock hack seems to work on some implementations
(some ChromeBooks, RockPi4) it also causes instability on other
implementations (notably LibreComputer Renegade, but there were more
reports in the LibreELEC project, where this has been removed). While
performance is indeed affected (tested with GStreamer), 4K playback
still works as long as you don't operate in lock step and keep at
least 1 frame ahead of time in the decode queue.

After discussion with ChromeOS members, it would seem that their
implementation indeed used to synchronously decode each frame, so
this hack was simply compensating for their code being less
efficient. In my opinion, this hack should not have been included
upstream.

Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/staging/media/rkvdec/rkvdec.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index c0cf3488f970..2df8cf4883e2 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -1027,12 +1027,6 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/*
-	 * Bump ACLK to max. possible freq. (500 MHz) to improve performance
-	 * When 4k video playback.
-	 */
-	clk_set_rate(rkvdec->clocks[0].clk, 500 * 1000 * 1000);
-
 	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rkvdec->regs))
 		return PTR_ERR(rkvdec->regs);
-- 
2.34.1

