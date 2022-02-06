Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A1A2CA2
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 16:18:29 +0000 (UTC)
Received: from ipservice-092-217-075-184.092.217.pools.vodafone-ip.de ([92.217.75.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGkF2-0001bS-Fm; Sun, 06 Feb 2022 17:18:20 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/14] staging: r8188eu: remove debug code to bypass LC calibration
Date: Sun,  6 Feb 2022 17:17:59 +0100
Message-Id: <20220206161809.423031-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206161809.423031-1-martin@kaiser.cx>
References: <20220206161809.423031-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a check before the LC calibration that is always false.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 27cac9775a90..0c2dbef59197 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -895,15 +895,10 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
 
 void PHY_LCCalibrate_8188E(struct adapter *adapt)
 {
-	bool singletone = false, carrier_sup = false;
 	u32 timeout = 2000, timecount = 0;
 	struct hal_data_8188e *pHalData = &adapt->haldata;
 	struct odm_dm_struct *dm_odm = &pHalData->odmpriv;
 
-	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
-	if (singletone || carrier_sup)
-		return;
-
 	while (*dm_odm->pbScanInProcess && timecount < timeout) {
 		mdelay(50);
 		timecount += 50;
-- 
2.30.2

