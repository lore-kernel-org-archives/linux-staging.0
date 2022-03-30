Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F7736C
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 07:27:26 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 30 Mar
 2022 15:27:25 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 30 Mar
 2022 15:27:23 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter
	<phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Haowen Bai <baihaowen@meizu.com>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2] staging: r8188eu: Fix misspelling in comment "Tranceiver" -> "Transceiver"
Date: Wed, 30 Mar 2022 15:27:21 +0800
Message-ID: <1648625242-12678-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <YkP7DGP+nbo2VJ+Z@kroah.com>
References: <YkP7DGP+nbo2VJ+Z@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-124.meizu.com (172.16.1.124) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

This patch fixes some spelling typo in error message reported by 
checkpatch.pl

WARNING: 'Tranceiver' may be misspelled - perhaps 'Transceiver'?
WARNING: 'Tranceiver' may be misspelled - perhaps 'Transceiver'?
WARNING: 'Tranceiver' may be misspelled - perhaps 'Transceiver'?
WARNING: 'Tranceiver' may be misspelled - perhaps 'Transceiver'?

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
V1->V2: split one-patch-per-misspelled-word; change title;

 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index ea75ff1..4864daf 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -378,10 +378,10 @@ phy_InitBBRFRegisterDefinition(
 	/*  Tx AGC Gain Stage (same for all path. Should we remove this?) */
 	pHalData->PHYRegDef.rfTxGainStage = rFPGA0_TxGainStage; /* Tx gain stage */
 
-	/*  Tranceiver A~D HSSI Parameter-1 */
+	/*  Transceiver A~D HSSI Parameter-1 */
 	pHalData->PHYRegDef.rfHSSIPara1 = rFPGA0_XA_HSSIParameter1;  /* wire control parameter1 */
 
-	/*  Tranceiver A~D HSSI Parameter-2 */
+	/*  Transceiver A~D HSSI Parameter-2 */
 	pHalData->PHYRegDef.rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;  /* wire control parameter2 */
 
 	/*  RF switch Control */
@@ -405,10 +405,10 @@ phy_InitBBRFRegisterDefinition(
 	/*  Tx AFE control 2 */
 	pHalData->PHYRegDef.rfTxAFE = rOFDM0_XATxAFE;
 
-	/*  Tranceiver LSSI Readback SI mode */
+	/*  Transceiver LSSI Readback SI mode */
 	pHalData->PHYRegDef.rfLSSIReadBack = rFPGA0_XA_LSSIReadBack;
 
-	/*  Tranceiver LSSI Readback PI mode */
+	/*  Transceiver LSSI Readback PI mode */
 	pHalData->PHYRegDef.rfLSSIReadBackPi = TransceiverA_HSPI_Readback;
 }
 
-- 
2.7.4

