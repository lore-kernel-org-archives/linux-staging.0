Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82AD139C
	for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 14:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by comms.puri.sm (Postfix) with ESMTP id 6A5E2DF866;
	Tue, 17 May 2022 07:35:40 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
	by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUInY8X_WcUF; Tue, 17 May 2022 07:35:39 -0700 (PDT)
From: Martin Kepplinger <martin.kepplinger@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
	t=1652798139; bh=0IASOl+36nZc05gh2SkCy6PUCwx8Zj2iARw2qdlE2FE=;
	h=From:To:Cc:Subject:Date:From;
	b=hAakK45ngtWlK27gcKaRE/cvpViGaHTm+fawKVtw5nHoIDwRrTZbt2YJdLpfglSYF
	 UStLJkk1jYycYuXYf8spNqCS5XDYgzm/dlbkpyrDe3hdfw/ivEuYoFvp5aBkFbLdKK
	 z1oxpRHuhVtzdivceGrTtS5oxZL0pCGcy0NudmvRK36EcgNQUT/rHkw83kErPM/4A7
	 n+mHF93ukD3UwqWhR4OdFOxCV50V8h4+JXh1mxvXaxFvC+IZuwrVy++LqunI62O/k4
	 VaB48WGjXpPEjjd+wIc90vMuJNEQvcm7n74dRzgqIX0v1DcMdddpRGt9L1tLbo04AV
	 R6xP4tdJXaDwQ==
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH] media: hantro: fix compatible string deprecation warning
Date: Tue, 17 May 2022 16:35:21 +0200
Message-Id: <20220517143521.1670663-1-martin.kepplinger@puri.sm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_device_is_compatible() in the end uses strlen of the string
for comparison, so in this case, the condition is true even if
the requested string "nxp,imx8mq-vpu-g1" is being used. The first
chars containing "nxp,imx8mq-vpu" are the same.

Fix this by encoding what the comment says.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---

This is more of a bugreport as the solution doesn't look very elegant
to me. I'm happy for advice.

thanks,
                           martin


 drivers/staging/media/hantro/hantro_drv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index ac232b5f7825..014fab637df0 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -923,10 +923,11 @@ static int hantro_probe(struct platform_device *pdev)
 
 	/*
 	 * Support for nxp,imx8mq-vpu is kept for backwards compatibility
-	 * but it's deprecated. Please update your DTS file to use
-	 * nxp,imx8mq-vpu-g1 or nxp,imx8mq-vpu-g2 instead.
+	 * but it's deprecated.
 	 */
-	if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
+	if ((of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu")) &&
+	    (!of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu-g1")) &&
+	    (!of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu-g2")))
 		dev_warn(&pdev->dev, "%s compatible is deprecated\n",
 			 match->compatible);
 
-- 
2.30.2

