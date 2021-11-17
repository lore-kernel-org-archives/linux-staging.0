Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AF72C94
	for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CCA56321B;
	Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637143017;
	bh=+B3Ic0RsuS2hzw7U1d2WnDFvh5AJV45Iz62Z5Ai+PYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QW1LYbJB/vmBwRyegh6x72eeitvlXag6EK+ydCYJUVvAavaSSm5Wv+SaLsxrvkJsy
	 coNxgVqT+7vLvX5+ftoH/BH+wcAxJSd/H1bdiLnXIlRQFuO3kqJsAUJqQYIp1NwOdh
	 JOq41GXdZIW1MO2xRxNxX7c2oh8/FRs5NT5Rys3aUHo7Rszz0a+iCbbJQUGyLUXtTv
	 9a71MT7NzrVbO02Kp0W5WCePiQE/geP2Nl2hBPLMTgXoUoaXOg7V3ea9yac8gEY4Bh
	 CV9aNOlKTCMMoF3F96k+ctRowt7yWmFsdVCGKfqXmHO+K8Oh9sVY7khSwbgl+w/9Z2
	 2eoXBBpGv+Gwg==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mnHgV-00DIUX-5U; Wed, 17 Nov 2021 09:56:55 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 03/12] media: atomisp: sh_css_metrics: drop some unused code
Date: Wed, 17 Nov 2021 09:56:45 +0000
Message-Id: <ef3f3627ff1b2cdb0960a95b8a93299cd36fd86c.1637142905.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637142905.git.mchehab+huawei@kernel.org>
References: <cover.1637142905.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

There are two #ifdefs there which aren't defined anywhere.

So, just drop the dead code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1637142905.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/sh_css_metrics.c        | 25 -------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index 9744bbebe1bc..8ded6cdd1575 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -123,40 +123,15 @@ sh_css_metrics_sample_pcs(void)
 	unsigned int pc;
 	unsigned int msink;
 
-#if SUSPEND
-	unsigned int sc = 0;
-	unsigned int stopped_sc = 0;
-	unsigned int resume_sc = 0;
-#endif
 
-#if MULTIPLE_PCS
-	int i;
-	unsigned int pc_tab[NOF_PCS];
-
-	for (i = 0; i < NOF_PCS; i++)
-		pc_tab[i] = 0;
-#endif
 
 	if (!pc_histogram_enabled)
 		return;
 
 	if (isp_histogram) {
-#if SUSPEND
-		/* STOP the ISP */
-		isp_ctrl_store(ISP0_ID, ISP_SC_REG, STOP_MASK);
-#endif
 		msink = isp_ctrl_load(ISP0_ID, ISP_CTRL_SINK_REG);
-#if MULTIPLE_PCS
-		for (i = 0; i < NOF_PCS; i++)
-			pc_tab[i] = isp_ctrl_load(ISP0_ID, ISP_PC_REG);
-#else
 		pc = isp_ctrl_load(ISP0_ID, ISP_PC_REG);
-#endif
 
-#if SUSPEND
-		/* RESUME the ISP */
-		isp_ctrl_store(ISP0_ID, ISP_SC_REG, RESUME_MASK);
-#endif
 		isp_histogram->msink[pc] &= msink;
 		stall = (msink != 0x7FF);
 
-- 
2.33.1

