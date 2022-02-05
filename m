Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E0E2C9C
	for <linux-staging@lists.linux.dev>; Sat,  5 Feb 2022 11:37:56 +0000 (UTC)
Received: from dslb-188-104-059-100.188.104.pools.vodafone-ip.de ([188.104.59.100] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGJO0-0005c9-3v; Sat, 05 Feb 2022 12:37:48 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/8] staging: r8188eu: TXPowercount is set but not used
Date: Sat,  5 Feb 2022 12:37:34 +0100
Message-Id: <20220205113741.379070-2-martin@kaiser.cx>
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

TXPowercount in struct odm_rf_cal is set but not used.
Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 1 -
 drivers/staging/r8188eu/hal/odm.c            | 1 -
 drivers/staging/r8188eu/include/odm.h        | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 795320e13e55..f0f26eecb2c0 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -285,7 +285,6 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 		if (dm_odm->RFCalibrateInfo.TxPowerTrackControl)
 			dm_odm->RFCalibrateInfo.ThermalValue = ThermalValue;
 	}
-	dm_odm->RFCalibrateInfo.TXPowercount = 0;
 }
 
 /* 1 7.	IQK */
diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 9b4b75c225a7..117cdf2e5180 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -506,7 +506,6 @@ static void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
 static void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm)
 {
 	pDM_Odm->RFCalibrateInfo.bTXPowerTracking = true;
-	pDM_Odm->RFCalibrateInfo.TXPowercount = 0;
 	pDM_Odm->RFCalibrateInfo.bTXPowerTrackingInit = false;
 	pDM_Odm->RFCalibrateInfo.TxPowerTrackControl = true;
 }
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 63e0b6725bee..046a4b9e0899 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -229,7 +229,6 @@ struct odm_rf_cal {
 	s32	RegEB4;
 	s32	RegEBC;
 
-	u8	TXPowercount;
 	bool	bTXPowerTrackingInit;
 	bool	bTXPowerTracking;
 	u8	TxPowerTrackControl; /* for mp mode, turn off txpwrtracking
-- 
2.30.2

