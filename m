Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD302CA1
	for <linux-staging@lists.linux.dev>; Sat,  5 Feb 2022 11:37:57 +0000 (UTC)
Received: from dslb-188-104-059-100.188.104.pools.vodafone-ip.de ([188.104.59.100] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGJO1-0005c9-4w; Sat, 05 Feb 2022 12:37:49 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/8] staging: r8188eu: TXPowerTrackingCallbackCnt is set but not used
Date: Sat,  5 Feb 2022 12:37:35 +0100
Message-Id: <20220205113741.379070-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205113741.379070-1-martin@kaiser.cx>
References: <20220205113741.379070-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TXPowerTrackingCallbackCnt in struct odm_rf_cal is set but not used.
Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 1 -
 drivers/staging/r8188eu/include/odm.h        | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index f0f26eecb2c0..2ce777ac041a 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -129,7 +129,6 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 	/*  2012/04/25 MH Add for tx power tracking to set tx power in tx agc for 88E. */
 	odm_TxPwrTrackSetPwr88E(dm_odm);
 
-	dm_odm->RFCalibrateInfo.TXPowerTrackingCallbackCnt++; /* cosa add for debug */
 	dm_odm->RFCalibrateInfo.bTXPowerTrackingInit = true;
 
 	/*  <Kordan> RFCalibrateInfo.RegA24 will be initialized when ODM HW configuring, but MP configures with para files. */
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 046a4b9e0899..2844ca96d3ba 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -253,7 +253,6 @@ struct odm_rf_cal {
 
 	bool	bReloadtxpowerindex;
 	u8	bRfPiEnable;
-	u32	TXPowerTrackingCallbackCnt; /* cosa add for debug */
 
 	u8	bCCKinCH14;
 	u8	CCK_index;
-- 
2.30.2

