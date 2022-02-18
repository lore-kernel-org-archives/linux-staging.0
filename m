Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1CA3213
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 09:30:44 +0000 (UTC)
Received: from dslb-178-004-174-047.178.004.pools.vodafone-ip.de ([178.4.174.47] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nKzb7-0005VT-9z; Fri, 18 Feb 2022 10:30:41 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: r8188eu: RxSNR is set but not used
Date: Fri, 18 Feb 2022 10:30:32 +0100
Message-Id: <20220218093034.854049-3-martin@kaiser.cx>
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

The RxSNR array in struct phy_info is set but not used.
Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 1 -
 drivers/staging/r8188eu/include/rtw_recv.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 8ebcd3050892..7d47ecd53757 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -171,7 +171,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 			pPhyInfo->RxMIMOSignalStrength[i] = (u8)RSSI;
 
 			/* Get Rx snr value in DB */
-			pPhyInfo->RxSNR[i] = (s32)(pPhyStaRpt->path_rxsnr[i] / 2);
 			dm_odm->PhyDbgInfo.RxSNRdB[i] = (s32)(pPhyStaRpt->path_rxsnr[i] / 2);
 		}
 		/*  (2)PWDB, Average PWDB cacluated by hardware (for rate adaptive) */
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index f82a26a675c0..5e65cf6b87bc 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -79,7 +79,6 @@ struct phy_info {
 	s8	recvpower;
 	u8	SignalStrength; /*  in 0-100 index. */
 	u8	RxPwr[MAX_PATH_NUM_92CS];/* per-path's pwdb */
-	u8	RxSNR[MAX_PATH_NUM_92CS];/* per-path's SNR */
 };
 
 struct rx_pkt_attrib {
-- 
2.30.2

