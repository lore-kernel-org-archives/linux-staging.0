Received: from mail.meizu.com (edge01.meizu.com [14.29.68.187])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54B77C
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 10:44:52 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 1 Apr 2022
 18:44:45 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Apr
 2022 18:44:43 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter
	<phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: =?UTF-8?q?=E7=99=BD=E6=B5=A9=E6=96=87?= <baihaowen@meizu.com>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: r8188eu: Fix misspelling in comment "cacluated" -> "calculated"
Date: Fri, 1 Apr 2022 18:44:41 +0800
Message-ID: <1648809881-2777-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-124.meizu.com (172.16.1.124) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

From: 白浩文 <baihaowen@meizu.com>

This patch fixes some spelling typo in error message reported by
checkpatch.pl

WARNING: 'cacluated' may be misspelled - perhaps 'calculated'?

Signed-off-by: 白浩文 <baihaowen@meizu.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 87e9a5270be0..1183e4a522c0 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -71,7 +71,7 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 		u8 cck_agc_rpt;
 
 		/*  (1)Hardware does not provide RSSI for CCK */
-		/*  (2)PWDB, Average PWDB cacluated by hardware (for rate adaptive) */
+		/*  (2)PWDB, Average PWDB calculated by hardware (for rate adaptive) */
 
 		cck_highpwr = dm_odm->bCckHighPower;
 
@@ -170,7 +170,7 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 			/* Get Rx snr value in DB */
 			dm_odm->PhyDbgInfo.RxSNRdB[i] = (s32)(pPhyStaRpt->path_rxsnr[i] / 2);
 		}
-		/*  (2)PWDB, Average PWDB cacluated by hardware (for rate adaptive) */
+		/*  (2)PWDB, Average PWDB calculated by hardware (for rate adaptive) */
 		rx_pwr_all = (((pPhyStaRpt->cck_sig_qual_ofdm_pwdb_all) >> 1) & 0x7f) - 110;
 
 		PWDB_ALL = odm_QueryRxPwrPercentage(rx_pwr_all);
-- 
2.7.4

