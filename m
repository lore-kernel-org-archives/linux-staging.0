Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322623216
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 20:45:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 6DE231F4483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1649191500;
	bh=8oDcE7AuYklwa6l0DYob/jQnR/CVHnofWCWQW3y5gNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DeZjdI7imYZZvg+kDC9pPL5dARx83mv65wa5gmDuf9DQMxc84BSLeXsvjKegBDTEG
	 QxDtbC7egcV8QQKplljF4VoJ48UeaFvL6qeYM2UwGF4RtA9iybZkC1BvpSBDZdinR8
	 XxhklC8SPZdW0mJ8roUeqszepUv4NLbJAoyUtWfjfFP2x2WiV/DvXCmF5x8lkF+Mqi
	 JGQtSRra6PkqVtB3wI/QaJsCcRCziJg+Z+MWX6gMs7O5Of5xgTwg6MakmbmtSRFRNv
	 GqK7eR6CPoHbDtM8mPIih6JGxLihDTd0T+yEh5l0yphROBYovOiL0BUYmP696QUvoo
	 MgKhyNr2bBJww==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 12/24] media: rkvdec: Stop overclocking the decoder
Date: Tue,  5 Apr 2022 16:44:13 -0400
Message-Id: <20220405204426.259074-13-nicolas.dufresne@collabora.com>
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

While this overclock hack seems to work on some implementations
(some ChromeBooks, RockPi4) it also causes instability on other
implementations (notably LibreComputer Renegade, but there were more
reports in the LibreELEC project, where this has been removed). While
performance is indeed affected (tested with GStreamer), 4K playback
still works as long as you don't operate in lock step and keep at
least 1 frame ahead of time in the decode queue.

After discussion with ChromeOS members, it would seem that their
implementation indeed used to synchronously decode each frames, so
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

