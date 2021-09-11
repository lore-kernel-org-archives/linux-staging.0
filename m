Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919EB3FD4
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 16:10:32 +0000 (UTC)
Received: from dslb-084-059-243-091.084.059.pools.vodafone-ip.de ([84.59.243.91] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mP5aH-0007nr-Dh; Sat, 11 Sep 2021 18:10:29 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: bHWPwrPindetect is always false
Date: Sat, 11 Sep 2021 18:10:16 +0200
Message-Id: <20210911161019.26881-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210911161019.26881-1-martin@kaiser.cx>
References: <20210911161019.26881-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bHWPwrPindetect component of struct pwrctrl_priv is never initialised
explicitly, it remains at its default value 0.

Remove bHWPwrPindetect itself and code that depends on
bHWPwrPindetect != 0.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_cmd.c        | 10 ----------
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 20 -------------------
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  4 ++--
 drivers/staging/r8188eu/hal/usb_halinit.c     | 14 -------------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  1 -
 5 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index b3695f1282de..c6c539bd7817 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -169,16 +169,6 @@ static int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
 	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
 
-	/* To decide allow or not */
-	if ((pcmdpriv->padapter->pwrctrlpriv.bHWPwrPindetect) &&
-	    (!pcmdpriv->padapter->registrypriv.usbss_enable)) {
-		if (cmd_obj->cmdcode == GEN_CMD_CODE(_Set_Drv_Extra)) {
-			struct drvextra_cmd_parm	*pdrvextra_cmd_parm = (struct drvextra_cmd_parm	*)cmd_obj->parmbuf;
-			if (pdrvextra_cmd_parm->ec_id == POWER_SAVING_CTRL_WK_CID)
-				bAllow = true;
-		}
-	}
-
 	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
 		bAllow = true;
 
diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index cf3673be5ac6..d901ac7aea4d 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -135,32 +135,12 @@ void rtw_ps_processor(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	enum rt_rf_power_state rfpwrstate;
 
 	pwrpriv->ps_processing = true;
 
 	if (pwrpriv->bips_processing)
 		goto exit;
 
-	if (padapter->pwrctrlpriv.bHWPwrPindetect) {
-		rfpwrstate = RfOnOffDetect(padapter);
-		DBG_88E("@@@@- #2  %s==> rfstate:%s\n", __func__, (rfpwrstate == rf_on) ? "rf_on" : "rf_off");
-
-		if (rfpwrstate != pwrpriv->rf_pwrstate) {
-			if (rfpwrstate == rf_off) {
-				pwrpriv->change_rfpwrstate = rf_off;
-				pwrpriv->brfoffbyhw = true;
-				padapter->bCardDisableWOHSM = true;
-				rtw_hw_suspend(padapter);
-			} else {
-				pwrpriv->change_rfpwrstate = rf_on;
-				rtw_hw_resume(padapter);
-			}
-			DBG_88E("current rf_pwrstate(%s)\n", (pwrpriv->rf_pwrstate == rf_off) ? "rf_off" : "rf_on");
-		}
-		pwrpriv->pwr_state_check_cnts++;
-	}
-
 	if (pwrpriv->ips_mode_req == IPS_NONE)
 		goto exit;
 
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 5ea96a5ac630..bb0d7e071f57 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -2008,8 +2008,8 @@ void Hal_ReadPowerSavingMode88E(struct adapter *padapter, u8 *hwinfo, bool AutoL
 		/*  if hw supported, 8051 (SIE) will generate WeakUP signal(D+/D- toggle) when autoresume */
 		padapter->pwrctrlpriv.bSupportRemoteWakeup = (hwinfo[EEPROM_USB_OPTIONAL_FUNCTION0] & BIT(1)) ? true : false;
 
-		DBG_88E("%s...bHWPwrPindetect(%x)-bHWPowerdown(%x) , bSupportRemoteWakeup(%x)\n", __func__,
-		padapter->pwrctrlpriv.bHWPwrPindetect, padapter->pwrctrlpriv.bHWPowerdown, padapter->pwrctrlpriv.bSupportRemoteWakeup);
+		DBG_88E("%s...bHWPowerdown(%x) , bSupportRemoteWakeup(%x)\n", __func__,
+			padapter->pwrctrlpriv.bHWPowerdown, padapter->pwrctrlpriv.bSupportRemoteWakeup);
 
 		DBG_88E("### PS params =>  power_mgnt(%x), usbss_enable(%x) ###\n", padapter->registrypriv.power_mgnt, padapter->registrypriv.usbss_enable);
 	}
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 62d9e656e1db..63b992610337 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1008,15 +1008,6 @@ static void CardDisableRTL8188EU(struct adapter *Adapter)
 	haldata->bMacPwrCtrlOn = false;
 	Adapter->bFWReady = false;
 }
-static void rtl8192cu_hw_power_down(struct adapter *adapt)
-{
-	/*  2010/-8/09 MH For power down module, we need to enable register block contrl reg at 0x1c. */
-	/*  Then enable power down control bit of register 0x04 BIT(4) and BIT(15) as 1. */
-
-	/*  Enable register area 0x0-0xc. */
-	rtw_write8(adapt, REG_RSV_CTRL, 0x0);
-	rtw_write16(adapt, REG_APS_FSMCO, 0x8812);
-}
 
 static u32 rtl8188eu_hal_deinit(struct adapter *Adapter)
 {
@@ -1029,14 +1020,9 @@ static u32 rtl8188eu_hal_deinit(struct adapter *Adapter)
 	DBG_88E("bkeepfwalive(%x)\n", Adapter->pwrctrlpriv.bkeepfwalive);
 	if (Adapter->pwrctrlpriv.bkeepfwalive) {
 		_ps_close_RF(Adapter);
-		if ((Adapter->pwrctrlpriv.bHWPwrPindetect) && (Adapter->pwrctrlpriv.bHWPowerdown))
-			rtl8192cu_hw_power_down(Adapter);
 	} else {
 		if (Adapter->hw_init_completed) {
 			CardDisableRTL8188EU(Adapter);
-
-			if ((Adapter->pwrctrlpriv.bHWPwrPindetect) && (Adapter->pwrctrlpriv.bHWPowerdown))
-				rtl8192cu_hw_power_down(Adapter);
 		}
 	}
 	return _SUCCESS;
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 69ea7925feef..28e4041acb98 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -113,7 +113,6 @@ struct pwrctrl_priv {
 
 	u8		wepkeymask;
 	u8		bHWPowerdown;/* if support hw power down */
-	u8		bHWPwrPindetect;
 	u8		bkeepfwalive;
 	u8		brfoffbyhw;
 };
-- 
2.20.1

