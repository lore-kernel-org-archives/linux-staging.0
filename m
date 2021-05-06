Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356DA2F81
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 15:26:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E692D610E9;
	Thu,  6 May 2021 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620314800;
	bh=WwdunTEPlspSuJNcgiz5VlTq6QqTmYyotSIBFOxVREY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pN0tPqqYk+vmmU/IHozBA1LbWIRQut8CTp+kYjegk8iR7zcI3WVRhDloKTUMufuDy
	 QqAYFWcgR0ME4bszD+ELg0qNEsOod58GZfuLaKbREBx8WMGfHz22eVGYe7YI/IwfC5
	 4RFWfKGZts1S81nHfCl5/MWdAWGB87VcFLwHpb34ynAhwqJagJd51CF7hNg2BMIpVH
	 zubDv5uHE1nKFt9vVCA6BkIZxzQibblFPeTPfbzDPOUbnF/R7b0R0svlfWsRKt+gEs
	 GJMe3bjcniBd4pNe/qddyiZ3wHct8whmmDsrCfSji0PLkXcwjQI1ql9iuBCb91sSeE
	 hBWVZZEN6++1Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1left7-000SB5-M0; Thu, 06 May 2021 17:26:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 01/25] staging: media: imx7-mipi-csis: use pm_runtime_resume_and_get()
Date: Thu,  6 May 2021 17:25:39 +0200
Message-Id: <74ab04a6bb8949d9b12b203def1e0c57b7793db5.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 025fdc488bd6..1dc680d94a46 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -695,11 +695,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 
 		mipi_csis_clear_counters(state);
 
-		ret = pm_runtime_get_sync(&state->pdev->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&state->pdev->dev);
+		ret = pm_runtime_resume_and_get(&state->pdev->dev);
+		if (ret < 0)
 			return ret;
-		}
+
 		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto done;
-- 
2.30.2

