Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E70258C
	for <linux-staging@lists.linux.dev>; Sat, 12 Feb 2022 16:17:56 +0000 (UTC)
Received: from dslb-188-097-215-215.188.097.pools.vodafone-ip.de ([188.97.215.215] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nIv5o-0007YM-5i; Sat, 12 Feb 2022 17:17:48 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/10] staging: r8188eu: remove path parameter from phy_RFSerialWrite
Date: Sat, 12 Feb 2022 17:17:31 +0100
Message-Id: <20220212161737.381841-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220212161737.381841-1-martin@kaiser.cx>
References: <20220212161737.381841-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only caller of phy_RFSerialWrite sets the eRFPath parameter
to RF_PATH_A. Remove the parameter and use RF_PATH_A directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 628cec40db5f..9e02855c47b2 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -217,14 +217,13 @@ phy_RFSerialRead(
 static	void
 phy_RFSerialWrite(
 		struct adapter *Adapter,
-		enum rf_radio_path eRFPath,
 		u32 Offset,
 		u32 Data
 	)
 {
 	u32 DataAndAddr = 0;
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
-	struct bb_reg_def *pPhyReg = &pHalData->PHYRegDef[eRFPath];
+	struct bb_reg_def *pPhyReg = &pHalData->PHYRegDef[RF_PATH_A];
 	u32 NewOffset;
 
 	/*  2009/06/17 MH We can not execute IO for power save or other accident mode. */
@@ -309,7 +308,7 @@ rtl8188e_PHY_SetRFReg(
 		Data = ((Original_Value & (~BitMask)) | (Data << BitShift));
 	}
 
-	phy_RFSerialWrite(Adapter, RF_PATH_A, RegAddr, Data);
+	phy_RFSerialWrite(Adapter, RegAddr, Data);
 }
 
 /*  */
-- 
2.30.2

