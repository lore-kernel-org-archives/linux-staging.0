Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FAA2C9A
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 14:31:45 +0000 (UTC)
Received: from dslb-178-004-202-058.178.004.pools.vodafone-ip.de ([178.4.202.58] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mjjCq-0001Pk-Ol; Sun, 07 Nov 2021 15:31:36 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: remove unused phy_PathA_IQK_8188E parameter
Date: Sun,  7 Nov 2021 15:30:57 +0100
Message-Id: <20211107143100.9047-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211107143100.9047-1-martin@kaiser.cx>
References: <20211107143100.9047-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The phy_PathA_IQK_8188E function does not use its configPathB
parameter. It can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 655fc420eb28..ac2aab0b345e 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -361,7 +361,7 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 #define IQK_DELAY_TIME		1		/* ms */
 
 static u8 /* bit0 = 1 => Tx OK, bit1 = 1 => Rx OK */
-phy_PathA_IQK_8188E(struct adapter *adapt, bool configPathB)
+phy_PathA_IQK_8188E(struct adapter *adapt)
 {
 	u32 regeac, regE94, regE9C;
 	u8 result = 0x00;
@@ -859,7 +859,7 @@ static void phy_IQCalibrate_8188E(struct adapter *adapt, s32 result[][8], u8 t,
 	ODM_SetBBReg(dm_odm, rRx_IQK, bMaskDWord, 0x81004800);
 
 	for (i = 0; i < retryCount; i++) {
-		PathAOK = phy_PathA_IQK_8188E(adapt, is2t);
+		PathAOK = phy_PathA_IQK_8188E(adapt);
 		if (PathAOK == 0x01) {
 			result[t][0] = (ODM_GetBBReg(dm_odm, rTx_Power_Before_IQK_A, bMaskDWord) & 0x3FF0000) >> 16;
 			result[t][1] = (ODM_GetBBReg(dm_odm, rTx_Power_After_IQK_A, bMaskDWord) & 0x3FF0000) >> 16;
-- 
2.20.1

