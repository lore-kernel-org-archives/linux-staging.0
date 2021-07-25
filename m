Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6266D0F
	for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 15:59:33 +0000 (UTC)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1m7gXM-0000SM-9T; Sun, 25 Jul 2021 17:59:32 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/18] staging: rtl8188eu: remove write-only power struct component
Date: Sun, 25 Jul 2021 17:58:54 +0200
Message-Id: <20210725155902.32433-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725155902.32433-1-martin@kaiser.cx>
References: <20210725155902.32433-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pwrpriv->bFwCurrentInPSMode is initialized and updated but nobody reads
its value. Remove this write-only component.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/core/rtw_pwrctrl.c      | 3 ---
 drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c | 3 ---
 drivers/staging/rtl8188eu/include/rtw_pwrctrl.h   | 1 -
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c b/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c
index cbb34b920ab9..f1af49af1105 100644
--- a/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c
@@ -335,7 +335,6 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 	/* if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) */
 	if (ps_mode == PS_MODE_ACTIVE) {
 		if (PS_RDY_CHECK(padapter)) {
-			pwrpriv->bFwCurrentInPSMode = true;
 			pwrpriv->pwr_mode = ps_mode;
 			pwrpriv->smart_ps = smart_ps;
 			pwrpriv->bcn_ant_mode = bcn_ant_mode;
@@ -461,8 +460,6 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 		pwrctrlpriv->power_mgnt = padapter->registrypriv.power_mgnt;/*  PS_MODE_MIN; */
 	pwrctrlpriv->bLeisurePs = (pwrctrlpriv->power_mgnt != PS_MODE_ACTIVE);
 
-	pwrctrlpriv->bFwCurrentInPSMode = false;
-
 	pwrctrlpriv->rpwm = 0;
 	pwrctrlpriv->cpwm = PS_STATE_S4;
 
diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
index 2afef26ddb56..d4c1c5413593 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
@@ -95,9 +95,6 @@ void _8051Reset88E(struct adapter *padapter)
 
 void rtl8188e_InitializeFirmwareVars(struct adapter *padapter)
 {
-	/*  Init Fw LPS related. */
-	padapter->pwrctrlpriv.bFwCurrentInPSMode = false;
-
 	/*  Init H2C counter. by tynli. 2009.12.09. */
 	padapter->HalData->LastHMEBoxNum = 0;
 }
diff --git a/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h b/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h
index 4345dc0c7cf9..78febd3605c7 100644
--- a/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h
@@ -174,7 +174,6 @@ struct pwrctrl_priv {
 	bool	bLeisurePs;
 	u8	LpsIdleCount;
 	u8	power_mgnt;
-	u8	bFwCurrentInPSMode;
 	u32	DelayLPSLastTimeStamp;
 	u8	btcoex_rfon;
 	s32		pnp_current_pwr_state;
-- 
2.20.1

