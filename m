Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ACD320F
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 09:30:43 +0000 (UTC)
Received: from dslb-178-004-174-047.178.004.pools.vodafone-ip.de ([178.4.174.47] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nKzb6-0005VT-Ef; Fri, 18 Feb 2022 10:30:40 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: RxMIMOSignalQuality is set but not used
Date: Fri, 18 Feb 2022 10:30:31 +0100
Message-Id: <20220218093034.854049-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220218093034.854049-1-martin@kaiser.cx>
References: <20220218093034.854049-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RxMIMOSignalQuality array in struct signal_stat is set but
not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 6 ------
 drivers/staging/r8188eu/include/rtw_recv.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index dcc38b036280..8ebcd3050892 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -67,9 +67,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 
 	isCCKrate = ((pPktinfo->Rate >= DESC92C_RATE1M) && (pPktinfo->Rate <= DESC92C_RATE11M)) ? true : false;
 
-	pPhyInfo->RxMIMOSignalQuality[RF_PATH_A] = -1;
-	pPhyInfo->RxMIMOSignalQuality[RF_PATH_B] = -1;
-
 	if (isCCKrate) {
 		u8 cck_agc_rpt;
 
@@ -150,8 +147,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 					SQ = ((64 - SQ_rpt) * 100) / 44;
 			}
 			pPhyInfo->SignalQuality = SQ;
-			pPhyInfo->RxMIMOSignalQuality[RF_PATH_A] = SQ;
-			pPhyInfo->RxMIMOSignalQuality[RF_PATH_B] = -1;
 		}
 	} else { /* is OFDM rate */
 		dm_odm->PhyDbgInfo.NumQryPhyStatusOFDM++;
@@ -203,7 +198,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 			if (pPktinfo->bPacketMatchBSSID) {
 				if (i == RF_PATH_A) /*  Fill value in RFD, Get the first spatial stream only */
 					pPhyInfo->SignalQuality = (u8)(EVM & 0xff);
-				pPhyInfo->RxMIMOSignalQuality[i] = (u8)(EVM & 0xff);
 			}
 		}
 	}
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 920f33235e00..f82a26a675c0 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -72,7 +72,6 @@ struct signal_stat {
 struct phy_info {
 	u8	RxPWDBAll;
 	u8	SignalQuality;	 /*  in 0-100 index. */
-	u8	RxMIMOSignalQuality[MAX_PATH_NUM_92CS]; /* EVM */
 	u8	RxMIMOSignalStrength[MAX_PATH_NUM_92CS];/*  in 0~100 index */
 	s8	RxPower; /*  in dBm Translate from PWdB */
 /*  Real power in dBm for this packet, no beautification and aggregation.
-- 
2.30.2

