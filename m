Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB1A320F
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 09:30:47 +0000 (UTC)
Received: from dslb-178-004-174-047.178.004.pools.vodafone-ip.de ([178.4.174.47] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nKzbA-0005VT-3F; Fri, 18 Feb 2022 10:30:44 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/4] staging: r8188eu: NumQryPhyStatusOFDM is set but not used
Date: Fri, 18 Feb 2022 10:30:34 +0100
Message-Id: <20220218093034.854049-5-martin@kaiser.cx>
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

NumQryPhyStatusOFDM in struct odm_phy_dbg_info is set but not used.
Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 2 --
 drivers/staging/r8188eu/include/odm.h      | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 833c8fd7fb0c..87e9a5270be0 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -148,8 +148,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 			pPhyInfo->SignalQuality = SQ;
 		}
 	} else { /* is OFDM rate */
-		dm_odm->PhyDbgInfo.NumQryPhyStatusOFDM++;
-
 		/*  (1)Get RSSI for HT rate */
 
 		for (i = RF_PATH_A; i < RF_PATH_MAX; i++) {
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 66b5413b6846..4c97f222987a 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -86,7 +86,6 @@ struct odm_phy_dbg_info {
 	/* ODM Write,debug info */
 	s8	RxSNRdB[MAX_PATH_NUM_92CS];
 	u64	NumQryPhyStatus;
-	u64	NumQryPhyStatusOFDM;
 	/* Others */
 	s32	RxEVM[MAX_PATH_NUM_92CS];
 };
-- 
2.30.2

