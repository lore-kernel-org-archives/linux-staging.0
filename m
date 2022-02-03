Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B672C9D
	for <linux-staging@lists.linux.dev>; Thu,  3 Feb 2022 20:32:32 +0000 (UTC)
Received: from dslb-188-096-149-005.188.096.pools.vodafone-ip.de ([188.96.149.5] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nFimL-0004W7-TF; Thu, 03 Feb 2022 21:32:29 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/4] staging: r8188eu: remove constant variable eRFPath
Date: Thu,  3 Feb 2022 21:32:17 +0100
Message-Id: <20220203203217.252156-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220203203217.252156-1-martin@kaiser.cx>
References: <20220203203217.252156-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the _PHY_SwChnl8192C function, eRFPath is always zero. Remove the
variable and use 0 in the code. Replace (enum rf_radio_path)0 with
RF_PATH_A.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 8279768201b7..6e26359bdda7 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -712,7 +712,6 @@ void PHY_SetBWMode8188E(struct adapter *Adapter, enum ht_channel_width Bandwidth
 
 static void _PHY_SwChnl8192C(struct adapter *Adapter, u8 channel)
 {
-	u8 eRFPath = 0;
 	u32 param1, param2;
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
 
@@ -725,8 +724,8 @@ static void _PHY_SwChnl8192C(struct adapter *Adapter, u8 channel)
 	/* s2. RF dependent command - CmdID_RF_WriteReg, param1=RF_CHNLBW, param2=channel */
 	param1 = RF_CHNLBW;
 	param2 = channel;
-	pHalData->RfRegChnlVal[eRFPath] = ((pHalData->RfRegChnlVal[eRFPath] & 0xfffffc00) | param2);
-	rtl8188e_PHY_SetRFReg(Adapter, (enum rf_radio_path)eRFPath, param1, bRFRegOffsetMask, pHalData->RfRegChnlVal[eRFPath]);
+	pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffffc00) | param2);
+	rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, param1, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
 }
 
 void PHY_SwChnl8188E(struct adapter *Adapter, u8 channel)
-- 
2.30.2

