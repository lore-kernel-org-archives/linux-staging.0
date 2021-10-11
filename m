Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894172C98
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 20:12:30 +0000 (UTC)
Received: from dslb-188-097-046-226.188.097.pools.vodafone-ip.de ([188.97.46.226] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ma1et-0004mk-L1; Mon, 11 Oct 2021 22:12:27 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/8] staging: r8188eu: remove odm_SwAntDivInit
Date: Mon, 11 Oct 2021 22:11:57 +0200
Message-Id: <20211011201159.10252-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011201159.10252-1-martin@kaiser.cx>
References: <20211011201159.10252-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is empty, it can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm.c             | 6 ------
 drivers/staging/r8188eu/include/odm_precomp.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index abd0b1c8c5cd..6f0bd678edf6 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -172,8 +172,6 @@ void ODM_DMInit(struct odm_dm_struct *pDM_Odm)
 	    (pDM_Odm->AntDivType == CGCS_RX_HW_ANTDIV) ||
 	    (pDM_Odm->AntDivType == CG_TRX_SMART_ANTDIV))
 		odm_InitHybridAntDiv(pDM_Odm);
-	else if (pDM_Odm->AntDivType == CGCS_RX_SW_ANTDIV)
-		odm_SwAntDivInit(pDM_Odm);
 }
 
 /*  2011/09/20 MH This is the entry pointer for all team to execute HW out source DM. */
@@ -1127,10 +1125,6 @@ void odm_TXPowerTrackingCheckAP(struct odm_dm_struct *pDM_Odm)
 /* 3============================================================ */
 /* 3 SW Antenna Diversity */
 /* 3============================================================ */
-void odm_SwAntDivInit(struct odm_dm_struct *pDM_Odm)
-{
-}
-
 void ODM_SwAntDivChkPerPktRssi(struct odm_dm_struct *pDM_Odm, u8 StationID, struct odm_phy_status_info *pPhyInfo)
 {
 }
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 1340b3df1181..aa1328abdfcc 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -47,7 +47,6 @@ void odm_RefreshRateAdaptiveMaskMP(struct odm_dm_struct *pDM_Odm);
 void odm_SwAntDivChkAntSwitch(struct odm_dm_struct *pDM_Odm, u8 Step);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
 void odm_CommonInfoSelfInit(struct odm_dm_struct *pDM_Odm);
-void odm_SwAntDivInit(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMaskCE(struct odm_dm_struct *pDM_Odm);
-- 
2.20.1

