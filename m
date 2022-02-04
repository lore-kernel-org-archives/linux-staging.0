Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B271329CA
	for <linux-staging@lists.linux.dev>; Fri,  4 Feb 2022 09:10:01 +0000 (UTC)
Received: from dslb-188-096-149-005.188.096.pools.vodafone-ip.de ([188.96.149.5] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nFubN-0002IT-Px; Fri, 04 Feb 2022 10:09:57 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 1/4] staging: r8188eu: remove constant parameter of phy_LCCalibrate_8188E
Date: Fri,  4 Feb 2022 10:09:38 +0100
Message-Id: <20220204090941.309900-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204090941.309900-1-martin@kaiser.cx>
References: <20220203203217.252156-1-martin@kaiser.cx>
 <20220204090941.309900-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only caller of phy_LCCalibrate_8188E sets is2t to false.
Remove this parameter and resulting dead code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2: no changes

 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 5f7a2668cabb..db87eaafb72f 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -821,10 +821,10 @@ static void phy_IQCalibrate_8188E(struct adapter *adapt, s32 result[][8], u8 t)
 	}
 }
 
-static void phy_LCCalibrate_8188E(struct adapter *adapt, bool is2t)
+static void phy_LCCalibrate_8188E(struct adapter *adapt)
 {
 	u8 tmpreg;
-	u32 RF_Amode = 0, RF_Bmode = 0, LC_Cal;
+	u32 RF_Amode = 0, LC_Cal;
 
 	/* Check continuous TX and Packet TX */
 	tmpreg = rtw_read8(adapt, 0xd03);
@@ -839,17 +839,9 @@ static void phy_LCCalibrate_8188E(struct adapter *adapt, bool is2t)
 		/* Path-A */
 		RF_Amode = rtl8188e_PHY_QueryRFReg(adapt, RF_PATH_A, RF_AC, bMask12Bits);
 
-		/* Path-B */
-		if (is2t)
-			RF_Bmode = rtl8188e_PHY_QueryRFReg(adapt, RF_PATH_B, RF_AC, bMask12Bits);
-
 		/* 2. Set RF mode = standby mode */
 		/* Path-A */
 		rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_AC, bMask12Bits, (RF_Amode & 0x8FFFF) | 0x10000);
-
-		/* Path-B */
-		if (is2t)
-			rtl8188e_PHY_SetRFReg(adapt, RF_PATH_B, RF_AC, bMask12Bits, (RF_Bmode & 0x8FFFF) | 0x10000);
 	}
 
 	/* 3. Read RF reg18 */
@@ -866,10 +858,6 @@ static void phy_LCCalibrate_8188E(struct adapter *adapt, bool is2t)
 		/* Path-A */
 		rtw_write8(adapt, 0xd03, tmpreg);
 		rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_AC, bMask12Bits, RF_Amode);
-
-		/* Path-B */
-		if (is2t)
-			rtl8188e_PHY_SetRFReg(adapt, RF_PATH_B, RF_AC, bMask12Bits, RF_Bmode);
 	} else {
 		/*  Deal with Packet TX case */
 		rtw_write8(adapt, REG_TXPAUSE, 0x00);
@@ -999,5 +987,5 @@ void PHY_LCCalibrate_8188E(struct adapter *adapt)
 		timecount += 50;
 	}
 
-	phy_LCCalibrate_8188E(adapt, false);
+	phy_LCCalibrate_8188E(adapt);
 }
-- 
2.30.2

