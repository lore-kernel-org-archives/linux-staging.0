Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DF68
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 15:13:18 +0000 (UTC)
Received: from dslb-188-097-212-203.188.097.pools.vodafone-ip.de ([188.97.212.203] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mttCP-0007gF-RO; Sun, 05 Dec 2021 16:13:09 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/10] staging: r8188eu: bHWPowerdown is set but not used
Date: Sun,  5 Dec 2021 16:12:45 +0100
Message-Id: <20211205151251.6861-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211205151251.6861-1-martin@kaiser.cx>
References: <20211205151251.6861-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bHWPowerdown in struct pwrctrl_priv is set but never read. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 10 ++--------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h   |  1 -
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index acd343eec280..d14c1757d7b3 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1118,22 +1118,16 @@ static void hal_get_chnl_group_88e(u8 chnl, u8 *group)
 void Hal_ReadPowerSavingMode88E(struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail)
 {
 	if (AutoLoadFail) {
-		padapter->pwrctrlpriv.bHWPowerdown = false;
 		padapter->pwrctrlpriv.bSupportRemoteWakeup = false;
 	} else {
 		/* hw power down mode selection , 0:rf-off / 1:power down */
 
-		if (padapter->registrypriv.hwpdn_mode == 2)
-			padapter->pwrctrlpriv.bHWPowerdown = (hwinfo[EEPROM_RF_FEATURE_OPTION_88E] & BIT(4));
-		else
-			padapter->pwrctrlpriv.bHWPowerdown = padapter->registrypriv.hwpdn_mode;
-
 		/*  decide hw if support remote wakeup function */
 		/*  if hw supported, 8051 (SIE) will generate WeakUP signal(D+/D- toggle) when autoresume */
 		padapter->pwrctrlpriv.bSupportRemoteWakeup = (hwinfo[EEPROM_USB_OPTIONAL_FUNCTION0] & BIT(1)) ? true : false;
 
-		DBG_88E("%s...bHWPowerdown(%x) , bSupportRemoteWakeup(%x)\n", __func__,
-			padapter->pwrctrlpriv.bHWPowerdown, padapter->pwrctrlpriv.bSupportRemoteWakeup);
+		DBG_88E("%s , bSupportRemoteWakeup(%x)\n", __func__,
+			padapter->pwrctrlpriv.bSupportRemoteWakeup);
 
 		DBG_88E("### PS params =>  power_mgnt(%x), usbss_enable(%x) ###\n", padapter->registrypriv.power_mgnt, padapter->registrypriv.usbss_enable);
 	}
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index b19ef796ab54..a71f2f8f7c43 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -93,7 +93,6 @@ struct pwrctrl_priv {
 	enum rt_rf_power_state	change_rfpwrstate;
 
 	u8		wepkeymask;
-	u8		bHWPowerdown;/* if support hw power down */
 	u8		bkeepfwalive;
 };
 
-- 
2.20.1

