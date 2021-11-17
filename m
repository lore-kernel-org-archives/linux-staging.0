Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FC92C9C
	for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 09:25:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0035163248;
	Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637141142;
	bh=JjJu+HTVQARFOWZTJ5XAwoi6CErV/3U3jpjwbHyocio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yd5W8dJKDKOdAwMfcOZUIVD0cvciIKSyWlxaytufKXzdKo+lLD6vf1940KNprMu3K
	 zBKSSxC9J87Be900/xyJS2Y69chlz1pC5+0OmkVplecEYGJYKSD8DtNi3u9xLHTblu
	 bQMGdgUDlMmOtU660LpcKGrRZYjwc2OMWOS1Iv9LahST5CITWFL6R9dBJ4lAeBs9zK
	 kyGzIshi8WqooUEvTb1cOZM4nntuo7irZ8wyuQo9r0QOgHaH67BFjuSwHmOQHW1kll
	 J0NQQz7kzHABRSE/Bbi8svAGQFOWOJRRjlB7XV8GvVrJFVssSdvABH5Ng++mB+Ljdb
	 jaUV33Hr/XqOA==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mnHCF-00Cb5j-7K; Wed, 17 Nov 2021 09:25:39 +0000
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
Subject: [PATCH 03/13] media: atomisp: sh_css_metrics: drop some unused code
Date: Wed, 17 Nov 2021 09:25:28 +0000
Message-Id: <e7c6d5349f4cdc002d6327c557e8c65a90e3447a.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
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
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

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

